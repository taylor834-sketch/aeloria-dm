'use client'

import { useEffect, useState, useMemo } from 'react'
import { supabase } from '@/lib/supabase'
import type { CampaignState } from '@/types/database'

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

function severityColor(s: number): string {
  if (s >= 5) return '#ef4444'
  if (s >= 4) return '#f87171'
  if (s >= 3) return '#fb923c'
  if (s >= 2) return 'var(--color-gold)'
  if (s >= 1) return 'var(--color-gold-dim)'
  return '#4b5563'
}

function severityLabel(s: number): string {
  if (s >= 5) return 'Critical'
  if (s >= 4) return 'Severe'
  if (s >= 3) return 'Elevated'
  if (s >= 2) return 'Moderate'
  if (s >= 1) return 'Low'
  return 'Dormant'
}

function ThreatBar({ severity, max = 5 }: { severity: number; max?: number }) {
  const pct = (severity / max) * 100
  const color = severityColor(severity)
  return (
    <div style={{ height: 6, background: 'var(--color-border)', borderRadius: 999, overflow: 'hidden' }}>
      <div
        style={{
          height: '100%',
          borderRadius: 999,
          width: `${pct}%`,
          background: color,
          transition: 'width 0.4s',
        }}
      />
    </div>
  )
}

function StateCard({ item }: { item: CampaignState }) {
  const color = severityColor(item.severity)
  const label = severityLabel(item.severity)
  return (
    <div
      className="card"
      style={{
        padding: '12px 16px',
        borderLeft: `3px solid ${color}`,
        borderRadius: '0 6px 6px 0',
      }}
    >
      <div className="flex items-start justify-between gap-3 mb-2">
        <div style={{ flex: 1 }}>
          <p
            className="font-display"
            style={{ fontSize: 13, fontWeight: 500, color: 'var(--color-parchment)', marginBottom: 2 }}
          >
            {item.label ?? item.key}
          </p>
          {item.value && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.5 }}>
              {item.value}
            </p>
          )}
        </div>
        <div style={{ textAlign: 'right', flexShrink: 0 }}>
          <span
            style={{ fontSize: 12, fontWeight: 600, color }}
          >
            {item.severity}/5
          </span>
          <p style={{ fontSize: 10, color: 'var(--color-parchment-dim)', marginTop: 1 }}>
            {label}
          </p>
        </div>
      </div>
      <ThreatBar severity={item.severity} />
    </div>
  )
}

