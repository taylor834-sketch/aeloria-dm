'use client'

import { useEffect, useState, useRef } from 'react'
import Link from 'next/link'
import { supabase } from '@/lib/supabase'
import type { Quest, Session, CampaignState } from '@/types/database'
import { Play, MapPin, Calendar, ChevronRight, Check, X, Pencil } from 'lucide-react'

// ── Types ─────────────────────────────────────────────────────────────────────

interface StateField {
  key: string
  label: string
  value: string
  editing: boolean
  saving: boolean
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

function SectionLabel({ children }: { children: React.ReactNode }) {
  return (
    <p style={{
      fontSize: 10,
      fontWeight: 600,
      letterSpacing: '0.1em',
      color: 'var(--color-parchment-dim)',
      textTransform: 'uppercase',
      marginBottom: 10,
    }}>
      {children}
    </p>
  )
}

const TYPE_STYLES: Record<string, { bg: string; text: string; border: string }> = {
  main:     { bg: 'rgba(139,30,30,0.12)',   text: '#fca5a5', border: 'rgba(139,30,30,0.25)' },
  subplot:  { bg: 'rgba(130,42,138,0.12)',  text: '#d8b4fe', border: 'rgba(130,42,200,0.2)' },
  regional: { bg: 'rgba(42,62,138,0.15)',   text: '#a5b4fc', border: 'rgba(99,130,201,0.2)' },
  town:     { bg: 'rgba(74,58,40,0.2)',     text: 'var(--color-parchment-dim)', border: 'var(--color-border)' },
}

// ── Inline editable state field ───────────────────────────────────────────────

function EditableStateField({
  field,
  onSave,
}: {
  field: StateField
  onSave: (key: string, value: string) => Promise<void>
}) {
  const [editing, setEditing] = useState(false)
  const [draft, setDraft] = useState(field.value)
  const [saving, setSaving] = useState(false)
  const inputRef = useRef<HTMLInputElement>(null)

  function startEdit() {
    setDraft(field.value)
    setEditing(true)
    setTimeout(() => inputRef.current?.focus(), 0)
  }

  async function commit() {
    if (draft === field.value) { setEditing(false); return }
    setSaving(true)
    await onSave(field.key, draft)
    setSaving(false)
    setEditing(false)
  }

  function cancel() {
    setDraft(field.value)
    setEditing(false)
  }

  return (
    <div className="card" style={{ padding: '10px 14px', position: 'relative' }}>
      <p style={{ fontSize: 10, fontWeight: 600, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 4 }}>
        {field.label}
      </p>
      {editing ? (
        <div className="flex items-center gap-2">
          <input
            ref={inputRef}
            value={draft}
            onChange={(e) => setDraft(e.target.value)}
            onKeyDown={(e) => { if (e.key === 'Enter') commit(); if (e.key === 'Escape') cancel() }}
            style={{
              flex: 1,
              background: 'var(--color-surface-raised)',
              border: '1px solid var(--color-border-bright)',
              borderRadius: 4,
              padding: '4px 8px',
              color: 'var(--color-parchment)',
              fontSize: 13,
              outline: 'none',
              fontFamily: 'var(--font-body)',
            }}
          />
          <button onClick={commit} disabled={saving}
            style={{ color: '#4ade80', background: 'none', border: 'none', cursor: 'pointer', padding: 2 }}>
            {saving ? <div className="w-3 h-3 rounded-full border animate-spin" style={{ borderColor: 'var(--color-border)', borderTopColor: 'var(--color-gold)' }} /> : <Check size={14} />}
          </button>
          <button onClick={cancel}
            style={{ color: 'var(--color-parchment-dim)', background: 'none', border: 'none', cursor: 'pointer', padding: 2 }}>
            <X size={14} />
          </button>
        </div>
      ) : (
        <div className="flex items-center gap-2 group">
          <span style={{ fontSize: 14, color: field.value ? 'var(--color-parchment)' : 'var(--color-parchment-dim)', fontStyle: field.value ? 'normal' : 'italic', flex: 1 }}>
            {field.value || 'Not set'}
          </span>
          <button onClick={startEdit}
            style={{ color: 'var(--color-parchment-dim)', background: 'none', border: 'none', cursor: 'pointer', padding: 2, opacity: 0.6 }}
            title="Edit">
            <Pencil size={12} />
          </button>
        </div>
      )}
    </div>
  )
}

// ── Main page ─────────────────────────────────────────────────────────────────

export default function RunSessionPage() {
  const [loading, setLoading] = useState(true)
  const [activeQuests, setActiveQuests] = useState<Quest[]>([])
  const [availableQuests, setAvailableQuests] = useState<Quest[]>([])
  const [lastSession, setLastSession] = useState<Session | null>(null)
  const [stateFields, setStateFields] = useState<StateField[]>([
    { key: 'party_location', label: 'Party Location', value: '', editing: false, saving: false },
    { key: 'party_level',    label: 'Party Level',    value: '', editing: false, saving: false },
    { key: 'in_game_date',   label: 'In-Game Date',   value: '', editing: false, saving: false },
    { key: 'active_quest_slug', label: 'Active Quest Slug', value: '', editing: false, saving: false },
  ])

  useEffect(() => {
    async function load() {
      const [questsRes, sessionRes, stateRes] = await Promise.all([
        supabase.from('quests').select('*').in('status', ['active', 'available']).order('created_at', { ascending: false }),
        supabase.from('sessions').select('*').order('session_number', { ascending: false }).limit(1),
        supabase.from('campaign_state').select('*'),
      ])

      const allQuests = questsRes.data ?? []
      setActiveQuests(allQuests.filter((q) => q.status === 'active'))
      setAvailableQuests(allQuests.filter((q) => q.status === 'available'))
      setLastSession((sessionRes.data ?? [])[0] ?? null)

      const stateRows: CampaignState[] = stateRes.data ?? []
      setStateFields((prev) =>
        prev.map((f) => {
          const row = stateRows.find((r) => r.key === f.key)
          return { ...f, value: row?.value ?? '' }
        })
      )

      setLoading(false)
    }
    load()
  }, [])

  async function saveStateField(key: string, value: string) {
    await supabase.from('campaign_state').upsert(
      { key, value, updated_at: new Date().toISOString() },
      { onConflict: 'key' }
    )
    setStateFields((prev) =>
      prev.map((f) => (f.key === key ? { ...f, value } : f))
    )
  }

  if (loading) return <Spinner />

  const typeStyle = (type: string) => TYPE_STYLES[type] ?? TYPE_STYLES.town

  const sessionDate = lastSession?.played_at
    ? (() => {
        try {
          return new Date(lastSession.played_at).toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' })
        } catch { return lastSession.played_at }
      })()
    : null

  return (
    <div style={{ maxWidth: 1100 }}>
      {/* Header */}
      <div className="mb-8">
        <div className="flex items-center gap-3 mb-1">
          <div style={{
            width: 32, height: 32,
            background: 'rgba(201,160,68,0.12)',
            border: '1px solid rgba(201,160,68,0.25)',
            borderRadius: 6,
            display: 'flex', alignItems: 'center', justifyContent: 'center',
            color: 'var(--color-gold)',
          }}>
            <Play size={15} />
          </div>
          <h1 className="font-display" style={{ fontSize: 26, fontWeight: 600, color: 'var(--color-gold-light)' }}>
            Run Session
          </h1>
        </div>
        <p style={{ color: 'var(--color-parchment-dim)', fontSize: 13, paddingLeft: 44 }}>
          DM screen — open this before your session starts
        </p>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: '320px 1fr', gap: 28, alignItems: 'start' }}>

