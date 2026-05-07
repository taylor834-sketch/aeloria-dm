'use client'

import { useEffect, useState, useRef } from 'react'
import { useRouter } from 'next/navigation'
import { MapPin, X, Info } from 'lucide-react'
import { supabase } from '@/lib/supabase'
import type { Location, PlayerDiscovery } from '@/types/database'

interface DiscoveredLocation extends Location {
  discovered_at: string
  discovery_notes: string | null
}

interface PopupState {
  location: DiscoveredLocation
  x: number
  y: number
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

function locationTypeColor(type: string): string {
  switch (type) {
    case 'city':     return '#c9a044'
    case 'town':     return '#b89e7a'
    case 'village':  return '#7a6848'
    case 'dungeon':  return '#8b1e1e'
    case 'landmark': return '#2a8a48'
    case 'ruin':     return '#6b5a3e'
    default:         return '#7a6848'
  }
}

function locationTypeIcon(type: string): string {
  switch (type) {
    case 'city':     return '⬟'
    case 'town':     return '◆'
    case 'village':  return '◇'
    case 'dungeon':  return '☠'
    case 'landmark': return '✦'
    case 'ruin':     return '◈'
    default:         return '●'
  }
}

// ── Map dot marker ────────────────────────────────────────────────────────

function LocationMarker({
  location,
  discovered,
  onClick,
}: {
  location: DiscoveredLocation | Location
  discovered: boolean
  onClick?: (loc: DiscoveredLocation, e: React.MouseEvent) => void
}) {
  const disc = discovered ? (location as DiscoveredLocation) : null
  const color = discovered ? locationTypeColor(location.location_type) : 'var(--color-border-bright)'
  const size  = location.is_major ? 12 : 8

  return (
    <div
      title={discovered ? location.name : '???'}
      onClick={(e) => disc && onClick?.(disc, e)}
      style={{
        position: 'absolute',
        left: `${location.map_x}%`,
        top:  `${location.map_y}%`,
        transform: 'translate(-50%, -50%)',
        width: size,
        height: size,
        borderRadius: '50%',
        background: color,
        boxShadow: discovered && location.is_major
          ? `0 0 12px ${color}, 0 0 4px ${color}`
          : discovered
          ? `0 0 6px ${color}`
          : 'none',
        border: discovered ? `1px solid ${color}` : '1px solid var(--color-border)',
        opacity: discovered ? 1 : 0.3,
        cursor: discovered ? 'pointer' : 'default',
        zIndex: discovered ? 2 : 1,
        transition: 'box-shadow 0.2s',
      }}
    />
  )
}

// ── Popup ─────────────────────────────────────────────────────────────────

function LocationPopup({
  popup,
  onClose,
}: {
  popup: PopupState
  onClose: () => void
}) {
  const { location } = popup

  return (
    <div
      style={{
        position: 'absolute',
        left: `calc(${location.map_x}% + 16px)`,
        top:  `calc(${location.map_y}% - 8px)`,
        background: 'var(--color-surface-raised)',
        border: '1px solid var(--color-border-bright)',
        borderRadius: 8,
        padding: '14px 16px',
        minWidth: 220,
        maxWidth: 280,
        zIndex: 10,
        boxShadow: '0 8px 32px rgba(0,0,0,0.6)',
      }}
    >
      <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: 8, marginBottom: 8 }}>
        <h3 className="font-display" style={{ fontSize: 14, color: 'var(--color-parchment)', fontWeight: 600, lineHeight: 1.3 }}>
          {location.name}
        </h3>
        <button
          onClick={onClose}
          style={{ background: 'none', border: 'none', cursor: 'pointer', color: 'var(--color-parchment-dim)', padding: 2, flexShrink: 0 }}
        >
          <X size={12} />
        </button>
      </div>

      <div style={{ display: 'flex', alignItems: 'center', gap: 6, marginBottom: 8 }}>
        <span style={{ fontSize: 10, color: locationTypeColor(location.location_type) }}>
          {locationTypeIcon(location.location_type)}
        </span>
        <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
          {location.region} · {location.location_type}
        </span>
      </div>

      {location.population != null && (
        <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginBottom: 6 }}>
          Population ~{location.population.toLocaleString()}
        </p>
      )}

      {location.description && (
        <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.6, marginBottom: 6 }}>
          {location.description}
        </p>
      )}

      {location.discovery_notes && (
        <div
          style={{
            marginTop: 8,
            padding: '6px 10px',
            background: 'rgba(201,160,68,0.06)',
            border: '1px solid rgba(201,160,68,0.15)',
            borderRadius: 4,
          }}
        >
          <p style={{ fontSize: 11, color: 'var(--color-gold)', fontStyle: 'italic', lineHeight: 1.5 }}>
            {location.discovery_notes}
          </p>
        </div>
      )}

      <p style={{ fontSize: 10, color: 'var(--color-parchment-dim)', marginTop: 8 }}>
        Discovered {new Date(location.discovered_at).toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}
      </p>
    </div>
  )
}

