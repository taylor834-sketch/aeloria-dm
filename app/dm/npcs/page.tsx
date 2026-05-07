'use client'

import { useEffect, useState, useMemo } from 'react'
import { supabase } from '@/lib/supabase'
import type { NPC, Player, NPCRelationship, Faction, Location } from '@/types/database'

interface NPCRow extends NPC {
  faction_name?: string
  location_name?: string
  relationships?: (NPCRelationship & { player?: Player })[]
}

type Toggle = 'all' | 'major' | 'deceased'

function Spinner() {
  return (
    <div className="flex items-center justify-center h-64">
      <div
        className="w-8 h-8 rounded-full border-2 animate-spin"
        style={{ borderColor: 'var(--color-border)', borderTopColor: 'var(--color-gold)' }}
      />
    </div>
  )
}

function attitudeDot(attitude: number) {
  let bg: string
  if (attitude >= 3)       bg = 'var(--color-emerald-bright)'
  else if (attitude >= 1)  bg = '#86efac'
  else if (attitude === 0) bg = '#6b7280'
  else if (attitude >= -2) bg = '#fb923c'
  else                     bg = 'var(--color-crimson-bright)'

  return (
    <div
      title={`${attitude > 0 ? '+' : ''}${attitude}`}
      style={{
        width: 10,
        height: 10,
        borderRadius: '50%',
        background: bg,
        border: '1px solid rgba(0,0,0,0.3)',
        flexShrink: 0,
      }}
    />
  )
}

function attitudeLabel(v: number): string {
  if (v >= 4)  return 'Devoted'
  if (v >= 2)  return 'Friendly'
  if (v >= 1)  return 'Warm'
  if (v === 0) return 'Neutral'
  if (v >= -1) return 'Cool'
  if (v >= -3) return 'Unfriendly'
  return 'Hostile'
}

function ExpandedRow({
  npc,
  players,
  onClose,
}: {
  npc: NPCRow
  players: Player[]
  onClose: () => void
}) {
  const [rels, setRels] = useState<(NPCRelationship & { player?: Player })[]>([])
  const [loaded, setLoaded] = useState(false)

  useEffect(() => {
    supabase
      .from('npc_relationships')
      .select('*')
      .eq('npc_id', npc.id)
      .then(({ data }) => {
        const allRels = players.map((p) => {
          const existing = (data ?? []).find((r) => r.player_id === p.id)
          return {
            ...(existing ?? {
              id: `ph-${p.id}`,
              npc_id: npc.id,
              player_id: p.id,
              attitude: 0,
              last_interaction: null,
              memories: [],
              updated_at: '',
            }),
            player: p,
          } as NPCRelationship & { player?: Player }
        })
        setRels(allRels)
        setLoaded(true)
      })
  }, [npc.id, players])

  return (
    <tr>
      <td
        colSpan={7}
        style={{
          background: 'var(--color-surface-raised)',
          padding: 0,
          borderTop: 'none',
        }}
      >
        <div style={{ padding: '16px 20px', borderBottom: '1px solid var(--color-border)' }}>
          <div className="flex items-start justify-between gap-4 mb-4">
            <div>
              <h3
                className="font-display"
                style={{ fontSize: 16, color: 'var(--color-gold-light)', marginBottom: 2 }}
              >
                {npc.name}
              </h3>
              {npc.role && (
                <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)' }}>{npc.role}</p>
              )}
            </div>
            <button
              onClick={onClose}
              style={{ color: 'var(--color-parchment-dim)', fontSize: 18, lineHeight: 1, background: 'none', border: 'none', cursor: 'pointer' }}
            >
              ✕
            </button>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12, marginBottom: 16 }}>
            {npc.description && (
              <div className="card" style={{ padding: '10px 12px' }}>
                <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 4 }}>
                  Appearance
                </p>
                <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.5 }}>
                  {npc.description}
                </p>
              </div>
            )}
            {npc.personality && (
              <div className="card" style={{ padding: '10px 12px' }}>
                <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 4 }}>
                  Personality
                </p>
                <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.5 }}>
                  {npc.personality}
                </p>
              </div>
            )}
          </div>

          {npc.secrets && (
            <div
              style={{
                padding: '8px 12px',
                marginBottom: 16,
                borderRadius: 4,
                background: 'rgba(139,30,30,0.1)',
                border: '1px solid rgba(139,30,30,0.3)',
              }}
            >
              <p style={{ fontSize: 11, color: '#fca5a5', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 4, fontWeight: 600 }}>
                ⚠ DM Secrets
              </p>
              <p style={{ fontSize: 12, color: '#fca5a5', lineHeight: 1.5 }}>
                {npc.secrets}
              </p>
            </div>
          )}

          {/* Player relationships */}
          <div>
            <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 8 }}>
              Player Relationships
            </p>
            {!loaded ? (
              <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>Loading…</p>
            ) : (
              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(200px, 1fr))', gap: 8 }}>
                {rels.map((rel) => {
                  const pct = ((rel.attitude + 5) / 10) * 100
                  const barColor =
                    rel.attitude >= 2 ? 'var(--color-emerald-bright)' :
                    rel.attitude >= 0 ? 'var(--color-gold)' :
                    'var(--color-crimson-bright)'
                  return (
                    <div
                      key={rel.id}
                      className="card"
                      style={{ padding: '8px 10px' }}
                    >
                      <div className="flex items-center justify-between mb-2">
                        <p style={{ fontSize: 12, color: 'var(--color-parchment)', fontWeight: 500 }}>
                          {rel.player?.character_name ?? 'Unknown'}
                        </p>
                        <p style={{ fontSize: 11, color: barColor }}>
                          {attitudeLabel(rel.attitude)} ({rel.attitude > 0 ? '+' : ''}{rel.attitude})
                        </p>
                      </div>
                      <div className="attitude-bar-track" style={{ height: 4 }}>
                        <div
                          style={{
                            height: '100%',
                            borderRadius: 999,
                            width: `${pct}%`,
                            background: barColor,
                          }}
                        />
                      </div>
                      {rel.last_interaction && (
                        <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginTop: 4, fontStyle: 'italic' }}>
                          {rel.last_interaction}
                        </p>
                      )}
                    </div>
                  )
                })}
              </div>
            )}
          </div>
        </div>
      </td>
    </tr>
  )
}

