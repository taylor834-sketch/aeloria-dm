export const dynamic = 'force-dynamic'

import { NextRequest, NextResponse } from 'next/server'
import { createServiceClient } from '@/lib/supabase'

export async function POST(req: NextRequest) {
  try {
    const body = await req.json()
    const { session_number, title, played_at, raw_transcript } = body

    if (!session_number || !raw_transcript) {
      return NextResponse.json({ error: 'session_number and raw_transcript required' }, { status: 400 })
    }

    const supabase = createServiceClient()
    const { data, error } = await supabase
      .from('sessions')
      .insert({
        session_number,
        title,
        played_at,
        raw_transcript,
        processed: false,
      })
      .select('id')
      .single()

    if (error) throw error
    return NextResponse.json({ sessionId: data.id })
  } catch (err: any) {
    return NextResponse.json({ error: err.message }, { status: 500 })
  }
}

export async function GET() {
  const supabase = createServiceClient()
  const { data, error } = await supabase
    .from('sessions')
    .select('*')
    .order('session_number', { ascending: false })

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })
  return NextResponse.json(data)
}
