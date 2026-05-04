export const dynamic = 'force-dynamic'

import { NextRequest, NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'
import { createServiceClient } from '@/lib/supabase'

const anthropic = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY!,
})

export async function POST(req: NextRequest) {
  try {
    const { sessionId } = await req.json()
    if (!sessionId) return NextResponse.json({ error: 'sessionId required' }, { status: 400 })

    const db = createServiceClient()

    // Fetch session
    const { data: session, error: sessionErr } = await db
      .from('sessions')
      .select('*')
      .eq('id', sessionId)
      .single()
    if (sessionErr || !session) throw new Error('Session not found')
    if (!session.raw_transcript) throw new Error('No transcript to process')

    // Fetch world context for Claude
    const [npcRes, locationRes, questRes, factionRes, playerRes] = await Promise.all([
      db.from('npcs').select('id, name, slug, role, faction_id'),
      db.from('locations').select('id, name, slug, region'),
      db.from('quests').select('id, title, slug, status'),
      db.from('factions').select('id, name, slug'),
      db.from('players').select('id, name, character_name').eq('is_active', true),
    ])

    const worldContext = {
      npcs:      npcRes.data ?? [],
      locations: locationRes.data ?? [],
      quests:    questRes.data ?? [],
      factions:  factionRes.data ?? [],
      players:   playerRes.data ?? [],
    }

    // ── Claude extraction prompt ──
    const extractionPrompt = `You are the campaign manager for a D&D campaign set in the world of Aeloria.
Your job is to read a session transcript and extract structured data to update the campaign database.

## World context (existing records)
NPCs: ${JSON.stringify(worldContext.npcs)}
Locations: ${JSON.stringify(worldContext.locations)}
Quests: ${JSON.stringify(worldContext.quests)}
Factions: ${JSON.stringify(worldContext.factions)}
Players: ${JSON.stringify(worldContext.players)}

## Session transcript
${session.raw_transcript}

## Your task
Analyze the transcript and return a JSON object with this exact structure:

{
  "summary": "2-3 sentence summary of the session events",
  "locations_visited": [
    { "location_id": "uuid-from-world-context", "player_id": "uuid", "notes": "how they arrived / what they did" }
  ],
  "relationship_changes": [
    {
      "npc_id": "uuid",
      "player_id": "uuid",
      "attitude_delta": -2,
      "summary": "brief explanation of why the attitude changed",
      "memory": "one sentence the NPC would remember about this interaction"
    }
  ],
  "quest_updates": [
    {
      "quest_id": "uuid",
      "new_status": "active|completed|failed",
      "player_notes": "what the players now know about this quest"
    }
  ],
  "faction_rep_changes": [
    {
      "faction_id": "uuid",
      "player_id": "uuid",
      "delta": 15,
      "notes": "why reputation changed"
    }
  ],
  "new_discoveries": [
    {
      "description": "something new the players learned",
      "entity_type": "npc|location|quest|faction|lore",
      "entity_id": "uuid if applicable, else null",
      "player_id": "uuid of the player who made the discovery, or null if the whole party"
    }
  ]
}

Rules:
- Only reference IDs that appear in the world context above
- attitude_delta must be between -5 and +5 (most interactions are ±1 or ±2)
- faction delta must be between -50 and +50 (most changes are ±5 to ±20)
- If a player visits a location for the first time, include it in locations_visited
- If you are uncertain about something, omit it rather than guess
- Return only the JSON object, no other text`

    const message = await anthropic.messages.create({
      model: 'claude-opus-4-6',
      max_tokens: 4096,
      messages: [{ role: 'user', content: extractionPrompt }],
    })

    const responseText = message.content[0].type === 'text' ? message.content[0].text : ''

    // Parse JSON from Claude's response
    let extracted: any
    try {
      const jsonMatch = responseText.match(/\{[\s\S]*\}/)
      extracted = JSON.parse(jsonMatch?.[0] ?? '{}')
    } catch {
      throw new Error('Failed to parse Claude response as JSON')
    }

    // ── Apply changes to database ──
    const changes = {
      summary: extracted.summary ?? '',
      locations: [] as string[],
      relationships: [] as any[],
      quests: [] as any[],
      factions: [] as any[],
    }

    // 1. Location discoveries (fog of war)
    for (const visit of extracted.locations_visited ?? []) {
      if (!visit.location_id) continue
      await db.from('player_discoveries').upsert({
        player_id: visit.player_id,
        location_id: visit.location_id,
        discovery_notes: visit.notes,
      }, { onConflict: 'player_id,location_id', ignoreDuplicates: true })

      const loc = worldContext.locations.find((l) => l.id === visit.location_id)
      if (loc) changes.locations.push(loc.name)
    }

    // 2. NPC relationship changes
    for (const rel of extracted.relationship_changes ?? []) {
      if (!rel.npc_id || !rel.player_id) continue

      // Get current relationship
      const { data: existing } = await db
        .from('npc_relationships')
        .select('*')
        .eq('npc_id', rel.npc_id)
        .eq('player_id', rel.player_id)
        .single()

      const currentAttitude = existing?.attitude ?? 0
      const currentMemories: any[] = Array.isArray(existing?.memories) ? (existing.memories as any[]) : []
      const newAttitude = Math.max(-5, Math.min(5, currentAttitude + (rel.attitude_delta ?? 0)))

      const newMemory = {
        session_id: sessionId,
        summary: rel.memory ?? rel.summary,
        attitude_delta: rel.attitude_delta ?? 0,
      }

      await db.from('npc_relationships').upsert({
        npc_id: rel.npc_id,
        player_id: rel.player_id,
        attitude: newAttitude,
        last_interaction: rel.summary,
        memories: [...currentMemories, newMemory],
        updated_at: new Date().toISOString(),
      }, { onConflict: 'npc_id,player_id' })

      const npc = worldContext.npcs.find((n) => n.id === rel.npc_id)
      const player = worldContext.players.find((p) => p.id === rel.player_id)
      changes.relationships.push({
        npc:     npc?.name ?? rel.npc_id,
        player:  player?.character_name ?? rel.player_id,
        delta:   rel.attitude_delta,
        summary: rel.summary,
      })
    }

    // 3. Quest updates
    for (const qu of extracted.quest_updates ?? []) {
      if (!qu.quest_id) continue
      await db.from('quests').update({ status: qu.new_status }).eq('id', qu.quest_id)

      const quest = worldContext.quests.find((q) => q.id === qu.quest_id)
      changes.quests.push({ title: quest?.title ?? qu.quest_id, update: qu.new_status })
    }

    // 4. Faction rep changes
    for (const fr of extracted.faction_rep_changes ?? []) {
      if (!fr.faction_id || !fr.player_id) continue

      const { data: existing } = await db
        .from('player_faction_rep')
        .select('*')
        .eq('faction_id', fr.faction_id)
        .eq('player_id', fr.player_id)
        .single()

      const current = existing?.reputation ?? 0
      const updated = Math.max(-100, Math.min(100, current + (fr.delta ?? 0)))
      const rankTitle = repToRank(updated)

      await db.from('player_faction_rep').upsert({
        faction_id: fr.faction_id,
        player_id:  fr.player_id,
        reputation: updated,
        rank_title: rankTitle,
        notes:      fr.notes,
        updated_at: new Date().toISOString(),
      }, { onConflict: 'player_id,faction_id' })

      const faction = worldContext.factions.find((f) => f.id === fr.faction_id)
      const player  = worldContext.players.find((p) => p.id === fr.player_id)
      changes.factions.push({
        faction: faction?.name ?? fr.faction_id,
        player:  player?.character_name ?? fr.player_id,
        delta:   fr.delta,
      })
    }

    // 5. Session events log
    const allEvents = [
      ...(extracted.locations_visited ?? []).map((v: any) => ({
        session_id: sessionId,
        event_type: 'location_visit',
        entity_type: 'location',
        entity_id: v.location_id,
        player_id: v.player_id,
        description: v.notes,
        data: {},
      })),
      ...(extracted.new_discoveries ?? []).map((d: any) => ({
        session_id: sessionId,
        event_type: 'discovery',
        entity_type: d.entity_type,
        entity_id: d.entity_id,
        player_id: d.player_id,
        description: d.description,
        data: {},
      })),
    ]

    if (allEvents.length > 0) {
      await db.from('session_events').insert(allEvents)
    }

    // 6. Update session as processed with summary
    await db.from('sessions').update({
      processed: true,
      summary: extracted.summary,
    }).eq('id', sessionId)

    return NextResponse.json({ success: true, summary: extracted.summary, changes })

  } catch (err: any) {
    console.error('process-session error:', err)
    return NextResponse.json({ error: err.message }, { status: 500 })
  }
}

function repToRank(rep: number): string {
  if (rep >= 80)  return 'Champion'
  if (rep >= 50)  return 'Honored'
  if (rep >= 20)  return 'Friendly'
  if (rep >= -20) return 'Neutral'
  if (rep >= -50) return 'Unfriendly'
  if (rep >= -80) return 'Hostile'
  return 'Exalted Enemy'
}
