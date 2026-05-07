'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import { MapPin, User, Swords } from 'lucide-react'
import { supabase } from '@/lib/supabase'
import type { Quest, NPC, Location } from '@/types/database'

interface PlayerQuestRow {
  quest_id: string
  status: string
  player_notes: string | null
  updated_at: string
  quests: Quest
}

interface QuestNPCLink {
  npc_id: string
  quest_id: string
  role: string | null
  npcs: { name: string; role: string | null; is_alive: boolean }
}

interface EnrichedQuest extends Quest {
  player_status: string
  player_notes: string | null
  location_name?: string
  npc_links: QuestNPCLink[]
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

function typeBadge(type: string) {
  const cls =
    type === 'main'     ? 'badge badge-main' :
    type === 'faction'  ? 'badge badge-faction' :
    type === 'personal' ? 'badge badge-personal' :
    'badge badge-side'
  return <span className={cls}>{type}</span>
}

function statusBadge(status: string) {
  const cls =
    status === 'active'    ? 'badge badge-active' :
    status === 'completed' ? 'badge badge-completed' :
    status === 'failed'    ? 'badge badge-failed' :
    'badge badge-available'
  return <span className={cls}>{status}</span>
}

function npcRoleColor(role: string | null) {
  switch (role) {
    case 'giver':    return 'var(--color-gold)'
    case 'target':   return '#f87171'
    case 'ally':     return 'var(--color-emerald-bright)'
    case 'obstacle': return '#fb923c'
    default:         return 'var(--color-parchment-mid)'
  }
}

function QuestCard({ quest, faded }: { quest: EnrichedQuest; faded?: boolean }) {
  return (
    <div
      className="card"
      style={{
        padding: '20px 22px',
        opacity: faded ? 0.65 : 1,
        transition: 'opacity 0.15s',
      }}
    >
      {/* Header */}
      <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: 12, marginBottom: 10 }}>
        <h3 className="font-display" style={{ fontSize: 16, color: 'var(--color-parchment)', fontWeight: 600, lineHeight: 1.3 }}>
          {quest.title}
        </h3>
        <div style={{ display: 'flex', gap: 6, flexShrink: 0, flexWrap: 'wrap', justifyContent: 'flex-end' }}>
          {typeBadge(quest.quest_type)}
          {statusBadge(quest.status)}
        </div>
      </div>

      {/* Meta */}
      <div style={{ display: 'flex', alignItems: 'center', gap: 12, marginBottom: 12, flexWrap: 'wrap' }}>
        {quest.region && (
          <span style={{ display: 'flex', alignItems: 'center', gap: 4, fontSize: 11, color: 'var(--color-parchment-dim)' }}>
            <MapPin size={10} />
            {quest.region}
          </span>
        )}
        {quest.location_name && (
          <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
            · {quest.location_name}
          </span>
        )}
      </div>

      {/* Description */}
      {quest.description && (
        <p style={{ fontSize: 13, color: 'var(--color-parchment-mid)', lineHeight: 1.65, marginBottom: 12 }}>
          {quest.description}
        </p>
      )}

      {/* Player notes */}
      {quest.player_notes && (
        <div
          style={{
            background: 'rgba(201,160,68,0.05)',
            border: '1px solid rgba(201,160,68,0.15)',
            borderRadius: 5,
            padding: '10px 14px',
            marginBottom: 12,
          }}
        >
          <p style={{ fontSize: 10, fontWeight: 700, letterSpacing: '0.08em', color: 'var(--color-gold-dim)', textTransform: 'uppercase', marginBottom: 4 }}>
            Your Notes
          </p>
          <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.6, fontStyle: 'italic' }}>
            {quest.player_notes}
          </p>
        </div>
      )}

      {/* Reward */}
      {quest.reward_notes && (
        <div style={{ marginBottom: 12 }}>
          <p style={{ fontSize: 10, fontWeight: 700, letterSpacing: '0.08em', color: 'var(--color-parchment-dim)', textTransform: 'uppercase', marginBottom: 4 }}>
            Reward
          </p>
          <p style={{ fontSize: 12, color: 'var(--color-gold)', lineHeight: 1.5 }}>
            {quest.reward_notes}
          </p>
        </div>
      )}

      {/* NPC links */}
      {quest.npc_links.length > 0 && (
        <div style={{ marginBottom: 8 }}>
          <p style={{ fontSize: 10, fontWeight: 700, letterSpacing: '0.08em', color: 'var(--color-parchment-dim)', textTransform: 'uppercase', marginBottom: 8 }}>
            Related People
          </p>
          <div style={{ display: 'flex', flexWrap: 'wrap', gap: 6 }}>
            {quest.npc_links.map((link) => (
              <div
                key={link.npc_id}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: 6,
                  padding: '5px 10px',
                  background: 'var(--color-surface-raised)',
                  border: '1px solid var(--color-border)',
                  borderRadius: 4,
                }}
              >
                <User size={10} style={{ color: 'var(--color-parchment-dim)' }} />
                <span style={{ fontSize: 12, color: 'var(--color-parchment)' }}>
                  {link.npcs.name}
                </span>
                {link.role && (
                  <span
                    style={{
                      fontSize: 10,
                      fontWeight: 600,
                      color: npcRoleColor(link.role),
                      textTransform: 'uppercase',
                      letterSpacing: '0.06em',
                    }}
                  >
                    {link.role}
                  </span>
                )}
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}

function QuestSection({
  title,
  quests,
  faded,
  accentColor,
}: {
  title: string
  quests: EnrichedQuest[]
  faded?: boolean
  accentColor: string
}) {
  if (quests.length === 0) return null
  return (
    <div style={{ marginBottom: 40 }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 16 }}>
        <Swords size={14} style={{ color: accentColor }} />
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
          {quests.length}
        </span>
      </div>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 14 }}>
        {quests.map((q) => (
          <QuestCard key={q.id} quest={q} faded={faded} />
        ))}
      </div>
    </div>
  )
}

