'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'
import type { CampaignState, Quest, Session, NPC } from '@/types/database'

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

function severityBarColor(s: number): string {
  if (s >= 5) return '#ef4444'
  if (s >= 4) return '#f87171'
  if (s >= 3) return '#fb923c'
  if (s >= 2) return 'var(--color-gold)'
  return '#6b7280'
}

function StatCard({ label, value }: { label: string; value: number | string }) {
  return (
    <div
      className="card flex flex-col gap-1 px-5 py-4"
      style={{ minWidth: 120 }}
    >
      <span
        className="font-display"
        style={{ fontSize: 28, fontWeight: 600, color: 'var(--color-gold-light)', lineHeight: 1 }}
      >
        {value}
      </span>
      <span style={{ fontSize: 12, color: 'var(--color-parchment-dim)', letterSpacing: '0.04em' }}>
        {label}
      </span>
    </div>
  )
}

export default function DmDashboard() {
  const [loading, setLoading] = useState(true)
  const [campaignState, setCampaignState] = useState<CampaignState[]>([])
  const [activeQuests, setActiveQuests] = useState<Quest[]>([])
  const [recentSessions, setRecentSessions] = useState<Session[]>([])
  const [npcCount, setNpcCount] = useState(0)
  const [locationCount, setLocationCount] = useState(0)
  const [sessionCount, setSessionCount] = useState(0)

  useEffect(() => {
    async function load() {
      const [stateRes, questRes, sessionRes, npcRes, locRes] = await Promise.all([
        supabase.from('campaign_state').select('*').order('severity', { ascending: false }),
        supabase.from('quests').select('*').eq('status', 'active').order('created_at', { ascending: false }),
        supabase.from('sessions').select('*').order('session_number', { ascending: false }).limit(5),
        supabase.from('npcs').select('id', { count: 'exact', head: true }),
        supabase.from('locations').select('id', { count: 'exact', head: true }),
      ])
      const allSessions = await supabase.from('sessions').select('id', { count: 'exact', head: true })

      setCampaignState(stateRes.data ?? [])
      setActiveQuests(questRes.data ?? [])
      setRecentSessions(sessionRes.data ?? [])
      setNpcCount(npcRes.count ?? 0)
      setLocationCount(locRes.count ?? 0)
      setSessionCount(allSessions.count ?? 0)
      setLoading(false)
    }
    load()
  }, [])

  if (loading) return <Spinner />

  // Group campaign_state by category
  const grouped: Record<string, CampaignState[]> = {}
  for (const cs of campaignState) {
    const cat = cs.category ?? 'General'
    if (!grouped[cat]) grouped[cat] = []
    grouped[cat].push(cs)
  }

  const avgSeverity =
    campaignState.length > 0
      ? campaignState.reduce((sum, cs) => sum + cs.severity, 0) / campaignState.length
      : 0

  const questTypeBadge = (type: string) => {
    const cls =
      type === 'main'     ? 'badge badge-main' :
      type === 'faction'  ? 'badge badge-faction' :
      type === 'personal' ? 'badge badge-personal' :
      'badge badge-side'
    return <span className={cls}>{type}</span>
  }

  return (
    <div style={{ maxWidth: 1100 }}>
      {/* Header */}
      <div className="mb-8">
        <h1
          className="font-display"
          style={{ fontSize: 28, fontWeight: 600, color: 'var(--color-gold-light)', marginBottom: 4 }}
        >
          Campaign Dashboard
        </h1>
        <p style={{ color: 'var(--color-parchment-mid)', fontSize: 14 }}>
          CR 847 — Age of Cracked Crowns
        </p>
      </div>

      {/* Quick Stats */}
      <div className="flex gap-4 mb-8 flex-wrap">
        <StatCard label="NPCs" value={npcCount} />
        <StatCard label="Locations" value={locationCount} />
        <StatCard label="Active Quests" value={activeQuests.length} />
        <StatCard label="Sessions" value={sessionCount} />
        <div
          className="card flex flex-col gap-1 px-5 py-4"
          style={{ minWidth: 160, flex: 1 }}
        >
          <div className="flex items-center gap-2 mb-1">
            <span style={{ fontSize: 12, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em' }}>
              World Tension
            </span>
            <span style={{ fontSize: 12, color: severityBarColor(avgSeverity), marginLeft: 'auto' }}>
              {avgSeverity.toFixed(1)} / 5
            </span>
          </div>
          <div style={{ height: 6, background: 'var(--color-border)', borderRadius: 999, overflow: 'hidden' }}>
            <div
              style={{
                height: '100%',
                borderRadius: 999,
                width: `${(avgSeverity / 5) * 100}%`,
                background: severityBarColor(avgSeverity),
                transition: 'width 0.3s',
              }}
            />
          </div>
        </div>
      </div>

      <div className="grid gap-6" style={{ gridTemplateColumns: '1fr 1fr' }}>
        {/* World Threats */}
        <div>
          <h2
            className="font-display mb-4"
            style={{ fontSize: 14, fontWeight: 600, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em' }}
          >
            World Threat Indicators
          </h2>
          {Object.keys(grouped).length === 0 ? (
            <div className="text-center py-16" style={{ color: 'var(--color-parchment-dim)' }}>
              <p className="font-display text-sm">No campaign state data</p>
            </div>
          ) : (
            <div className="space-y-4">
              {Object.entries(grouped).map(([category, items]) => (
                <div key={category}>
                  <p
                    style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: 8 }}
                  >
                    {category}
                  </p>
                  <div className="space-y-2">
                    {items.map((cs) => (
                      <div
                        key={cs.id}
                        className="card px-4 py-3"
                        style={{
                          borderLeft: `3px solid ${severityBarColor(cs.severity)}`,
                          borderRadius: '0 6px 6px 0',
                        }}
                      >
                        <div className="flex items-start justify-between gap-3 mb-2">
                          <div>
                            <p
                              className="font-display"
                              style={{ fontSize: 13, color: 'var(--color-parchment)', fontWeight: 500 }}
                            >
                              {cs.label ?? cs.key}
                            </p>
                            {cs.value && (
                              <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', marginTop: 2 }}>
                                {cs.value}
                              </p>
                            )}
                          </div>
                          <span
                            style={{
                              fontSize: 11,
                              color: severityBarColor(cs.severity),
                              flexShrink: 0,
                              fontWeight: 600,
                            }}
                          >
                            {cs.severity}/5
                          </span>
                        </div>
                        <div
                          style={{ height: 4, background: 'var(--color-border)', borderRadius: 999, overflow: 'hidden' }}
                        >
                          <div
                            style={{
                              height: '100%',
                              borderRadius: 999,
                              width: `${(cs.severity / 5) * 100}%`,
                              background: severityBarColor(cs.severity),
                            }}
                          />
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Right column */}
        <div className="space-y-6">
          {/* Active Quests */}
          <div>
            <h2
              className="font-display mb-4"
              style={{ fontSize: 14, fontWeight: 600, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em' }}
            >
              Active Quests
            </h2>
            {activeQuests.length === 0 ? (
              <div className="text-center py-8" style={{ color: 'var(--color-parchment-dim)' }}>
                <p className="font-display text-sm">No active quests</p>
              </div>
            ) : (
              <div className="space-y-2">
                {activeQuests.map((q) => (
                  <div key={q.id} className="card card-hover px-4 py-3">
                    <div className="flex items-start justify-between gap-2">
                      <p
                        className="font-display"
                        style={{ fontSize: 13, color: 'var(--color-parchment)', fontWeight: 500 }}
                      >
                        {q.title}
                      </p>
                      {questTypeBadge(q.quest_type)}
                    </div>
                    {q.region && (
                      <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginTop: 4 }}>
                        {q.region}
                      </p>
                    )}
                  </div>
                ))}
              </div>
            )}
          </div>

          {/* Recent Sessions */}
          <div>
            <h2
              className="font-display mb-4"
              style={{ fontSize: 14, fontWeight: 600, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em' }}
            >
              Recent Sessions
            </h2>
            {recentSessions.length === 0 ? (
              <div className="text-center py-8" style={{ color: 'var(--color-parchment-dim)' }}>
                <p className="font-display text-sm">No sessions recorded</p>
              </div>
            ) : (
              <div className="space-y-2">
                {recentSessions.map((s) => (
                  <div key={s.id} className="card card-hover px-4 py-3">
                    <div className="flex items-start justify-between gap-2 mb-1">
                      <p
                        className="font-display"
                        style={{ fontSize: 13, color: 'var(--color-parchment)', fontWeight: 500 }}
                      >
                        Session {s.session_number}
                        {s.title ? `: ${s.title}` : ''}
                      </p>
                      <span
                        className={`badge ${s.processed ? 'badge-completed' : 'badge-available'}`}
                        style={{ flexShrink: 0 }}
                      >
                        {s.processed ? 'Processed' : 'Pending'}
                      </span>
                    </div>
                    <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
                      {new Date(s.played_at).toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' })}
                    </p>
                    {s.summary && (
                      <p
                        style={{
                          fontSize: 12,
                          color: 'var(--color-parchment-mid)',
                          marginTop: 6,
                          display: '-webkit-box',
                          WebkitLineClamp: 2,
                          WebkitBoxOrient: 'vertical',
                          overflow: 'hidden',
                        }}
                      >
                        {s.summary}
                      </p>
                    )}
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