// ── Page ──────────────────────────────────────────────────────────────────

export default function MapPage() {
  const router = useRouter()
  const [allLocations,   setAllLocations]   = useState<Location[]>([])
  const [discovered,     setDiscovered]     = useState<DiscoveredLocation[]>([])
  const [loading,        setLoading]        = useState(true)
  const [popup,          setPopup]          = useState<PopupState | null>(null)
  const [selectedRegion, setSelectedRegion] = useState<string>('All')
  const mapRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const playerId = typeof window !== 'undefined' ? localStorage.getItem('selectedPlayerId') : null
    if (!playerId) { router.push('/player'); return }

    async function load() {
      const [allRes, discRes] = await Promise.all([
        supabase.from('locations').select('*'),
        supabase
          .from('player_discoveries')
          .select('location_id, discovered_at, discovery_notes')
          .eq('player_id', playerId),
      ])

      const all  = allRes.data ?? []
      const disc = discRes.data ?? []

      const discMap: Record<string, { discovered_at: string; discovery_notes: string | null }> = {}
      for (const d of disc) discMap[d.location_id] = { discovered_at: d.discovered_at, discovery_notes: d.discovery_notes }

      const discLocations: DiscoveredLocation[] = all
        .filter((l) => discMap[l.id])
        .map((l) => ({
          ...l,
          discovered_at: discMap[l.id].discovered_at,
          discovery_notes: discMap[l.id].discovery_notes,
        }))

      setAllLocations(all)
      setDiscovered(discLocations)
      setLoading(false)
    }

    load()
  }, [router])

  // Close popup on outside click
  useEffect(() => {
    function handle(e: MouseEvent) {
      if (mapRef.current && !mapRef.current.contains(e.target as Node)) {
        setPopup(null)
      }
    }
    document.addEventListener('mousedown', handle)
    return () => document.removeEventListener('mousedown', handle)
  }, [])

  if (loading) return <Spinner />

  const discoveredIds = new Set(discovered.map((d) => d.id))

  // Region filter
  const regions = ['All', ...Array.from(new Set(discovered.map((l) => l.region))).sort()]
  const filteredDiscovered = selectedRegion === 'All'
    ? discovered
    : discovered.filter((l) => l.region === selectedRegion)

  return (
    <div style={{ display: 'flex', height: 'calc(100vh - 52px)', overflow: 'hidden' }}>

      {/* ── Side Panel ── */}
      <div
        style={{
          width: 260,
          flexShrink: 0,
          background: 'var(--color-surface)',
          borderRight: '1px solid var(--color-border)',
          display: 'flex',
          flexDirection: 'column',
          overflowY: 'auto',
        }}
      >
        {/* Panel header */}
        <div
          style={{
            padding: '16px 16px 12px',
            borderBottom: '1px solid var(--color-border)',
          }}
        >
          <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 6 }}>
            <MapPin size={14} style={{ color: 'var(--color-gold)' }} />
            <h2 className="font-display" style={{ fontSize: 13, color: 'var(--color-gold-light)', fontWeight: 600 }}>
              Discovered Locations
            </h2>
          </div>
          <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
            {discovered.length} of {allLocations.length} discovered
          </p>

          {/* Region filter */}
          <div style={{ marginTop: 10 }}>
            <select
              value={selectedRegion}
              onChange={(e) => setSelectedRegion(e.target.value)}
              style={{
                width: '100%',
                background: 'var(--color-surface-raised)',
                border: '1px solid var(--color-border)',
                borderRadius: 4,
                padding: '5px 8px',
                color: 'var(--color-parchment-mid)',
                fontSize: 12,
                cursor: 'pointer',
              }}
            >
              {regions.map((r) => (
                <option key={r} value={r}>{r}</option>
              ))}
            </select>
          </div>
        </div>

        {/* Location list */}
        <div style={{ padding: '8px 8px', flex: 1 }}>
          {filteredDiscovered.length === 0 ? (
            <p style={{ padding: '16px', fontSize: 12, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>
              No discovered locations here.
            </p>
          ) : (
            filteredDiscovered.map((loc) => (
              <button
                key={loc.id}
                onClick={() => setPopup({ location: loc, x: loc.map_x, y: loc.map_y })}
                style={{
                  display: 'block',
                  width: '100%',
                  textAlign: 'left',
                  padding: '8px 10px',
                  background: popup?.location.id === loc.id ? 'rgba(201,160,68,0.08)' : 'none',
                  border: 'none',
                  borderRadius: 4,
                  cursor: 'pointer',
                  transition: 'background 0.1s',
                  marginBottom: 2,
                }}
              >
                <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
                  <span style={{ fontSize: 10, color: locationTypeColor(loc.location_type), flexShrink: 0 }}>
                    {locationTypeIcon(loc.location_type)}
                  </span>
                  <div>
                    <div style={{ fontSize: 12, color: 'var(--color-parchment)', fontWeight: 500 }}>
                      {loc.name}
                    </div>
                    <div style={{ fontSize: 10, color: 'var(--color-parchment-dim)' }}>
                      {loc.region}
                    </div>
                  </div>
                </div>
              </button>
            ))
          )}
        </div>

        {/* Legend */}
        <div
          style={{
            padding: '12px 16px',
            borderTop: '1px solid var(--color-border)',
          }}
        >
          <p style={{ fontSize: 10, fontWeight: 700, letterSpacing: '0.08em', color: 'var(--color-parchment-dim)', textTransform: 'uppercase', marginBottom: 8 }}>
            Legend
          </p>
          {[
            { type: 'city',     label: 'City'     },
            { type: 'town',     label: 'Town'     },
            { type: 'village',  label: 'Village'  },
            { type: 'dungeon',  label: 'Dungeon'  },
            { type: 'landmark', label: 'Landmark' },
            { type: 'ruin',     label: 'Ruin'     },
          ].map(({ type, label }) => (
            <div key={type} style={{ display: 'flex', alignItems: 'center', gap: 6, marginBottom: 4 }}>
              <span style={{ fontSize: 10, color: locationTypeColor(type) }}>{locationTypeIcon(type)}</span>
              <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>{label}</span>
            </div>
          ))}
        </div>
      </div>

      {/* ── Map Area ── */}
      <div
        ref={mapRef}
        style={{
          flex: 1,
          position: 'relative',
          overflow: 'hidden',
          background: 'var(--color-bg)',
          // Atmospheric grid pattern
          backgroundImage: `
            radial-gradient(ellipse at 30% 40%, rgba(201,160,68,0.03) 0%, transparent 60%),
            radial-gradient(ellipse at 70% 70%, rgba(42,138,72,0.02) 0%, transparent 50%),
            linear-gradient(rgba(42,34,24,0.3) 1px, transparent 1px),
            linear-gradient(90deg, rgba(42,34,24,0.3) 1px, transparent 1px)
          `,
          backgroundSize: '100% 100%, 100% 100%, 40px 40px, 40px 40px',
        }}
      >
        {/* Vignette overlay */}
        <div
          style={{
            position: 'absolute',
            inset: 0,
            background: 'radial-gradient(ellipse at center, transparent 50%, rgba(10,9,7,0.6) 100%)',
            pointerEvents: 'none',
            zIndex: 1,
          }}
        />

        {/* Notice banner */}
        <div
          style={{
            position: 'absolute',
            top: 16,
            left: '50%',
            transform: 'translateX(-50%)',
            display: 'flex',
            alignItems: 'center',
            gap: 8,
            padding: '8px 16px',
            background: 'rgba(26,23,20,0.92)',
            border: '1px solid var(--color-border)',
            borderRadius: 6,
            zIndex: 5,
            whiteSpace: 'nowrap',
          }}
        >
          <Info size={12} style={{ color: 'var(--color-gold-dim)', flexShrink: 0 }} />
          <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
            Full cartographic map coming soon — currently showing discovered locations
          </span>
        </div>

        {/* Undiscovered locations (faint) */}
        {allLocations
          .filter((l) => !discoveredIds.has(l.id))
          .map((loc) => (
            <LocationMarker key={loc.id} location={loc} discovered={false} />
          ))
        }

        {/* Discovered locations (glowing) */}
        {discovered.map((loc) => (
          <LocationMarker
            key={loc.id}
            location={loc}
            discovered
            onClick={(l, e) => {
              e.stopPropagation()
              setPopup((prev) => prev?.location.id === l.id ? null : { location: l, x: l.map_x, y: l.map_y })
            }}
          />
        ))}

        {/* Popup */}
        {popup && (
          <LocationPopup
            popup={popup}
            onClose={() => setPopup(null)}
          />
        )}

        {/* Fog labels on undiscovered zones */}
        {allLocations.filter((l) => !discoveredIds.has(l.id)).length > 0 && (
          <div
            style={{
              position: 'absolute',
              bottom: 20,
              right: 20,
              zIndex: 3,
              background: 'rgba(10,9,7,0.85)',
              border: '1px solid var(--color-border)',
              borderRadius: 5,
              padding: '8px 12px',
            }}
          >
            <p style={{ fontSize: 10, color: 'var(--color-parchment-dim)' }}>
              <span style={{ color: 'var(--color-parchment-dim)', opacity: 0.5, marginRight: 6 }}>●</span>
              {allLocations.length - discovered.length} locations undiscovered
            </p>
          </div>
        )}
      </div>

    </div>
  )
}
