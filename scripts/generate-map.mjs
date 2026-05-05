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
Painterly illustrated top-down fantasy world map in the style of Inkarnate, 1792x1024 pixels wide.

The image shows ONE single large continent — like the size of Europe or Asia — filling most of
the frame from left edge to right edge and from top to nearly the bottom. The continent has a
solid connected interior. The ocean only appears as a strip at the very top and very bottom edges
of the image, and in two small corner areas. There are no large water channels cutting through
the continent. A cluster of 4-5 small rocky islands sits in the top-right ocean corner only.

TERRAIN ZONES across this large continent (left to right, top to bottom):
- TOP-LEFT CORNER: Dramatic jagged snow-capped mountain peaks with icy glaciers and grey
  stone faces. Lit side bright, shadow side dark. Avalanche paths visible.
- TOP-CENTER: Dense dark evergreen forest canopy seen from above — deep forest greens,
  misty at the edges, individual pine treetops visible.
- LEFT SIDE MIDDLE: Grey-brown desolate wasteland and marshes — cracked grey earth,
  dead skeletal trees, dark stagnant pools, patches of dark eerie fog.
- CENTER (the biggest zone): Rolling golden-tan grassy plains and farmland —
  warm amber and ochre fields, a winding river snaking southward.
- RIGHT SIDE: Cooler blue-grey hilly coastal terrain — stone ridges, grey-green scrub,
  a river delta near the coast.
- BOTTOM EDGE: Narrow warm teal/turquoise coastal strip with sandy beaches.

Inkarnate art style: rich painterly textures, terrain blends softly (no hard borders),
warm light from upper left, deep detailed mountains, beautiful forest canopy, hex grid on ocean.

MANDATORY — NO EXCEPTIONS:
No text. No words. No letters. No numbers. No labels. No place names anywhere in the image.
No city markers. No compass rose. No legend. No scale bar. No title.
Only pure beautiful terrain.
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
