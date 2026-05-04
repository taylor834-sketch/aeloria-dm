/**
 * generate-map.mjs
 * Calls DALL-E 3 to generate a high-quality Aeloria fantasy map,
 * downloads the result, and saves it to public/map/aeloria-map.png
 *
 * Usage:
 *   OPENAI_API_KEY=sk-... node scripts/generate-map.mjs
 *   — or add OPENAI_API_KEY to .env.local and run:
 *   node scripts/generate-map.mjs
 */

import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const OUTPUT_PATH = path.join(__dirname, '..', 'public', 'map', 'aeloria-map.png')

// ── Load API key ──────────────────────────────────────────────────────────────
let apiKey = process.env.OPENAI_API_KEY

if (!apiKey) {
  // Try to read from .env.local
  try {
    const envPath = path.join(__dirname, '..', '.env.local')
    const envContent = fs.readFileSync(envPath, 'utf-8')
    const match = envContent.match(/^OPENAI_API_KEY=(.+)$/m)
    if (match) apiKey = match[1].trim()
  } catch { /* no .env.local */ }
}

if (!apiKey) {
  console.error('❌  No OPENAI_API_KEY found.')
  console.error('    Add OPENAI_API_KEY=sk-... to .env.local or set it as an env variable.')
  process.exit(1)
}

// ── Prompt ────────────────────────────────────────────────────────────────────
// Carefully engineered for DALL-E 3 to produce an Inkarnate-quality map
// with Aeloria's exact regional geography.
const PROMPT = `
A breathtakingly detailed painterly digital fantasy world map illustration,
top-down bird's-eye cartographic view in the style of Inkarnate and Wonderdraft.
Professional fantasy game map, rich hand-painted terrain textures.

THE CONTINENT occupies most of the image, surrounded by dark deep ocean water
with subtle hex-grid wave lines and a few decorative sailing ships and sea serpents.

GEOGRAPHY (described west-to-east, north-to-south):
- NORTHWEST CORNER: A dramatic snow-covered mountain range with jagged icy peaks,
  blue-white glaciers, rocky grey stone faces, dense snowfall shadings, avalanche paths.
  Mountains rendered as classic illustrated side-facing ridgelines with lit and shadow faces.
- NORTH-CENTER: A vast ancient dark evergreen forest — dense pine and fir trees,
  deep forest greens fading to black in the canopy depths, misty atmosphere at the edges,
  a few glades visible from above.
- WEST-CENTER: A bleak grey-brown ash wasteland with marshes, skeletal dead trees,
  cracked dried earth, patches of grey fog, reeds and stagnant pools. Eerie and desolate.
- CENTER: Broad golden-tan fertile plains and farmland — rolling hills, patches of
  cultivated fields in warm amber and ochre tones, a major river running south.
- EAST: Blue-grey slate-coloured coastal hilly territories — stone bluffs, grey-green
  scrubland, a large river system, slightly cooler tone than the central plains.
- SOUTH COAST: A narrow teal-colored tropical/subtropical coastal strip — sandy beaches,
  turquoise shallow water meeting the coast, lush low vegetation.
- NORTHEAST SEA: A scattered cluster of 4-5 small rocky volcanic-looking islands
  with white foam coastlines, surrounded by slightly lighter shallow water.

ART STYLE:
Painterly soft-edged terrain blending (regions fade into each other, not hard polygon borders).
Rich warm parchment undertones on the land. Deep navy-blue ocean with subtle depth gradient.
Illustrated mountain ranges with proper lit and shadow faces. Individual tree canopy textures
visible from above in the forest. Hand-painted look with visible brush strokes.
Dramatic lighting from upper-left.

CRITICAL: Absolutely no text, no labels, no place names, no written words anywhere on the image.
No city dots or town markers. No coordinate grids on land. No legend box. No compass rose.
No title. Pure terrain illustration only. The entire image should be filled with terrain.
`.trim()

// ── Call DALL-E 3 ─────────────────────────────────────────────────────────────
console.log('🗺  Calling DALL-E 3 (1792×1024)… this takes about 15–30 seconds…')

const response = await fetch('https://api.openai.com/v1/images/generations', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    Authorization: `Bearer ${apiKey}`,
  },
  body: JSON.stringify({
    model: 'dall-e-3',
    prompt: PROMPT,
    n: 1,
    size: '1792x1024',   // Largest landscape DALL-E 3 supports
    quality: 'hd',       // HD mode for maximum detail
    response_format: 'url',
  }),
})

if (!response.ok) {
  const err = await response.json().catch(() => ({}))
  console.error('❌  DALL-E 3 API error:', err?.error?.message ?? response.statusText)
  process.exit(1)
}

const data = await response.json()
const imageUrl = data.data?.[0]?.url

if (!imageUrl) {
  console.error('❌  No image URL in response:', JSON.stringify(data))
  process.exit(1)
}

console.log('✅  Image generated! Downloading…')

// ── Download the image ────────────────────────────────────────────────────────
const imgResponse = await fetch(imageUrl)
if (!imgResponse.ok) {
  console.error('❌  Failed to download image:', imgResponse.statusText)
  process.exit(1)
}

const buffer = Buffer.from(await imgResponse.arrayBuffer())
fs.writeFileSync(OUTPUT_PATH, buffer)

const sizeKB = Math.round(buffer.length / 1024)
console.log(`✅  Saved to public/map/aeloria-map.png  (${sizeKB} KB)`)
console.log('')
console.log('Next step: commit the PNG and push — Vercel will deploy it automatically.')
console.log('  git add public/map/aeloria-map.png && git commit -m "Add AI-generated Aeloria map" && git push')
