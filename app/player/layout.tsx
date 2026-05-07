'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useEffect, useState } from 'react'
import { Crown, RefreshCw } from 'lucide-react'
import { supabase } from '@/lib/supabase'
import type { Player } from '@/types/database'

const navLinks = [
  { href: '/player',               label: 'Dashboard'  },
  { href: '/player/quests',        label: 'Quests'     },
  { href: '/player/journal',       label: 'Journal'    },
  { href: '/player/relationships', label: 'Companions' },
  { href: '/player/factions',      label: 'Factions'   },
  { href: '/player/map',           label: 'Map'        },
]

export default function PlayerLayout({ children }: { children: React.ReactNode }) {
  const pathname = usePathname()
  const [player, setPlayer]     = useState<Player | null>(null)
  const [allPlayers, setAllPlayers] = useState<Player[]>([])
  const [switching, setSwitching]   = useState(false)

  useEffect(() => {
    const id = typeof window !== 'undefined' ? localStorage.getItem('selectedPlayerId') : null

    supabase.from('players').select('*').eq('is_active', true).then(({ data }) => {
      const list = data ?? []
      setAllPlayers(list)
      if (id) {
        const found = list.find((p) => p.id === id)
        if (found) setPlayer(found)
      }
    })
  }, [])

  const handleSwitch = (p: Player) => {
    localStorage.setItem('selectedPlayerId', p.id)
    setPlayer(p)
    setSwitching(false)
    // Force a reload so the new player context propagates
    window.location.reload()
  }

  return (
    <div style={{ minHeight: '100vh', background: 'var(--color-bg)' }}>
      {/* ── Top Nav ── */}
      <header
        style={{
          background: 'var(--color-surface)',
          borderBottom: '1px solid var(--color-border)',
          position: 'sticky',
          top: 0,
          zIndex: 50,
        }}
      >
        <div
          style={{
            maxWidth: 1200,
            margin: '0 auto',
            padding: '0 24px',
            height: 52,
            display: 'flex',
            alignItems: 'center',
            gap: 32,
          }}
        >
          {/* Brand */}
          <div style={{ display: 'flex', alignItems: 'center', gap: 8, flexShrink: 0 }}>
            <div
              style={{
                width: 26,
                height: 26,
                borderRadius: 4,
                background: 'rgba(201,160,68,0.1)',
                border: '1px solid var(--color-gold-dim)',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                color: 'var(--color-gold)',
              }}
            >
              <Crown size={13} />
            </div>
            <span
              className="font-display"
              style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-gold-light)', letterSpacing: '0.08em' }}
            >
              Aeloria
            </span>
          </div>

          {/* Center Nav */}
          <nav style={{ display: 'flex', alignItems: 'center', gap: 2, flex: 1 }}>
            {navLinks.map(({ href, label }) => {
              const isActive =
                href === '/player' ? pathname === '/player' : pathname.startsWith(href)
              return (
                <Link
                  key={href}
                  href={href}
                  style={{
                    padding: '4px 12px',
                    fontSize: 13,
                    fontWeight: 500,
                    color: isActive ? 'var(--color-gold)' : 'var(--color-parchment-mid)',
                    textDecoration: 'none',
                    borderBottom: isActive ? '2px solid var(--color-gold)' : '2px solid transparent',
                    transition: 'color 0.15s, border-color 0.15s',
                    lineHeight: '52px',
                    display: 'inline-block',
                  }}
                >
                  {label}
                </Link>
              )
            })}
          </nav>

          {/* Right: character info + switch */}
          <div style={{ display: 'flex', alignItems: 'center', gap: 10, flexShrink: 0 }}>
            {player && (
              <>
                <span
                  className="font-display"
                  style={{ fontSize: 12, color: 'var(--color-parchment)', fontWeight: 500 }}
                >
                  {player.character_name}
                </span>
                <span
                  style={{
                    fontSize: 10,
                    fontWeight: 600,
                    padding: '2px 7px',
                    borderRadius: 999,
                    background: 'rgba(201,160,68,0.12)',
                    border: '1px solid rgba(201,160,68,0.25)',
                    color: 'var(--color-gold-light)',
                    letterSpacing: '0.04em',
                  }}
                >
                  Lvl {player.level}
                </span>
              </>
            )}
            {allPlayers.length > 1 && (
              <div style={{ position: 'relative' }}>
                <button
                  onClick={() => setSwitching((v) => !v)}
                  title="Switch Character"
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: 4,
                    fontSize: 11,
                    color: 'var(--color-parchment-dim)',
                    background: 'none',
                    border: 'none',
                    cursor: 'pointer',
                    padding: '4px 6px',
                    borderRadius: 4,
                    transition: 'color 0.15s',
                  }}
                >
                  <RefreshCw size={12} />
                  Switch
                </button>
                {switching && (
                  <div
                    style={{
                      position: 'absolute',
                      right: 0,
                      top: 'calc(100% + 8px)',
                      background: 'var(--color-surface-raised)',
                      border: '1px solid var(--color-border-bright)',
                      borderRadius: 6,
                      overflow: 'hidden',
                      minWidth: 180,
                      zIndex: 100,
                    }}
                  >
                    {allPlayers.map((p) => (
                      <button
                        key={p.id}
                        onClick={() => handleSwitch(p)}
                        style={{
                          display: 'block',
                          width: '100%',
                          textAlign: 'left',
                          padding: '10px 14px',
                          background: p.id === player?.id ? 'rgba(201,160,68,0.08)' : 'none',
                          border: 'none',
                          cursor: 'pointer',
                          borderBottom: '1px solid var(--color-border)',
                          color: p.id === player?.id ? 'var(--color-gold)' : 'var(--color-parchment-mid)',
                          fontSize: 13,
                          transition: 'background 0.1s',
                        }}
                      >
                        <div className="font-display" style={{ fontWeight: 600, fontSize: 12 }}>{p.character_name}</div>
                        <div style={{ fontSize: 10, color: 'var(--color-parchment-dim)', marginTop: 2 }}>
                          Lvl {p.level} {p.character_race} {p.character_class}
                        </div>
                      </button>
                    ))}
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      </header>

      {/* ── Page content ── */}
      <main>{children}</main>
    </div>
  )
}
