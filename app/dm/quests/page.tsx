'use client'

import { useEffect, useState, useMemo } from 'react'
import { supabase } from '@/lib/supabase'
import type { Quest, NPC } from '@/types/database'

interface QuestWithGiver extends Quest {
  giver_name?: string
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

const COLUMNS: { key: string; label: string; badgeClass: string; headerColor: string }[] = [
  { key: 'available', label: 'Available', badgeClass: 'badge-available', headerColor: '#9ca3af' },
  { key: 'active',    label: 'Active',    badgeClass: 'badge-active',    headerColor: 'var(--color-gold-light)' },
  { key: 'completed', label: 'Completed', badgeClass: 'badge-completed', headerColor: '#4ade80' },
  { key: 'failed',    label: 'Failed',    badgeClass: 'badge-failed',    headerColor: '#f87171' },
]

const COLUMN_BORDER: Record<string, string> = {
  available: 'var(--color-border-bright)',
  active:    'var(--color-gold-dim)',
  completed: 'rgba(42,138,72,0.4)',
  failed:    'rgba(139,30,30,0.4)',
}

function QuestCard({ quest }: { quest: QuestWithGiver }) {
  return (
    <div
      className="card card-hover"
      style={{
        padding: '12px 14px',
        borderLeft: `3px solid ${COLUMN_BORDER[quest.status] ?? 'var(--color-border)'}`,
        borderRadius: '0 6px 6px 0',
      }}
    >
      <div className="flex items-start justify-between gap-2 mb-2">
        <h4
          className="font-display"
          style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment)', lineHeight: 1.3, flex: 1 }}
        >
          {quest.title}
        </h4>
        {typeBadge(quest.quest_type)}
      </div>
      <div className="flex items-center gap-2 flex-wrap mb-2">
        {quest.region && (
          <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
            {quest.region}
          </span>
        )}
        {quest.giver_name && (
          <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
            · Given by {quest.giver_name}
          </span>
        )}
      </div>
      {quest.dm_notes && (
        <p
          style={{
            fontSize: 11,
            color: 'var(--color-parchment-dim)',
            fontStyle: 'italic',
            lineHeight: 1.5,
            borderTop: '1px solid var(--color-border)',
            paddingTop: 6,
            marginTop: 6,
            display: '-webkit-box',
            WebkitLineClamp: 3,
            WebkitBoxOrient: 'vertical',
            overflow: 'hidden',
          }}
        >
          {quest.dm_notes}
        </p>
      )}
    </div>
  )
}

export default function QuestsPage() {
  const [quests, setQuests] = useState<QuestWithGiver[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function load() {
      const [questRes, npcRes] = await Promise.all([
        supabase.from('quests').select('*').order('created_at', { ascending: false }),
        supabase.from('npcs').select('id, name'),
      ])

      const npcs: Pick<NPC, 'id' | 'name'>[] = (npcRes.data ?? []) as Pick<NPC, 'id' | 'name'>[]
      const questData = (questRes.data ?? []) as Quest[]

      setQuests(
        questData.map((q) => ({
          ...q,
          giver_name: q.giver_npc_id
            ? npcs.find((n) => n.id === q.giver_npc_id)?.name
            : undefined,
        }))
      )
      setLoading(false)
    }
    load()
  }, [])

  const columns = useMemo(() => {
    const grouped: Record<string, QuestWithGiver[]> = {}
    for (const col of COLUMNS) {
      grouped[col.key] = quests.filter((q) => q.status === col.key)
    }
    return grouped
  }, [quests])

  if (loading) return <Spinner />

  return (
    <div style={{ maxWidth: 1200 }}>
      {/* Header */}
      <div className="mb-6">
        <h1
          className="font-display"
          style={{ fontSize: 26, fontWeight: 600, color: 'var(--color-gold-light)', marginBottom: 4 }}
        >
          Quest Board
        </h1>
        <p style={{ color: 'var(--color-parchment-dim)', fontSize: 13 }}>
          {quests.length} total quests
        </p>
      </div>

      {/* Kanban board */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 16, alignItems: 'start' }}>
        {COLUMNS.map((col) => {
          const colQuests = columns[col.key] ?? []
          return (
            <div key={col.key}>
              {/* Column header */}
              <div
                className="flex items-center gap-2 mb-3 px-2"
                style={{ borderBottom: `2px solid ${COLUMN_BORDER[col.key]}`, paddingBottom: 8 }}
              >
                <h2
                  className="font-display"
                  style={{ fontSize: 13, fontWeight: 600, color: col.headerColor, textTransform: 'uppercase', letterSpacing: '0.08em' }}
                >
                  {col.label}
                </h2>
                <span
                  className="badge"
                  style={{
                    background: 'var(--color-surface-raised)',
                    color: 'var(--color-parchment-dim)',
                    border: '1px solid var(--color-border)',
                    fontSize: 11,
                  }}
                >
                  {colQuests.length}
                </span>
              </div>

              {/* Cards */}
              <div className="space-y-3">
                {colQuests.length === 0 ? (
                  <div
                    style={{
                      padding: '24px 12px',
                      textAlign: 'center',
                      border: '1px dashed var(--color-border)',
                      borderRadius: 6,
                    }}
                  >
                    <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>
                      No quests
                    </p>
                  </div>
                ) : (
                  colQuests.map((q) => <QuestCard key={q.id} quest={q} />)
                )}
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}
