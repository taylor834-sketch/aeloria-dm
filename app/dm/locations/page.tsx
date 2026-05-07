'use client'

import { useEffect, useState, useMemo } from 'react'
import { supabase } from '@/lib/supabase'
import type { Location } from '@/types/database'

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

const REGION_COLORS: Record<string, { bg: string; text: string; border: string }> = {
  'Aranthor':        { bg: 'rgba(201,160,68,0.12)',  text: 'var(--color-gold-light)',  border: 'rgba(201,160,68,0.3)' },
  'Darian Empire':   { bg: 'rgba(74,90,130,0.15)',   text: '#a5b4fc',                  border: 'rgba(99,120,200,0.3)' },
  'Veilwood':        { bg: 'rgba(42,100,58,0.15)',    text: '#86efac',                  border: 'rgba(42,138,72,0.3)' },
  'Dreadspire':      { bg: 'rgba(60,50,50,0.2)',      text: '#9ca3af',                  border: 'rgba(80,70,70,0.4)' },
  'Ashen Marches':   { bg: 'rgba(160,90,20,0.15)',   text: '#fb923c',                  border: 'rgba(200,100,20,0.3)' },
  'Shattered Isles': { bg: 'rgba(20,120,130,0.15)',  text: '#67e8f9',                  border: 'rgba(20,160,170,0.3)' },
  'Sapphire Coast':  { bg: 'rgba(30,80,180,0.15)',   text: '#93c5fd',                  border: 'rgba(60,100,220,0.3)' },
}

function regionBadge(region: string) {
  const colors = REGION_COLORS[region] ?? { bg: 'rgba(74,58,40,0.2)', text: 'var(--color-parchment-dim)', border: 'var(--color-border)' }
  return (
    <span
      className="badge"
      style={{ background: colors.bg, color: colors.text, border: `1px solid ${colors.border}` }}
    >
      {region}
    </span>
  )
}

