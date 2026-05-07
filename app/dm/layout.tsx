'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import {
  Globe,
  MapPin,
  Users,
  Shield,
  ScrollText,
  BookOpen,
  UserCog,
  Crown,
} from 'lucide-react'

interface NavItem {
  href: string
  label: string
  icon: React.ReactNode
}

const mainNav: NavItem = {
  href: '/dm',
  label: 'Dashboard',
  icon: <Globe size={16} />,
}

const campaignNav: NavItem[] = [
  { href: '/dm/locations', label: 'Locations',  icon: <MapPin size={16} /> },
  { href: '/dm/npcs',      label: 'NPCs',        icon: <Users size={16} /> },
  { href: '/dm/factions',  label: 'Factions',    icon: <Shield size={16} /> },
  { href: '/dm/quests',    label: 'Quests',      icon: <ScrollText size={16} /> },
]

const sessionNav: NavItem[] = [
  { href: '/dm/sessions', label: 'Sessions', icon: <BookOpen size={16} /> },
]

const worldNav: NavItem[] = [
  { href: '/dm/world',   label: 'World State', icon: <Globe size={16} /> },
  { href: '/dm/players', label: 'Players',     icon: <UserCog size={16} /> },
]

function NavLink({ item, pathname }: { item: NavItem; pathname: string }) {
  const isActive =
    item.href === '/dm'
      ? pathname === '/dm'
      : pathname.startsWith(item.href)

  return (
    <Link href={item.href} className={`nav-item${isActive ? ' active' : ''}`}>
      {item.icon}
      <span>{item.label}</span>
    </Link>
  )
}

export default function DmLayout({ children }: { children: React.ReactNode }) {
  const pathname = usePathname()

  return (
    <div className="flex min-h-screen" style={{ background: 'var(--color-bg)' }}>
      {/* ── Sidebar ── */}
      <aside
        className="flex-shrink-0 flex flex-col"
        style={{
          width: 240,
          background: 'var(--color-surface)',
          borderRight: '1px solid var(--color-border)',
          position: 'sticky',
          top: 0,
          height: '100vh',
          overflowY: 'auto',
        }}
      >
        {/* Brand */}
        <div
          className="flex items-center gap-3 px-4 py-5"
          style={{ borderBottom: '1px solid var(--color-border)' }}
        >
          <div
            className="flex items-center justify-center rounded"
            style={{
              width: 32,
              height: 32,
              background: 'rgba(201,160,68,0.12)',
              border: '1px solid var(--color-gold-dim)',
              color: 'var(--color-gold)',
              flexShrink: 0,
            }}
          >
            <Crown size={16} />
          </div>
          <div>
            <p className="font-display text-sm font-semibold" style={{ color: 'var(--color-gold-light)', lineHeight: 1.2 }}>
              DM Console
            </p>
            <p style={{ fontSize: 10, color: 'var(--color-parchment-dim)', letterSpacing: '0.06em' }}>
              AELORIA
            </p>
          </div>
        </div>

        {/* Nav */}
        <nav className="flex-1 px-3 py-4 space-y-5">
          {/* Dashboard */}
          <div>
            <NavLink item={mainNav} pathname={pathname} />
          </div>

          {/* Campaign section */}
          <div>
            <p
              className="px-3 mb-1"
              style={{ fontSize: 10, fontWeight: 600, letterSpacing: '0.1em', color: 'var(--color-parchment-dim)', textTransform: 'uppercase' }}
            >
              Campaign
            </p>
            {campaignNav.map((item) => (
              <NavLink key={item.href} item={item} pathname={pathname} />
            ))}
          </div>

          {/* Sessions section */}
          <div>
            <p
              className="px-3 mb-1"
              style={{ fontSize: 10, fontWeight: 600, letterSpacing: '0.1em', color: 'var(--color-parchment-dim)', textTransform: 'uppercase' }}
            >
              Sessions
            </p>
            {sessionNav.map((item) => (
              <NavLink key={item.href} item={item} pathname={pathname} />
            ))}
          </div>

          {/* World section */}
          <div>
            <p
              className="px-3 mb-1"
              style={{ fontSize: 10, fontWeight: 600, letterSpacing: '0.1em', color: 'var(--color-parchment-dim)', textTransform: 'uppercase' }}
            >
              World
            </p>
            {worldNav.map((item) => (
              <NavLink key={item.href} item={item} pathname={pathname} />
            ))}
          </div>
        </nav>

        {/* Footer */}
        <div
          className="px-4 py-3"
          style={{ borderTop: '1px solid var(--color-border)' }}
        >
          <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
            Aeloria · CR 847
          </p>
        </div>
      </aside>

      {/* ── Main content ── */}
      <main
        className="flex-1 min-w-0"
        style={{ padding: 32, overflowY: 'auto', minHeight: '100vh' }}
      >
        {children}
      </main>
    </div>
  )
}
