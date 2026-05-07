/**
 * push-sql.mjs — run pending Supabase SQL via the Management API
 *
 * Usage:
 *   node scripts/push-sql.mjs
 *
 * Requires in .env.local:
 *   NEXT_PUBLIC_SUPABASE_URL=https://mgdfwmlvxtyotvubkloe.supabase.co
 *   SUPABASE_PAT=sbp_xxxxxxxxxxxxxxxxxxxx
 *
 * Get your PAT at: https://supabase.com/dashboard/account/tokens
 * (Account → Access Tokens → Generate new token)
 */

import { readFileSync } from 'fs'
import { fileURLToPath } from 'url'
import path from 'path'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const root = path.resolve(__dirname, '..')

// load .env.local
const envLines = readFileSync(path.join(root, '.env.local'), 'utf8').split('\n')
const env = {}
for (const line of envLines) {
  const m = line.match(/^([^#=]+)=(.*)$/)
  if (m) env[m[1].trim()] = m[2].trim()
}

const SUPABASE_URL = env['NEXT_PUBLIC_SUPABASE_URL'] || 'https://mgdfwmlvxtyotvubkloe.supabase.co'
const PAT = env['SUPABASE_PAT']

if (!PAT) {
  console.error(`
❌  Missing SUPABASE_PAT in .env.local

1. Go to: https://supabase.com/dashboard/account/tokens
2. Click "Generate new token", name it "elaryn-dm"
3. Copy the token (starts with sbp_)
4. Add this line to C:\\Users\\taylo\\elaryn-dm\\.env.local:
     SUPABASE_PAT=sbp_xxxxxxxxxxxxxxxxxxxx
5. Run this script again
`)
  process.exit(1)
}

const PROJECT_REF = SUPABASE_URL.match(/https:\/\/([^.]+)\.supabase\.co/)?.[1]
if (!PROJECT_REF) {
  console.error('❌  Could not parse project ref from SUPABASE_URL')
  process.exit(1)
}

const SQL_FILES = [
  'supabase/expand-quest-sixty-years.sql',
  'supabase/seed-town-quests.sql',
  'supabase/seed-town-quests-2.sql',
  'supabase/patch-quest-dm-notes.sql',
]

async function runSQL(label, sql) {
  process.stdout.write(`\n▶  Running: ${label} ... `)

  const res = await fetch(`https://api.supabase.com/v1/projects/${PROJECT_REF}/database/query`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${PAT}`,
    },
    body: JSON.stringify({ query: sql }),
  })

  if (!res.ok) {
    const text = await res.text()
    console.error(`\n  ✗ HTTP ${res.status}: ${text}`)
    return false
  }

  console.log('✓')
  return true
}

let allOk = true
for (const file of SQL_FILES) {
  let sql
  try {
    sql = readFileSync(path.join(root, file), 'utf8')
  } catch {
    console.error(`\n✗ Could not read ${file}`)
    allOk = false
    continue
  }
  const ok = await runSQL(file, sql)
  if (!ok) allOk = false
}

console.log(allOk
  ? '\n✅  All done — refresh the quest board to see the new quests.'
  : '\n⚠️  Some files failed. Fallback: paste supabase/run-pending.sql into\n   https://supabase.com/dashboard/project/' + PROJECT_REF + '/sql/new'
)