export default function QuestLogPage() {
  const router = useRouter()
  const [quests, setQuests]   = useState<EnrichedQuest[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    const playerId = typeof window !== 'undefined' ? localStorage.getItem('selectedPlayerId') : null
    if (!playerId) { router.push('/player'); return }

    async function load() {
      // Fetch player_quests + nested quest data
      const { data: pqData } = await supabase
        .from('player_quests')
        .select('quest_id, status, player_notes, updated_at, quests(*)')
        .eq('player_id', playerId)

      if (!pqData || pqData.length === 0) { setLoading(false); return }

      const questIds = pqData.map((r) => (r as any).quest_id as string)

      // Fetch NPC links for all quests
      const { data: npcLinksData } = await supabase
        .from('npc_quest_links')
        .select('npc_id, quest_id, role, npcs(name, role, is_alive)')
        .in('quest_id', questIds)

      // Fetch location names
      const locationIds = pqData
        .map((r) => (r as any).quests?.location_id)
        .filter(Boolean) as string[]
      const { data: locData } = locationIds.length
        ? await supabase.from('locations').select('id, name').in('id', locationIds)
        : { data: [] }

      const locMap: Record<string, string> = {}
      for (const l of locData ?? []) locMap[l.id] = l.name

      const linksByQuest: Record<string, QuestNPCLink[]> = {}
      for (const link of npcLinksData ?? []) {
        const l = link as any
        if (!linksByQuest[l.quest_id]) linksByQuest[l.quest_id] = []
        linksByQuest[l.quest_id].push(l as QuestNPCLink)
      }

      const enriched: EnrichedQuest[] = pqData.map((row) => {
        const r = row as any
        const q: Quest = r.quests
        return {
          ...q,
          player_status: r.status,
          player_notes: r.player_notes,
          location_name: q.location_id ? locMap[q.location_id] : undefined,
          npc_links: linksByQuest[q.id] ?? [],
        }
      })

      // Sort: active first, then completed, then failed
      const order: Record<string, number> = { active: 0, completed: 1, failed: 2 }
      enriched.sort((a, b) => (order[a.status] ?? 3) - (order[b.status] ?? 3))

      setQuests(enriched)
      setLoading(false)
    }

    load()
  }, [router])

  if (loading) return <Spinner />

  const active    = quests.filter((q) => q.status === 'active')
  const completed = quests.filter((q) => q.status === 'completed')
  const failed    = quests.filter((q) => q.status === 'failed')

  return (
    <div style={{ maxWidth: 800, margin: '0 auto', padding: '32px 24px' }}>
      <div style={{ marginBottom: 32 }}>
        <h1 className="font-display" style={{ fontSize: 26, color: 'var(--color-gold-light)', letterSpacing: '0.06em', marginBottom: 6 }}>
          Quest Log
        </h1>
        <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)' }}>
          {active.length} active · {completed.length} completed · {failed.length} failed
        </p>
      </div>

      <hr className="rule-gold" style={{ marginBottom: 32 }} />

      {quests.length === 0 && (
        <div style={{ textAlign: 'center', padding: '64px 0' }}>
          <p style={{ color: 'var(--color-parchment-dim)', fontStyle: 'italic', fontSize: 15 }}>
            No quests recorded yet. Your legend is unwritten.
          </p>
        </div>
      )}

      <QuestSection
        title="Active Quests"
        quests={active}
        accentColor="var(--color-gold)"
      />
      <QuestSection
        title="Completed"
        quests={completed}
        faded
        accentColor="var(--color-emerald-bright)"
      />
      <QuestSection
        title="Failed"
        quests={failed}
        faded
        accentColor="var(--color-crimson-bright)"
      />
    </div>
  )
}
