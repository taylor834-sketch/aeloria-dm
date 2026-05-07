'use client'

import { useEffect, useRef, useState } from 'react'
import type { Location } from '@/types/database'

interface LeafletMapProps {
  locations: Location[]
  discoveredIds?: Set<string>  // for player view fog-of-war
  isDM?: boolean
  onLocationClick?: (location: Location) => void
}

// Town type → icon color
const typeColors: Record<string, string> = {
  town:     '#d4a940',
  dungeon:  '#cc2200',
  landmark: '#4a8a4a',
  ruins:    '#7a6a5a',
}

// Map bounds match SVG viewBox 1000×700
const MAP_WIDTH  = 1000
const MAP_HEIGHT = 700

export default function LeafletMap({
  locations,
  discoveredIds,
  isDM = false,
  onLocationClick,
}: LeafletMapProps) {
  const mapRef    = useRef<HTMLDivElement>(null)
  const leafletRef = useRef<any>(null)
  const [selectedLocation, setSelectedLocation] = useState<Location | null>(null)

  useEffect(() => {
    if (!mapRef.current || leafletRef.current) return

    // Dynamic import — Leaflet must be client-side only
    import('leaflet').then(async (L) => {
      // Patch default icon path (Leaflet bug with webpack)
      delete (L.Icon.Default.prototype as any)._getIconUrl
      L.Icon.Default.mergeOptions({
        iconRetinaUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png',
        iconUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png',
        shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
      })

      // CRS.Simple: pixel coordinates, no projection
      const map = L.map(mapRef.current!, {
        crs: L.CRS.Simple,
        minZoom: -1,
        maxZoom: 3,
        zoomSnap: 0.25,
        attributionControl: false,
        zoomControl: true,
      })

      // Fit the SVG as the base layer using imageOverlay
      const bounds: L.LatLngBoundsLiteral = [[0, 0], [MAP_HEIGHT, MAP_WIDTH]]
      map.fitBounds(bounds)
      map.setMaxBounds([[-50, -50], [MAP_HEIGHT + 50, MAP_WIDTH + 50]])

      // SVG overlay as base layer
      const svgElement = document.createElementNS('http://www.w3.org/2000/svg', 'svg')
      svgElement.setAttribute('xmlns', 'http://www.w3.org/2000/svg')
      svgElement.setAttribute('viewBox', `0 0 ${MAP_WIDTH} ${MAP_HEIGHT}`)
      svgElement.style.width = '100%'
      svgElement.style.height = '100%'

      // Use a foreign object approach — embed an img that loads our SVG component
      // Instead, we use an SVG overlay via Leaflet's built-in SVGOverlay
      // The SVG content is inlined below as a data URI
      // Base map layer — prefer AI-generated PNG, fall back to SVG
      // Generate the PNG by running: node scripts/generate-map.mjs
      const hasPng = await new Promise<boolean>((resolve) => {
        const img = new Image()
        img.onload  = () => resolve(true)
        img.onerror = () => resolve(false)
        img.src = '/map/aeloria-map.png?' + Date.now()
      })
      const mapImageUrl = hasPng ? '/map/aeloria-map.png' : '/map/aeloria-base.svg'

      L.imageOverlay(mapImageUrl, bounds, {
        opacity: 1,
        interactive: false,
      }).addTo(map)

      // ── FOG OF WAR (player view only) ──
      if (!isDM && discoveredIds) {
        // Cover the entire map with a dark overlay
        const fogLayer = L.polygon(
          [
            [[-50, -50], [-50, MAP_WIDTH + 50], [MAP_HEIGHT + 50, MAP_WIDTH + 50], [MAP_HEIGHT + 50, -50]],
          ] as L.LatLngExpression[][],
          {
            color: 'transparent',
            fillColor: '#0d0a06',
            fillOpacity: 0.75,
            stroke: false,
          }
        ).addTo(map)

        // Cut holes in fog for discovered locations
        locations
          .filter((loc) => discoveredIds.has(loc.id))
          .forEach((loc) => {
            // Convert SVG coords (x,y) to Leaflet CRS.Simple (lat=y-flipped, lng=x)
            const cx = loc.map_x
            const cy = MAP_HEIGHT - loc.map_y
            const radius = loc.is_major ? 60 : 35

            // Draw a bright discovery circle
            L.circle([cy, cx], {
              radius,
              color: 'transparent',
              fillColor: 'transparent',
              fillOpacity: 0,
            }).addTo(map)

            // Soft edge glow to show discovery boundary
            L.circle([cy, cx], {
              radius: radius + 8,
              color: '#8b6914',
              weight: 1,
              fillColor: 'transparent',
              fillOpacity: 0,
              dashArray: '4,4',
              opacity: 0.4,
            }).addTo(map)
          })
      }

      // ── LOCATION MARKERS ──
      locations.forEach((loc) => {
        const isDiscovered = isDM || (discoveredIds?.has(loc.id) ?? false)
        const cx = loc.map_x
        const cy = MAP_HEIGHT - loc.map_y

        if (!isDiscovered) return

        const color = typeColors[loc.location_type] ?? '#d4a940'
        const radius = loc.is_major ? 10 : 7

        const marker = L.circleMarker([cy, cx], {
          radius,
          color: '#1a0a00',
          weight: 1.5,
          fillColor: color,
          fillOpacity: 0.9,
        }).addTo(map)

        const popupContent = `
          <div style="font-family:Georgia,serif;max-width:220px;padding:4px">
            <div style="font-weight:bold;font-size:13px;color:#3d1f00;margin-bottom:4px">${loc.name}</div>
            <div style="font-size:11px;color:#666;margin-bottom:6px">${loc.region} · ${loc.location_type}${loc.population ? ` · pop. ${loc.population.toLocaleString()}` : ''}</div>
            <div style="font-size:11px;color:#222;line-height:1.4">${loc.description ?? ''}</div>
            ${isDM && loc.dm_notes ? `<div style="margin-top:6px;padding:4px;background:#fff8f0;border-left:3px solid #cc4400;font-size:10px;color:#663300"><strong>DM:</strong> ${loc.dm_notes}</div>` : ''}
          </div>
        `

        marker.bindPopup(popupContent, {
          maxWidth: 240,
          className: 'aeloria-popup',
        })

        marker.on('click', () => {
          onLocationClick?.(loc)
          setSelectedLocation(loc)
        })
      })

      // Store reference
      leafletRef.current = map
    })

    return () => {
      leafletRef.current?.remove()
      leafletRef.current = null
    }
  }, []) // eslint-disable-line react-hooks/exhaustive-deps

  return (
    <div className="relative w-full h-full">
      <div ref={mapRef} className="w-full h-full" />
      <style>{`
        .aeloria-popup .leaflet-popup-content-wrapper {
          background: #fef9ec;
          border: 1.5px solid #8b6914;
          border-radius: 4px;
          box-shadow: 0 2px 12px rgba(0,0,0,0.4);
        }
        .aeloria-popup .leaflet-popup-tip {
          background: #fef9ec;
        }
        .leaflet-container {
          background: #1a1008;
          cursor: crosshair;
        }
        .leaflet-zoom-box {
          border-color: #8b6914;
        }
      `}</style>
    </div>
  )
}
