'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import { Users, MapPin, Skull } from 'lucide-react'
import { supabase } from '@/lib/supabase'
import type { NPC, NPCRelationship, Location } from '@/types/database'

interface EnrichedRelationship {
  id: string
  npc_id: string
  player_id: string
  attitude: number
  last_interaction: string | null
  updated_at: string
  npc: NPC
  location_name?: string
  memories: MemoryEntry[]
}

interface MemoryEntry {
  session_number?: number
  summary?: string
  attitude_delta?: number
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

// ── Attitude helpers ───────────────────────────────────────────────────────

function attitudeLabel(v: number): string {
  if (v >= 4)  return 'Devoted Ally'
  if (v >= 2)  return 'Friendly'
  if (v >= 1)  return 'Warm'
  if (v === 0) return 'Neutral'
  if (v >= -1) return 'Cool'
  if (v >= -3) return 'Unfriendly'
  return 'Hostile'
}

function attitudeColor(v: number): string {
  if (v >= 2)  return 'var(--color-emerald-bright)'
  if (v >= 0)  return '#c48820'
  return 'var(--color-crimson-bright)'
}

function AttitudeBar({ value }: { value: number }) {
  const pct   = ((value + 5) / 10) * 100
  const color = attitudeColor(value)

  return (
    <div style={{ marginTop: 6 }}>
      <div
        style={{
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
          marginBottom: 4,
        }}
      >
        <span style={{ fontSize: 11, color, fontWeight: 600 }}>{attitudeLabel(value)}</span>
        <span style={{ fontSize: 10, color: 'var(--color-parchment-dim)' }}>
          {value > 0 ? '+' : ''}{value}
        </span>
      </div>
      <div
        className="attitude-bar-track"
        style={{ height: 6, background: 'var(--color-border)', borderRadius: 999, overflow: 'hidden' }}
      >
        <div
          style={{
            height: '100%',
            width: `${Math.max(2, pct)}%`,
            background: color,
            borderRadius: 999,
            transition: 'width 0.4s ease',
          }}
        />
      </div>
    </div>
  )
}

// ── NPC Card ──────────────────────────────────────────────────────────────

function NPCCard({ rel }: { rel: EnrichedRelationship }) {
  const [expanded, setExpanded] = useState(false)
  const memories = rel.memories ?? []

  return (
    <div className="card" style={{ overflow: 'hidden' }}>
      <div style={{ padding: '18px 20px' }}>
        {/* Name row */}
        <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: 8, marginBottom: 8 }}>
          <div>
            <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
              <h3
                className="font-display"
                style={{ fontSize: 15, color: rel.npc.is_alive ? 'var(--color-parchment)' : 'var(--color-parchment-dim)', fontWeight: 600 }}
              >
                {rel.npc.name}
              </h3>
              {!rel.npc.is_alive && (
                <Skull size={12} style={{ color: 'var(--color-parchment-dim)' }} aria-label="Deceased" />
              )}
            </div>
            <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', marginTop: 2 }}>
              {[rel.npc.role, rel.npc.race].filter(Boolean).join(' · ')}
            </p>
          </div>
          {rel.location_name && (
            <div style={{ display: 'flex', alignItems: 'center', gap: 4, flexShrink: 0 }}>
              <MapPin size={10} style={{ color: 'var(--color-parchment-dim)' }} />
              <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>{rel.location_name}</span>
            </div>
          )}
        </div>

        {/* Attitude bar */}
        <AttitudeBar value={rel.attitude} />

        {/* Last interaction */}
        {rel.last_interaction && (
          <p
            style={{
              fontSize: 12,
              color: 'var(--color-parchment-mid)',
              fontStyle: 'italic',
              marginTop: 10,
              lineHeight: 1.5,
              overflow: 'hidden',
              display: '-webkit-box',
              WebkitLineClamp: expanded ? undefined : 2,
              WebkitBoxOrient: 'vertical',
            } as React.CSSProperties}
          >
            "{rel.last_interaction}"
          </p>
        )}

        {/* Memory toggle */}
        {memories.length > 0 && (
          <button
            onClick={() => setExpanded((v) => !v)}
            style={{
              marginTop: 10,
              background: 'none',
              border: 'none',
              cursor: 'pointer',
              fontSize: 11,
              color: 'var(--color-gold-dim)',
              padding: 0,
              display: 'flex',
              alignItems: 'center',
              gap: 4,
            }}
          >
            {expanded ? '▲' : '▼'} {memories.length} {memories.length === 1 ? 'memory' : 'memories'}
          </button>
        )}
      </div>

