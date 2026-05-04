'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'
import type { NPC, Faction, Quest, Player, NPCRelationship } from '@/types/database'

type Tab = 'npcs' | 'factions' | 'quests' | 'sessions'

interface NPCWithRelationships extends NPC {
  relationships?: (NPCRelationship & { player?: Player })[]
  faction?: Faction
  location_name?: string
}

const attitudeLabel = (v: number) => {
  if (v >= 4)  return { text: 'Devoted ally', color: 'text-emerald-400' }
  if (v >= 2)  return { text: 'Friendly',     color: 'text-green-400' }
  if (v >= 1)  return { text: 'Warm',         color: 'text-lime-400' }
  if (v === 0) return { text: 'Neutral',      color: 'text-amber-500' }
  if (v >= -1) return { text: 'Cool',         color: 'text-orange-400' }
  if (v >= -3) return { text: 'Unfriendly',   color: 'text-red-400' }
  return              { text: 'Hostile',      color: 'text-red-600' }
}

const attitudeBar = (v: number) => {
  const pct = ((v + 5) / 10) * 100
  const color = v >= 2 ? '#22c55e' : v >= 0 ? '#f59e0b' : '#ef4444'
  return (
    <div className="w-full h-1.5 bg-stone-700 rounded-full overflow-hidden">
      <div className="h-full rounded-full transition-all" style={{ width: `${pct}%`, background: color }} />
    </div>
  )
}

