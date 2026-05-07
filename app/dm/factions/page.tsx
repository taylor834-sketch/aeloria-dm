'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'
import type { Faction, Player, PlayerFactionRep } from '@/types/database'

interface FactionWithReps extends Faction {
  reps: (PlayerFactionRep & { player?: Player })[]
}

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

function dangerSkulls(rating: number) {
  return (
    <div className="flex items-center gap-0.5">
      {[1, 2, 3, 4, 5].map((i) => (
        <span
          key={i}
          className={`danger-${i <= rating ? rating : 0}`}
          style={{
            fontSize: 13,
            color: i <= rating
              ? (rating >= 5 ? '#ef4444' : rating >= 4 ? '#f87171' : rating >= 3 ? '#fb923c' : rating >= 2 ? 'var(--color-gold-light)' : '#9ca3af')
              : 'var(--color-border-bright)',
          }}
        >
          {i <= rating ? '☠' : '○'}
        </span>
      ))}
    </div>
  )
}

function repBarColor(rep: number): string {
  if (rep >= 30) return 'var(--color-emerald-bright)'
  if (rep >= 0)  return 'var(--color-gold)'
  return 'var(--color-crimson-bright)'
}

function RepBar({ rep, player }: { rep: PlayerFactionRep & { player?: Player }; player?: Player }) {
  const pct = ((rep.reputation + 100) / 200) * 100
  const color = repBarColor(rep.reputation)

  return (
    <div key={rep.id} style={{ marginBottom: 8 }}>
      <div className="flex items-center justify-between mb-1">
        <span style={{ fontSize: 12, color: 'var(--color-parchment-mid)' }}>
          {rep.player?.character_name ?? player?.character_name ?? 'Unknown'}
        </span>
        <div className="flex items-center gap-2">
          {rep.rank_title && (
            <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>
              {rep.rank_title}
            </span>
          )}
          <span style={{ fontSize: 11, color, fontWeight: 600 }}>
            {rep.reputation > 0 ? '+' : ''}{rep.reputation}
          </span>
        </div>
      </div>
      <div style={{ height: 4, background: 'var(--color-border)', borderRadius: 999, overflow: 'hidden' }}>
        <div
          style={{
            height: '100%',
            borderRadius: 999,
            width: `${pct}%`,
            background: color,
          }}
        />
      </div>
    </div>
  )
}