export default function NpcsPage() {
  const [npcs, setNpcs] = useState<NPCRow[]>([])
  const [players, setPlayers] = useState<Player[]>([])
  const [loading, setLoading] = useState(true)
  const [toggle, setToggle] = useState<Toggle>('all')
  const [search, setSearch] = useState('')
  const [factionFilter, setFactionFilter] = useState('')
  const [locationFilter, setLocationFilter] = useState('')
  const [expandedId, setExpandedId] = useState<string | null>(null)

  useEffect(() => {
    async function load() {
      const [npcRes, playerRes, factionRes, locationRes] = await Promise.all([
        supabase.from('npcs').select('*').order('is_major', { ascending: false }),
        supabase.from('players').select('*'),
        supabase.from('factions').select('id, name'),
        supabase.from('locations').select('id, name'),
      ])

      const factions: Faction[] = (factionRes.data ?? []) as Faction[]
      const locations: Location[] = (locationRes.data ?? []) as Location[]
      const npcData = (npcRes.data ?? []) as NPC[]

      setNpcs(
        npcData.map((n) => ({
          ...n,
          faction_name: factions.find((f) => f.id === n.faction_id)?.name,
          location_name: locations.find((l) => l.id === n.location_id)?.name,
        }))
      )
      setPlayers(playerRes.data ?? [])
      setLoading(false)
    }
    load()
  }, [])

  const factionOptions = useMemo(() => {
    const set = new Set(npcs.filter((n) => n.faction_name).map((n) => n.faction_name!))
    return Array.from(set).sort()
  }, [npcs])

  const locationOptions = useMemo(() => {
    const set = new Set(npcs.filter((n) => n.location_name).map((n) => n.location_name!))
    return Array.from(set).sort()
  }, [npcs])

  const filtered = useMemo(() => {
    return npcs.filter((n) => {
      const matchToggle =
        toggle === 'all' ||
        (toggle === 'major' && n.is_major) ||
        (toggle === 'deceased' && !n.is_alive)
      const matchSearch =
        !search ||
        n.name.toLowerCase().includes(search.toLowerCase()) ||
        n.role?.toLowerCase().includes(search.toLowerCase())
      const matchFaction = !factionFilter || n.faction_name === factionFilter
      const matchLocation = !locationFilter || n.location_name === locationFilter
      return matchToggle && matchSearch && matchFaction && matchLocation
    })
  }, [npcs, toggle, search, factionFilter, locationFilter])

  if (loading) return <Spinner />

  const inputStyle: React.CSSProperties = {
    background: 'var(--color-surface)',
    border: '1px solid var(--color-border)',
    borderRadius: 5,
    padding: '7px 12px',
    color: 'var(--color-parchment)',
    fontSize: 13,
    outline: 'none',
  }

  const toggleButton = (value: Toggle, label: string) => (
    <button
      onClick={() => setToggle(value)}
      style={{
        padding: '6px 14px',
        borderRadius: 5,
        fontSize: 13,
        cursor: 'pointer',
        background: toggle === value ? 'rgba(201,160,68,0.12)' : 'var(--color-surface)',
        border: toggle === value ? '1px solid var(--color-gold-dim)' : '1px solid var(--color-border)',
        color: toggle === value ? 'var(--color-gold-light)' : 'var(--color-parchment-mid)',
      }}
    >
      {label}
    </button>
  )

  return (
    <div style={{ maxWidth: 1100 }}>
      {/* Header */}
      <div className="mb-6">
        <h1
          className="font-display"
          style={{ fontSize: 26, fontWeight: 600, color: 'var(--color-gold-light)', marginBottom: 4 }}
        >
          NPC Database
        </h1>
        <p style={{ color: 'var(--color-parchment-dim)', fontSize: 13 }}>
          {filtered.length} of {npcs.length} NPCs
        </p>
      </div>

      {/* Controls */}
      <div className="flex gap-3 mb-5 flex-wrap items-center">
        <div className="flex gap-1">
          {toggleButton('all', 'All')}
          {toggleButton('major', 'Major')}
          {toggleButton('deceased', 'Deceased')}
        </div>
        <input
          type="text"
          placeholder="Search by name or role…"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          style={{ ...inputStyle, minWidth: 200 }}
        />
        <select value={factionFilter} onChange={(e) => setFactionFilter(e.target.value)} style={{ ...inputStyle, minWidth: 150 }}>
          <option value="">All Factions</option>
          {factionOptions.map((f) => <option key={f} value={f}>{f}</option>)}
        </select>
        <select value={locationFilter} onChange={(e) => setLocationFilter(e.target.value)} style={{ ...inputStyle, minWidth: 150 }}>
          <option value="">All Locations</option>
          {locationOptions.map((l) => <option key={l} value={l}>{l}</option>)}
        </select>
      </div>

      {/* Table */}
      {filtered.length === 0 ? (
        <div className="text-center py-16" style={{ color: 'var(--color-parchment-dim)' }}>
          <p className="font-display text-sm">No NPCs found</p>
        </div>
      ) : (
        <div style={{ overflowX: 'auto' }}>
          <table
            style={{
              width: '100%',
              borderCollapse: 'collapse',
              fontSize: 13,
            }}
          >
            <thead>
              <tr style={{ borderBottom: '1px solid var(--color-border)' }}>
                {['Name', 'Race', 'Role', 'Location', 'Faction', 'Status', 'Attitudes'].map((col) => (
                  <th
                    key={col}
                    style={{
                      textAlign: 'left',
                      padding: '8px 12px',
                      fontSize: 11,
                      fontWeight: 600,
                      color: 'var(--color-parchment-dim)',
                      textTransform: 'uppercase',
                      letterSpacing: '0.08em',
                    }}
                  >
                    {col}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {filtered.map((npc) => {
                const isExpanded = expandedId === npc.id
                return [
                  <tr
                    key={npc.id}
                    onClick={() => setExpandedId(isExpanded ? null : npc.id)}
                    style={{
                      borderBottom: isExpanded ? 'none' : '1px solid var(--color-border)',
                      cursor: 'pointer',
                      background: isExpanded ? 'var(--color-surface-raised)' : 'transparent',
                      transition: 'background 0.1s',
                    }}
                    onMouseEnter={(e) => {
                      if (!isExpanded) (e.currentTarget as HTMLElement).style.background = 'var(--color-surface-raised)'
                    }}
                    onMouseLeave={(e) => {
                      if (!isExpanded) (e.currentTarget as HTMLElement).style.background = 'transparent'
                    }}
                  >
                    <td style={{ padding: '10px 12px' }}>
                      <span
                        className="font-display"
                        style={{
                          fontSize: 13,
                          fontWeight: 500,
                          color: npc.is_alive ? 'var(--color-parchment)' : 'var(--color-parchment-dim)',
                          textDecoration: npc.is_alive ? 'none' : 'line-through',
                        }}
                      >
                        {npc.is_major && <span style={{ color: 'var(--color-gold)', marginRight: 4 }}>★</span>}
                        {npc.name}
                      </span>
                    </td>
                    <td style={{ padding: '10px 12px', color: 'var(--color-parchment-mid)' }}>
                      {npc.race ?? '—'}
                    </td>
                    <td style={{ padding: '10px 12px', color: 'var(--color-parchment-mid)' }}>
                      {npc.role ?? '—'}
                    </td>
                    <td style={{ padding: '10px 12px', color: 'var(--color-parchment-mid)' }}>
                      {npc.location_name ?? '—'}
                    </td>
                    <td style={{ padding: '10px 12px', color: 'var(--color-parchment-mid)' }}>
                      {npc.faction_name ?? '—'}
                    </td>
                    <td style={{ padding: '10px 12px' }}>
                      {npc.is_alive ? (
                        <span className="badge" style={{ background: 'rgba(42,138,72,0.1)', color: '#4ade80', border: '1px solid rgba(42,138,72,0.25)', fontSize: 11 }}>
                          Alive
                        </span>
                      ) : (
                        <span className="badge" style={{ background: 'rgba(60,60,60,0.2)', color: '#9ca3af', border: '1px solid rgba(80,80,80,0.3)', fontSize: 11 }}>
                          Deceased
                        </span>
                      )}
                    </td>
                    <td style={{ padding: '10px 12px' }}>
                      <div className="flex gap-1.5">
                        {players.slice(0, 6).map((p) => (
                          <div
                            key={p.id}
                            title={p.character_name}
                          >
                            {attitudeDot(0)}
                          </div>
                        ))}
                      </div>
                    </td>
                  </tr>,
                  isExpanded && (
                    <ExpandedRow
                      key={`${npc.id}-expanded`}
                      npc={npc}
                      players={players}
                      onClose={() => setExpandedId(null)}
                    />
                  ),
                ]
              })}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
