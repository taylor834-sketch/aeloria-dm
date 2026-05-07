'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import Link from 'next/link'
import { supabase } from '@/lib/supabase'
import type { Location, NPC, Quest, Faction, LocationReputation } from '@/types/database'
import { ArrowLeft, MapPin, Users, ScrollText, Skull, Star, ChevronRight } from 'lucide-react'

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

function SectionHeader({ icon, title }: { icon: React.ReactNode; title: string }) {
  return (
    <div className="flex items-center gap-2 mb-3">
      <span style={{ color: 'var(--color-gold-dim)' }}>{icon}</span>
      <h2
        className="font-display"
        style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment-mid)', letterSpacing: '0.08em', textTransform: 'uppercase' }}
      >
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

function attitudeLabel(attitude: number) {
  if (attitude >= 4) return { label: 'Devoted', color: '#4ade80' }
  if (attitude >= 2) return { label: 'Friendly', color: '#86efac' }
  if (attitude >= 0) return { label: 'Neutral', color: 'var(--color-parchment-mid)' }
  if (attitude >= -2) return { label: 'Wary', color: '#fb923c' }
  return { label: 'Hostile', color: '#f87171' }
}

interface NPCWithRelationships extends NPC {
  faction?: Faction | null
  overallAttitude?: number
}

export default function LocationDetailPage() {
  const params = useParams()
  const slug = params.slug as string

  const [location, setLocation] = useState<Location | null>(null)
  const [npcs, setNpcs] = useState<NPCWithRelationships[]>([])
  const [quests, setQuests] = useState<Quest[]>([])
  const [reputation, setReputation] = useState<LocationReputation | null>(null)
  const [factions, setFactions] = useState<Record<string, Faction>>({})
  const [loading, setLoading] = useState(true)
  const [notFound, setNotFound] = useState(false)

  useEffect(() => {
    async function load() {
      // Load location
      const { data: loc } = await supabase
        .from('locations')
        .select('*')
        .eq('slug', slug)
        .single()

      if (!loc) {
        setNotFound(true)
        setLoading(false)
        return
      }

      setLocation(loc)

      // Load everything in parallel
      const [
        { data: npcData },
        { data: questData },
        { data: repData },
        { data: factionData },
      ] = await Promise.all([
        supabase
          .from('npcs')
          .select('*')
          .eq('location_id', loc.id)
          .order('is_major', { ascending: false }),
        supabase
          .from('quests')
          .select('*')
          .eq('location_id', loc.id)
          .order('status'),
        supabase
          .from('location_reputation')
          .select('*')
          .eq('location_id', loc.id)
          .single(),
        supabase
          .from('factions')
          .select('*'),
      ])

      // Build faction lookup
      const factionMap: Record<string, Faction> = {}
      for (const f of factionData ?? []) factionMap[f.id] = f

      // Attach faction info to NPCs
      const enrichedNpcs: NPCWithRelationships[] = (npcData ?? []).map((npc) => ({
        ...npc,
        faction: npc.faction_id ? factionMap[npc.faction_id] ?? null : null,
      }))

      setNpcs(enrichedNpcs)
      setQuests(questData ?? [])
      setReputation(repData ?? null)
      setFactions(factionMap)
      setLoading(false)
    }

    load()
  }, [slug])

  if (loading) return <Spinner />

  if (notFound) {
    return (
      <div className="flex flex-col items-center justify-center h-64 gap-4">
        <p style={{ color: 'var(--color-parchment-dim)', fontSize: 14 }}>Location not found.</p>
        <Link href="/dm/locations" style={{ color: 'var(--color-gold)', fontSize: 13, textDecoration: 'none' }}>
          ← Back to Locations
        </Link>
      </div>
    )
  }

  const regionColors = REGION_COLORS[location!.region] ?? {
    bg: 'rgba(74,58,40,0.2)',
    text: 'var(--color-parchment-dim)',
    border: 'var(--color-border)',
  }

  const majorNpcs = npcs.filter((n) => n.is_major && n.is_alive)
  const minorNpcs = npcs.filter((n) => !n.is_major && n.is_alive)
  const deceasedNpcs = npcs.filter((n) => !n.is_alive)

  const activeQuests = quests.filter((q) => q.status === 'active')
  const otherQuests = quests.filter((q) => q.status !== 'active')

  return (
    <div style={{ maxWidth: 900 }}>
      {/* Back nav */}
      <Link
        href="/dm/locations"
        className="flex items-center gap-1 mb-5"
        style={{ color: 'var(--color-parchment-dim)', textDecoration: 'none', fontSize: 13, width: 'fit-content' }}
      >
        <ArrowLeft size={14} />
        All Locations
      </Link>

      {/* Header */}
      <div className="mb-6">
        <div className="flex items-start gap-3 mb-3">
          <h1
            className="font-display flex-1"
            style={{ fontSize: 28, fontWeight: 600, color: 'var(--color-parchment)', lineHeight: 1.2 }}
          >
            {location!.name}
            {location!.is_major && (
              <Star size={16} style={{ display: 'inline', marginLeft: 10, color: 'var(--color-gold)', verticalAlign: 'middle' }} />
            )}
          </h1>
        </div>

        {/* Badges row */}
        <div className="flex items-center gap-2 flex-wrap mb-4">
          <span
            className="badge"
            style={{ background: regionColors.bg, color: regionColors.text, border: `1px solid ${regionColors.border}` }}
          >
            <MapPin size={10} />
            {location!.region}
          </span>
          <span
            className="badge"
            style={{ background: 'rgba(74,58,40,0.2)', color: 'var(--color-parchment-dim)', border: '1px solid var(--color-border)' }}
          >
            {location!.location_type}
          </span>
          {location!.population != null && (
            <span
              className="badge"
              style={{ background: 'rgba(74,58,40,0.2)', color: 'var(--color-parchment-dim)', border: '1px solid var(--color-border)' }}
            >
              <Users size={10} />
              Pop. {location!.population.toLocaleString()}
            </span>
          )}
          {reputation && (
            <span
              className="badge"
              style={{ background: 'rgba(42,138,72,0.1)', color: '#86efac', border: '1px solid rgba(42,138,72,0.2)' }}
            >
              {reputation.rank_title}
            </span>
          )}
        </div>

        {/* Description */}
        {location!.description && (
          <p style={{ fontSize: 14, color: 'var(--color-parchment-mid)', lineHeight: 1.7, maxWidth: 700 }}>
            {location!.description}
          </p>
        )}
      </div>

      {/* DM Notes */}
      {location!.dm_notes && (
        <div
          className="mb-6"
          style={{
            padding: '12px 16px',
            borderRadius: 6,
            background: 'rgba(139,30,30,0.08)',
            border: '1px solid rgba(139,30,30,0.25)',
          }}
        >
          <p
            style={{
              fontSize: 11,
              color: 'var(--color-parchment-dim)',
              textTransform: 'uppercase',
              letterSpacing: '0.08em',
              marginBottom: 6,
              fontWeight: 600,
            }}
          >
            DM Notes
          </p>
          <p style={{ fontSize: 13, color: '#fca5a5', lineHeight: 1.6 }}>{location!.dm_notes}</p>
        </div>
      )}

      {/* Two-column layout */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 24 }}>

        {/* NPCs column */}
        <div>
          <SectionHeader icon={<Users size={14} />} title={`NPCs (${npcs.length})`} />

          {npcs.length === 0 ? (
            <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>No NPCs recorded here.</p>
          ) : (
            <div className="flex flex-col gap-2">
              {majorNpcs.length > 0 && (
                <>
                  <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.06em', marginBottom: 2 }}>
                    Major
                  </p>
                  {majorNpcs.map((npc) => (
                    <NpcCard key={npc.id} npc={npc} />
                  ))}
                </>
              )}
              {minorNpcs.length > 0 && (
                <>
                  <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.06em', marginTop: 8, marginBottom: 2 }}>
                    Others
                  </p>
                  {minorNpcs.map((npc) => (
                    <NpcCard key={npc.id} npc={npc} />
                  ))}
                </>
              )}
              {deceasedNpcs.length > 0 && (
                <>
                  <p style={{ fontSize: 11, color: '#f87171', textTransform: 'uppercase', letterSpacing: '0.06em', marginTop: 8, marginBottom: 2, opacity: 0.6 }}>
                    Deceased
                  </p>
                  {deceasedNpcs.map((npc) => (
                    <NpcCard key={npc.id} npc={npc} deceased />
                  ))}
                </>
              )}
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
              {activeQuests.length > 0 && (
                <>
                  <p style={{ fontSize: 11, color: 'var(--color-gold-dim)', textTransform: 'uppercase', letterSpacing: '0.06em', marginBottom: 2 }}>
                    Active
                  </p>
                  {activeQuests.map((q) => (
                    <QuestCard key={q.id} quest={q} />
                  ))}
                </>
              )}
              {otherQuests.length > 0 && (
                <>
                  {activeQuests.length > 0 && (
                    <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.06em', marginTop: 8, marginBottom: 2 }}>
                      Other
                    </p>
                  )}
                  {otherQuests.map((q) => (
                    <QuestCard key={q.id} quest={q} />
                  ))}
                </>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

function NpcCard({ npc, deceased }: { npc: NPCWithRelationships; deceased?: boolean }) {
  const [expanded, setExpanded] = useState(false)

  return (
    <div
      className="card"
      style={{
        opacity: deceased ? 0.55 : 1,
        cursor: 'pointer',
        transition: 'border-color 0.15s, background-color 0.15s',
      }}
      onClick={() => setExpanded((v) => !v)}
    >
      <div className="flex items-start gap-2" style={{ padding: '10px 12px' }}>
        <div style={{ flex: 1, minWidth: 0 }}>
          <div className="flex items-center gap-2 flex-wrap">
            <span
              className="font-display"
              style={{ fontSize: 13, fontWeight: 600, color: deceased ? '#9ca3af' : 'var(--color-parchment)' }}
            >
              {npc.name}
            </span>
            {deceased && <Skull size={12} style={{ color: '#f87171', opacity: 0.7 }} />}
            {npc.is_major && !deceased && (
              <Star size={11} style={{ color: 'var(--color-gold)', opacity: 0.8 }} />
            )}
          </div>
          <div className="flex items-center gap-2 flex-wrap mt-1">
            {npc.role && (
              <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>{npc.role}</span>
            )}
            {npc.race && (
              <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)', opacity: 0.7 }}>· {npc.race}</span>
            )}
            {npc.faction && (
              <span
                className="badge"
                style={{ fontSize: 10, background: 'rgba(42,62,138,0.12)', color: '#a5b4fc', border: '1px solid rgba(99,130,201,0.2)' }}
              >
                {npc.faction.name}
              </span>
            )}
          </div>
        </div>
        <ChevronRight
          size={14}
          style={{
            color: 'var(--color-parchment-dim)',
            transform: expanded ? 'rotate(90deg)' : 'rotate(0deg)',
            transition: 'transform 0.15s',
            flexShrink: 0,
            marginTop: 2,
          }}
        />
      </div>

      {expanded && (
        <div
          style={{
            padding: '0 12px 10px',
            borderTop: '1px solid var(--color-border)',
            paddingTop: 10,
          }}
        >
          {npc.description && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.6, marginBottom: 6 }}>
              {npc.description}
            </p>
          )}
          {npc.personality && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', lineHeight: 1.5, marginBottom: 6 }}>
              <span style={{ color: 'var(--color-parchment-dim)', fontWeight: 600 }}>Personality: </span>
              {npc.personality}
            </p>
          )}
          {npc.secrets && (
            <div
              style={{
                marginTop: 8,
                padding: '6px 10px',
                borderRadius: 4,
                background: 'rgba(139,30,30,0.08)',
                border: '1px solid rgba(139,30,30,0.2)',
              }}
            >
              <p style={{ fontSize: 11, color: '#fca5a5', lineHeight: 1.5 }}>
                <span style={{ fontWeight: 600, textTransform: 'uppercase', letterSpacing: '0.06em', marginRight: 6 }}>Secret:</span>
                {npc.secrets}
              </p>
            </div>
          )}
          {!npc.description && !npc.personality && !npc.secrets && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>No details recorded.</p>
          )}
        </div>
      )}
    </div>
  )
}