export default function WorldPage() {
  const [states, setStates] = useState<CampaignState[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    supabase
      .from('campaign_state')
      .select('*')
      .order('severity', { ascending: false })
      .then(({ data }) => {
        setStates(data ?? [])
        setLoading(false)
      })
  }, [])

  const grouped = useMemo(() => {
    const g: Record<string, CampaignState[]> = {}
    for (const s of states) {
      const cat = s.category ?? 'General'
      if (!g[cat]) g[cat] = []
      g[cat].push(s)
    }
    return g
  }, [states])

  const avgSeverity = useMemo(() => {
    if (!states.length) return 0
    return states.reduce((sum, s) => sum + s.severity, 0) / states.length
  }, [states])

  const maxSeverity = useMemo(() => {
    if (!states.length) return 0
    return Math.max(...states.map((s) => s.severity))
  }, [states])

  if (loading) return <Spinner />

  return (
    <div style={{ maxWidth: 900 }}>
      {/* Header */}
      <div className="mb-8">
        <h1
          className="font-display"
          style={{ fontSize: 26, fontWeight: 600, color: 'var(--color-gold-light)', marginBottom: 4 }}
        >
          World State
        </h1>
        <p style={{ color: 'var(--color-parchment-dim)', fontSize: 13 }}>
          Campaign clock indicators and threat levels
        </p>
      </div>

      {/* World Tension summary bar */}
      <div
        className="card"
        style={{ padding: '18px 20px', marginBottom: 28 }}
      >
        <div className="flex items-start justify-between gap-4 mb-4">
          <div>
            <p
              className="font-display"
              style={{ fontSize: 16, fontWeight: 600, color: 'var(--color-parchment)', marginBottom: 3 }}
            >
              World Tension
            </p>
            <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)' }}>
              Average severity across {states.length} indicators
            </p>
          </div>
          <div style={{ textAlign: 'right' }}>
            <p
              className="font-display"
              style={{ fontSize: 28, fontWeight: 700, color: severityColor(avgSeverity), lineHeight: 1 }}
            >
              {avgSeverity.toFixed(1)}
            </p>
            <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
              {severityLabel(Math.round(avgSeverity))}
            </p>
          </div>
        </div>
        <ThreatBar severity={avgSeverity} />
        <div
          className="flex items-center justify-between mt-2"
          style={{ fontSize: 10, color: 'var(--color-parchment-dim)' }}
        >
          <span>Dormant</span>
          <span>Moderate</span>
          <span>Critical</span>
        </div>

        {/* Summary stats */}
        <div
          style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(3, 1fr)',
            gap: 12,
            marginTop: 16,
            paddingTop: 14,
            borderTop: '1px solid var(--color-border)',
          }}
        >
          <div style={{ textAlign: 'center' }}>
            <p className="font-display" style={{ fontSize: 20, fontWeight: 700, color: severityColor(maxSeverity) }}>
              {maxSeverity}
            </p>
            <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>Peak Threat</p>
          </div>
          <div style={{ textAlign: 'center' }}>
            <p className="font-display" style={{ fontSize: 20, fontWeight: 700, color: 'var(--color-parchment)' }}>
              {states.filter((s) => s.severity >= 4).length}
            </p>
            <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>High Severity</p>
          </div>
          <div style={{ textAlign: 'center' }}>
            <p className="font-display" style={{ fontSize: 20, fontWeight: 700, color: 'var(--color-parchment)' }}>
              {Object.keys(grouped).length}
            </p>
            <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>Categories</p>
          </div>
        </div>
      </div>

      {/* Grouped indicators */}
      {Object.keys(grouped).length === 0 ? (
        <div className="text-center py-16" style={{ color: 'var(--color-parchment-dim)' }}>
          <p className="font-display text-sm">No campaign state data</p>
          <p style={{ fontSize: 12, marginTop: 6 }}>
            Add rows to the campaign_state table in Supabase to track world events.
          </p>
        </div>
      ) : (
        <div className="space-y-8">
          {Object.entries(grouped)
            .sort(([, a], [, b]) => {
              const aMax = Math.max(...a.map((s) => s.severity))
              const bMax = Math.max(...b.map((s) => s.severity))
              return bMax - aMax
            })
            .map(([category, items]) => {
              const catMax = Math.max(...items.map((s) => s.severity))
              return (
                <div key={category}>
                  <div
                    className="flex items-center gap-3 mb-3"
                    style={{ borderBottom: `1px solid ${severityColor(catMax)}40`, paddingBottom: 8 }}
                  >
                    <h2
                      className="font-display"
                      style={{
                        fontSize: 13,
                        fontWeight: 600,
                        color: severityColor(catMax),
                        textTransform: 'uppercase',
                        letterSpacing: '0.1em',
                      }}
                    >
                      {category}
                    </h2>
                    <span
                      className="badge"
                      style={{
                        background: 'var(--color-surface-raised)',
                        color: 'var(--color-parchment-dim)',
                        border: '1px solid var(--color-border)',
                        fontSize: 10,
                      }}
                    >
                      {items.length} indicators
                    </span>
                    <span style={{ fontSize: 11, color: severityColor(catMax), marginLeft: 'auto' }}>
                      Peak: {catMax}/5 · {severityLabel(catMax)}
                    </span>
                  </div>
                  <div className="space-y-2">
                    {items.map((item) => (
                      <StateCard key={item.id} item={item} />
                    ))}
                  </div>
                </div>
              )
            })}
        </div>
      )}
    </div>
  )
}