export default function FactionsPage() {
  const [factions, setFactions] = useState<FactionWithReps[]>([])
  const [players, setPlayers] = useState<Player[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const [facRes, playerRes, repRes] = await Promise.all([
        supabase.from('factions').select('*').order('danger_rating', { ascending: false }),
        supabase.from('players').select('*').eq('is_active', true),
        supabase.from('player_faction_rep').select('*'),
      ])

      const playerData: Player[] = playerRes.data ?? []
      const repData: PlayerFactionRep[] = repRes.data ?? []
      const factionData: Faction[] = facRes.data ?? []

      setPlayers(playerData)
      setFactions(
        factionData.map((f) => {
          const factionReps = repData
            .filter((r) => r.faction_id === f.id)
            .map((r) => ({
              ...r,
              player: playerData.find((p) => p.id === r.player_id),
            }))

          // Build a rep for every active player, default 0 if none
          const allReps: (PlayerFactionRep & { player?: Player })[] = playerData.map((p) => {
            const existing = factionReps.find((r) => r.player_id === p.id)
            return existing ?? {
              id: `ph-${f.id}-${p.id}`,
              player_id: p.id,
              faction_id: f.id,
              reputation: 0,
              rank_title: 'Unknown',
              notes: null,
              updated_at: '',
              player: p,
            }
          })

          return { ...f, reps: allReps }
        })
      )
      setLoading(false)
    }
    load()
  }, [])

  if (loading) return <Spinner />

  function alignmentBadge(alignment?: string | null) {
    if (!alignment) return null
    const lc = alignment.toLowerCase()
    let bg = 'rgba(74,58,40,0.2)'
    let color = 'var(--color-parchment-dim)'
    let border = 'var(--color-border)'
    if (lc.includes('evil')) { bg = 'rgba(139,30,30,0.12)'; color = '#fca5a5'; border = 'rgba(139,30,30,0.3)' }
    else if (lc.includes('good')) { bg = 'rgba(42,138,72,0.12)'; color = '#86efac'; border = 'rgba(42,138,72,0.3)' }
    else if (lc.includes('neutral') || lc.includes('true')) { bg = 'rgba(74,58,40,0.2)'; color = 'var(--color-parchment-mid)' }
    return (
      <span className="badge" style={{ background: bg, color, border: `1px solid ${border}`, fontSize: 11 }}>
        {alignment}
      </span>
    )
  }

  return (
    <div style={{ maxWidth: 1100 }}>
      {/* Header */}
      <div className="mb-6">
        <h1
          className="font-display"
          style={{ fontSize: 26, fontWeight: 600, color: 'var(--color-gold-light)', marginBottom: 4 }}
        >
          Factions
        </h1>
        <p style={{ color: 'var(--color-parchment-dim)', fontSize: 13 }}>
          {factions.length} factions
        </p>
      </div>

      {factions.length === 0 ? (
        <div className="text-center py-16" style={{ color: 'var(--color-parchment-dim)' }}>
          <p className="font-display text-sm">No factions found</p>
        </div>
      ) : (
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 16 }}>
          {factions.map((f) => (
            <div key={f.id} className="card" style={{ display: 'flex', flexDirection: 'column' }}>
              {/* Faction header */}
              <div style={{ padding: '16px 18px 12px', borderBottom: '1px solid var(--color-border)' }}>
                <div className="flex items-start justify-between gap-3 mb-3">
                  <h2
                    className="font-display"
                    style={{ fontSize: 16, fontWeight: 600, color: 'var(--color-parchment)', flex: 1 }}
                  >
                    {f.name}
                  </h2>
                  {dangerSkulls(f.danger_rating)}
                </div>
                <div className="flex items-center gap-2 flex-wrap">
                  {alignmentBadge(f.alignment)}
                  {f.goal && (
                    <span
                      style={{
                        fontSize: 12,
                        color: 'var(--color-parchment-mid)',
                        fontStyle: 'italic',
                        overflow: 'hidden',
                        textOverflow: 'ellipsis',
                        whiteSpace: 'nowrap',
                        maxWidth: 280,
                      }}
                    >
                      {f.goal}
                    </span>
                  )}
                </div>
              </div>

              {/* Description */}
              <div style={{ padding: '12px 18px', flex: 1 }}>
                {f.description && (
                  <p
                    style={{
                      fontSize: 13,
                      color: 'var(--color-parchment-mid)',
                      lineHeight: 1.6,
                      display: '-webkit-box',
                      WebkitLineClamp: 2,
                      WebkitBoxOrient: 'vertical',
                      overflow: 'hidden',
                      marginBottom: f.dm_notes ? 12 : 0,
                    }}
                  >
                    {f.description}
                  </p>
                )}

                {f.dm_notes && (
                  <div
                    style={{
                      padding: '8px 10px',
                      borderRadius: 4,
                      background: 'rgba(139,30,30,0.08)',
                      border: '1px solid rgba(139,30,30,0.2)',
                    }}
                  >
                    <p style={{ fontSize: 11, color: '#fca5a5', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 4, fontWeight: 600 }}>
                      DM
                    </p>
                    <p style={{ fontSize: 12, color: '#fca5a5', lineHeight: 1.5 }}>
                      {f.dm_notes}
                    </p>
                  </div>
                )}
              </div>

              {/* Party Reputation */}
              {players.length > 0 && (
                <div
                  style={{
                    padding: '12px 18px',
                    borderTop: '1px solid var(--color-border)',
                    background: 'var(--color-surface-raised)',
                    borderRadius: '0 0 6px 6px',
                  }}
                >
                  <p
                    style={{
                      fontSize: 11,
                      color: 'var(--color-parchment-dim)',
                      textTransform: 'uppercase',
                      letterSpacing: '0.08em',
                      marginBottom: 10,
                      fontWeight: 600,
                    }}
                  >
                    Party Reputation
                  </p>
                  {f.reps.map((rep) => (
                    <RepBar key={rep.id} rep={rep} />
                  ))}
                </div>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