export default function DMDashboard() {
  const [tab, setTab] = useState<Tab>('npcs')
  const [npcs, setNpcs] = useState<NPCWithRelationships[]>([])
  const [factions, setFactions] = useState<Faction[]>([])
  const [quests, setQuests] = useState<Quest[]>([])
  const [players, setPlayers] = useState<Player[]>([])
  const [selectedNPC, setSelectedNPC] = useState<NPCWithRelationships | null>(null)
  const [loading, setLoading] = useState(true)
  const [npcSearch, setNpcSearch] = useState('')

  useEffect(() => {
    Promise.all([
      supabase.from('npcs').select('*').order('is_major', { ascending: false }),
      supabase.from('factions').select('*').order('danger_rating', { ascending: false }),
      supabase.from('quests').select('*').order('quest_type'),
      supabase.from('players').select('*').eq('is_active', true),
    ]).then(([npcRes, factionRes, questRes, playerRes]) => {
      setFactions(factionRes.data ?? [])
      setQuests(questRes.data ?? [])
      setPlayers(playerRes.data ?? [])

      const npcData = npcRes.data ?? []
      setNpcs(npcData.map((n) => ({
        ...n,
        faction: factionRes.data?.find((f) => f.id === n.faction_id),
      })))
      setLoading(false)
    })
  }, [])

  const loadNPCRelationships = async (npc: NPCWithRelationships) => {
    const { data } = await supabase
      .from('npc_relationships')
      .select('*')
      .eq('npc_id', npc.id)

    const enriched: (NPCRelationship & { player?: Player })[] = (data ?? []).map((r) => ({
      ...r,
      player: players.find((p) => p.id === r.player_id),
    }))

    // Fill in missing player entries at attitude 0
    const allPlayerRelationships = players.map((p) => {
      const existing = enriched.find((r) => r.player_id === p.id)
      return existing ?? {
        id: `placeholder-${p.id}`,
        npc_id: npc.id,
        player_id: p.id,
        attitude: 0,
        last_interaction: null,
        memories: [],
        updated_at: '',
        player: p,
      } as NPCRelationship & { player?: Player }
    })

    const updated = { ...npc, relationships: allPlayerRelationships }
    setSelectedNPC(updated)
  }

  const filteredNPCs = npcs.filter((n) =>
    n.name.toLowerCase().includes(npcSearch.toLowerCase()) ||
    n.role?.toLowerCase().includes(npcSearch.toLowerCase()) ||
    n.faction?.name?.toLowerCase().includes(npcSearch.toLowerCase())
  )

  const questsByStatus = {
    active:    quests.filter((q) => q.status === 'active'),
    available: quests.filter((q) => q.status === 'available'),
    hidden:    quests.filter((q) => q.status === 'hidden'),
    completed: quests.filter((q) => q.status === 'completed'),
  }

  return (
    <div className="min-h-screen bg-stone-950 text-amber-100 font-serif">
      {/* ── Header ── */}
      <header className="border-b border-amber-900/40 px-6 py-4 flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-amber-400 tracking-widest">ELARYN</h1>
          <p className="text-xs text-amber-700">Dungeon Master Dashboard · 247 PA</p>
        </div>
        <nav className="flex gap-2">
          {([
            ['npcs',     'NPCs & Relations'],
            ['factions', 'Factions'],
            ['quests',   'Quests'],
            ['sessions', 'Sessions'],
          ] as [Tab, string][]).map(([t, label]) => (
            <button
              key={t}
              onClick={() => setTab(t)}
              className={`px-4 py-2 text-sm border rounded transition-colors ${
                tab === t
                  ? 'bg-amber-800 border-amber-500 text-amber-100'
                  : 'bg-stone-900 border-amber-900/40 text-amber-600 hover:border-amber-700'
              }`}
            >
              {label}
            </button>
          ))}
          <a
            href="/map"
            className="px-4 py-2 text-sm border border-amber-900/40 bg-stone-900 text-amber-600 rounded hover:border-amber-700 transition-colors"
          >
            Map →
          </a>
        </nav>
      </header>

      {loading ? (
        <div className="flex items-center justify-center h-64">
          <p className="text-amber-700 italic">Consulting the archives…</p>
        </div>
      ) : (
        <main className="p-6">

          {/* ═══════════════════ NPCs TAB ═══════════════════ */}
          {tab === 'npcs' && (
            <div className="flex gap-6 h-[calc(100vh-140px)]">
              {/* NPC list */}
              <div className="w-80 flex-shrink-0 flex flex-col gap-3">
                <input
                  value={npcSearch}
                  onChange={(e) => setNpcSearch(e.target.value)}
                  placeholder="Search NPCs…"
                  className="w-full px-3 py-2 bg-stone-900 border border-amber-900/40 rounded text-sm text-amber-200 placeholder-amber-800 focus:outline-none focus:border-amber-700"
                />
                <div className="overflow-y-auto space-y-1.5 flex-1">
                  {filteredNPCs.map((npc) => (
                    <button
                      key={npc.id}
                      onClick={() => loadNPCRelationships(npc)}
                      className={`w-full text-left px-3 py-2.5 rounded border transition-colors ${
                        selectedNPC?.id === npc.id
                          ? 'bg-amber-900/50 border-amber-600'
                          : 'bg-stone-900/50 border-amber-900/20 hover:border-amber-800'
                      }`}
                    >
                      <div className="flex items-center justify-between">
                        <span className="font-medium text-sm text-amber-200">{npc.name}</span>
                        {npc.is_major && (
                          <span className="text-xs bg-amber-900 text-amber-400 px-1.5 py-0.5 rounded">MAJOR</span>
                        )}
                      </div>
                      <div className="text-xs text-amber-700 mt-0.5">{npc.role}</div>
                      {npc.faction && (
                        <div className="text-xs text-amber-800 mt-0.5">{npc.faction.name}</div>
                      )}
                    </button>
                  ))}
                </div>
              </div>

              {/* NPC detail panel */}
              {selectedNPC ? (
                <div className="flex-1 overflow-y-auto space-y-5">
                  <div className="flex items-start justify-between">
                    <div>
                      <h2 className="text-2xl font-bold text-amber-400">{selectedNPC.name}</h2>
                      <p className="text-sm text-amber-700 mt-0.5">
                        {selectedNPC.role}{selectedNPC.race ? ` · ${selectedNPC.race}` : ''}
                        {selectedNPC.faction ? ` · ${selectedNPC.faction.name}` : ''}
                      </p>
                    </div>
                    <div className="flex gap-1.5">
                      {!selectedNPC.is_alive && (
                        <span className="text-xs bg-stone-700 text-stone-400 px-2 py-1 rounded border border-stone-600">
                          DECEASED
                        </span>
                      )}
                    </div>
                  </div>

                  {/* Description + personality */}
                  <div className="grid grid-cols-2 gap-4">
                    <div className="bg-stone-900/50 border border-amber-900/30 rounded p-4">
                      <h3 className="text-xs font-bold text-amber-700 uppercase tracking-wider mb-2">Appearance</h3>
                      <p className="text-sm text-amber-200 leading-relaxed">{selectedNPC.description}</p>
                    </div>
                    <div className="bg-stone-900/50 border border-amber-900/30 rounded p-4">
                      <h3 className="text-xs font-bold text-amber-700 uppercase tracking-wider mb-2">Personality</h3>
                      <p className="text-sm text-amber-200 leading-relaxed">{selectedNPC.personality}</p>
                    </div>
                  </div>

                  {/* DM Secrets */}
                  {selectedNPC.secrets && (
                    <div className="bg-red-950/30 border border-red-800/50 rounded p-4">
                      <h3 className="text-xs font-bold text-red-500 uppercase tracking-wider mb-2">
                        ⚠ DM SECRETS — NOT FOR PLAYERS
                      </h3>
                      <p className="text-sm text-red-300 leading-relaxed">{selectedNPC.secrets}</p>
                    </div>
                  )}

                  {/* Relationship matrix */}
                  <div>
                    <h3 className="text-xs font-bold text-amber-700 uppercase tracking-wider mb-3">
                      Player Relationships
                    </h3>
                    {selectedNPC.relationships && selectedNPC.relationships.length > 0 ? (
                      <div className="space-y-3">
                        {selectedNPC.relationships.map((rel) => {
                          const { text, color } = attitudeLabel(rel.attitude)
                          const memories = Array.isArray(rel.memories) ? rel.memories : []
                          return (
                            <div key={rel.id} className="bg-stone-900/50 border border-amber-900/20 rounded p-4">
                              <div className="flex items-center justify-between mb-2">
                                <div>
                                  <span className="font-medium text-amber-300">
                                    {rel.player?.character_name ?? 'Unknown'}
                                  </span>
                                  <span className="text-xs text-amber-800 ml-2">
                                    ({rel.player?.name ?? ''})
                                  </span>
                                </div>
                                <div className="flex items-center gap-3">
                                  <span className={`text-sm font-medium ${color}`}>{text}</span>
                                  <span className="text-xs text-amber-800">
                                    {rel.attitude > 0 ? '+' : ''}{rel.attitude}
                                  </span>
                                </div>
                              </div>
                              <div className="mb-2">{attitudeBar(rel.attitude)}</div>
                              {rel.last_interaction && (
                                <p className="text-xs text-amber-700 italic mt-1">
                                  Last: {rel.last_interaction}
                                </p>
                              )}
                              {memories.length > 0 && (
                                <div className="mt-2 space-y-1">
                                  <p className="text-xs text-amber-800 font-bold">Memories:</p>
                                  {(memories as any[]).map((m: any, i: number) => (
                                    <div key={i} className="text-xs text-amber-600 pl-2 border-l border-amber-900/40">
                                      {m.summary}
                                      {m.attitude_delta !== 0 && (
                                        <span className={m.attitude_delta > 0 ? 'text-green-600' : 'text-red-600'}>
                                          {' '}({m.attitude_delta > 0 ? '+' : ''}{m.attitude_delta})
                                        </span>
                                      )}
                                    </div>
                                  ))}
                                </div>
                              )}
                            </div>
                          )
                        })}
                      </div>
                    ) : (
                      <p className="text-sm text-amber-800 italic">
                        No player interactions recorded yet.
                      </p>
                    )}
                  </div>
                </div>
              ) : (
                <div className="flex-1 flex items-center justify-center">
                  <p className="text-amber-800 italic">Select an NPC to view details</p>
                </div>
              )}
            </div>
          )}

          {/* ═══════════════════ FACTIONS TAB ═══════════════════ */}
          {tab === 'factions' && (
            <div className="grid grid-cols-2 gap-4 max-w-5xl">
              {factions.map((f) => (
                <div key={f.id} className="bg-stone-900/50 border border-amber-900/30 rounded p-5">
                  <div className="flex items-start justify-between mb-2">
                    <h2 className="font-bold text-amber-400">{f.name}</h2>
                    <div className="flex items-center gap-2">
                      <span className="text-xs text-amber-800">{f.alignment}</span>
                      <span className="text-xs text-red-500">
                        {'★'.repeat(f.danger_rating)}{'☆'.repeat(5 - f.danger_rating)}
                      </span>
                    </div>
                  </div>
                  <p className="text-xs text-amber-600 mb-3 italic">{f.goal}</p>
                  <p className="text-sm text-amber-200 leading-relaxed">{f.description}</p>
                  {f.dm_notes && (
                    <div className="mt-3 bg-red-950/20 border-l-2 border-red-800 pl-2 py-1">
                      <p className="text-xs text-red-400">{f.dm_notes}</p>
                    </div>
                  )}

                  {/* Player rep for this faction */}
                  <PlayerFactionRep factionId={f.id} players={players} />
                </div>
              ))}
            </div>
          )}

          {/* ═══════════════════ QUESTS TAB ═══════════════════ */}
          {tab === 'quests' && (
            <div className="space-y-6 max-w-4xl">
              {(['active', 'available', 'hidden', 'completed'] as const).map((status) => {
                const qs = questsByStatus[status]
                if (qs.length === 0) return null
                return (
                  <div key={status}>
                    <h2 className="text-xs font-bold uppercase tracking-widest text-amber-700 mb-3">
                      {status} ({qs.length})
                    </h2>
                    <div className="space-y-2">
                      {qs.map((q) => (
                        <div key={q.id} className={`border rounded p-4 ${
                          status === 'active'
                            ? 'bg-amber-950/30 border-amber-700/50'
                            : status === 'hidden'
                            ? 'bg-stone-900/30 border-stone-700/50'
                            : 'bg-stone-900/50 border-amber-900/20'
                        }`}>
                          <div className="flex items-start justify-between gap-4">
                            <div>
                              <span className="font-medium text-amber-300">{q.title}</span>
                              <span className="text-xs text-amber-800 ml-2">
                                {q.region} · {q.quest_type}
                              </span>
                            </div>
                            <span className={`text-xs px-2 py-0.5 rounded flex-shrink-0 ${
                              status === 'active'    ? 'bg-amber-700 text-amber-100' :
                              status === 'hidden'    ? 'bg-stone-700 text-stone-400' :
                              status === 'completed' ? 'bg-emerald-900 text-emerald-400' :
                              'bg-stone-800 text-amber-600'
                            }`}>
                              {status}
                            </span>
                          </div>
                          {q.description && (
                            <p className="text-sm text-amber-200 mt-2 leading-relaxed">{q.description}</p>
                          )}
                          {q.dm_notes && (
                            <p className="text-xs text-red-400 mt-2 pl-2 border-l border-red-800">
                              <strong>DM:</strong> {q.dm_notes}
                            </p>
                          )}
                        </div>
                      ))}
                    </div>
                  </div>
                )
              })}
            </div>
          )}

          {/* ═══════════════════ SESSIONS TAB ═══════════════════ */}
          {tab === 'sessions' && (
            <div className="max-w-3xl space-y-4">
              <div className="flex items-center justify-between mb-2">
                <h2 className="text-lg font-bold text-amber-400">Session Log</h2>
                <a
                  href="/dm/upload"
                  className="px-4 py-2 bg-amber-800 border border-amber-600 rounded text-sm hover:bg-amber-700 transition-colors"
                >
                  + Upload Transcript
                </a>
              </div>
              <SessionList />
            </div>
          )}

        </main>
      )}
    </div>
  )
}