export default function LocationsPage() {
  const [locations, setLocations] = useState<Location[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')
  const [regionFilter, setRegionFilter] = useState('')
  const [typeFilter, setTypeFilter] = useState('')

  useEffect(() => {
    supabase
      .from('locations')
      .select('*')
      .order('is_major', { ascending: false })
      .then(({ data }) => {
        setLocations(data ?? [])
        setLoading(false)
      })
  }, [])

  const regions = useMemo(() => {
    const set = new Set(locations.map((l) => l.region).filter(Boolean))
    return Array.from(set).sort()
  }, [locations])

  const types = useMemo(() => {
    const set = new Set(locations.map((l) => l.location_type).filter(Boolean))
    return Array.from(set).sort()
  }, [locations])

  const filtered = useMemo(() => {
    return locations.filter((l) => {
      const matchSearch =
        !search ||
        l.name.toLowerCase().includes(search.toLowerCase()) ||
        l.description?.toLowerCase().includes(search.toLowerCase())
      const matchRegion = !regionFilter || l.region === regionFilter
      const matchType = !typeFilter || l.location_type === typeFilter
      return matchSearch && matchRegion && matchType
    })
  }, [locations, search, regionFilter, typeFilter])

  if (loading) return <Spinner />

  const inputStyle: React.CSSProperties = {
    background: 'var(--color-surface)',
    border: '1px solid var(--color-border)',
    borderRadius: 5,
    padding: '8px 12px',
    color: 'var(--color-parchment)',
    fontSize: 13,
    outline: 'none',
  }

  return (
    <div style={{ maxWidth: 1100 }}>
      {/* Header */}
      <div className="mb-6">
        <h1
          className="font-display"
          style={{ fontSize: 26, fontWeight: 600, color: 'var(--color-gold-light)', marginBottom: 4 }}
        >
          Locations
        </h1>
        <p style={{ color: 'var(--color-parchment-dim)', fontSize: 13 }}>
          {filtered.length} of {locations.length} locations
        </p>
      </div>

      {/* Filter bar */}
      <div className="flex gap-3 mb-6 flex-wrap">
        <input
          type="text"
          placeholder="Search locations…"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          style={{ ...inputStyle, minWidth: 220 }}
        />
        <select
          value={regionFilter}
          onChange={(e) => setRegionFilter(e.target.value)}
          style={{ ...inputStyle, minWidth: 160 }}
        >
          <option value="">All Regions</option>
          {regions.map((r) => (
            <option key={r} value={r}>{r}</option>
          ))}
        </select>
        <select
          value={typeFilter}
          onChange={(e) => setTypeFilter(e.target.value)}
          style={{ ...inputStyle, minWidth: 140 }}
        >
          <option value="">All Types</option>
          {types.map((t) => (
            <option key={t} value={t}>{t}</option>
          ))}
        </select>
        {(search || regionFilter || typeFilter) && (
          <button
            onClick={() => { setSearch(''); setRegionFilter(''); setTypeFilter('') }}
            style={{ ...inputStyle, color: 'var(--color-parchment-dim)', cursor: 'pointer' }}
          >
            Clear
          </button>
        )}
      </div>

      {/* Grid */}
      {filtered.length === 0 ? (
        <div className="text-center py-16" style={{ color: 'var(--color-parchment-dim)' }}>
          <p className="font-display text-sm">No locations found</p>
        </div>
      ) : (
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 16 }}>
          {filtered.map((loc) => (
            <div key={loc.id} className="card card-hover" style={{ display: 'flex', flexDirection: 'column' }}>
              {/* Card header */}
              <div style={{ padding: '14px 16px 10px', borderBottom: '1px solid var(--color-border)' }}>
                <div className="flex items-start gap-2 mb-2">
                  <h3
                    className="font-display flex-1"
                    style={{ fontSize: 14, fontWeight: 600, color: 'var(--color-parchment)', lineHeight: 1.3 }}
                  >
                    {loc.name}
                    {loc.is_major && (
                      <span style={{ marginLeft: 6, fontSize: 12, color: 'var(--color-gold)' }}>⭐</span>
                    )}
                  </h3>
                </div>
                <div className="flex items-center gap-2 flex-wrap">
                  {regionBadge(loc.region)}
                  <span className="badge" style={{ background: 'rgba(74,58,40,0.2)', color: 'var(--color-parchment-dim)', border: '1px solid var(--color-border)' }}>
                    {loc.location_type}
                  </span>
                  {loc.population != null && (
                    <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>
                      Pop. {loc.population.toLocaleString()}
                    </span>
                  )}
                </div>
              </div>

              {/* Description */}
              <div style={{ padding: '10px 16px', flex: 1 }}>
                {loc.description ? (
                  <p
                    style={{
                      fontSize: 12,
                      color: 'var(--color-parchment-mid)',
                      lineHeight: 1.6,
                      display: '-webkit-box',
                      WebkitLineClamp: 2,
                      WebkitBoxOrient: 'vertical',
                      overflow: 'hidden',
                    }}
                  >
                    {loc.description}
                  </p>
                ) : (
                  <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>
                    No description recorded.
                  </p>
                )}
              </div>

              {/* DM Notes */}
              {loc.dm_notes && (
                <div
                  style={{
                    padding: '8px 12px',
                    margin: '0 8px 8px',
                    borderRadius: 4,
                    background: 'rgba(139,30,30,0.08)',
                    border: '1px solid rgba(139,30,30,0.2)',
                  }}
                >
                  <p
                    style={{
                      fontSize: 11,
                      color: 'var(--color-parchment-dim)',
                      textTransform: 'uppercase',
                      letterSpacing: '0.08em',
                      marginBottom: 4,
                      fontWeight: 600,
                    }}
                  >
                    DM
                  </p>
                  <p
                    style={{
                      fontSize: 12,
                      color: '#fca5a5',
                      lineHeight: 1.5,
                      display: '-webkit-box',
                      WebkitLineClamp: 3,
                      WebkitBoxOrient: 'vertical',
                      overflow: 'hidden',
                    }}
                  >
                    {loc.dm_notes}
                  </p>
                </div>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
