import { NextRequest, NextResponse } from 'next/server'
import { createServiceClient } from '@/lib/supabase'

export const dynamic = 'force-dynamic'

// Quest extended notes now live in Supabase (quests.extended_notes column)
// This route is kept for backwards compatibility but reads from DB not filesystem
export async function GET(
  _req: NextRequest,
  context: { params: Promise<{ slug: string }> }
) {
  const { slug } = await context.params
  const db = createServiceClient()

  const { data } = await db
    .from('quests')
    .select('extended_notes')
    .eq('slug', slug)
    .single()

  return NextResponse.json({ content: (data as any)?.extended_notes ?? null })
}
