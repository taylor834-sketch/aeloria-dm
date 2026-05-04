'use client'

import { Suspense, useEffect, useState } from 'react'
import { useSearchParams } from 'next/navigation'
import dynamic from 'next/dynamic'
import { supabase } from '@/lib/supabase'
import type { Location, Quest, NPC, Player } from '@/types/database'

const LeafletMap = dynamic(() => import('@/components/map/LeafletMap'), {
  ssr: false,
  loading: () => (
    <div className="w-full h-full flex items-center justify-center bg-stone-950">
      <span className="text-amber-600 font-serif italic">The map unfurls…</span>
    </div>
  ),
})

type PlayerTab = 'map' | 'quests' | 'npcs' | 'journal'

// Wrap in Suspense so useSearchParams works during static prerender
export default function PlayerPage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen bg-stone-950 flex items-center justify-center">
        <p className="text-amber-700 font-serif italic">Loading your adventure…</p>
      </div>
    }>
      <PlayerView />
    </Suspense>
  )
}

function PlayerView() {
  const searchParams = useSearchParams()
  const playerId = searchParams.get('player')

  const [activeTab, setActiveTab] = useState<PlayerTab>('map')
  const [player, setPlayer] = useState<Player | null>(null)
  const [allPlayers, setAllPlayers] = useState<Player[]>([])
  const [locations, setLocations] = useState<Location[]>([])
  const [discoveredIds, setDiscoveredIds] = useState<Set<string>>(new Set())
  const [quests, setQuests] = useState<Quest[]>([])
  const [knownNPCs, setKnownNPCs] = useState<(NPC & { attitude?: number })[]>([])
  const [journal, setJournal] = useState<any[]>([])
  const [selectedLocation, setSelectedLocation] = useState<Location | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    supabase.from('players').select('*').eq('is_active', true).then(({ data }) => {
      setAllPlayers(data ?? [])
      if (playerId) {
        setPlayer(data?.find((p) => p.id === playerId) ?? null)
      } else if (data?.length) {
        setPlayer(data[0])
      }
    })
    supabase.from('locations').select('*').then(({ data }) => setLocations(data ?? []))
  }, [playerId])

  useEffect(() => {
    if (!player) return

    Promise.all([
      // Discovered locations for fog of war
      supabase
        .from('player_discoveries')
        .select('location_id')
        .eq('player_id', player.id),
      // Active quests
      supabase
        .from('quests')
        .select('*')
        .in('status', ['active', 'completed']),
      // Known NPCs (anyone they have a relationship with)
      supabase
        .from('npc_relationships')
        .select('*, npc:npcs(*)')
        .eq('player_id', player.id),
      // Session journal
      supabase
        .from('sessions')
        .select('session_number, title, played_at, summary')
        .eq('processed', true)
        .order('session_number', { ascending: false }),
    ]).then(([discRes, questRes, relRes, sessRes]) => {
      const ids = new Set((discRes.data ?? []).map((d) => d.location_id))
      setDiscoveredIds(ids)
      setQuests(questRes.data ?? [])

      const npcsWithAttitude = (relRes.data ?? [])
        .filter((r) => r.npc)
        .map((r) => ({ ...r.npc!, attitude: r.attitude }))
      setKnownNPCs(npcsWithAttitude)

      setJournal(sessRes.data ?? [])
      setLoading(false)
    })
  }, [player])

  const discoveredLocations = locations.filter((l) => discoveredIds.has(l.id))

  if (!player && allPlayers.length === 0 && !loading) {
    return (
      <div className="min-h-screen bg-stone-950 text-amber-100 font-serif flex items-center justify-center">
        <p className="text-amber-700 italic">No players found. Have the DM add players first.</p>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-stone-950 text-amber-100 font-serif flex flex-col">
      {/* ── Header ── */}
      <header className="border-b border-amber-900/40 px-6 py-3 flex items-center justify-between">
        <div className="flex items-center gap-4">
          <div>
            <h1 className="text-lg font-bold text-amber-400">{player?.character_name ?? 'Aeloria'}</h1>
            <p className="text-xs text-amber-700">
              {player?.character_race} {player?.character_class} · Level {player?.level}
            </p>
          </div>
          {/* Player switcher */}
          {allPlayers.length > 1 && (
            <select
              value={player?.id ?? ''}
              onChange={(e) => setPlayer(allPlayers.find((p) => p.id === e.target.value) ?? null)}
              className="text-xs bg-stone-900 border border-amber-900/40 rounded px-2 py-1 text-amber-600"
            >
              {allPlayers.map((p) => (
                <option key={p.id} value={p.id}>{p.character_name}</option>
              ))}
            </select>
          )}
        </div>

        <nav className="flex gap-2">
          {([
            ['map',    `Map (${discoveredLocations.length})`],
            ['quests', `Quests (${quests.filter(q => q.status === 'active').length})`],
            ['npcs',   `Known (${knownNPCs.length})`],
            ['journal','Journal'],
          ] as [PlayerTab, string][]).map(([t, label]) => (
            <button
              key={t}
              onClick={() => setActiveTab(t)}
              className={`px-3 py-1.5 text-sm border rounded transition-colors ${
                activeTab === t
                  ? 'bg-amber-800 border-amber-500 text-amber-100'
                  : 'bg-stone-900 border-amber-900/40 text-amber-600 hover:border-amber-700'
              }`}
            >
              {label}
            </button>
          ))}
        </nav>
      </header>

      {loading ? (
        <div className="flex-1 flex items-center justify-center">
          <p className="text-amber-700 italic">Loading your adventure…</p>
        </div>
      ) : (
        <main className="flex-1 overflow-hidden">
          {/* ── MAP ── */}
          {activeTab === 'map' && (
            <div className="flex h-full">
              <div className="flex-1 relative">
                <LeafletMap
                  locations={locations}
                  discoveredIds={discoveredIds}
                  isDM={false}
                  onLocationClick={setSelectedLocation}
                />
                {/* Fog of war overlay label */}
                <div className="absolute bottom-4 left-4 bg-stone-950/80 border border-amber-900/40 rounded px-3 py-1.5 text-xs text-amber-700">
                  {discoveredLocations.length} of {locations.filter(l => l.location_type !== 'dungeon').length} locations discovered
                </div>
              </div>
              {selectedLocation && (
                <div className="w-64 border-l border-amber-900/40 p-4 overflow-y-auto">
                  <div className="flex items-start justify-between mb-2">
                    <h2 className="font-bold text-amber-400">{selectedLocation.name}</h2>
                    <button onClick={() => setSelectedLocation(null)} className="text-amber-800 hover:text-amber-500">✕</button>
                  </div>
                  <p className="text-xs text-amber-700 mb-2">{selectedLocation.region}</p>
                  <p className="text-sm text-amber-200 leading-relaxed">{selectedLocation.description}</p>
                </div>
              )}
            </div>
          )}

          {/* ── QUESTS ── */}
          {activeTab === 'quests' && (
            <div className="p-6 max-w-2xl space-y-4 overflow-y-auto h-full">
              <div className="space-y-3">
                {(['active', 'completed'] as const).map((status) => {
                  const qs = quests.filter((q) => q.status === status)
                  if (!qs.length) return null
                  return (
                    <div key={status}>
                      <h2 className="text-xs font-bold text-amber-700 uppercase tracking-widest mb-2">
                        {status} quests ({qs.length})
                      </h2>
                      {qs.map((q) => (
                        <div key={q.id} className={`border rounded p-4 mb-2 ${
                          status === 'active'
                            ? 'bg-amber-950/20 border-amber-800/40'
                            : 'bg-stone-900/30 border-stone-700/40'
                        }`}>
                          <div className="flex items-center justify-between mb-1">
                            <span className="font-medium text-amber-300">{q.title}</span>
                            <span className="text-xs text-amber-800">{q.region}</span>
                          </div>
                          <p className="text-sm text-amber-200 leading-relaxed">{q.description}</p>
                        </div>
                      ))}
                    </div>
                  )
                })}
                {quests.length === 0 && (
                  <p className="text-amber-800 italic text-center py-8">No quests yet. Start exploring.</p>
                )}
              </div>
            </div>
          )}

          {/* ── KNOWN NPCs ── */}
          {activeTab === 'npcs' && (
            <div className="p-6 overflow-y-auto h-full">
              {knownNPCs.length === 0 ? (
                <p className="text-amber-800 italic text-center py-8">No one met yet. The world awaits.</p>
              ) : (
                <div className="grid grid-cols-2 gap-3 max-w-3xl">
                  {knownNPCs.map((npc) => {
                    const attitude = npc.attitude ?? 0
                    const color = attitude >= 2 ? 'text-green-400' : attitude >= 0 ? 'text-amber-400' : 'text-red-400'
                    const bar = ((attitude + 5) / 10) * 100
                    const barColor = attitude >= 2 ? '#22c55e' : attitude >= 0 ? '#f59e0b' : '#ef4444'
                    return (
                      <div key={npc.id} className="bg-stone-900/50 border border-amber-900/20 rounded p-4">
                        <div className="flex items-start justify-between mb-1">
                          <span className="font-medium text-amber-300">{npc.name}</span>
                          <span className={`text-xs ${color}`}>
                            {attitude >= 4 ? 'Ally' : attitude >= 2 ? 'Friendly' : attitude >= 0 ? 'Neutral' : attitude >= -2 ? 'Wary' : 'Hostile'}
                          </span>
                        </div>
                        <p className="text-xs text-amber-700 mb-2">{npc.role}</p>
                        <div className="w-full h-1 bg-stone-700 rounded-full overflow-hidden mb-2">
                          <div className="h-full rounded-full" style={{ width: `${bar}%`, background: barColor }} />
                        </div>
                        <p className="text-xs text-amber-600 leading-relaxed line-clamp-2">{npc.description}</p>
                      </div>
                    )
                  })}
                </div>
              )}
            </div>
          )}

          {/* ── JOURNAL ── */}
          {activeTab === 'journal' && (
            <div className="p-6 overflow-y-auto h-full max-w-2xl space-y-4">
              {journal.length === 0 ? (
                <p className="text-amber-800 italic text-center py-8">The chronicle has no entries yet.</p>
              ) : (
                journal.map((s) => (
                  <div key={s.session_number} className="bg-stone-900/40 border border-amber-900/20 rounded p-5">
                    <div className="flex items-center justify-between mb-2">
                      <h2 className="font-bold text-amber-400">
                        Session {s.session_number}{s.title ? `: ${s.title}` : ''}
                      </h2>
                      <span className="text-xs text-amber-800">{s.played_at}</span>
                    </div>
                    <p className="text-sm text-amber-200 leading-relaxed">{s.summary ?? 'Summary not available.'}</p>
                  </div>
                ))
              )}
            </div>
          )}
        </main>
      )}
    </div>
  )
}
