'use client'

import { useEffect, useState, useMemo } from 'react'
import { useParams } from 'next/navigation'
import Link from 'next/link'
import { supabase } from '@/lib/supabase'
import type { Location, NPC, Quest, Faction, LocationReputation } from '@/types/database'
import { ArrowLeft, MapPin, Users, ScrollText, Skull, Star, ChevronRight, Link2 } from 'lucide-react'

// ── Entity hyperlink engine ───────────────────────────────────────────────────

interface EntityRef {
  name: string
  slug: string
  type: 'npc' | 'location'
}

/** Render text with entity names auto-linked. Sorts by name length desc to match longest first. */
function EntityText({ text, entities, style }: { text: string; entities: EntityRef[]; style?: React.CSSProperties }) {
  const parts = useMemo(() => {
    if (!text || entities.length === 0) return [{ text, entity: null as EntityRef | null }]

    // Sort longest names first to avoid partial matches
    const sorted = [...entities].sort((a, b) => b.name.length - a.name.length)

    // Build a regex alternation from all entity names (escape special chars)
    const escaped = sorted.map((e) => e.name.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'))
    const pattern = new RegExp(`(${escaped.join('|')})`, 'gi')

    const segments: { text: string; entity: EntityRef | null }[] = []
    let last = 0
    let match: RegExpExecArray | null

    while ((match = pattern.exec(text)) !== null) {
      if (match.index > last) {
        segments.push({ text: text.slice(last, match.index), entity: null })
      }
      const matched = match[0]
      const entity = sorted.find((e) => e.name.toLowerCase() === matched.toLowerCase()) ?? null
      segments.push({ text: matched, entity })
      last = match.index + matched.length
    }
    if (last < text.length) segments.push({ text: text.slice(last), entity: null })
    return segments
  }, [text, entities])

  return (
    <span style={style}>
      {parts.map((part, i) =>
        part.entity ? (
          <Link
            key={i}
            href={`/dm/${part.entity.type === 'npc' ? 'npcs' : 'locations'}/${part.entity.slug}`}
            style={{
              color: part.entity.type === 'npc' ? 'var(--color-gold-light)' : '#93c5fd',
              textDecoration: 'none',
              borderBottom: `1px dashed ${part.entity.type === 'npc' ? 'rgba(201,160,68,0.4)' : 'rgba(147,197,253,0.4)'}`,
              cursor: 'pointer',
            }}
            onClick={(e) => e.stopPropagation()}
          >
            {part.text}
          </Link>
        ) : (
          <span key={i}>{part.text}</span>
        )
      )}
    </span>
  )
}

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

const REGION_COLORS: Record<string, { bg: string; text: string; border: string }> = {
  'Aranthor':        { bg: 'rgba(201,160,68,0.12)',  text: 'var(--color-gold-light)',  border: 'rgba(201,160,68,0.3)' },
  'Darian Empire':   { bg: 'rgba(74,90,130,0.15)',   text: '#a5b4fc',                  border: 'rgba(99,120,200,0.3)' },
  'Veilwood':        { bg: 'rgba(42,100,58,0.15)',    text: '#86efac',                  border: 'rgba(42,138,72,0.3)' },
  'Dreadspire':      { bg: 'rgba(60,50,50,0.2)',      text: '#9ca3af',                  border: 'rgba(80,70,70,0.4)' },
  'Ashen Marches':   { bg: 'rgba(160,90,20,0.15)',   text: '#fb923c',                  border: 'rgba(200,100,20,0.3)' },
  'Shattered Isles': { bg: 'rgba(20,120,130,0.15)',  text: '#67e8f9',                  border: 'rgba(20,160,170,0.3)' },
  'Sapphire Coast':  { bg: 'rgba(30,80,180,0.15)',   text: '#93c5fd',                  border: 'rgba(60,100,220,0.3)' },
}

const STATUS_STYLES: Record<string, { bg: string; text: string; border: string }> = {
  active:    { bg: 'rgba(201,160,68,0.12)',  text: 'var(--color-gold-light)', border: 'rgba(201,160,68,0.25)' },
  completed: { bg: 'rgba(42,138,72,0.12)',   text: '#4ade80',                 border: 'rgba(42,138,72,0.25)' },
  failed:    { bg: 'rgba(139,30,30,0.15)',   text: '#f87171',                 border: 'rgba(139,30,30,0.3)' },
  available: { bg: 'rgba(74,58,40,0.3)',     text: 'var(--color-parchment-mid)', border: 'var(--color-border-bright)' },
  hidden:    { bg: 'rgba(26,32,64,0.3)',     text: '#93c5fd',                 border: 'rgba(99,130,201,0.25)' },
}

interface NPCWithFaction extends NPC { faction?: Faction | null }

// ── Main page ─────────────────────────────────────────────────────────────────

export default function LocationDetailPage() {
  const params = useParams()
  const slug = params.slug as string

  const [location, setLocation] = useState<Location | null>(null)
  const [npcs, setNpcs] = useState<NPCWithFaction[]>([])
  const [referencedNpcs, setReferencedNpcs] = useState<NPCWithFaction[]>([])
  const [quests, setQuests] = useState<Quest[]>([])
  const [reputation, setReputation] = useState<LocationReputation | null>(null)
  const [allNpcs, setAllNpcs] = useState<NPC[]>([])
  const [allLocations, setAllLocations] = useState<Location[]>([])
  const [loading, setLoading] = useState(true)
  const [notFound, setNotFound] = useState(false)

  useEffect(() => {
    async function load() {
      const { data: loc } = await supabase.from('locations').select('*').eq('slug', slug).single()
      if (!loc) { setNotFound(true); setLoading(false); return }
      setLocation(loc)

      const [npcRes, questRes, repRes, factionRes, allNpcRes, allLocRes] = await Promise.all([
        supabase.from('npcs').select('*').eq('location_id', loc.id).order('is_major', { ascending: false }),
        supabase.from('quests').select('*').eq('location_id', loc.id).order('status'),
        supabase.from('location_reputation').select('*').eq('location_id', loc.id).single(),
        supabase.from('factions').select('*'),
        supabase.from('npcs').select('id, name, slug, role, race, is_major, is_alive, location_id, faction_id, description, personality, secrets'),
        supabase.from('locations').select('id, name, slug, region'),
      ])

      const factionMap: Record<string, Faction> = {}
      for (const f of factionRes.data ?? []) factionMap[f.id] = f

      const locationNpcIds = new Set((npcRes.data ?? []).map((n) => n.id))
      const enriched = (npcRes.data ?? []).map((n) => ({ ...n, faction: n.faction_id ? factionMap[n.faction_id] ?? null : null }))

      // Find NPCs mentioned by name in location text but not based here
      const allNpcList = allNpcRes.data ?? []
      const questList = questRes.data ?? []
      const searchText = [
        loc.description ?? '',
        loc.dm_notes ?? '',
        ...questList.map((q) => `${q.description ?? ''} ${q.dm_notes ?? ''}`),
      ].join(' ').toLowerCase()

      const mentioned = allNpcList.filter((n) =>
        !locationNpcIds.has(n.id) &&
        n.name.length > 3 &&
        searchText.includes(n.name.toLowerCase())
      ).map((n) => ({ ...n, faction: n.faction_id ? factionMap[n.faction_id] ?? null : null }))

      setNpcs(enriched)
      setReferencedNpcs(mentioned as NPCWithFaction[])
      setQuests(questList)
      setReputation(repRes.data ?? null)
      setAllNpcs(allNpcList as NPC[])
      setAllLocations(allLocRes.data ?? [])
      setLoading(false)
    }
    load()
  }, [slug])

  // Build entity map for hyperlinking
  const entities: EntityRef[] = useMemo(() => [
    ...allNpcs.map((n) => ({ name: n.name, slug: n.slug, type: 'npc' as const })),
    ...allLocations.filter((l) => l.slug !== slug).map((l) => ({ name: l.name, slug: l.slug, type: 'location' as const })),
  ], [allNpcs, allLocations, slug])

  if (loading) return <Spinner />
  if (notFound) return (
    <div className="flex flex-col items-center justify-center h-64 gap-4">
      <p style={{ color: 'var(--color-parchment-dim)', fontSize: 14 }}>Location not found.</p>
      <Link href="/dm/locations" style={{ color: 'var(--color-gold)', fontSize: 13, textDecoration: 'none' }}>← Back to Locations</Link>
    </div>
  )

  const regionColors = REGION_COLORS[location!.region] ?? { bg: 'rgba(74,58,40,0.2)', text: 'var(--color-parchment-dim)', border: 'var(--color-border)' }
  const majorNpcs = npcs.filter((n) => n.is_major && n.is_alive)
  const minorNpcs = npcs.filter((n) => !n.is_major && n.is_alive)
  const deceasedNpcs = npcs.filter((n) => !n.is_alive)
  const activeQuests = quests.filter((q) => q.status === 'active')
  const otherQuests = quests.filter((q) => q.status !== 'active')
  const totalNpcCount = npcs.length + referencedNpcs.length

  return (
    <div style={{ maxWidth: 900 }}>
      {/* Back nav */}
      <Link href="/dm/locations" className="flex items-center gap-1 mb-5"
        style={{ color: 'var(--color-parchment-dim)', textDecoration: 'none', fontSize: 13, width: 'fit-content' }}>
        <ArrowLeft size={14} /> All Locations
      </Link>

      {/* Header */}
      <div className="mb-6">
        <div className="flex items-start gap-3 mb-3">
          <h1 className="font-display flex-1"
            style={{ fontSize: 28, fontWeight: 600, color: 'var(--color-parchment)', lineHeight: 1.2 }}>
            {location!.name}
            {location!.is_major && <Star size={16} style={{ display: 'inline', marginLeft: 10, color: 'var(--color-gold)', verticalAlign: 'middle' }} />}
          </h1>
        </div>

        <div className="flex items-center gap-2 flex-wrap mb-4">
          <span className="badge" style={{ background: regionColors.bg, color: regionColors.text, border: `1px solid ${regionColors.border}` }}>
            <MapPin size={10} /> {location!.region}
          </span>
          <span className="badge" style={{ background: 'rgba(74,58,40,0.2)', color: 'var(--color-parchment-dim)', border: '1px solid var(--color-border)' }}>
            {location!.location_type}
          </span>
          {location!.population != null && (
            <span className="badge" style={{ background: 'rgba(74,58,40,0.2)', color: 'var(--color-parchment-dim)', border: '1px solid var(--color-border)' }}>
              <Users size={10} /> Pop. {location!.population.toLocaleString()}
            </span>
          )}
          {reputation && (
            <span className="badge" style={{ background: 'rgba(42,138,72,0.1)', color: '#86efac', border: '1px solid rgba(42,138,72,0.2)' }}>
              {reputation.rank_title}
            </span>
          )}
        </div>

        {location!.description && (
          <p style={{ fontSize: 14, color: 'var(--color-parchment-mid)', lineHeight: 1.7, maxWidth: 700 }}>
            <EntityText text={location!.description} entities={entities} />
          </p>
        )}
      </div>

      {/* DM Notes */}
      {location!.dm_notes && (
        <div className="mb-6" style={{ padding: '12px 16px', borderRadius: 6, background: 'rgba(139,30,30,0.08)', border: '1px solid rgba(139,30,30,0.25)' }}>
          <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 6, fontWeight: 600 }}>
            DM Notes
          </p>
          <p style={{ fontSize: 13, color: '#fca5a5', lineHeight: 1.6 }}>
            <EntityText text={location!.dm_notes} entities={entities} style={{ color: '#fca5a5' }} />
          </p>
        </div>
      )}

      {/* Two-column layout */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 24 }}>

        {/* NPCs column */}
        <div>
          <SectionHeader icon={<Users size={14} />} title={`NPCs (${totalNpcCount})`} />

          {totalNpcCount === 0 ? (
            <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>No NPCs recorded here.</p>
          ) : (
            <div className="flex flex-col gap-2">
              {majorNpcs.length > 0 && <>
                <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.06em', marginBottom: 2 }}>Based Here — Major</p>
                {majorNpcs.map((npc) => <NpcCard key={npc.id} npc={npc} entities={entities} />)}
              </>}
              {minorNpcs.length > 0 && <>
                <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.06em', marginTop: 8, marginBottom: 2 }}>Based Here — Others</p>
                {minorNpcs.map((npc) => <NpcCard key={npc.id} npc={npc} entities={entities} />)}
              </>}
              {deceasedNpcs.length > 0 && <>
                <p style={{ fontSize: 11, color: '#f87171', textTransform: 'uppercase', letterSpacing: '0.06em', marginTop: 8, marginBottom: 2, opacity: 0.6 }}>Deceased</p>
                {deceasedNpcs.map((npc) => <NpcCard key={npc.id} npc={npc} entities={entities} deceased />)}
              </>}

              {/* Referenced NPCs */}
              {referencedNpcs.length > 0 && <>
                <div className="flex items-center gap-2 mt-4 mb-2">
                  <Link2 size={11} style={{ color: 'var(--color-parchment-dim)', opacity: 0.6 }} />
                  <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.06em', opacity: 0.8 }}>
                    Referenced in this location
                  </p>
                </div>
                {referencedNpcs.map((npc) => (
                  <Link key={npc.id} href={`/dm/npcs/${npc.slug}`} style={{ textDecoration: 'none' }}>
                    <div className="card" style={{ padding: '8px 12px', display: 'flex', alignItems: 'center', gap: 8, transition: 'border-color 0.15s, background 0.15s', cursor: 'pointer' }}>
                      <div style={{ flex: 1, minWidth: 0 }}>
                        <span className="font-display" style={{ fontSize: 12, fontWeight: 600, color: 'var(--color-gold-light)' }}>
                          {npc.name}
                        </span>
                        {npc.role && <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginLeft: 8 }}>{npc.role}</span>}
                      </div>
                      <ChevronRight size={12} style={{ color: 'var(--color-parchment-dim)', flexShrink: 0 }} />
                    </div>
                  </Link>
                ))}
              </>}
            </div>
          )}
        </div>

        {/* Quests column */}
        <div>
          <SectionHeader icon={<ScrollText size={14} />} title={`Quests (${quests.length})`} />

          {quests.length === 0 ? (
            <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>No quests tied to this location.</p>
          ) : (
            <div className="flex flex-col gap-2">
              {activeQuests.length > 0 && <>
                <p style={{ fontSize: 11, color: 'var(--color-gold-dim)', textTransform: 'uppercase', letterSpacing: '0.06em', marginBottom: 2 }}>Active</p>
                {activeQuests.map((q) => <QuestCard key={q.id} quest={q} entities={entities} />)}
              </>}
              {otherQuests.length > 0 && <>
                {activeQuests.length > 0 && <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.06em', marginTop: 8, marginBottom: 2 }}>Other</p>}
                {otherQuests.map((q) => <QuestCard key={q.id} quest={q} entities={entities} />)}
              </>}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

// ── NPC Card ──────────────────────────────────────────────────────────────────

function NpcCard({ npc, entities, deceased }: { npc: NPCWithFaction; entities: EntityRef[]; deceased?: boolean }) {
  const [expanded, setExpanded] = useState(false)

  return (
    <div className="card" style={{ opacity: deceased ? 0.55 : 1, cursor: 'pointer', transition: 'border-color 0.15s, background-color 0.15s' }}
      onClick={() => setExpanded((v) => !v)}>
      <div className="flex items-start gap-2" style={{ padding: '10px 12px' }}>
        <div style={{ flex: 1, minWidth: 0 }}>
          <div className="flex items-center gap-2 flex-wrap">
            <span className="font-display" style={{ fontSize: 13, fontWeight: 600, color: deceased ? '#9ca3af' : 'var(--color-parchment)' }}>
              {npc.name}
            </span>
            {deceased && <Skull size={12} style={{ color: '#f87171', opacity: 0.7 }} />}
            {npc.is_major && !deceased && <Star size={11} style={{ color: 'var(--color-gold)', opacity: 0.8 }} />}
          </div>
          <div className="flex items-center gap-2 flex-wrap mt-1">
            {npc.role && <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>{npc.role}</span>}
            {npc.race && <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)', opacity: 0.7 }}>· {npc.race}</span>}
            {npc.faction && (
              <span className="badge" style={{ fontSize: 10, background: 'rgba(42,62,138,0.12)', color: '#a5b4fc', border: '1px solid rgba(99,130,201,0.2)' }}>
                {npc.faction.name}
              </span>
            )}
          </div>
        </div>
        <ChevronRight size={14} style={{ color: 'var(--color-parchment-dim)', transform: expanded ? 'rotate(90deg)' : 'rotate(0deg)', transition: 'transform 0.15s', flexShrink: 0, marginTop: 2 }} />
      </div>

      {expanded && (
        <div style={{ padding: '0 12px 10px', borderTop: '1px solid var(--color-border)', paddingTop: 10 }}>
          {npc.description && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.6, marginBottom: 6 }}>
              <EntityText text={npc.description} entities={entities} />
            </p>
          )}
          {npc.personality && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', lineHeight: 1.5, marginBottom: 6 }}>
              <span style={{ fontWeight: 600 }}>Personality: </span>
              <EntityText text={npc.personality} entities={entities} />
            </p>
          )}
          {npc.secrets && (
            <div style={{ marginTop: 8, padding: '6px 10px', borderRadius: 4, background: 'rgba(139,30,30,0.08)', border: '1px solid rgba(139,30,30,0.2)' }}>
              <p style={{ fontSize: 11, color: '#fca5a5', lineHeight: 1.5 }}>
                <span style={{ fontWeight: 600, textTransform: 'uppercase', letterSpacing: '0.06em', marginRight: 6 }}>Secret:</span>
                <EntityText text={npc.secrets} entities={entities} style={{ color: '#fca5a5' }} />
              </p>
            </div>
          )}
          {!npc.description && !npc.personality && !npc.secrets && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>No details recorded.</p>
          )}
          <div className="mt-2 pt-2" style={{ borderTop: '1px solid var(--color-border)' }}>
            <Link href={`/dm/npcs/${npc.slug}`} style={{ fontSize: 11, color: 'var(--color-gold)', textDecoration: 'none' }}
              onClick={(e) => e.stopPropagation()}>
              View full NPC page →
            </Link>
          </div>
        </div>
      )}
    </div>
  )
}