// ── Sub-components ────────────────────────────────

function PlayerFactionRep({ factionId, players }: { factionId: string; players: Player[] }) {
  const [reps, setReps] = useState<any[]>([])

  useEffect(() => {
    supabase
      .from('player_faction_rep')
      .select('*')
      .eq('faction_id', factionId)
      .then(({ data }) => setReps(data ?? []))
  }, [factionId])

  if (players.length === 0) return null

  return (
    <div className="mt-4 pt-3 border-t border-amber-900/30">
      <p className="text-xs text-amber-800 font-bold uppercase tracking-wider mb-2">Player Standing</p>
      <div className="space-y-1.5">
        {players.map((p) => {
          const rep = reps.find((r) => r.player_id === p.id)
          const val = rep?.reputation ?? 0
          const pct = ((val + 100) / 200) * 100
          const color = val >= 30 ? '#22c55e' : val >= 0 ? '#f59e0b' : '#ef4444'
          return (
            <div key={p.id} className="flex items-center gap-2">
              <span className="text-xs text-amber-600 w-24 truncate">{p.character_name}</span>
              <div className="flex-1 h-1 bg-stone-700 rounded-full overflow-hidden">
                <div className="h-full rounded-full" style={{ width: `${pct}%`, background: color }} />
              </div>
              <span className="text-xs text-amber-800 w-16 text-right">{rep?.rank_title ?? 'Unknown'}</span>
            </div>
          )
        })}
      </div>
    </div>
  )
}

