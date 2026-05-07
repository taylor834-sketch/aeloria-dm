import { NextRequest, NextResponse } from 'next/server'
import fs from 'fs'
import path from 'path'

// Map quest slugs to campaign file paths
const QUEST_FILE_MAP: Record<string, string> = {
  'bell-at-thornwick':  'quests/main/bell-at-thornwick.md',
  'cracked-crown':      'quests/main/cracked-crown.md',
  'hungry-dark':        'quests/main/hungry-dark.md',
  'frost-and-blood':    'quests/main/frost-and-blood.md',
  'the-forgetting':     'quests/main/the-forgetting.md',
  'imperial-gambit':    'quests/main/imperial-gambit.md',
  'black-rose-thorns':  'quests/regional/black-rose-thorns.md',
  'fog-and-freedom':    'quests/regional/fog-and-freedom.md',
  'the-singing-ruins':  'quests/ashfields/the-singing-ruins.md',
  'the-vane-lands':     'quests/hearthlands/the-vane-lands.md',
  'the-fog-ships':      'quests/saltmere/the-fog-ships.md',
}

const CAMPAIGN_DIR = process.env.CAMPAIGN_DIR ?? 'C:\\Users\\taylo\\CampaignWriter'

export async function GET(
  _req: NextRequest,
  { params }: { params: { slug: string } }
) {
  const relativePath = QUEST_FILE_MAP[params.slug]
  if (!relativePath) {
    return NextResponse.json({ content: null }, { status: 200 })
  }

  try {
    const filePath = path.join(CAMPAIGN_DIR, relativePath)
    const content = fs.readFileSync(filePath, 'utf-8')
    return NextResponse.json({ content })
  } catch {
    return NextResponse.json({ content: null }, { status: 200 })
  }
}
