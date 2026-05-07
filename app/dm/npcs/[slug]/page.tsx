'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import Link from 'next/link'
import { supabase } from '@/lib/supabase'
import type { NPC, Faction, Location, Quest, NPCRelationship, Player, NPCQuestLink } from '@/types/database'
import { ArrowLeft, MapPin, Users, ScrollText, Skull, Star, ChevronRight, Shield, Eye, EyeOff } from 'lucide-react'

// ── Types ─────────────────────────────────────────────────────────────────────

interface QuestWithRole extends Quest { link_role?: string | null }
interface RelationshipWithPlayer extends NPCRelationship { player?: Player }

// ── Helpers ───────────────────────────────────────────────────────────────────

function Spinner() {
  return (
    <div className="flex items-center justify-center h-64">
      <div className="w-8 h-8 rounded-full border-2 animate-spin"
        style={{ borderColor: 'var(--color-border)', borderTopColor: 'var(--color-gold)' }} />
    </div>
  )
}

function SectionHeader({ icon, title }: { icon: React.ReactNode; title: string }) {
  return (
    <div className="flex items-center gap-2 mb-3">
      <span style={{ color: 'var(--color-gold-dim)' }}>{icon}</span>
      <h2 className="font-display"
        style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment-mid)', letterSpacing: '0.08em', textTransform: 'uppercase' }}>
        {title}
      </h2>
      <div style={{ flex: 1, height: 1, background: 'var(--color-border)', marginLeft: 8 }} />
    </div>
  )
}

function attitudeBadge(attitude: number) {
  const label = attitude >= 3 ? 'Friendly' : attitude >= 1 ? 'Warm' : attitude === 0 ? 'Neutral' : attitude >= -2 ? 'Cold' : 'Hostile'
  const color = attitude >= 3 ? '#4ade80' : attitude >= 1 ? '#86efac' : attitude === 0 ? '#9ca3af' : attitude >= -2 ? '#fb923c' : '#f87171'
  return (
    <span className="badge" style={{ background: 'rgba(0,0,0,0.2)', color, border: `1px solid ${color}40`, fontSize: 11 }}>
      {label} ({attitude > 0 ? '+' : ''}{attitude})
    </span>
  )
}

const STATUS_STYLES: Record<string, { bg: string; text: string; border: string; label: string }> = {
  active:    { bg: 'rgba(201,160,68,0.15)',  text: 'var(--color-gold-light)', border: 'rgba(201,160,68,0.35)', label: 'Active' },
  completed: { bg: 'rgba(42,138,72,0.15)',   text: '#4ade80',                 border: 'rgba(42,138,72,0.35)', label: 'Completed' },
  failed:    { bg: 'rgba(139,30,30,0.2)',    text: '#f87171',                 border: 'rgba(139,30,30,0.4)',  label: 'Failed' },
  available: { bg: 'rgba(74,58,40,0.3)',     text: 'var(--color-parchment-mid)', border: 'var(--color-border-bright)', label: 'Available' },
  hidden:    { bg: 'rgba(26,32,64,0.3)',     text: '#93c5fd',                 border: 'rgba(99,130,201,0.3)', label: 'Hidden' },
}

// ── Main page ─────────────────────────────────────────────────────────────────