function SessionList() {
  const [sessions, setSessions] = useState<any[]>([])

  useEffect(() => {
    supabase
      .from('sessions')
      .select('*')
      .order('session_number', { ascending: false })
      .then(({ data }) => setSessions(data ?? []))
  }, [])

  if (sessions.length === 0) {
    return (
      <div className="text-center py-16 border border-amber-900/20 rounded bg-stone-900/30">
        <p className="text-amber-700 italic">No sessions recorded yet.</p>
        <p className="text-amber-800 text-sm mt-2">Upload your first transcript to begin.</p>
      </div>
    )
  }

  return (
    <div className="space-y-2">
      {sessions.map((s) => (
        <div key={s.id} className="bg-stone-900/50 border border-amber-900/20 rounded p-4">
          <div className="flex items-center justify-between">
            <div>
              <span className="font-medium text-amber-300">
                Session {s.session_number}: {s.title ?? 'Untitled'}
              </span>
              <span className="text-xs text-amber-800 ml-3">{s.played_at}</span>
            </div>
            <span className={`text-xs px-2 py-0.5 rounded ${
              s.processed
                ? 'bg-emerald-900 text-emerald-400'
                : 'bg-amber-950 text-amber-600'
            }`}>
              {s.processed ? 'Processed' : 'Pending'}
            </span>
          </div>
          {s.summary && (
            <p className="text-sm text-amber-200 mt-2 leading-relaxed">{s.summary}</p>
          )}
        </div>
      ))}
    </div>
  )
}
