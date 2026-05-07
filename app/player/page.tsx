'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { MapPin, ScrollText, Users, Shield, BookOpen, ChevronRight } from 'lucide-react'
import { supabase } from '@/lib/supabase'
import type { Player, Quest, Session } from '@/types/database'

interface DashboardData {
  player: Player
  activeQuests: (Quest & { location_name?: string })[]
  lastSession: Session | null
  discoveredCount: number
  totalLocationCount: number
  npcRelCount: number
  factionRepCount: number
}

function formatDate(dateStr: string) {
  return new Date(dateStr).toLocaleDateString('en-US', {
    weekday: 'long',
    year: 'numeric',
    month: 'long',
    day: 'numeric',
  })
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

// ── Player Selection Screen ────────────────────────────────────────────────

function PlayerSelection({ players, onSelect }: { players: Player[]; onSelect: (p: Player) => void }) {
  return (
    <div
      style={{
        minHeight: '100vh',
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
        gap: 32,
        padding: 24,
        background: 'var(--color-bg)',
      }}
    >
      <div style={{ textAlign: 'center' }}>
        <h1
          className="font-display"
          style={{ fontSize: 32, color: 'var(--color-gold-light)', letterSpacing: '0.12em', marginBottom: 8 }}
        >
          Aeloria
        </h1>
        <p style={{ color: 'var(--color-parchment-dim)', fontSize: 14 }}>
          Choose your character to continue your adventure
        </p>
      </div>

      <hr className="rule-gold" style={{ width: 200 }} />

      <div style={{ display: 'flex', flexDirection: 'column', gap: 12, width: '100%', maxWidth: 340 }}>
        {players.map((p) => (
          <button
            key={p.id}
            onClick={() => onSelect(p)}
            className="card card-hover"
            style={{
              textAlign: 'left',
              padding: '16px 20px',
              cursor: 'pointer',
              border: '1px solid var(--color-border)',
              background: 'none',
              width: '100%',
              transition: 'border-color 0.15s, background 0.15s',
            }}
          >
            <div
              className="font-display"
              style={{ fontSize: 16, color: 'var(--color-gold)', fontWeight: 600, marginBottom: 4 }}
            >
              {p.character_name}
            </div>
            <div style={{ fontSize: 12, color: 'var(--color-parchment-mid)' }}>
              Level {p.level}
              {p.character_race ? ` ${p.character_race}` : ''}
              {p.character_class ? ` ${p.character_class}` : ''}
            </div>
            <div style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginTop: 4 }}>
              Played by {p.name}
            </div>
          </button>
        ))}
      </div>

      {players.length === 0 && (
        <p style={{ color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>
          No active players yet — ask your DM to add you.
        </p>
      )}
    </div>
  )
}

// ── Quest Card (compact) ───────────────────────────────────────────────────

function ActiveQuestCard({ quest }: { quest: Quest & { location_name?: string } }) {
  const typeClass =
    quest.quest_type === 'main'     ? 'badge badge-main' :
    quest.quest_type === 'faction'  ? 'badge badge-faction' :
    quest.quest_type === 'personal' ? 'badge badge-personal' :
    'badge badge-side'

  return (
    <div
      className="card card-hover"
      style={{ padding: '14px 16px' }}
    >
      <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: 8, marginBottom: 6 }}>
        <h3 className="font-display" style={{ fontSize: 13, color: 'var(--color-parchment)', fontWeight: 600, lineHeight: 1.3 }}>
          {quest.title}
        </h3>
        <span className={typeClass} style={{ flexShrink: 0 }}>{quest.quest_type}</span>
      </div>
      {quest.region && (
        <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginBottom: 6 }}>
          <MapPin size={10} style={{ display: 'inline', marginRight: 3 }} />
          {quest.region}{quest.location_name ? ` · ${quest.location_name}` : ''}
        </p>
      )}
      {quest.description && (
        <p
          style={{
            fontSize: 12,
            color: 'var(--color-parchment-mid)',
            lineHeight: 1.5,
            overflow: 'hidden',
            display: '-webkit-box',
            WebkitLineClamp: 2,
            WebkitBoxOrient: 'vertical',
          }}
        >
          {quest.description}
        </p>
      )}
    </div>
  )
}

// ── Dashboard ─────────────────────────────────────────────────────────────