        {/* ── Left: Campaign State ── */}
        <div>
          <SectionLabel>Campaign State</SectionLabel>
          <div className="flex flex-col gap-2 mb-6">
            {stateFields.map((field) => (
              <EditableStateField key={field.key} field={field} onSave={saveStateField} />
            ))}
          </div>

          {/* Last Session Summary */}
          {lastSession && (
            <div>
              <SectionLabel>Last Session</SectionLabel>
              <div className="card" style={{ padding: '14px 16px' }}>
                <div className="flex items-start justify-between gap-2 mb-2">
                  <span className="font-display" style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment)' }}>
                    Session {lastSession.session_number}
                    {lastSession.title ? `: ${lastSession.title}` : ''}
                  </span>
                  {sessionDate && (
                    <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)', flexShrink: 0 }}>
                      <Calendar size={10} style={{ display: 'inline', verticalAlign: 'middle', marginRight: 3 }} />
                      {sessionDate}
                    </span>
                  )}
                </div>
                {lastSession.summary ? (
                  <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.7 }}>
                    {lastSession.summary}
                  </p>
                ) : (
                  <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>
                    No summary recorded.
                  </p>
                )}
              </div>
            </div>
          )}
        </div>

        {/* ── Right: Quests ── */}
        <div>
          {/* Active Quests */}
          <SectionLabel>Active Quests — Open for Session</SectionLabel>
          {activeQuests.length === 0 ? (
            <div className="card" style={{ padding: '20px 16px', textAlign: 'center', marginBottom: 24 }}>
              <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>No active quests.</p>
            </div>
          ) : (
            <div className="flex flex-col gap-3 mb-8">
              {activeQuests.map((q) => {
                const ts = typeStyle(q.quest_type)
                return (
                  <div key={q.id} className="card" style={{ padding: '16px 18px', borderLeft: '3px solid rgba(201,160,68,0.4)' }}>
                    <div className="flex items-start justify-between gap-3 mb-2">
                      <div style={{ flex: 1 }}>
                        <div className="flex items-center gap-2 mb-1 flex-wrap">
                          <span className="font-display" style={{ fontSize: 15, fontWeight: 600, color: 'var(--color-parchment)' }}>
                            {q.title}
                          </span>
                          <span className="badge" style={{ background: ts.bg, color: ts.text, border: `1px solid ${ts.border}`, fontSize: 10 }}>
                            {q.quest_type}
                          </span>
                        </div>
                        {q.region && (
                          <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginBottom: 6 }}>
                            <MapPin size={10} style={{ display: 'inline', verticalAlign: 'middle', marginRight: 3 }} />
                            {q.region}
                          </p>
                        )}
                        {q.description && (
                          <p style={{
                            fontSize: 12,
                            color: 'var(--color-parchment-mid)',
                            lineHeight: 1.6,
                            display: '-webkit-box',
                            WebkitLineClamp: 2,
                            WebkitBoxOrient: 'vertical',
                            overflow: 'hidden',
                          }}>
                            {q.description}
                          </p>
                        )}
                      </div>
                      <Link href={`/dm/run/${q.slug}`}
                        style={{
                          display: 'flex', alignItems: 'center', gap: 6,
                          padding: '7px 14px',
                          borderRadius: 5,
                          background: 'rgba(201,160,68,0.12)',
                          border: '1px solid rgba(201,160,68,0.3)',
                          color: 'var(--color-gold-light)',
                          fontSize: 12, fontWeight: 600,
                          textDecoration: 'none',
                          flexShrink: 0,
                          fontFamily: 'var(--font-display)',
                          letterSpacing: '0.05em',
                          whiteSpace: 'nowrap',
                          transition: 'background 0.15s',
                        }}>
                        <Play size={12} />
                        Open for Session
                      </Link>
                    </div>
                    {q.dm_notes && (
                      <div style={{ marginTop: 8, paddingTop: 8, borderTop: '1px solid var(--color-border)' }}>
                        <p style={{ fontSize: 11, color: '#fca5a5', lineHeight: 1.6 }}>{q.dm_notes}</p>
                      </div>
                    )}
                  </div>
                )
              })}
            </div>
          )}

          {/* Available Quests */}
          {availableQuests.length > 0 && (
            <div>
              <SectionLabel>Available — Could Run Tonight</SectionLabel>
              <div className="flex flex-col gap-2">
                {availableQuests.map((q) => {
                  const ts = typeStyle(q.quest_type)
                  return (
                    <div key={q.id} className="card" style={{ padding: '10px 14px', display: 'flex', alignItems: 'center', gap: 12, opacity: 0.85 }}>
                      <div style={{ flex: 1, minWidth: 0 }}>
                        <div className="flex items-center gap-2 flex-wrap">
                          <span className="font-display" style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment)' }}>
                            {q.title}
                          </span>
                          <span className="badge" style={{ background: ts.bg, color: ts.text, border: `1px solid ${ts.border}`, fontSize: 10 }}>
                            {q.quest_type}
                          </span>
                        </div>
                        {q.region && (
                          <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginTop: 2 }}>
                            {q.region}
                          </p>
                        )}
                      </div>
                      <Link href={`/dm/run/${q.slug}`}
                        style={{
                          display: 'flex', alignItems: 'center', gap: 5,
                          padding: '5px 10px',
                          borderRadius: 4,
                          background: 'rgba(74,58,40,0.3)',
                          border: '1px solid var(--color-border-bright)',
                          color: 'var(--color-parchment-mid)',
                          fontSize: 11,
                          textDecoration: 'none',
                          flexShrink: 0,
                          fontFamily: 'var(--font-display)',
                          letterSpacing: '0.04em',
                          whiteSpace: 'nowrap',
                        }}>
                        <ChevronRight size={11} />
                        Run this
                      </Link>
                    </div>
                  )
                })}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
