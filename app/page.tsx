import Link from 'next/link'
import { Shield, BookOpen, Crown } from 'lucide-react'

export default function LandingPage() {
  return (
    <div className="min-h-screen flex flex-col items-center justify-center" style={{ background: 'var(--color-bg)' }}>

      {/* Header */}
      <div className="mb-10 flex flex-col items-center gap-3">
        <Crown size={28} style={{ color: 'var(--color-gold)' }} />
        <h1 className="font-display text-3xl tracking-widest uppercase" style={{ color: 'var(--color-parchment)' }}>
          Aeloria
        </h1>
        <p className="text-xs tracking-widest uppercase" style={{ color: 'var(--color-parchment-dim)', letterSpacing: '0.2em' }}>
          Age of Cracked Crowns
        </p>
        <div className="w-32 h-px mt-1" style={{ background: 'var(--color-gold-dim)' }} />
      </div>

      {/* Portal cards */}
      <div className="flex gap-6 w-full max-w-xl px-6">

        <Link href="/dm" className="flex-1 group">
          <div className="card card-hover glow-gold p-8 flex flex-col items-center gap-4 text-center"
            style={{ transition: 'border-color 0.2s, background-color 0.2s' }}>
            <div className="w-14 h-14 rounded-full flex items-center justify-center"
              style={{ background: 'rgba(201,160,68,0.1)', border: '1px solid var(--color-gold-dim)' }}>
              <Shield size={22} style={{ color: 'var(--color-gold)' }} />
            </div>
            <div>
              <h2 className="font-display text-lg mb-1" style={{ color: 'var(--color-gold-light)' }}>Dungeon Master</h2>
              <p className="text-xs leading-relaxed" style={{ color: 'var(--color-parchment-dim)' }}>
                Full campaign access — NPCs, locations, sessions, world state
              </p>
            </div>
          </div>
        </Link>

        <Link href="/player" className="flex-1 group">
          <div className="card card-hover p-8 flex flex-col items-center gap-4 text-center"
            style={{ transition: 'border-color 0.2s, background-color 0.2s' }}>
            <div className="w-14 h-14 rounded-full flex items-center justify-center"
              style={{ background: 'rgba(184,158,122,0.08)', border: '1px solid var(--color-border-bright)' }}>
              <BookOpen size={22} style={{ color: 'var(--color-parchment-mid)' }} />
            </div>
            <div>
              <h2 className="font-display text-lg mb-1" style={{ color: 'var(--color-parchment)' }}>Player View</h2>
              <p className="text-xs leading-relaxed" style={{ color: 'var(--color-parchment-dim)' }}>
                Quest log, session journal, NPC standings, fog of war map
              </p>
            </div>
          </div>
        </Link>

      </div>

      <p className="mt-12 text-xs" style={{ color: 'var(--color-parchment-dim)', opacity: 0.35 }}>
        CR 847 · The crown is broken. The bells are silent.
      </p>

    </div>
  )
}
