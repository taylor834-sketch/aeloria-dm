import { createClient, type SupabaseClient } from '@supabase/supabase-js'

// Lazy-init public client: createClient is called on first .from() / .auth etc.,
// never at module load time (which would throw during Next.js static builds).
let _publicClient: SupabaseClient | null = null

export const supabase = new Proxy({} as SupabaseClient, {
  get(_, prop: string) {
    if (!_publicClient) {
      _publicClient = createClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
      )
    }
    const value = (_publicClient as any)[prop]
    return typeof value === 'function' ? value.bind(_publicClient) : value
  },
})

// Server-side only — service role key bypasses RLS.  Import only inside API routes.
export function createServiceClient(): SupabaseClient {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { persistSession: false } }
  )
}
