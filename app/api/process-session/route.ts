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

    const { data: session, error: sessionErr } = await db
      .from('sessions')
      .select('*')
      .eq('id', sessionId)
      .single()
    if (sessionErr || !session) throw new Error('Session not found')
    if (!session.raw_transcript) throw new Error('No transcript to process')

    // Fetch full world context for Claude
    const [npcRes, locationRes, questRes, factionRes, playerRes, locRepRes] = await Promise.all([
      db.from('npcs').select('id, name, slug, role, race, faction_id, location_id, is_alive'),
      db.from('locations').select('id, name, slug, region, location_type'),
      db.from('quests').select('id, title, slug, status, quest_type, region'),
      db.from('factions').select('id, name, slug, alignment'),
      db.from('players').select('id, name, character_name, character_class, character_race, level').eq('is_active', true),
      db.from('location_reputation').select('location_id, reputation, rank_title'),
    ])

    // Fetch existing NPC relationships for delta context
    const { data: existingRels } = await db
      .from('npc_relationships')
      .select('npc_id, player_id, attitude')

    const worldContext = {
      npcs:               npcRes.data ?? [],
      locations:          locationRes.data ?? [],
      quests:             questRes.data ?? [],
      factions:           factionRes.data ?? [],
      players:            playerRes.data ?? [],
      location_reputations: locRepRes.data ?? [],
      existing_relationships: existingRels ?? [],
    }

    // System prompt is the stable world knowledge — cache it
    const systemPrompt = `You are the campaign manager for an ongoing D&D 5e campaign set in the world of Aeloria (Age of Cracked Crowns).

Your role is to read session transcripts and extract structured data to update the campaign database. You have deep knowledge of D&D 5e social mechanics, relationship dynamics, and narrative pacing.

## D&D Social Mechanics Guidelines
- Attitude scale: -5 (hostile, attack on sight) to +5 (devoted ally, would die for them)
- Small positive interactions: +1 (polite, helpful)
- Meaningful help or roleplaying: +2 (saved their life, uncovered their secret kindly)
- Exceptional acts: +3 to +4 (huge sacrifice, deep trust earned)
- Betrayal/violence against them: -3 to -5
- Rudeness/minor offense: -1
- Location reputation: -100 (hunted, bounty posted) to +100 (celebrated heroes, statues)
- Most session location rep changes are ±5 to ±20

## What to extract
For EVERY NPC the players interacted with meaningfully, record attitude changes and memories.
For EVERY location the players entered, record a discovery and any reputation change.
For EVERY quest that had progress, update its status.
For EVERY faction the players helped or hurt, update reputation.

Be conservative — only extract things clearly evidenced in the transcript.`

    const extractionPrompt = `## Current World State

### Players
${JSON.stringify(worldContext.players, null, 2)}

### NPCs (living: ${worldContext.npcs.filter(n => n.is_alive).length})
${JSON.stringify(worldContext.npcs, null, 2)}

### Locations
${JSON.stringify(worldContext.locations, null, 2)}

### Quests
${JSON.stringify(worldContext.quests, null, 2)}

### Factions
${JSON.stringify(worldContext.factions, null, 2)}

### Existing NPC-Player Attitudes (for delta calculation)
${JSON.stringify(worldContext.existing_relationships, null, 2)}

### Current Location Reputations
${JSON.stringify(worldContext.location_reputations, null, 2)}

---

## Session Transcript — Session ${session.session_number}
${session.raw_transcript}

---

## Task
Analyze the transcript and return a JSON object with this exact structure:

{
  "session_title": "short evocative title for this session (5-8 words)",
  "summary": "3-4 sentence narrative summary written for players to read in their journal. Past tense. Vivid and specific.",
  "dm_summary": "1-2 sentences of DM-only notes: foreshadowing planted, player mistakes, things to follow up",
  "locations_visited": [
    {
      "location_id": "uuid",
      "player_id": "uuid or null for whole party",
      "notes": "what happened here / why they came / what they found"
    }
  ],
  "location_reputation_changes": [
    {
      "location_id": "uuid",
      "delta": 10,
      "notes": "why reputation changed at this location"
    }
  ],
  "relationship_changes": [
    {
      "npc_id": "uuid",
      "player_id": "uuid",
      "attitude_delta": 1,
      "summary": "one sentence: what the NPC experienced or felt about this interaction",
      "memory": "one sentence the NPC will remember about this player specifically"
    }
  ],
  "quest_updates": [
    {
      "quest_id": "uuid",
      "new_status": "active|completed|failed|available",
      "player_notes": "what the players now know or have done on this quest"
    }
  ],
  "faction_rep_changes": [
    {
      "faction_id": "uuid",
      "player_id": "uuid or null for whole party",
      "delta": 15,
      "notes": "why reputation changed"
    }
  ],
  "new_discoveries": [
    {
      "description": "what the players learned (player-visible text)",
      "entity_type": "npc|location|quest|faction|lore",
      "entity_id": "uuid if applicable, else null",
      "player_id": "uuid if only one player, null if the whole party"
    }
  ],
  "npc_deaths": [
    {
      "npc_id": "uuid",
      "circumstances": "how they died"
    }
  ]
}

Rules:
- Only reference IDs from the world context above
- attitude_delta: -5 to +5, most are ±1 or ±2
- location reputation delta: -50 to +50, most are ±5 to ±20
- faction delta: -50 to +50, most are ±5 to ±20
- If uncertain, omit rather than guess
- Return ONLY the JSON object, no other text`

    const message = await anthropic.messages.create({
      model: 'claude-opus-4-6',
      max_tokens: 4096,
      system: [
        {
          type: 'text',
          text: systemPrompt,
          cache_control: { type: 'ephemeral' },
        },
      ],
      messages: [{ role: 'user', content: extractionPrompt }],
    })

    const responseText = message.content[0].type === 'text' ? message.content[0].text : ''

    let extracted: any
    try {
      const jsonMatch = responseText.match(/\{[\s\S]*\}/)
      extracted = JSON.parse(jsonMatch?.[0] ?? '{}')
    } catch {
      throw new Error('Failed to parse Claude response as JSON')
    }

    const changes = {
      summary:       extracted.summary ?? '',
      locations:     [] as string[],
      relationships: [] as any[],
      quests:        [] as any[],
      factions:      [] as any[],
      discoveries:   [] as string[],
    }

    // 1. Location discoveries (fog of war)
    for (const visit of extracted.locations_visited ?? []) {
      if (!visit.location_id) continue
      const playerIds = visit.player_id
        ? [visit.player_id]
        : worldContext.players.map((p) => p.id)

      for (const pid of playerIds) {
        await db.from('player_discoveries').upsert(
          { player_id: pid, location_id: visit.location_id, discovery_notes: visit.notes },
          { onConflict: 'player_id,location_id', ignoreDuplicates: true }
        )
      }
      const loc = worldContext.locations.find((l) => l.id === visit.location_id)
      if (loc) changes.locations.push(loc.name)
    }

    // 2. Location reputation changes
    for (const lr of extracted.location_reputation_changes ?? []) {
      if (!lr.location_id) continue
      const existing = worldContext.location_reputations.find((r) => r.location_id === lr.location_id)
      const current = existing?.reputation ?? 0
      const updated = Math.max(-100, Math.min(100, current + (lr.delta ?? 0)))
      const rankTitle = locRepToRank(updated)

      await db.from('location_reputation').upsert(
        { location_id: lr.location_id, reputation: updated, rank_title: rankTitle, notes: lr.notes, updated_at: new Date().toISOString() },
        { onConflict: 'location_id' }
      )
    }

    // 3. NPC relationship changes
    for (const rel of extracted.relationship_changes ?? []) {
      if (!rel.npc_id || !rel.player_id) continue

      const { data: existing } = await db
        .from('npc_relationships')
        .select('*')
        .eq('npc_id', rel.npc_id)
        .eq('player_id', rel.player_id)
        .single()

      const currentAttitude = existing?.attitude ?? 0
      const currentMemories: any[] = Array.isArray(existing?.memories) ? existing.memories as any[] : []
      const newAttitude = Math.max(-5, Math.min(5, currentAttitude + (rel.attitude_delta ?? 0)))

      await db.from('npc_relationships').upsert(
        {
          npc_id: rel.npc_id,
          player_id: rel.player_id,
          attitude: newAttitude,
          last_interaction: rel.summary,
          memories: [...currentMemories, {
            session_id: sessionId,
            session_number: session.session_number,
            summary: rel.memory ?? rel.summary,
            attitude_delta: rel.attitude_delta ?? 0,
          }],
          updated_at: new Date().toISOString(),
        },
        { onConflict: 'npc_id,player_id' }
      )

      const npc    = worldContext.npcs.find((n) => n.id === rel.npc_id)
      const player = worldContext.players.find((p) => p.id === rel.player_id)
      changes.relationships.push({ npc: npc?.name ?? rel.npc_id, player: player?.character_name ?? rel.player_id, delta: rel.attitude_delta, summary: rel.summary })
    }

    // 4. Quest updates
    for (const qu of extracted.quest_updates ?? []) {
      if (!qu.quest_id) continue
      const updateData: any = { status: qu.new_status }
      if (qu.new_status === 'completed') updateData.completed_at = new Date().toISOString()
      await db.from('quests').update(updateData).eq('id', qu.quest_id)

      // Update player_quests for all active players
      for (const player of worldContext.players) {
        await db.from('player_quests').upsert(
          { player_id: player.id, quest_id: qu.quest_id, status: qu.new_status, player_notes: qu.player_notes, updated_at: new Date().toISOString() },
          { onConflict: 'player_id,quest_id' }
        )
      }

      const quest = worldContext.quests.find((q) => q.id === qu.quest_id)
      changes.quests.push({ title: quest?.title ?? qu.quest_id, update: qu.new_status })
    }

    // 5. Faction rep changes
    for (const fr of extracted.faction_rep_changes ?? []) {
      if (!fr.faction_id) continue
      const playerIds = fr.player_id
        ? [fr.player_id]
        : worldContext.players.map((p) => p.id)

      for (const pid of playerIds) {
        const { data: existing } = await db
          .from('player_faction_rep')
          .select('*')
          .eq('faction_id', fr.faction_id)
          .eq('player_id', pid)
          .single()

        const current = existing?.reputation ?? 0
        const updated = Math.max(-100, Math.min(100, current + (fr.delta ?? 0)))

        await db.from('player_faction_rep').upsert(
          { faction_id: fr.faction_id, player_id: pid, reputation: updated, rank_title: repToRank(updated), notes: fr.notes, updated_at: new Date().toISOString() },
          { onConflict: 'player_id,faction_id' }
        )
      }

      const faction = worldContext.factions.find((f) => f.id === fr.faction_id)
      changes.factions.push({ faction: faction?.name ?? fr.faction_id, delta: fr.delta })
    }

    // 6. NPC deaths
    for (const death of extracted.npc_deaths ?? []) {
      if (!death.npc_id) continue
      await db.from('npcs').update({ is_alive: false }).eq('id', death.npc_id)
    }

    // 7. Session events log
    const allEvents = [
      ...(extracted.locations_visited ?? []).map((v: any) => ({
        session_id:  sessionId,
        event_type:  'location_visit',
        entity_type: 'location',
        entity_id:   v.location_id,
        player_id:   v.player_id ?? null,
        description: v.notes,
        data:        {},
      })),
      ...(extracted.new_discoveries ?? []).map((d: any) => ({
        session_id:  sessionId,
        event_type:  'discovery',
        entity_type: d.entity_type,
        entity_id:   d.entity_id ?? null,
        player_id:   d.player_id ?? null,
        description: d.description,
        data:        {},
      })),
      ...(extracted.relationship_changes ?? []).map((r: any) => ({
        session_id:  sessionId,
        event_type:  'relationship_change',
        entity_type: 'npc',
        entity_id:   r.npc_id,
        player_id:   r.player_id,
        description: r.summary,
        data:        { attitude_delta: r.attitude_delta },
      })),
      ...(extracted.quest_updates ?? []).map((q: any) => ({
        session_id:  sessionId,
        event_type:  'quest_update',
        entity_type: 'quest',
        entity_id:   q.quest_id,
        player_id:   null,
        description: q.player_notes ?? `Quest status → ${q.new_status}`,
        data:        { new_status: q.new_status },
      })),
    ]

    if (allEvents.length > 0) {
      await db.from('session_events').insert(allEvents)
    }

    // 8. Mark session processed
    await db.from('sessions').update({
      processed:   true,
      summary:     extracted.summary,
      title:       extracted.session_title ?? session.title,
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

function locRepToRank(rep: number): string {
  if (rep >= 80)  return 'Heroes of the people'
  if (rep >= 50)  return 'Welcomed guests'
  if (rep >= 20)  return 'Known & trusted'
  if (rep >= -20) return 'Unknown strangers'
  if (rep >= -50) return 'Unwelcome'
  if (rep >= -80) return 'Persons of interest'
  return 'Hunted'
}