      {/* Memory list */}
      {expanded && memories.length > 0 && (
        <div
          style={{
            borderTop: '1px solid var(--color-border)',
            background: 'var(--color-surface-raised)',
          }}
        >
          {[...memories].reverse().map((mem, i) => (
            <div
              key={i}
              style={{
                padding: '12px 20px',
                borderBottom: i < memories.length - 1 ? '1px solid var(--color-border)' : 'none',
              }}
            >
              <div
                style={{
                  display: 'flex',
                  justifyContent: 'space-between',
                  alignItems: 'center',
                  marginBottom: 4,
                }}
              >
                <span style={{ fontSize: 10, color: 'var(--color-parchment-dim)' }}>
                  {mem.session_number != null ? `Session ${mem.session_number}` : `Memory ${memories.length - i}`}
                </span>
                {mem.attitude_delta != null && mem.attitude_delta !== 0 && (
                  <span
                    style={{
                      fontSize: 11,
                      fontWeight: 700,
                      color: mem.attitude_delta > 0 ? 'var(--color-emerald-bright)' : 'var(--color-crimson-bright)',
                    }}
                  >
                    {mem.attitude_delta > 0 ? '+' : ''}{mem.attitude_delta}
                  </span>
                )}
              </div>
              {mem.summary && (
                <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.6 }}>
                  {mem.summary}
                </p>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  )
}

// ── Section ───────────────────────────────────────────────────────────────

function RelationshipSection({
  title,
  rels,
  accentColor,
}: {
  title: string
  rels: EnrichedRelationship[]
  accentColor: string
}) {
  if (rels.length === 0) return null
  return (
    <div style={{ marginBottom: 40 }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 16 }}>
        <h2
          style={{
            fontSize: 10,
            fontWeight: 700,
            letterSpacing: '0.1em',
            color: accentColor,
            textTransform: 'uppercase',
          }}
        >
          {title}
        </h2>
        <span
          style={{
            fontSize: 10,
            padding: '1px 7px',
            borderRadius: 999,
            background: 'var(--color-surface-raised)',
            border: '1px solid var(--color-border)',
            color: 'var(--color-parchment-dim)',
          }}
        >
          {rels.length}
        </span>
      </div>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))', gap: 14 }}>
        {rels.map((rel) => (
          <NPCCard key={rel.id} rel={rel} />
        ))}
      </div>
    </div>
  )
}

// ── Page ──────────────────────────────────────────────────────────────────

export default function RelationshipsPage() {
  const router = useRouter()
  const [relationships, setRelationships] = useState<EnrichedRelationship[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    const playerId = typeof window !== 'undefined' ? localStorage.getItem('selectedPlayerId') : null
    if (!playerId) { router.push('/player'); return }

    async function load() {
      // Fetch relationships with NPC data
      const { data: relData } = await supabase
        .from('npc_relationships')
        .select('*, npcs(*)')
        .eq('player_id', playerId)
        .order('attitude', { ascending: false })

      if (!relData || relData.length === 0) { setLoading(false); return }

      // Fetch location names
      const locationIds = (relData as any[])
        .map((r) => r.npcs?.location_id)
        .filter(Boolean) as string[]

      const { data: locData } = locationIds.length
        ? await supabase.from('locations').select('id, name').in('id', locationIds)
        : { data: [] }

      const locMap: Record<string, string> = {}
      for (const l of locData ?? []) locMap[l.id] = l.name

      const enriched: EnrichedRelationship[] = (relData as any[]).map((r) => ({
        id:               r.id,
        npc_id:           r.npc_id,
        player_id:        r.player_id,
        attitude:         r.attitude,
        last_interaction: r.last_interaction,
        memories:         Array.isArray(r.memories) ? r.memories : [],
        updated_at:       r.updated_at,
        npc:              r.npcs as NPC,
        location_name:    r.npcs?.location_id ? locMap[r.npcs.location_id] : undefined,
      }))

      setRelationships(enriched)
      setLoading(false)
    }

    load()
  }, [router])

  if (loading) return <Spinner />

  const allies  = relationships.filter((r) => r.attitude >= 2)
  const neutral = relationships.filter((r) => r.attitude >= -1 && r.attitude < 2)
  const hostile = relationships.filter((r) => r.attitude < -1)

  return (
    <div style={{ maxWidth: 1000, margin: '0 auto', padding: '32px 24px' }}>

      {/* Header */}
      <div style={{ marginBottom: 32 }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 10 }}>
          <Users size={18} style={{ color: 'var(--color-gold)' }} />
          <h1
            className="font-display"
            style={{ fontSize: 26, color: 'var(--color-gold-light)', letterSpacing: '0.06em' }}
          >
            Companions & Relationships
          </h1>
        </div>
        <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)' }}>
          {relationships.length} people you've encountered across Aeloria
        </p>
      </div>

      <hr className="rule-gold" style={{ marginBottom: 32 }} />

      {relationships.length === 0 ? (
        <div style={{ textAlign: 'center', padding: '64px 0' }}>
          <p style={{ color: 'var(--color-parchment-dim)', fontStyle: 'italic', fontSize: 15 }}>
            You have met no one yet. The world awaits.
          </p>
        </div>
      ) : (
        <>
          <RelationshipSection
            title="Allies"
            rels={allies}
            accentColor="var(--color-emerald-bright)"
          />
          <RelationshipSection
            title="Neutral"
            rels={neutral}
            accentColor="var(--color-gold)"
          />
          <RelationshipSection
            title="Hostile"
            rels={hostile}
            accentColor="var(--color-crimson-bright)"
          />
        </>
      )}

    </div>
  )
}