function QuestCard({ quest }: { quest: Quest }) {
  const [expanded, setExpanded] = useState(false)
  const statusStyle = STATUS_STYLES[quest.status] ?? STATUS_STYLES.available

  return (
    <div
      className="card"
      style={{ cursor: 'pointer', transition: 'border-color 0.15s, background-color 0.15s' }}
      onClick={() => setExpanded((v) => !v)}
    >
      <div className="flex items-start gap-2" style={{ padding: '10px 12px' }}>
        <div style={{ flex: 1, minWidth: 0 }}>
          <div className="flex items-center gap-2 flex-wrap mb-1">
            <span
              className="font-display"
              style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment)' }}
            >
              {quest.title}
            </span>
          </div>
          <div className="flex items-center gap-2 flex-wrap">
            <span
              className="badge"
              style={{ background: statusStyle.bg, color: statusStyle.text, border: `1px solid ${statusStyle.border}` }}
            >
              {quest.status}
            </span>
            <span
              className="badge"
              style={{ background: 'rgba(74,58,40,0.2)', color: 'var(--color-parchment-dim)', border: '1px solid var(--color-border)' }}
            >
              {quest.quest_type}
            </span>
          </div>
        </div>
        <ChevronRight
          size={14}
          style={{
            color: 'var(--color-parchment-dim)',
            transform: expanded ? 'rotate(90deg)' : 'rotate(0deg)',
            transition: 'transform 0.15s',
            flexShrink: 0,
            marginTop: 2,
          }}
        />
      </div>

      {expanded && (
        <div
          style={{
            padding: '0 12px 10px',
            borderTop: '1px solid var(--color-border)',
            paddingTop: 10,
          }}
        >
          {quest.description && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.6, marginBottom: 6 }}>
              {quest.description}
            </p>
          )}
          {quest.reward_notes && (
            <p style={{ fontSize: 12, color: 'var(--color-gold-dim)', lineHeight: 1.5, marginBottom: 6 }}>
              <span style={{ fontWeight: 600 }}>Reward: </span>
              {quest.reward_notes}
            </p>
          )}
          {quest.dm_notes && (
            <div
              style={{
                marginTop: 8,
                padding: '6px 10px',
                borderRadius: 4,
                background: 'rgba(139,30,30,0.08)',
                border: '1px solid rgba(139,30,30,0.2)',
              }}
            >
              <p style={{ fontSize: 11, color: '#fca5a5', lineHeight: 1.5 }}>
                <span style={{ fontWeight: 600, textTransform: 'uppercase', letterSpacing: '0.06em', marginRight: 6 }}>DM:</span>
                {quest.dm_notes}
              </p>
            </div>
          )}
          {!quest.description && !quest.reward_notes && !quest.dm_notes && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>No details recorded.</p>
          )}
        </div>
      )}
    </div>
  )
}