// ── Quest Card ────────────────────────────────────────────────────────────────

function QuestCard({ quest, entities }: { quest: Quest; entities: EntityRef[] }) {
  const [expanded, setExpanded] = useState(false)
  const statusStyle = STATUS_STYLES[quest.status] ?? STATUS_STYLES.available

  return (
    <div className="card" style={{ cursor: 'pointer', transition: 'border-color 0.15s, background-color 0.15s' }}
      onClick={() => setExpanded((v) => !v)}>
      <div className="flex items-start gap-2" style={{ padding: '10px 12px' }}>
        <div style={{ flex: 1, minWidth: 0 }}>
          <span className="font-display" style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment)', display: 'block', marginBottom: 4 }}>
            {quest.title}
          </span>
          <div className="flex items-center gap-2 flex-wrap">
            <span className="badge" style={{ background: statusStyle.bg, color: statusStyle.text, border: `1px solid ${statusStyle.border}` }}>
              {quest.status}
            </span>
            <span className="badge" style={{ background: 'rgba(74,58,40,0.2)', color: 'var(--color-parchment-dim)', border: '1px solid var(--color-border)' }}>
              {quest.quest_type}
            </span>
          </div>
        </div>
        <ChevronRight size={14} style={{ color: 'var(--color-parchment-dim)', transform: expanded ? 'rotate(90deg)' : 'rotate(0deg)', transition: 'transform 0.15s', flexShrink: 0, marginTop: 2 }} />
      </div>

      {expanded && (
        <div style={{ padding: '0 12px 10px', borderTop: '1px solid var(--color-border)', paddingTop: 10 }}>
          {quest.description && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.6, marginBottom: 6 }}>
              <EntityText text={quest.description} entities={entities} />
            </p>
          )}
          {quest.reward_notes && (
            <p style={{ fontSize: 12, color: 'var(--color-gold-dim)', lineHeight: 1.5, marginBottom: 6 }}>
              <span style={{ fontWeight: 600 }}>Reward: </span>
              <EntityText text={quest.reward_notes} entities={entities} />
            </p>
          )}
          {quest.dm_notes && (
            <div style={{ marginTop: 8, padding: '6px 10px', borderRadius: 4, background: 'rgba(139,30,30,0.08)', border: '1px solid rgba(139,30,30,0.2)' }}>
              <p style={{ fontSize: 11, color: '#fca5a5', lineHeight: 1.5 }}>
                <span style={{ fontWeight: 600, textTransform: 'uppercase', letterSpacing: '0.06em', marginRight: 6 }}>DM:</span>
                <EntityText text={quest.dm_notes} entities={entities} style={{ color: '#fca5a5' }} />
              </p>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
