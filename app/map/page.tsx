'use client'

import { useEffect, useState } from 'react'
import dynamic from 'next/dynamic'
import { supabase } from '@/lib/supabase'
import type { Location } from '@/types/database'

// Leaflet must be loaded client-side only
const LeafletMap = dynamic(() => import('@/components/map/LeafletMap'), {
  ssr: false,
  loading: () => (
    <div className="w-full h-full flex items-center justify-center bg-stone-950">
      <span className="text-amber-600 font-serif italic">Unrolling the map…</span>
    </div>
  ),
})

export default function MapPage() {
  const [locations, setLocations] = useState<Location[]>([])
  const [selected, setSelected] = useState<Location | null>(null)
  const [filter, setFilter] = useState<string>('all')

  useEffect(() => {
    supabase
      .from('locations')
      .select('*')
      .order('is_major', { ascending: false })
      .then(({ data }) => {
        if (data) setLocations(data)
      })
  }, [])

  const filtered = filter === 'all'
    ? locations
    : locations.filter((l) => l.location_type === filter || l.region === filter)

  return (
    <div className="flex h-screen bg-stone-950 text-amber-100 font-serif overflow-hidden">
      {/* ── Sidebar ── */}
      <aside className="w-72 flex-shrink-0 border-r border-amber-900/40 flex flex-col overflow-hidden">
        <div className="p-4 border-b border-amber-900/40">
          <h1 className="text-xl font-bold text-amber-400 tracking-widest uppercase">Elaryn</h1>
          <p className="text-xs text-amber-700 mt-0.5">DM Map — 247 PA</p>
        </div>

        {/* Filter buttons */}
        <div className="p-3 border-b border-amber-900/30 flex flex-wrap gap-1.5">
          {['all', 'town', 'dungeon', 'Hearthlands', 'Ashfields', 'Verdant Reach', 'Frostmarch', 'Amber Expanse', 'Saltmere'].map((f) => (
            <button
              key={f}
              onClick={() => setFilter(f)}
              className={`text-xs px-2 py-0.5 rounded border transition-colors ${
                filter === f
                  ? 'bg-amber-700 border-amber-500 text-amber-100'
                  : 'bg-stone-900 border-amber-900/50 text-amber-600 hover:border-amber-700'
              }`}
            >
              {f}
            </button>
          ))}
        </div>

        {/* Location list */}
        <div className="flex-1 overflow-y-auto p-2 space-y-1">
          {filtered.map((loc) => (
            <button
              key={loc.id}
              onClick={() => setSelected(selected?.id === loc.id ? null : loc)}
              className={`w-full text-left px-3 py-2 rounded border text-sm transition-colors ${
                selected?.id === loc.id
                  ? 'bg-amber-900/50 border-amber-600 text-amber-100'
                  : 'bg-stone-900/40 border-amber-900/20 text-amber-300 hover:border-amber-800'
              }`}
            >
              <div className="flex items-center gap-2">
                <span className={`w-2 h-2 rounded-full flex-shrink-0 ${
                  loc.location_type === 'dungeon' ? 'bg-red-600' :
                  loc.is_major ? 'bg-amber-400' : 'bg-amber-700'
                }`} />
                <span className="truncate">{loc.name}</span>
                {loc.population && (
                  <span className="ml-auto text-xs text-amber-800 flex-shrink-0">
                    {loc.population >= 1000 ? `${(loc.population/1000).toFixed(1)}k` : loc.population}
                  </span>
                )}
              </div>
              <div className="text-xs text-amber-800 mt-0.5 pl-4">{loc.region}</div>
            </button>
          ))}
        </div>

        {/* Selected location detail */}
        {selected && (
          <div className="border-t border-amber-900/40 p-4 bg-stone-950/80 max-h-64 overflow-y-auto">
            <div className="flex items-start justify-between gap-2 mb-2">
              <h2 className="font-bold text-amber-400 leading-tight">{selected.name}</h2>
              <button
                onClick={() => setSelected(null)}
                className="text-amber-800 hover:text-amber-500 text-xs"
              >
                ✕
              </button>
            </div>
            <div className="text-xs text-amber-700 mb-2">
              {selected.region} · {selected.location_type}
              {selected.population && ` · pop. ${selected.population.toLocaleString()}`}
            </div>
            <p className="text-xs text-amber-200 leading-relaxed mb-3">{selected.description}</p>
            {selected.dm_notes && (
              <div className="bg-red-950/40 border-l-2 border-red-700 pl-2 py-1">
                <div className="text-xs text-red-400 font-bold mb-1">DM ONLY</div>
                <p className="text-xs text-red-300 leading-relaxed">{selected.dm_notes}</p>
              </div>
            )}
            <div className="mt-3 flex gap-2">
              <a
                href={`/dm?location=${selected.slug}`}
                className="text-xs px-2 py-1 bg-amber-900/50 border border-amber-700 rounded hover:bg-amber-800/50"
              >
                Open in DM Tool →
              </a>
            </div>
          </div>
        )}
      </aside>

      {/* ── Map ── */}
      <div className="flex-1 relative">
        <LeafletMap
          locations={locations}
          isDM={true}
          onLocationClick={setSelected}
        />
      </div>
    </div>
  )
}
