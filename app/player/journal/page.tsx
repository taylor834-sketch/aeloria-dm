'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import { BookOpen, CheckCircle2, Clock } from 'lucide-react'
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

// ── Roman numerals ────────────────────────────────────────────────────────

function toRoman(n: number): string {
  const vals: [number, string][] = [
    [1000, 'M'], [900, 'CM'], [500, 'D'], [400, 'CD'],
    [100, 'C'],  [90, 'XC'],  [50, 'L'],  [40, 'XL'],
    [10, 'X'],   [9, 'IX'],   [5, 'V'],   [4, 'IV'],
    [1, 'I'],
  ]
  let result = ''
  let remaining = n
  for (const [value, numeral] of vals) {
    while (remaining >= value) {
      result += numeral
      remaining -= value
    }
  }
  return result
}

function formatDate(dateStr: string) {
  return new Date(dateStr).toLocaleDateString('en-US', {
    weekday: 'long',
    year: 'numeric',
    month: 'long',
    day: 'numeric',
  })
}

// ── Journal Entry ─────────────────────────────────────────────────────────

function JournalEntry({ session }: { session: Session }) {
  return (
    <article
      style={{
        background: 'var(--color-surface)',
        border: '1px solid var(--color-border)',
        borderRadius: 8,
        overflow: 'hidden',
        position: 'relative',
      }}
    >
      {/* Warm inner accent bar */}
      <div
        style={{
          height: 2,
          background: 'linear-gradient(90deg, var(--color-gold-dim) 0%, transparent 100%)',
          opacity: 0.6,
        }}
      />

      {/* Inner warm background */}
      <div
        style={{
          background: 'linear-gradient(160deg, rgba(201,160,68,0.03) 0%, transparent 60%)',
          padding: '24px 28px',
        }}
      >
        {/* Chapter heading */}
        <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: 16, marginBottom: 12 }}>
          <div>
            <div style={{ display: 'flex', alignItems: 'baseline', gap: 12, marginBottom: 4 }}>
              <span
                className="font-display"
                style={{
                  fontSize: 11,
                  fontWeight: 600,
                  letterSpacing: '0.16em',
                  color: 'var(--color-gold-dim)',
                  textTransform: 'uppercase',
                }}
              >
                Session {toRoman(session.session_number)}
              </span>
            </div>
            <h2
              className="font-display"
              style={{
                fontSize: 20,
                color: 'var(--color-parchment)',
                fontWeight: 600,
                lineHeight: 1.3,
                letterSpacing: '0.03em',
              }}
            >
              {session.title ?? `The ${toRoman(session.session_number)} Chapter`}
            </h2>
          </div>
          <div style={{ textAlign: 'right', flexShrink: 0 }}>
            <div
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: 5,
                justifyContent: 'flex-end',
                marginBottom: 4,
              }}
            >
              {session.processed ? (
                <CheckCircle2 size={11} style={{ color: 'var(--color-emerald-bright)' }} />
              ) : (
                <Clock size={11} style={{ color: 'var(--color-parchment-dim)' }} />
              )}
              <span
                style={{
                  fontSize: 10,
                  color: session.processed ? 'var(--color-emerald-bright)' : 'var(--color-parchment-dim)',
                }}
              >
                {session.processed ? 'Chronicled' : 'Awaiting chronicle'}
              </span>
            </div>
            <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
              {formatDate(session.played_at)}
            </p>
          </div>
        </div>

        <hr className="rule-gold" style={{ marginBottom: 16, opacity: 0.25 }} />

        {/* Summary */}
        {session.summary ? (
          <p
            style={{
              fontSize: 14,
              color: 'var(--color-parchment-mid)',
              lineHeight: 1.8,
              fontStyle: 'italic',
            }}
          >
            {session.summary}
          </p>
        ) : (
          <p
            style={{
              fontSize: 13,
              color: 'var(--color-parchment-dim)',
              fontStyle: 'italic',
              textAlign: 'center',
              padding: '12px 0',
            }}
          >
            The chronicler's quill has not yet set this session to parchment.
          </p>
        )}
      </div>
    </article>
  )
}

// ── Page ──────────────────────────────────────────────────────────────────

export default function JournalPage() {
  const router = useRouter()
  const [sessions, setSessions] = useState<Session[]>([])
  const [loading, setLoading]   = useState(true)

  useEffect(() => {
    const playerId = typeof window !== 'undefined' ? localStorage.getItem('selectedPlayerId') : null
    if (!playerId) { router.push('/player'); return }

    supabase
      .from('sessions')
      .select('*')
      .order('session_number', { ascending: false })
      .then(({ data }) => {
        setSessions(data ?? [])
        setLoading(false)
      })
  }, [router])

  if (loading) return <Spinner />

  return (
    <div style={{ maxWidth: 760, margin: '0 auto', padding: '32px 24px' }}>

      {/* Header */}
      <div style={{ marginBottom: 32 }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 10 }}>
          <BookOpen size={18} style={{ color: 'var(--color-gold)' }} />
          <h1
            className="font-display"
            style={{ fontSize: 26, color: 'var(--color-gold-light)', letterSpacing: '0.06em' }}
          >
            The Chronicle of Aeloria
          </h1>
        </div>
        <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>
          A record of deeds, discoveries, and the unfolding fate of the world.
        </p>
      </div>

      <hr className="rule-gold" style={{ marginBottom: 32 }} />

      {/* Sessions */}
      {sessions.length === 0 ? (
        <div style={{ textAlign: 'center', padding: '64px 0' }}>
          <p style={{ color: 'var(--color-parchment-dim)', fontStyle: 'italic', fontSize: 15 }}>
            The chronicle is empty. Your story has not yet begun.
          </p>
        </div>
      ) : (
        <div style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
          {sessions.map((session) => (
            <JournalEntry key={session.id} session={session} />
          ))}
        </div>
      )}

    </div>
  )
}
