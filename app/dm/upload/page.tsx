'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'

export default function UploadPage() {
  const router = useRouter()
  const [transcript, setTranscript] = useState('')
  const [sessionNumber, setSessionNumber] = useState('')
  const [sessionTitle, setSessionTitle] = useState('')
  const [playedAt, setPlayedAt] = useState(new Date().toISOString().split('T')[0])
  const [status, setStatus] = useState<'idle' | 'saving' | 'processing' | 'done' | 'error'>('idle')
  const [result, setResult] = useState<any>(null)
  const [errorMsg, setErrorMsg] = useState('')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!transcript.trim() || !sessionNumber) return

    setStatus('saving')
    setErrorMsg('')

    try {
      // 1. Save session to Supabase
      const saveRes = await fetch('/api/sessions', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          session_number: parseInt(sessionNumber),
          title: sessionTitle || null,
          played_at: playedAt,
          raw_transcript: transcript,
        }),
      })

      if (!saveRes.ok) throw new Error('Failed to save session')
      const { sessionId } = await saveRes.json()

      // 2. Process with Claude
      setStatus('processing')
      const processRes = await fetch('/api/process-session', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ sessionId }),
      })

      if (!processRes.ok) throw new Error('Claude processing failed')
      const data = await processRes.json()

      setResult(data)
      setStatus('done')
    } catch (err: any) {
      setErrorMsg(err.message ?? 'Something went wrong')
      setStatus('error')
    }
  }

  const handleFileUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return
    const reader = new FileReader()
    reader.onload = (ev) => setTranscript(ev.target?.result as string)
    reader.readAsText(file)
  }

  return (
    <div className="min-h-screen bg-stone-950 text-amber-100 font-serif">
      <header className="border-b border-amber-900/40 px-6 py-4 flex items-center justify-between">
        <div>
          <h1 className="text-xl font-bold text-amber-400 tracking-widest">UPLOAD SESSION</h1>
          <p className="text-xs text-amber-700">Claude reads the transcript and updates all records</p>
        </div>
        <a href="/dm" className="text-sm text-amber-600 hover:text-amber-400">← Back to Dashboard</a>
      </header>

      <main className="max-w-3xl mx-auto p-6">
        {status === 'done' && result ? (
          <ProcessingResult result={result} onContinue={() => router.push('/dm')} />
        ) : (
          <form onSubmit={handleSubmit} className="space-y-5">
            {/* Session metadata */}
            <div className="grid grid-cols-3 gap-4">
              <div>
                <label className="block text-xs text-amber-700 mb-1 uppercase tracking-wider">Session #</label>
                <input
                  type="number"
                  value={sessionNumber}
                  onChange={(e) => setSessionNumber(e.target.value)}
                  required
                  placeholder="1"
                  className="w-full px-3 py-2 bg-stone-900 border border-amber-900/40 rounded text-amber-200 focus:outline-none focus:border-amber-700"
                />
              </div>
              <div>
                <label className="block text-xs text-amber-700 mb-1 uppercase tracking-wider">Title (optional)</label>
                <input
                  value={sessionTitle}
                  onChange={(e) => setSessionTitle(e.target.value)}
                  placeholder="The Road to Duskwall"
                  className="w-full px-3 py-2 bg-stone-900 border border-amber-900/40 rounded text-amber-200 focus:outline-none focus:border-amber-700"
                />
              </div>
              <div>
                <label className="block text-xs text-amber-700 mb-1 uppercase tracking-wider">Date Played</label>
                <input
                  type="date"
                  value={playedAt}
                  onChange={(e) => setPlayedAt(e.target.value)}
                  className="w-full px-3 py-2 bg-stone-900 border border-amber-900/40 rounded text-amber-200 focus:outline-none focus:border-amber-700"
                />
              </div>
            </div>

            {/* File upload or paste */}
            <div>
              <div className="flex items-center justify-between mb-1">
                <label className="text-xs text-amber-700 uppercase tracking-wider">Transcript</label>
                <label className="text-xs text-amber-600 cursor-pointer hover:text-amber-400">
                  Upload .txt file
                  <input type="file" accept=".txt,.md" onChange={handleFileUpload} className="hidden" />
                </label>
              </div>
              <textarea
                value={transcript}
                onChange={(e) => setTranscript(e.target.value)}
                placeholder="Paste the session transcript here, or upload a .txt file above.

The AI will extract:
• Which locations the players visited
• NPC interactions and attitude changes
• Quest updates (started, progressed, completed)
• Faction reputation changes
• New information discovered
• Session summary"
                rows={16}
                className="w-full px-4 py-3 bg-stone-900 border border-amber-900/40 rounded text-amber-200 text-sm leading-relaxed placeholder-amber-900 focus:outline-none focus:border-amber-700 resize-none font-mono"
              />
              <div className="text-xs text-amber-800 mt-1 text-right">
                {transcript.length > 0 ? `${transcript.length.toLocaleString()} characters` : 'No transcript yet'}
              </div>
            </div>

            {errorMsg && (
              <div className="bg-red-950/40 border border-red-800 rounded p-3 text-red-300 text-sm">
                {errorMsg}
              </div>
            )}

            <div className="flex items-center gap-4">
              <button
                type="submit"
                disabled={status !== 'idle' && status !== 'error'}
                className="px-6 py-3 bg-amber-800 border border-amber-600 rounded font-medium hover:bg-amber-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
              >
                {status === 'saving'     ? 'Saving…' :
                 status === 'processing' ? 'Claude is reading…' :
                 'Process Session →'}
              </button>

              {(status === 'saving' || status === 'processing') && (
                <div className="text-sm text-amber-600 italic">
                  {status === 'saving'
                    ? 'Saving transcript to database…'
                    : 'Claude is extracting events, relationships, and discoveries…'}
                </div>
              )}
            </div>

            {(status === 'saving' || status === 'processing') && (
              <div className="bg-stone-900/50 border border-amber-900/30 rounded p-4">
                <div className="flex items-center gap-3 mb-2">
                  <div className="w-2 h-2 bg-amber-500 rounded-full animate-pulse" />
                  <span className="text-sm text-amber-400">
                    {status === 'processing' ? 'Claude is analyzing your session…' : 'Saving…'}
                  </span>
                </div>
                {status === 'processing' && (
                  <ul className="text-xs text-amber-700 space-y-1 pl-5 list-disc">
                    <li>Identifying visited locations and first discoveries</li>
                    <li>Reading NPC interactions and attitude shifts</li>
                    <li>Tracking quest updates and completions</li>
                    <li>Noting faction reputation changes</li>
                    <li>Writing session summary</li>
                  </ul>
                )}
              </div>
            )}
          </form>
        )}
      </main>
    </div>
  )
}