export default function PlayerDashboard() {
  const router = useRouter()
  const [data, setData]       = useState<DashboardData | null>(null)
  const [loading, setLoading] = useState(true)
  const [players, setPlayers] = useState<Player[]>([])
  const [noPlayer, setNoPlayer] = useState(false)

  useEffect(() => {
    const id = typeof window !== 'undefined' ? localStorage.getItem('selectedPlayerId') : null

    // Load all active players first
    supabase.from('players').select('*').eq('is_active', true).then(async ({ data: allPlayers }) => {
      const list = allPlayers ?? []
      setPlayers(list)

      const player = id ? list.find((p) => p.id === id) : null

      if (!player) {
        if (list.length === 1) {
          // Auto-select if only one player
          localStorage.setItem('selectedPlayerId', list[0].id)
          await loadDashboard(list[0])
        } else {
          setNoPlayer(true)
          setLoading(false)
        }
        return
      }

      await loadDashboard(player)
    })
  }, [])

  async function loadDashboard(player: Player) {
    const [
      questsRes,
      sessionRes,
      discoveriesRes,
      totalLocRes,
      npcRelRes,
      factionRepRes,
      locationsRes,
    ] = await Promise.all([
      supabase
        .from('player_quests')
        .select('quest_id, quests(*)')
        .eq('player_id', player.id)
        .eq('status', 'active'),
      supabase
        .from('sessions')
        .select('*')
        .order('session_number', { ascending: false })
        .limit(1)
        .single(),
      supabase
        .from('player_discoveries')
        .select('location_id', { count: 'exact', head: true })
        .eq('player_id', player.id),
      supabase
        .from('locations')
        .select('id', { count: 'exact', head: true }),
      supabase
        .from('npc_relationships')
        .select('id', { count: 'exact', head: true })
        .eq('player_id', player.id)
        .neq('attitude', 0),
      supabase
        .from('player_faction_rep')
        .select('id', { count: 'exact', head: true })
        .eq('player_id', player.id),
      supabase.from('locations').select('id, name'),
    ])

    // Build location name map
    const locMap: Record<string, string> = {}
    for (const l of locationsRes.data ?? []) locMap[l.id] = l.name

    // Extract quests from joined result
    const activeQuests: (Quest & { location_name?: string })[] = []
    for (const row of questsRes.data ?? []) {
      const q = (row as any).quests as Quest
      if (q) {
        activeQuests.push({
          ...q,
          location_name: q.location_id ? locMap[q.location_id] : undefined,
        })
      }
    }

    setData({
      player,
      activeQuests: activeQuests.slice(0, 3),
      lastSession: sessionRes.data ?? null,
      discoveredCount: discoveriesRes.count ?? 0,
      totalLocationCount: totalLocRes.count ?? 0,
      npcRelCount: npcRelRes.count ?? 0,
      factionRepCount: factionRepRes.count ?? 0,
    })
    setLoading(false)
  }

  function handleSelectPlayer(p: Player) {
    localStorage.setItem('selectedPlayerId', p.id)
    setNoPlayer(false)
    setLoading(true)
    loadDashboard(p)
  }

  if (loading) return <Spinner />

  if (noPlayer) {
    return <PlayerSelection players={players} onSelect={handleSelectPlayer} />
  }

  if (!data) return null

  const { player, activeQuests, lastSession, discoveredCount, totalLocationCount, npcRelCount, factionRepCount } = data

  return (
    <div style={{ maxWidth: 900, margin: '0 auto', padding: '32px 24px' }}>

      {/* ── Character Header ── */}
      <div style={{ marginBottom: 36 }}>
        <h1
          className="font-display"
          style={{ fontSize: 34, color: 'var(--color-gold-light)', letterSpacing: '0.06em', marginBottom: 6, lineHeight: 1.2 }}
        >
          {player.character_name}
        </h1>
        <p style={{ color: 'var(--color-parchment-mid)', fontSize: 15, marginBottom: 4 }}>
          Level {player.level}
          {player.character_race ? ` ${player.character_race}` : ''}
          {player.character_class ? ` ${player.character_class}` : ''}
        </p>
        <p style={{ color: 'var(--color-parchment-dim)', fontSize: 13 }}>
          Played by {player.name}
        </p>
      </div>

      <hr className="rule-gold" style={{ marginBottom: 36 }} />

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 24 }}>

        {/* ── Last Session ── */}
        <div className="card" style={{ padding: '20px 24px', gridColumn: '1 / -1' }}>
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 14 }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
              <BookOpen size={14} style={{ color: 'var(--color-gold)' }} />
              <span
                style={{ fontSize: 10, fontWeight: 700, letterSpacing: '0.1em', color: 'var(--color-parchment-dim)', textTransform: 'uppercase' }}
              >
                Last Session
              </span>
            </div>
            <Link
              href="/player/journal"
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: 4,
                fontSize: 11,
                color: 'var(--color-gold-dim)',
                textDecoration: 'none',
              }}
            >
              Full Journal <ChevronRight size={12} />
            </Link>
          </div>

          {lastSession ? (
            <>
              <div style={{ display: 'flex', alignItems: 'baseline', gap: 12, marginBottom: 10 }}>
                <h2
                  className="font-display"
                  style={{ fontSize: 18, color: 'var(--color-parchment)', fontWeight: 600 }}
                >
                  {lastSession.title ?? `Session ${lastSession.session_number}`}
                </h2>
                <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
                  Session {lastSession.session_number} · {formatDate(lastSession.played_at)}
                </span>
              </div>
              {lastSession.summary ? (
                <p style={{ fontSize: 13, color: 'var(--color-parchment-mid)', lineHeight: 1.7 }}>
                  {lastSession.summary}
                </p>
              ) : (
                <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>
                  Session summary not yet written.
                </p>
              )}
            </>
          ) : (
            <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>
              Your adventure awaits its first chapter.
            </p>
          )}
        </div>

        {/* ── Active Quests ── */}
        <div style={{ gridColumn: '1 / -1' }}>
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 14 }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
              <ScrollText size={14} style={{ color: 'var(--color-gold)' }} />
              <span
                style={{ fontSize: 10, fontWeight: 700, letterSpacing: '0.1em', color: 'var(--color-parchment-dim)', textTransform: 'uppercase' }}
              >
                Active Quests
              </span>
              {activeQuests.length > 0 && (
                <span
                  style={{
                    fontSize: 10,
                    padding: '1px 6px',
                    borderRadius: 999,
                    background: 'rgba(201,160,68,0.12)',
                    border: '1px solid rgba(201,160,68,0.2)',
                    color: 'var(--color-gold-light)',
                  }}
                >
                  {activeQuests.length}
                </span>
              )}
            </div>
            <Link
              href="/player/quests"
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: 4,
                fontSize: 11,
                color: 'var(--color-gold-dim)',
                textDecoration: 'none',
              }}
            >
              Quest Log <ChevronRight size={12} />
            </Link>
          </div>

          {activeQuests.length > 0 ? (
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(260px, 1fr))', gap: 12 }}>
              {activeQuests.map((q) => (
                <ActiveQuestCard key={q.id} quest={q} />
              ))}
            </div>
          ) : (
            <div className="card" style={{ padding: '20px 24px', textAlign: 'center' }}>
              <p style={{ color: 'var(--color-parchment-dim)', fontSize: 13, fontStyle: 'italic' }}>
                No active quests. The road ahead is open.
              </p>
            </div>
          )}
        </div>

        {/* ── World at a Glance ── */}
        <div style={{ gridColumn: '1 / -1' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 14 }}>
            <MapPin size={14} style={{ color: 'var(--color-gold)' }} />
            <span
              style={{ fontSize: 10, fontWeight: 700, letterSpacing: '0.1em', color: 'var(--color-parchment-dim)', textTransform: 'uppercase' }}
            >
              World at a Glance
            </span>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 12 }}>
            {/* Locations */}
            <Link href="/player/map" style={{ textDecoration: 'none' }}>
              <div className="card card-hover" style={{ padding: '16px 20px', cursor: 'pointer' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 8 }}>
                  <MapPin size={14} style={{ color: 'var(--color-gold-dim)' }} />
                  <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>Locations Discovered</span>
                </div>
                <div style={{ display: 'flex', alignItems: 'baseline', gap: 4 }}>
                  <span className="font-display" style={{ fontSize: 28, color: 'var(--color-gold)', lineHeight: 1 }}>
                    {discoveredCount}
                  </span>
                  <span style={{ fontSize: 13, color: 'var(--color-parchment-dim)' }}>/ {totalLocationCount}</span>
                </div>
              </div>
            </Link>

            {/* NPCs */}
            <Link href="/player/relationships" style={{ textDecoration: 'none' }}>
              <div className="card card-hover" style={{ padding: '16px 20px', cursor: 'pointer' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 8 }}>
                  <Users size={14} style={{ color: 'var(--color-gold-dim)' }} />
                  <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>Known Companions</span>
                </div>
                <span className="font-display" style={{ fontSize: 28, color: 'var(--color-gold)', lineHeight: 1 }}>
                  {npcRelCount}
                </span>
              </div>
            </Link>

            {/* Factions */}
            <Link href="/player/factions" style={{ textDecoration: 'none' }}>
              <div className="card card-hover" style={{ padding: '16px 20px', cursor: 'pointer' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 8 }}>
                  <Shield size={14} style={{ color: 'var(--color-gold-dim)' }} />
                  <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>Faction Standings</span>
                </div>
                <span className="font-display" style={{ fontSize: 28, color: 'var(--color-gold)', lineHeight: 1 }}>
                  {factionRepCount}
                </span>
              </div>
            </Link>
          </div>
        </div>

      </div>
    </div>
  )
}
