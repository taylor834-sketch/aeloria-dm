'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import { Shield } from 'lucide-react'
import { supabase } from '@/lib/supabase'
import type { Faction, PlayerFactionRep } from '@/types/database'

interface FactionDisplay {
  faction: Faction
  rep: PlayerFactionRep | null
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

// ── Reputation helpers ─────────────────────────────────────────────────────

function repLabel(rep: number): string {
  if (rep >= 90)  return 'Exalted'
  if (rep >= 60)  return 'Champion'
  if (rep >= 30)  return 'Honored'
  if (rep >= 10)  return 'Friendly'
  if (rep >= -10) return 'Neutral'
  if (rep >= -30) return 'Unfriendly'
  if (rep >= -60) return 'Hostile'
  return 'Exalted Enemy'
}

function repBarColor(rep: number): string {
  if (rep >= 10)  return 'var(--color-emerald-bright)'
  if (rep >= -10) return '#c48820'
  return 'var(--color-crimson-bright)'
}

function repBarPct(rep: number): number {
  return ((rep + 100) / 200) * 100
}

function dangerStars(rating: number) {
  return Array.from({ length: 5 }, (_, i) => (
    <span
      key={i}
      style={{
        fontSize: 10,
        color: i < rating ? 'var(--color-crimson-bright)' : 'var(--color-border-bright)',
      }}
    >
      ●
    </span>
  ))
}

// ── Faction Card ──────────────────────────────────────────────────────────

function FactionCard({ faction, rep }: { faction: Faction; rep: PlayerFactionRep | null }) {
  const isKnown = rep !== null
  const repVal  = isKnown ? rep!.reputation : 0
  const barPct  = isKnown ? repBarPct(repVal) : 50
  const barColor = isKnown ? repBarColor(repVal) : 'var(--color-border-bright)'
  const rankTitle = rep?.rank_title || (isKnown ? repLabel(repVal) : 'Unknown')

  return (
    <div
      className="card"
      style={{
        padding: '20px 22px',
        opacity: isKnown ? 1 : 0.55,
      }}
    >
      {/* Header */}
      <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: 12, marginBottom: 12 }}>
        <div>
          <h3
            className="font-display"
            style={{ fontSize: 15, color: 'var(--color-parchment)', fontWeight: 600, marginBottom: 4 }}
          >
            {faction.name}
          </h3>
          <div style={{ display: 'flex', alignItems: 'center', gap: 8, flexWrap: 'wrap' }}>
            {faction.alignment && (
              <span
                style={{
                  fontSize: 10,
                  padding: '2px 7px',
                  background: 'var(--color-surface-raised)',
                  border: '1px solid var(--color-border)',
                  borderRadius: 999,
                  color: 'var(--color-parchment-dim)',
                  letterSpacing: '0.04em',
                }}
              >
                {faction.alignment}
              </span>
            )}
            <span style={{ display: 'flex', alignItems: 'center', gap: 2 }}>
              {dangerStars(faction.danger_rating)}
            </span>
          </div>
        </div>

        {/* Rank title */}
        <div style={{ textAlign: 'right', flexShrink: 0 }}>
          <div
            className="font-display"
            style={{
              fontSize: 13,
              fontWeight: 600,
              color: isKnown ? repBarColor(repVal) : 'var(--color-parchment-dim)',
            }}
          >
            {rankTitle}
          </div>
          {isKnown && (
            <div style={{ fontSize: 10, color: 'var(--color-parchment-dim)', marginTop: 2 }}>
              {repVal > 0 ? '+' : ''}{repVal} reputation
            </div>
          )}
        </div>
      </div>

      {/* Goal */}
      {faction.goal && (
        <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', lineHeight: 1.55, marginBottom: 12 }}>
          {faction.goal}
        </p>
      )}

      {/* Rep bar */}
      <div style={{ marginBottom: isKnown && rep?.notes ? 12 : 0 }}>
        <div
          style={{
            height: 6,
            background: 'var(--color-border)',
            borderRadius: 999,
            overflow: 'hidden',
            marginBottom: 4,
          }}
        >
          <div
            style={{
              height: '100%',
              width: `${Math.max(2, barPct)}%`,
              background: barColor,
              borderRadius: 999,
              transition: 'width 0.4s ease',
            }}
          />
        </div>
        <div style={{ display: 'flex', justifyContent: 'space-between' }}>
          <span style={{ fontSize: 9, color: 'var(--color-parchment-dim)' }}>Exalted Enemy</span>
          <span style={{ fontSize: 9, color: 'var(--color-parchment-dim)' }}>Exalted</span>
        </div>
      </div>