function ProcessingResult({ result, onContinue }: { result: any; onContinue: () => void }) {
  return (
    <div className="space-y-6">
      <div className="bg-emerald-950/40 border border-emerald-800 rounded p-4 flex items-start gap-3">
        <span className="text-emerald-400 text-lg">✓</span>
        <div>
          <p className="font-medium text-emerald-300">Session processed successfully</p>
          <p className="text-sm text-emerald-600 mt-0.5">All records have been updated.</p>
        </div>
      </div>

      {result.summary && (
        <div className="bg-stone-900/50 border border-amber-900/30 rounded p-5">
          <h3 className="text-xs font-bold text-amber-700 uppercase tracking-wider mb-3">Session Summary</h3>
          <p className="text-sm text-amber-200 leading-relaxed whitespace-pre-wrap">{result.summary}</p>
        </div>
      )}

      <div className="grid grid-cols-2 gap-4">
        {result.changes?.locations?.length > 0 && (
          <div className="bg-stone-900/50 border border-amber-900/20 rounded p-4">
            <h3 className="text-xs font-bold text-amber-700 uppercase tracking-wider mb-2">
              Locations Visited ({result.changes.locations.length})
            </h3>
            <ul className="text-sm text-amber-300 space-y-1">
              {result.changes.locations.map((l: string, i: number) => (
                <li key={i}>{l}</li>
              ))}
            </ul>
          </div>
        )}
        {result.changes?.relationships?.length > 0 && (
          <div className="bg-stone-900/50 border border-amber-900/20 rounded p-4">
            <h3 className="text-xs font-bold text-amber-700 uppercase tracking-wider mb-2">
              Relationship Changes ({result.changes.relationships.length})
            </h3>
            <ul className="text-sm space-y-1">
              {result.changes.relationships.map((r: any, i: number) => (
                <li key={i} className={r.delta > 0 ? 'text-green-400' : r.delta < 0 ? 'text-red-400' : 'text-amber-400'}>
                  {r.npc} ↔ {r.player}: {r.delta > 0 ? '+' : ''}{r.delta} ({r.summary})
                </li>
              ))}
            </ul>
          </div>
        )}
        {result.changes?.quests?.length > 0 && (
          <div className="bg-stone-900/50 border border-amber-900/20 rounded p-4">
            <h3 className="text-xs font-bold text-amber-700 uppercase tracking-wider mb-2">
              Quest Updates ({result.changes.quests.length})
            </h3>
            <ul className="text-sm text-amber-300 space-y-1">
              {result.changes.quests.map((q: any, i: number) => (
                <li key={i}>{q.title}: {q.update}</li>
              ))}
            </ul>
          </div>
        )}
        {result.changes?.factions?.length > 0 && (
          <div className="bg-stone-900/50 border border-amber-900/20 rounded p-4">
            <h3 className="text-xs font-bold text-amber-700 uppercase tracking-wider mb-2">
              Faction Changes ({result.changes.factions.length})
            </h3>
            <ul className="text-sm space-y-1">
              {result.changes.factions.map((f: any, i: number) => (
                <li key={i} className={f.delta > 0 ? 'text-green-400' : 'text-red-400'}>
                  {f.faction} / {f.player}: {f.delta > 0 ? '+' : ''}{f.delta}
                </li>
              ))}
            </ul>
          </div>
        )}
      </div>

      <button
        onClick={onContinue}
        className="px-6 py-3 bg-amber-800 border border-amber-600 rounded hover:bg-amber-700 transition-colors"
      >
        Back to Dashboard →
      </button>
    </div>
  )
}