export default function NPCDetailPage() {
  const params = useParams()
  const slug = params.slug as string

  const [npc, setNpc] = useState<NPC | null>(null)
  const [faction, setFaction] = useState<Faction | null>(null)
  const [location, setLocation] = useState<Location | null>(null)
  const [quests, setQuests] = useState<QuestWithRole[]>([])
  const [relationships, setRelationships] = useState<RelationshipWithPlayer[]>([])
  const [locationNpcs, setLocationNpcs] = useState<NPC[]>([])
  const [secretsVisible, setSecretsVisible] = useState(false)
  const [loading, setLoading] = useState(true)
  const [notFound, setNotFound] = useState(false)

  useEffect(() => {
    async function load() {
      const { data: n } = await supabase.from('npcs').select('*').eq('slug', slug).single()
      if (!n) { setNotFound(true); setLoading(false); return }
      setNpc(n)

      const fetches: Promise<unknown>[] = [
        // Quest links
        supabase.from('npc_quest_links').select('*').eq('npc_id', n.id).then(async (res) => {
          const links: NPCQuestLink[] = res.data ?? []
          if (links.length === 0) return
          const qids = links.map((l) => l.quest_id)
          const { data: qs } = await supabase.from('quests').select('*').in('id', qids)
          setQuests((qs ?? []).map((q) => ({
            ...q,
            link_role: links.find((l) => l.quest_id === q.id)?.role ?? null,
          })))
        }),
        // Player relationships
        supabase.from('npc_relationships').select('*').eq('npc_id', n.id).then(async (res) => {
          const rels: NPCRelationship[] = res.data ?? []
          if (rels.length === 0) return
          const pids = rels.map((r) => r.player_id)
          const { data: players } = await supabase.from('players').select('*').in('id', pids)
          setRelationships(rels.map((r) => ({
            ...r,
            player: (players ?? []).find((p) => p.id === r.player_id),
          })))
        }),
      ]

      if (n.faction_id) {
        fetches.push(
          supabase.from('factions').select('*').eq('id', n.faction_id).single().then((res) => setFaction(res.data ?? null))
        )
      }

      if (n.location_id) {
        fetches.push(
          supabase.from('locations').select('*').eq('id', n.location_id).single().then((res) => {
            const loc = res.data ?? null
            setLocation(loc)
            if (loc) {
              supabase.from('npcs').select('*').eq('location_id', loc.id).neq('id', n.id).limit(8).then((r) => setLocationNpcs(r.data ?? []))
            }
          })
        )
      }

      await Promise.all(fetches)
      setLoading(false)
    }
    load()
  }, [slug])

  if (loading) return <Spinner />
  if (notFound || !npc) return (
    <div className="flex flex-col items-center justify-center h-64 gap-4">
      <p style={{ color: 'var(--color-parchment-dim)', fontSize: 14 }}>NPC not found.</p>
      <Link href="/dm/npcs" style={{ color: 'var(--color-gold)', fontSize: 13, textDecoration: 'none' }}>← NPCs</Link>
    </div>
  )

  const isAlive = npc.is_alive !== false

  return (
    <div style={{ maxWidth: 960 }}>
      {/* Back nav */}
      <Link href="/dm/npcs" className="flex items-center gap-1 mb-5"
        style={{ color: 'var(--color-parchment-dim)', textDecoration: 'none', fontSize: 13, width: 'fit-content' }}>
        <ArrowLeft size={14} /> NPCs
      </Link>

      {/* Header */}
      <div className="mb-6">
        <div className="flex items-start gap-3 mb-2 flex-wrap">
          <h1 className="font-display flex-1"
            style={{ fontSize: 28, fontWeight: 600, color: isAlive ? 'var(--color-parchment)' : 'var(--color-parchment-dim)', lineHeight: 1.2, minWidth: 260, textDecoration: isAlive ? 'none' : 'line-through' }}>
            {npc.name}
          </h1>
          <div className="flex items-center gap-2 flex-wrap">
            {npc.is_major && (
              <span className="badge" style={{ background: 'rgba(201,160,68,0.12)', color: 'var(--color-gold)', border: '1px solid rgba(201,160,68,0.3)', fontSize: 11, display: 'flex', alignItems: 'center', gap: 4 }}>
                <Star size={10} /> Major NPC
              </span>
            )}
            {!isAlive && (
              <span className="badge" style={{ background: 'rgba(139,30,30,0.15)', color: '#f87171', border: '1px solid rgba(139,30,30,0.3)', fontSize: 11, display: 'flex', alignItems: 'center', gap: 4 }}>
                <Skull size={10} /> Deceased
              </span>
            )}
          </div>
        </div>

        {/* Meta row */}
        <div className="flex items-center gap-3 flex-wrap mb-4" style={{ fontSize: 13, color: 'var(--color-parchment-dim)' }}>
          {npc.race && <span>{npc.race}</span>}
          {npc.role && <span style={{ color: 'var(--color-parchment-mid)' }}>· {npc.role}</span>}
          {faction && (
            <Link href={`/dm/factions/${faction.slug}`} style={{ textDecoration: 'none' }}>
              <span className="badge" style={{ fontSize: 11, background: 'rgba(99,130,201,0.1)', color: '#93c5fd', border: '1px solid rgba(99,130,201,0.25)', cursor: 'pointer' }}>
                <Shield size={9} style={{ display: 'inline', marginRight: 3, verticalAlign: 'middle' }} />
                {faction.name}
              </span>
            </Link>
          )}
          {location && (
            <Link href={`/dm/locations/${location.slug}`} style={{ textDecoration: 'none' }}>
              <span style={{ color: 'var(--color-parchment-dim)', fontSize: 12 }}>
                <MapPin size={11} style={{ display: 'inline', verticalAlign: 'middle', marginRight: 3 }} />
                {location.name}
                {location.region && `, ${location.region}`}
              </span>
            </Link>
          )}
        </div>

        {/* Description */}
        {npc.description && (
          <p style={{ fontSize: 14, color: 'var(--color-parchment-mid)', lineHeight: 1.8, maxWidth: 760, marginBottom: 12 }}>
            {npc.description}
          </p>
        )}

        {/* Personality */}
        {npc.personality && (
          <div style={{ padding: '12px 16px', borderRadius: 6, background: 'rgba(201,160,68,0.05)', border: '1px solid rgba(201,160,68,0.15)', marginBottom: 12, maxWidth: 760 }}>
            <p style={{ fontSize: 11, color: 'var(--color-gold-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', fontWeight: 600, marginBottom: 6 }}>Personality</p>
            <p style={{ fontSize: 13, color: 'var(--color-parchment-mid)', lineHeight: 1.7, fontStyle: 'italic' }}>{npc.personality}</p>
          </div>
        )}

        {/* Secrets (toggle) */}
        {npc.secrets && (
          <div style={{ padding: '12px 16px', borderRadius: 6, background: 'rgba(139,30,30,0.07)', border: '1px solid rgba(139,30,30,0.2)', maxWidth: 760 }}>
            <button
              onClick={() => setSecretsVisible((v) => !v)}
              className="flex items-center gap-2"
              style={{ background: 'none', border: 'none', cursor: 'pointer', padding: 0, marginBottom: secretsVisible ? 8 : 0 }}
            >
              {secretsVisible ? <EyeOff size={13} style={{ color: '#f87171' }} /> : <Eye size={13} style={{ color: '#f87171' }} />}
              <span style={{ fontSize: 11, color: '#f87171', textTransform: 'uppercase', letterSpacing: '0.08em', fontWeight: 600 }}>
                {secretsVisible ? 'Hide Secrets' : 'Reveal Secrets'}
              </span>
            </button>
            {secretsVisible && (
              <p style={{ fontSize: 13, color: '#fca5a5', lineHeight: 1.7 }}>{npc.secrets}</p>
            )}
          </div>
        )}
      </div>

      {/* Player relationships */}
      {relationships.length > 0 && (
        <div className="mb-6">
          <SectionHeader icon={<Users size={14} />} title="Player Relationships" />
          <div className="flex flex-col gap-2">
            {relationships.map((rel) => (
              <div key={rel.id} className="card" style={{ padding: '10px 14px', display: 'flex', alignItems: 'center', gap: 12 }}>
                <div style={{ flex: 1 }}>
                  <div className="flex items-center gap-2 mb-1">
                    <span className="font-display" style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment)' }}>
                      {rel.player?.character_name ?? rel.player?.name ?? 'Unknown Player'}
                    </span>
                    {attitudeBadge(rel.attitude)}
                  </div>
                  {rel.last_interaction && (
                    <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
                      Last interaction: {new Date(rel.last_interaction).toLocaleDateString()}
                    </p>
                  )}
                  {rel.memories && Array.isArray(rel.memories) && rel.memories.length > 0 && (
                    <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', marginTop: 4, fontStyle: 'italic' }}>
                      "{String((rel.memories as string[])[0])}"
                    </p>
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Lower grid */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 24 }}>

        {/* Quests */}
        <div>
          <SectionHeader icon={<ScrollText size={14} />} title={`Quests (${quests.length})`} />
          {quests.length === 0 ? (
            <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>Not linked to any quests.</p>
          ) : (
            <div className="flex flex-col gap-2">
              {quests.map((q) => {
                const ss = STATUS_STYLES[q.status] ?? STATUS_STYLES.available
                return (
                  <Link key={q.id} href={`/dm/quests/${q.slug}`} style={{ textDecoration: 'none' }}>
                    <div className="card card-hover" style={{ padding: '10px 12px', borderLeft: `3px solid ${ss.border}`, borderRadius: '0 6px 6px 0' }}>
                      <div className="flex items-start justify-between gap-2 mb-1">
                        <span className="font-display" style={{ fontSize: 12, fontWeight: 600, color: 'var(--color-parchment)', lineHeight: 1.3, flex: 1 }}>
                          {q.title}
                        </span>
                        <span className="badge" style={{ background: ss.bg, color: ss.text, border: `1px solid ${ss.border}`, fontSize: 10 }}>
                          {ss.label}
                        </span>
                      </div>
                      {q.link_role && (
                        <span className="badge" style={{ fontSize: 10, background: 'rgba(201,160,68,0.1)', color: 'var(--color-gold-dim)', border: '1px solid rgba(201,160,68,0.2)' }}>
                          {q.link_role}
                        </span>
                      )}
                    </div>
                  </Link>
                )
              })}
            </div>
          )}
        </div>

        {/* Location & co-located NPCs */}
        <div>
          {location && (
            <div className="mb-6">
              <SectionHeader icon={<MapPin size={14} />} title="Based At" />
              <Link href={`/dm/locations/${location.slug}`} style={{ textDecoration: 'none' }}>
                <div className="card card-hover" style={{ padding: '12px 14px', display: 'flex', alignItems: 'center', gap: 10 }}>
                  <div style={{ flex: 1 }}>
                    <span className="font-display" style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment)' }}>
                      {location.name}
                    </span>
                    <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginTop: 2 }}>
                      {location.region} · {location.location_type}
                    </p>
                    {location.description && (
                      <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginTop: 4, fontStyle: 'italic',
                        display: '-webkit-box', WebkitLineClamp: 2, WebkitBoxOrient: 'vertical', overflow: 'hidden' }}>
                        {location.description}
                      </p>
                    )}
                  </div>
                  <ChevronRight size={13} style={{ color: 'var(--color-parchment-dim)', flexShrink: 0 }} />
                </div>
              </Link>
            </div>
          )}

          {locationNpcs.length > 0 && (
            <div>
              <SectionHeader icon={<Users size={14} />} title="Others at this Location" />
              <div className="flex flex-col gap-2">
                {locationNpcs.map((n) => (
                  <Link key={n.id} href={`/dm/npcs/${n.slug}`} style={{ textDecoration: 'none' }}>
                    <div className="card card-hover" style={{ padding: '8px 12px', display: 'flex', alignItems: 'center', gap: 8 }}>
                      <div style={{ flex: 1, minWidth: 0 }}>
                        <div className="flex items-center gap-2">
                          <span className="font-display" style={{ fontSize: 12, fontWeight: 600, color: n.is_alive === false ? 'var(--color-parchment-dim)' : 'var(--color-parchment)', textDecoration: n.is_alive === false ? 'line-through' : 'none' }}>
                            {n.name}
                          </span>
                          {n.is_major && <Star size={10} style={{ color: 'var(--color-gold)', opacity: 0.7, flexShrink: 0 }} />}
                        </div>
                        {n.role && <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginTop: 1 }}>{n.role}</p>}
                      </div>
                      <ChevronRight size={12} style={{ color: 'var(--color-parchment-dim)', flexShrink: 0 }} />
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