      {/* Notes */}
      {rep?.notes && (
        <div
          style={{
            marginTop: 8,
            padding: '8px 12px',
            background: 'var(--color-surface-raised)',
            border: '1px solid var(--color-border)',
            borderRadius: 4,
          }}
        >
          <p style={{ fontSize: 11, color: 'var(--color-parchment-mid)', lineHeight: 1.55, fontStyle: 'italic' }}>
            {rep.notes}
          </p>
        </div>
      )}

      {!isKnown && (
        <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', fontStyle: 'italic', marginTop: 4 }}>
          Standing unknown — you have yet to make an impression.
        </p>
      )}
    </div>
  )
}

// ── Page ──────────────────────────────────────────────────────────────────

export default function FactionsPage() {
  const router = useRouter()
  const [factions, setFactions]   = useState<FactionDisplay[]>([])
  const [loading, setLoading]     = useState(true)

  useEffect(() => {
    const playerId = typeof window !== 'undefined' ? localStorage.getItem('selectedPlayerId') : null
    if (!playerId) { router.push('/player'); return }

    async function load() {
      const [factionsRes, repRes] = await Promise.all([
        supabase.from('factions').select('*').order('name'),
        supabase.from('player_faction_rep').select('*').eq('player_id', playerId),
      ])

      const allFactions = factionsRes.data ?? []
      const repData     = repRes.data ?? []

      const repMap: Record<string, PlayerFactionRep> = {}
      for (const r of repData) repMap[r.faction_id] = r

      // Sort: known first (by rep value desc), then unknown
      const displays: FactionDisplay[] = allFactions.map((f) => ({
        faction: f,
        rep: repMap[f.id] ?? null,
      }))

      displays.sort((a, b) => {
        const aRep = a.rep?.reputation ?? null
        const bRep = b.rep?.reputation ?? null
        if (aRep !== null && bRep !== null) return bRep - aRep
        if (aRep !== null) return -1
        if (bRep !== null) return 1
        return a.faction.name.localeCompare(b.faction.name)
      })

      setFactions(displays)
      setLoading(false)
    }

    load()
  }, [router])

  if (loading) return <Spinner />

  const known   = factions.filter((f) => f.rep !== null)
  const unknown = factions.filter((f) => f.rep === null)

  return (
    <div style={{ maxWidth: 960, margin: '0 auto', padding: '32px 24px' }}>

      {/* Header */}
      <div style={{ marginBottom: 32 }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 10 }}>
          <Shield size={18} style={{ color: 'var(--color-gold)' }} />
          <h1
            className="font-display"
            style={{ fontSize: 26, color: 'var(--color-gold-light)', letterSpacing: '0.06em' }}
          >
            Faction Standing
          </h1>
        </div>
        <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)' }}>
          {known.length} known standings · {unknown.length} factions yet unknown
        </p>
      </div>

      <hr className="rule-gold" style={{ marginBottom: 32 }} />

      {factions.length === 0 ? (
        <div style={{ textAlign: 'center', padding: '64px 0' }}>
          <p style={{ color: 'var(--color-parchment-dim)', fontStyle: 'italic', fontSize: 15 }}>
            No factions recorded yet.
          </p>
        </div>
      ) : (
        <>
          {/* Known factions */}
          {known.length > 0 && (
            <div style={{ marginBottom: 40 }}>
              <h2
                style={{
                  fontSize: 10,
                  fontWeight: 700,
                  letterSpacing: '0.1em',
                  color: 'var(--color-gold)',
                  textTransform: 'uppercase',
                  marginBottom: 16,
                }}
              >
                Your Standings
              </h2>
              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(320px, 1fr))', gap: 14 }}>
                {known.map(({ faction, rep }) => (
                  <FactionCard key={faction.id} faction={faction} rep={rep} />
                ))}
              </div>
            </div>
          )}

          {/* Unknown factions */}
          {unknown.length > 0 && (
            <div>
              <h2
                style={{
                  fontSize: 10,
                  fontWeight: 700,
                  letterSpacing: '0.1em',
                  color: 'var(--color-parchment-dim)',
                  textTransform: 'uppercase',
                  marginBottom: 16,
                }}
              >
                Unknown
              </h2>
              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(320px, 1fr))', gap: 14 }}>
                {unknown.map(({ faction }) => (
                  <FactionCard key={faction.id} faction={faction} rep={null} />
                ))}
              </div>
            </div>
          )}
        </>
      )}

    </div>
  )
}
