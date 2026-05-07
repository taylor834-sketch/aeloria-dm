'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'
import type { Session } from '@/types/database'

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

interface ProcessResult {
  summary?: string
  changes?: {
    locations?: string[]
    relationships?: { npc: string; player: string; delta: number; summary: string }[]
    quests?: { title: string; update: string }[]
    factions?: { faction: string; delta: number }[]
    discoveries?: string[]
  }
  error?: string
}

export default function SessionsPage() {
  const [sessions, setSessions] = useState<Session[]>([])
  const [loading, setLoading] = useState(true)

  // Upload form state
  const [sessionNumber, setSessionNumber] = useState('')
  const [title, setTitle] = useState('')
  const [transcript, setTranscript] = useState('')
  const [playedAt, setPlayedAt] = useState(new Date().toISOString().split('T')[0])
  const [saving, setSaving] = useState(false)
  const [processing, setProcessing] = useState(false)
  const [result, setResult] = useState<ProcessResult | null>(null)
  const [saveError, setSaveError] = useState<string | null>(null)

  async function loadSessions() {
    const { data } = await supabase
      .from('sessions')
      .select('*')
      .order('session_number', { ascending: false })
    setSessions(data ?? [])
  }

  useEffect(() => {
    loadSessions().then(() => setLoading(false))
  }, [])

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!sessionNumber || !transcript.trim()) return

    setSaving(true)
    setSaveError(null)
    setResult(null)

    // 1. Save session
    const saveRes = await fetch('/api/sessions', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        session_number: parseInt(sessionNumber),
        title: title || null,
        played_at: playedAt,
        raw_transcript: transcript,
      }),
    })

    const saveData = await saveRes.json()
    if (!saveRes.ok || saveData.error) {
      setSaveError(saveData.error ?? 'Failed to save session')
      setSaving(false)
      return
    }

    setSaving(false)
    setProcessing(true)

    // 2. Process with Claude
    const processRes = await fetch('/api/process-session', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ sessionId: saveData.sessionId }),
    })

    const processData = await processRes.json()
    setProcessing(false)

    if (!processRes.ok || processData.error) {
      setResult({ error: processData.error ?? 'Processing failed' })
    } else {
      setResult({ summary: processData.summary, changes: processData.changes })
      // Reset form
      setSessionNumber('')
      setTitle('')
      setTranscript('')
      // Reload sessions
      loadSessions()
    }
  }

  const inputStyle: React.CSSProperties = {
    width: '100%',
    background: 'var(--color-surface)',
    border: '1px solid var(--color-border)',
    borderRadius: 5,
    padding: '8px 12px',
    color: 'var(--color-parchment)',
    fontSize: 13,
    outline: 'none',
    fontFamily: 'var(--font-body)',
  }

  const labelStyle: React.CSSProperties = {
    display: 'block',
    fontSize: 11,
    fontWeight: 600,
    color: 'var(--color-parchment-dim)',
    textTransform: 'uppercase',
    letterSpacing: '0.08em',
    marginBottom: 5,
  }

  return (
    <div style={{ maxWidth: 1100 }}>
      {/* Header */}
      <div className="mb-6">
        <h1
          className="font-display"
          style={{ fontSize: 26, fontWeight: 600, color: 'var(--color-gold-light)', marginBottom: 4 }}
        >
          Sessions
        </h1>
        <p style={{ color: 'var(--color-parchment-dim)', fontSize: 13 }}>
          Session log and transcript upload
        </p>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: '60% 40%', gap: 24 }}>
        {/* ── Left: Session list ── */}
        <div>
          <h2
            className="font-display mb-4"
            style={{ fontSize: 14, fontWeight: 600, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em' }}
          >
            Session Log
          </h2>

          {loading ? (
            <Spinner />
          ) : sessions.length === 0 ? (
            <div className="text-center py-16" style={{ color: 'var(--color-parchment-dim)' }}>
              <p className="font-display text-sm">No sessions recorded yet</p>
              <p style={{ fontSize: 12, marginTop: 6 }}>Upload your first transcript to get started.</p>
            </div>
          ) : (
            <div className="space-y-3">
              {sessions.map((s) => (
                <SessionCard key={s.id} session={s} />
              ))}
            </div>
          )}
        </div>

        {/* ── Right: Upload form ── */}
        <div>
          <h2
            className="font-display mb-4"
            style={{ fontSize: 14, fontWeight: 600, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em' }}
          >
            Upload Transcript
          </h2>

          <form onSubmit={handleSubmit} className="space-y-4">
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12 }}>
              <div>
                <label style={labelStyle}>Session #</label>
                <input
                  type="number"
                  min={1}
                  value={sessionNumber}
                  onChange={(e) => setSessionNumber(e.target.value)}
                  placeholder="e.g. 14"
                  required
                  style={inputStyle}
                />
              </div>
              <div>
                <label style={labelStyle}>Date Played</label>
                <input
                  type="date"
                  value={playedAt}
                  onChange={(e) => setPlayedAt(e.target.value)}
                  required
                  style={inputStyle}
                />
              </div>
            </div>

            <div>
              <label style={labelStyle}>Title (optional)</label>
              <input
                type="text"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="e.g. The Fall of Brightwater"
                style={inputStyle}
              />
            </div>

            <div>
              <label style={labelStyle}>Session Transcript</label>
              <textarea
                value={transcript}
                onChange={(e) => setTranscript(e.target.value)}
                placeholder="Paste your session transcript here…"
                required
                rows={14}
                style={{
                  ...inputStyle,
                  resize: 'vertical',
                  lineHeight: 1.6,
                  background: '#1c1a14',
                  color: 'var(--color-parchment)',
                  borderColor: 'var(--color-border-bright)',
                  fontFamily: 'monospace',
                  fontSize: 12,
                }}
              />
            </div>

            <button
              type="submit"
              disabled={saving || processing || !sessionNumber || !transcript.trim()}
              style={{
                width: '100%',
                padding: '10px 16px',
                borderRadius: 5,
                fontSize: 13,
                fontWeight: 600,
                cursor: saving || processing ? 'not-allowed' : 'pointer',
                background: saving || processing ? 'rgba(201,160,68,0.08)' : 'rgba(201,160,68,0.12)',
                border: '1px solid var(--color-gold-dim)',
                color: saving || processing ? 'var(--color-gold-dim)' : 'var(--color-gold-light)',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                gap: 8,
                transition: 'all 0.15s',
                fontFamily: 'var(--font-display)',
                letterSpacing: '0.06em',
              }}
            >
              {saving ? (
                <>
                  <div
                    className="w-4 h-4 rounded-full border-2 animate-spin"
                    style={{ borderColor: 'var(--color-gold-dim)', borderTopColor: 'var(--color-gold)' }}
                  />
                  Saving…
                </>
              ) : processing ? (
                <>
                  <div
                    className="w-4 h-4 rounded-full border-2 animate-spin"
                    style={{ borderColor: 'var(--color-gold-dim)', borderTopColor: 'var(--color-gold)' }}
                  />
                  Processing with Claude…
                </>
              ) : (
                'Save & Process with Claude'
              )}
            </button>
          </form>

          {/* Save error */}
          {saveError && (
            <div
              style={{
                marginTop: 12,
                padding: '10px 12px',
                borderRadius: 5,
                background: 'rgba(139,30,30,0.12)',
                border: '1px solid rgba(139,30,30,0.3)',
              }}
            >
              <p style={{ fontSize: 12, color: '#f87171' }}>Error: {saveError}</p>
            </div>
          )}

          {/* Processing results */}
          {result && (
            <div
              style={{
                marginTop: 16,
                padding: '14px 16px',
                borderRadius: 6,
                background: result.error
                  ? 'rgba(139,30,30,0.08)'
                  : 'rgba(42,138,72,0.08)',
                border: result.error
                  ? '1px solid rgba(139,30,30,0.3)'
                  : '1px solid rgba(42,138,72,0.25)',
              }}
            >
              {result.error ? (
                <p style={{ fontSize: 13, color: '#f87171' }}>Processing error: {result.error}</p>
              ) : (
                <div>
                  <p
                    style={{ fontSize: 11, fontWeight: 600, color: '#4ade80', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 8 }}
                  >
                    Session Processed
                  </p>
                  {result.summary && (
                    <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.6, marginBottom: 10 }}>
                      {result.summary}
                    </p>
                  )}
                  {result.changes && (
                    <div className="space-y-2">
                      {(result.changes.quests ?? []).length > 0 && (
                        <div>
                          <p style={{ fontSize: 11, color: '#4ade80', marginBottom: 3 }}>
                            Quests updated: {result.changes.quests!.map((q) => `${q.title} → ${q.update}`).join(', ')}
                          </p>
                        </div>
                      )}
                      {(result.changes.relationships ?? []).length > 0 && (
                        <p style={{ fontSize: 11, color: '#86efac' }}>
                          {result.changes.relationships!.length} relationship changes recorded
                        </p>
                      )}
                      {(result.changes.locations ?? []).length > 0 && (
                        <p style={{ fontSize: 11, color: 'var(--color-parchment-mid)' }}>
                          Locations visited: {result.changes.locations!.join(', ')}
                        </p>
                      )}
                    </div>
                  )}
                </div>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

function SessionCard({ session }: { session: Session }) {
  const [expanded, setExpanded] = useState(false)

  const dateStr = (() => {
    try {
      return new Date(session.played_at).toLocaleDateString('en-US', {
        year: 'numeric', month: 'short', day: 'numeric',
      })
    } catch {
      return session.played_at
    }
  })()

  return (
    <div className="card card-hover" style={{ overflow: 'hidden' }}>
      <button
        onClick={() => setExpanded(!expanded)}
        className="w-full text-left"
        style={{ padding: '12px 16px', display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: 12 }}
      >
        <div style={{ flex: 1 }}>
          <div className="flex items-center gap-2 mb-1">
            <span
              className="font-display"
              style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment)' }}
            >
              Session {session.session_number}
              {session.title ? `: ${session.title}` : ''}
            </span>
            <span
              className={`badge ${session.processed ? 'badge-completed' : 'badge-available'}`}
            >
              {session.processed ? 'Processed' : 'Pending'}
            </span>
          </div>
          <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>{dateStr}</p>
          {session.summary && !expanded && (
            <p
              style={{
                fontSize: 12,
                color: 'var(--color-parchment-mid)',
                marginTop: 6,
                lineHeight: 1.5,
                display: '-webkit-box',
                WebkitLineClamp: 2,
                WebkitBoxOrient: 'vertical',
                overflow: 'hidden',
              }}
            >
              {session.summary}
            </p>
          )}
        </div>
        <span style={{ color: 'var(--color-parchment-dim)', fontSize: 12, marginTop: 2, flexShrink: 0 }}>
          {expanded ? '▲' : '▼'}
        </span>
      </button>

      {expanded && session.summary && (
        <div
          style={{
            padding: '0 16px 14px',
            borderTop: '1px solid var(--color-border)',
            paddingTop: 12,
          }}
        >
          <p style={{ fontSize: 13, color: 'var(--color-parchment-mid)', lineHeight: 1.7 }}>
            {session.summary}
          </p>
        </div>
      )}
    </div>
  )
}
