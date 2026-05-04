import Link from 'next/link'

export default function Home() {
  return (
    <main className="min-h-screen bg-stone-950 text-amber-100 font-serif flex flex-col items-center justify-center p-8">
      <div className="max-w-lg w-full text-center space-y-8">
        <div>
          <h1 className="text-5xl font-bold text-amber-400 tracking-widest mb-3">ELARYN</h1>
          <p className="text-amber-700 italic text-lg">A world 247 years rebuilt from ruin</p>
          <div className="mt-3 w-24 h-px bg-amber-800 mx-auto" />
        </div>

        <div className="grid grid-cols-1 gap-4 text-left">
          <Link href="/dm" className="group block bg-stone-900 border border-amber-900/40 rounded-lg p-5 hover:border-amber-700 transition-colors">
            <div className="flex items-center justify-between mb-2">
              <h2 className="text-lg font-bold text-amber-400 group-hover:text-amber-300">DM Dashboard</h2>
              <span className="text-amber-800 group-hover:text-amber-600">→</span>
            </div>
            <p className="text-sm text-amber-700 leading-relaxed">
              NPCs and relationship matrix, faction standings, quest tracker, session log. DM eyes only.
            </p>
          </Link>

          <Link href="/map" className="group block bg-stone-900 border border-amber-900/40 rounded-lg p-5 hover:border-amber-700 transition-colors">
            <div className="flex items-center justify-between mb-2">
              <h2 className="text-lg font-bold text-amber-400 group-hover:text-amber-300">World Map</h2>
              <span className="text-amber-800 group-hover:text-amber-600">→</span>
            </div>
            <p className="text-sm text-amber-700 leading-relaxed">
              Interactive map of Elaryn. Click any town or dungeon for full details and DM notes.
            </p>
          </Link>

          <Link href="/player" className="group block bg-stone-900 border border-amber-900/40 rounded-lg p-5 hover:border-amber-700 transition-colors">
            <div className="flex items-center justify-between mb-2">
              <h2 className="text-lg font-bold text-amber-400 group-hover:text-amber-300">Player View</h2>
              <span className="text-amber-800 group-hover:text-amber-600">→</span>
            </div>
            <p className="text-sm text-amber-700 leading-relaxed">
              Discovered map with fog of war, active quests, known NPCs, session journal.
            </p>
          </Link>

          <Link href="/dm/upload" className="group block bg-stone-900 border border-amber-900/40 rounded-lg p-5 hover:border-amber-700 transition-colors">
            <div className="flex items-center justify-between mb-2">
              <h2 className="text-lg font-bold text-amber-400 group-hover:text-amber-300">Upload Session</h2>
              <span className="text-amber-800 group-hover:text-amber-600">→</span>
            </div>
            <p className="text-sm text-amber-700 leading-relaxed">
              Paste a session transcript. Claude reads it and updates all NPCs, quests, relationships, and the map.
            </p>
          </Link>
        </div>

        <p className="text-xs text-amber-900">
          Built for the Elaryn campaign · Next.js + Supabase + Claude
        </p>
      </div>
    </main>
  )
}
