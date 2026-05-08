'use client'

import { useEffect, useState, useRef, useCallback } from 'react'
import { useParams } from 'next/navigation'
import Link from 'next/link'
import { supabase } from '@/lib/supabase'
import type { Quest, NPC, NPCQuestLink } from '@/types/database'
import {
  ArrowLeft,
  BookOpen,
  Clock,
  ChevronDown,
  ChevronRight,
  Check,
  Plus,
  Trash2,
  Users,
  Play,
  Square,
  RotateCcw,
} from 'lucide-react'

// ── Markdown parser ───────────────────────────────────────────────────────────

type SectionType = 'setup' | 'complication' | 'resolution' | 'npc' | 'backup' | 'pressure-test' | 'other'

interface ParsedSection {
  label: string
  content: string
  type: SectionType
}

interface QuestContent {
  readAloud: string | null
  meta: string | null
  sections: ParsedSection[]
  checklistSuggestions: string[]
}

function classifyLabel(label: string): SectionType {
  const l = label.toLowerCase()
  if (l.startsWith('setup')) return 'setup'
  if (l.startsWith('the complication') || l.startsWith('what they found')) return 'complication'
  if (l.startsWith('resolution') || l.startsWith('what happens') || l.startsWith('what works') || l.startsWith('the decision')) return 'resolution'
  if (l.startsWith('key npc') || l.startsWith('the npc')) return 'npc'
  if (l.startsWith('backup path')) return 'backup'
  if (l.startsWith('pressure test')) return 'pressure-test'
  return 'other'
}

function extractChecklistSuggestions(text: string): string[] {
  const suggestions: string[] = []
  const dcPattern = /DC\s+(\d+)\s+(\w+)/g
  let match: RegExpExecArray | null

  while ((match = dcPattern.exec(text)) !== null) {
    const dc = match[1]
    const skill = match[2]
    const idx = match.index
    // grab ~40 chars of context after the match
    const context = text.slice(idx + match[0].length, idx + match[0].length + 60)
      .replace(/\n/g, ' ')
      .replace(/\*\*/g, '')
      .trim()
    const contextWords = context.split(/\s+/).slice(0, 5).join(' ')
    const label = contextWords ? `DC ${dc} ${skill} — ${contextWords}` : `DC ${dc} ${skill}`
    suggestions.push(label.replace(/[,;]$/, '').trim())
  }

  return [...new Set(suggestions)].slice(0, 8)
}

export function parseQuestContent(markdown: string): QuestContent {
  const lines = markdown.split('\n')
  const readAloudLines: string[] = []
  const sections: ParsedSection[] = []
  let meta: string | null = null

  // Collect blockquote lines (read aloud)
  for (const line of lines) {
    if (line.startsWith('> ')) {
      const stripped = line
        .replace(/^> /, '')
        .replace(/^\*\*Read Aloud:\*\*\s*/i, '')
        .replace(/^\*+/, '')
        .replace(/\*+$/, '')
        .trim()
      if (stripped) readAloudLines.push(stripped)
    }
  }

  // Split into paragraphs
  const paragraphs = markdown.split(/\n\n+/).map((p) => p.trim()).filter(Boolean)

  for (const para of paragraphs) {
    // Skip blockquote-only paragraphs
    if (para.split('\n').every((l) => l.startsWith('> '))) continue

    // Detect bold label at start: **Label:** content
    const boldMatch = para.match(/^\*\*([^*]+):\*\*\s*([\s\S]*)/)
    if (boldMatch) {
      const label = boldMatch[1].trim()
      const content = boldMatch[2].trim()
      const type = classifyLabel(label)
      sections.push({ label, content, type })
      continue
    }

    // Detect meta line (Type/Length/Levels)
    if (!meta && /Type:|Length:|Levels?:/i.test(para) && para.length < 200) {
      meta = para.replace(/\*\*/g, '').trim()
    }
  }

  const checklistSuggestions = extractChecklistSuggestions(markdown)

  return {
    readAloud: readAloudLines.length > 0 ? readAloudLines.join('\n') : null,
    meta,
    sections,
    checklistSuggestions,
  }
}

// ── Types ─────────────────────────────────────────────────────────────────────

interface ChecklistItem {
  id: string
  text: string
  checked: boolean
}

interface QuestNPC extends NPC {
  link_role?: string | null
}

// ── Helpers ───────────────────────────────────────────────────────────────────

function Spinner() {
  return (
    <div className="flex items-center justify-center h-64">
      <div className="w-8 h-8 rounded-full border-2 animate-spin"
        style={{ borderColor: 'var(--color-border)', borderTopColor: 'var(--color-gold)' }} />
    </div>
  )
}

function formatTime(seconds: number): string {
  const h = Math.floor(seconds / 3600)
  const m = Math.floor((seconds % 3600) / 60)
  const s = seconds % 60
  if (h > 0) return `${h}:${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`
  return `${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`
}

function isTimeSensitive(text: string): boolean {
  return /\b(clock|countdown|day\b|days\b|week\b|weeks\b|expires|expir|window|deteriorat|dying|urgent|ticking)\b/i.test(text)
}

function stripMd(text: string): string {
  return text
    .replace(/\*\*(.+?)\*\*/g, '$1')
    .replace(/\*(.+?)\*/g, '$1')
    .replace(/^[#>]+\s?/gm, '')
    .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
    .trim()
}

// ── Sub-components ────────────────────────────────────────────────────────────

function CollapsibleSection({
  label,
  children,
  defaultOpen = false,
  style,
}: {
  label: string
  children: React.ReactNode
  defaultOpen?: boolean
  style?: React.CSSProperties
}) {
  const [open, setOpen] = useState(defaultOpen)
  return (
    <div style={{ borderRadius: 6, overflow: 'hidden', ...style }}>
      <button
        onClick={() => setOpen((o) => !o)}
        className="w-full text-left"
        style={{
          display: 'flex', alignItems: 'center', justifyContent: 'space-between',
          padding: '10px 14px',
          background: 'rgba(74,58,40,0.15)',
          border: '1px solid var(--color-border)',
          borderBottom: open ? 'none' : '1px solid var(--color-border)',
          borderRadius: open ? '6px 6px 0 0' : 6,
          cursor: 'pointer',
        }}
      >
        <span className="font-display" style={{ fontSize: 12, fontWeight: 600, color: 'var(--color-parchment-mid)', letterSpacing: '0.06em', textTransform: 'uppercase' }}>
          {label}
        </span>
        {open ? <ChevronDown size={13} style={{ color: 'var(--color-parchment-dim)' }} /> : <ChevronRight size={13} style={{ color: 'var(--color-parchment-dim)' }} />}
      </button>
      {open && (
        <div style={{
          padding: '12px 14px',
          background: 'rgba(26,23,20,0.6)',
          border: '1px solid var(--color-border)',
          borderTop: 'none',
          borderRadius: '0 0 6px 6px',
        }}>
          {children}
        </div>
      )}
    </div>
  )
}

function ContentText({ text }: { text: string }) {
  const paras = text.split(/\n\n+/).filter(Boolean)
  if (paras.length === 0) return null
  return (
    <>
      {paras.map((p, i) => {
        const t = p.trim()
        if (t.startsWith('- ') || t.includes('\n- ')) {
          const items = t.split('\n').filter((l) => l.trim())
          return (
            <ul key={i} style={{ paddingLeft: 16, margin: '4px 0' }}>
              {items.map((item, j) => (
                <li key={j} style={{ fontSize: 13, color: 'var(--color-parchment-mid)', lineHeight: 1.7, listStyleType: 'disc' }}>
                  {stripMd(item.replace(/^-\s*/, ''))}
                </li>
              ))}
            </ul>
          )
        }
        return (
          <p key={i} style={{ fontSize: 13, color: 'var(--color-parchment-mid)', lineHeight: 1.8, marginBottom: i < paras.length - 1 ? 8 : 0 }}>
            {stripMd(t)}
          </p>
        )
      })}
    </>
  )
}

// ── Checklist ─────────────────────────────────────────────────────────────────

function Checklist({ slug, suggestions }: { slug: string; suggestions: string[] }) {
  const storageKey = `quest-checklist-${slug}`
  const [items, setItems] = useState<ChecklistItem[]>([])
  const [newText, setNewText] = useState('')
  const inputRef = useRef<HTMLInputElement>(null)

  // Load from localStorage
  useEffect(() => {
    try {
      const stored = localStorage.getItem(storageKey)
      if (stored) {
        const parsed = JSON.parse(stored) as ChecklistItem[]
        setItems(parsed)
      } else if (suggestions.length > 0) {
        // Pre-populate with suggestions
        const defaults: ChecklistItem[] = suggestions.map((s, i) => ({
          id: `default-${i}`,
          text: s,
          checked: false,
        }))
        setItems(defaults)
        localStorage.setItem(storageKey, JSON.stringify(defaults))
      }
    } catch {
      // ignore parse errors
    }
  }, [storageKey, suggestions])

  function persist(next: ChecklistItem[]) {
    setItems(next)
    localStorage.setItem(storageKey, JSON.stringify(next))
  }

  function toggle(id: string) {
    persist(items.map((item) => item.id === id ? { ...item, checked: !item.checked } : item))
  }

  function addItem() {
    const text = newText.trim()
    if (!text) return
    const next: ChecklistItem[] = [...items, { id: `item-${Date.now()}`, text, checked: false }]
    persist(next)
    setNewText('')
    inputRef.current?.focus()
  }

  function clearAll() {
    persist([])
  }

  function removeItem(id: string) {
    persist(items.filter((item) => item.id !== id))
  }

  return (
    <div>
      <div className="flex items-center justify-between mb-2">
        <p style={{ fontSize: 10, fontWeight: 600, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em' }}>
          At-Table Checklist
        </p>
        {items.length > 0 && (
          <button onClick={clearAll}
            style={{ fontSize: 10, color: 'var(--color-parchment-dim)', background: 'none', border: 'none', cursor: 'pointer', display: 'flex', alignItems: 'center', gap: 3 }}>
            <Trash2 size={10} /> Clear All
          </button>
        )}
      </div>

      <div className="flex flex-col gap-1 mb-2">
        {items.length === 0 && (
          <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', fontStyle: 'italic', padding: '6px 0' }}>
            No items yet — add some below.
          </p>
        )}
        {items.map((item) => (
          <div key={item.id}
            style={{
              display: 'flex', alignItems: 'flex-start', gap: 8,
              padding: '5px 8px',
              borderRadius: 4,
              background: item.checked ? 'rgba(42,138,72,0.05)' : 'rgba(74,58,40,0.1)',
              opacity: item.checked ? 0.5 : 1,
              transition: 'opacity 0.15s',
            }}>
            <button onClick={() => toggle(item.id)}
              style={{
                width: 16, height: 16, minWidth: 16,
                borderRadius: 3,
                border: item.checked ? '1px solid rgba(42,138,72,0.5)' : '1px solid var(--color-border-bright)',
                background: item.checked ? 'rgba(42,138,72,0.2)' : 'transparent',
                color: item.checked ? '#4ade80' : 'transparent',
                cursor: 'pointer',
                display: 'flex', alignItems: 'center', justifyContent: 'center',
                padding: 0, marginTop: 1, flexShrink: 0,
              }}>
              {item.checked && <Check size={10} />}
            </button>
            <span style={{
              fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.5, flex: 1,
              textDecoration: item.checked ? 'line-through' : 'none',
            }}>
              {item.text}
            </span>
            <button onClick={() => removeItem(item.id)}
              style={{ color: 'var(--color-parchment-dim)', background: 'none', border: 'none', cursor: 'pointer', padding: 0, opacity: 0.5, flexShrink: 0, marginTop: 2 }}>
              <Trash2 size={10} />
            </button>
          </div>
        ))}
      </div>

      {/* Add item */}
      <div className="flex gap-1">
        <input
          ref={inputRef}
          value={newText}
          onChange={(e) => setNewText(e.target.value)}
          onKeyDown={(e) => { if (e.key === 'Enter') addItem() }}
          placeholder="Add item…"
          style={{
            flex: 1,
            background: 'var(--color-surface)',
            border: '1px solid var(--color-border)',
            borderRadius: 4,
            padding: '5px 8px',
            color: 'var(--color-parchment)',
            fontSize: 12,
            outline: 'none',
            fontFamily: 'var(--font-body)',
          }}
        />
        <button onClick={addItem}
          style={{
            padding: '5px 8px', borderRadius: 4,
            background: 'rgba(201,160,68,0.1)',
            border: '1px solid rgba(201,160,68,0.2)',
            color: 'var(--color-gold-dim)',
            cursor: 'pointer', display: 'flex', alignItems: 'center',
          }}>
          <Plus size={13} />
        </button>
      </div>
    </div>
  )
}

// ── Session Timer ─────────────────────────────────────────────────────────────

function SessionTimer({ slug }: { slug: string }) {
  const startKey = `quest-timer-start-${slug}`
  const [running, setRunning] = useState(false)
  const [elapsed, setElapsed] = useState(0)
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null)

  const tick = useCallback(() => {
    try {
      const stored = localStorage.getItem(startKey)
      if (stored) {
        const start = parseInt(stored, 10)
        setElapsed(Math.floor((Date.now() - start) / 1000))
      }
    } catch { /* ignore */ }
  }, [startKey])

  useEffect(() => {
    // Restore from localStorage on mount
    try {
      const stored = localStorage.getItem(startKey)
      if (stored) {
        setRunning(true)
        tick()
      }
    } catch { /* ignore */ }
  }, [startKey, tick])

  useEffect(() => {
    if (running) {
      intervalRef.current = setInterval(tick, 1000)
    } else {
      if (intervalRef.current) clearInterval(intervalRef.current)
    }
    return () => { if (intervalRef.current) clearInterval(intervalRef.current) }
  }, [running, tick])

  function start() {
    const now = Date.now()
    localStorage.setItem(startKey, String(now))
    setElapsed(0)
    setRunning(true)
  }

  function stop() {
    setRunning(false)
    localStorage.removeItem(startKey)
  }

  function reset() {
    stop()
    setElapsed(0)
  }

  return (
    <div style={{ padding: '12px 14px', borderRadius: 6, background: 'rgba(180,140,20,0.08)', border: '1px solid rgba(180,140,20,0.2)' }}>
      <p style={{ fontSize: 10, fontWeight: 600, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 8 }}>
        Session Timer
      </p>
      <div className="flex items-center gap-3">
        <span className="font-display" style={{
          fontSize: 24, fontWeight: 600,
          color: running ? 'var(--color-gold-light)' : 'var(--color-parchment-dim)',
          letterSpacing: '0.05em',
          fontVariantNumeric: 'tabular-nums',
          minWidth: 72,
        }}>
          {formatTime(elapsed)}
        </span>
        <div className="flex gap-1">
          {!running ? (
            <button onClick={start}
              title="Start"
              style={{ padding: '4px 8px', borderRadius: 4, background: 'rgba(42,138,72,0.15)', border: '1px solid rgba(42,138,72,0.3)', color: '#4ade80', cursor: 'pointer', display: 'flex', alignItems: 'center' }}>
              <Play size={12} />
            </button>
          ) : (
            <button onClick={stop}
              title="Stop"
              style={{ padding: '4px 8px', borderRadius: 4, background: 'rgba(139,30,30,0.15)', border: '1px solid rgba(139,30,30,0.3)', color: '#f87171', cursor: 'pointer', display: 'flex', alignItems: 'center' }}>
              <Square size={12} />
            </button>
          )}
          <button onClick={reset}
            title="Reset"
            style={{ padding: '4px 8px', borderRadius: 4, background: 'rgba(74,58,40,0.2)', border: '1px solid var(--color-border)', color: 'var(--color-parchment-dim)', cursor: 'pointer', display: 'flex', alignItems: 'center' }}>
            <RotateCcw size={12} />
          </button>
        </div>
      </div>
    </div>
  )
}

// ── NPC card ──────────────────────────────────────────────────────────────────

function NPCCard({ npc }: { npc: QuestNPC }) {
  // Extract stat block shorthand: "use **X** stat block"
  const statMatch = (npc.description ?? '').match(/use\s+\*\*([^*]+)\*\*\s+stat\s+block/i)
  const statBlock = statMatch ? statMatch[1] : null

  // Extract last quoted sentence from personality
  const quoteMatch = (npc.personality ?? '').match(/"([^"]+)"[^"]*$/)
  const voiceLine = quoteMatch ? quoteMatch[1] : null

  return (
    <Link href={`/dm/npcs/${npc.slug}`} style={{ textDecoration: 'none' }}>
      <div className="card card-hover" style={{ padding: '10px 12px', marginBottom: 6 }}>
        <div className="flex items-start justify-between gap-2 mb-1">
          <span className="font-display" style={{ fontSize: 12, fontWeight: 600, color: 'var(--color-parchment)' }}>
            {npc.name}
          </span>
          {npc.link_role && (
            <span className="badge" style={{ fontSize: 10, background: 'rgba(201,160,68,0.08)', color: 'var(--color-gold-dim)', border: '1px solid rgba(201,160,68,0.15)', flexShrink: 0 }}>
              {npc.link_role}
            </span>
          )}
        </div>
        {npc.role && <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginBottom: 3 }}>{npc.role}</p>}
        {statBlock && <p style={{ fontSize: 10, color: 'var(--color-parchment-dim)', marginBottom: 3 }}>Stat block: {statBlock}</p>}
        {voiceLine && (
          <p style={{ fontSize: 11, color: 'var(--color-parchment-mid)', fontStyle: 'italic', marginTop: 2 }}>
            &ldquo;{voiceLine}&rdquo;
          </p>
        )}
      </div>
    </Link>
  )
}

// ── Parse inline NPC entries from "**Key NPCs:**" section ─────────────────────

function parseInlineNPCs(content: string): Array<{ name: string; desc: string }> {
  const results: Array<{ name: string; desc: string }> = []
  const lines = content.split('\n').filter((l) => l.trim().startsWith('-'))
  for (const line of lines) {
    const stripped = line.replace(/^-\s*/, '').trim()
    // "Name — description" or "**Name** — description"
    const dashMatch = stripped.match(/^\*?\*?([^*—–]+)\*?\*?\s*[—–]\s*(.+)/)
    if (dashMatch) {
      results.push({ name: dashMatch[1].trim(), desc: dashMatch[2].trim() })
    } else if (stripped) {
      results.push({ name: stripMd(stripped), desc: '' })
    }
  }
  return results
}

// ── Main page ─────────────────────────────────────────────────────────────────

export default function DMHandbookPage() {
  const params = useParams()
  const slug = params.slug as string

  const [quest, setQuest] = useState<Quest | null>(null)
  const [npcs, setNpcs] = useState<QuestNPC[]>([])
  const [relatedQuests, setRelatedQuests] = useState<Quest[]>([])
  const [questContent, setQuestContent] = useState<QuestContent | null>(null)
  const [loading, setLoading] = useState(true)
  const [notFound, setNotFound] = useState(false)

  useEffect(() => {
    async function load() {
      const { data: q } = await supabase
        .from('quests')
        .select('*')
        .eq('slug', slug)
        .single()

      if (!q) { setNotFound(true); setLoading(false); return }
      setQuest(q)

      const questWithNotes = q as Quest & { extended_notes?: string | null }

      const [linkRes, relRes, notesRes] = await Promise.all([
        supabase.from('npc_quest_links').select('*').eq('quest_id', q.id),
        supabase.from('quests').select('*').eq('region', q.region ?? '').neq('id', q.id).limit(3),
        fetch(`/api/quest-notes/${slug}`).then((r) => r.json()).catch(() => ({ content: null })),
      ])

      // NPCs
      const links: NPCQuestLink[] = linkRes.data ?? []
      if (links.length > 0) {
        const npcIds = links.map((l) => l.npc_id)
        const { data: npcRows } = await supabase.from('npcs').select('*').in('id', npcIds)
        const enriched: QuestNPC[] = (npcRows ?? []).map((n) => ({
          ...n,
          link_role: links.find((l) => l.npc_id === n.id)?.role ?? null,
        }))
        setNpcs(enriched)
      }

      setRelatedQuests((relRes.data ?? []).slice(0, 3))

      // Parse extended notes — prefer API response, fall back to column
      const rawContent: string | null = notesRes.content ?? questWithNotes.extended_notes ?? null
      if (rawContent) {
        setQuestContent(parseQuestContent(rawContent))
      }

      setLoading(false)
    }
    load()
  }, [slug])

  if (loading) return <Spinner />
  if (notFound || !quest) return (
    <div className="flex flex-col items-center justify-center h-64 gap-4">
      <p style={{ color: 'var(--color-parchment-dim)', fontSize: 14 }}>Quest not found.</p>
      <Link href="/dm/run" style={{ color: 'var(--color-gold)', fontSize: 13, textDecoration: 'none' }}>← Back to Run Session</Link>
    </div>
  )

  const dmText = [quest.dm_notes ?? '', quest.description ?? ''].join(' ')
  const showTimer = isTimeSensitive(dmText)

  // Bucket sections by type
  const setupSections = questContent?.sections.filter((s) => s.type === 'setup') ?? []
  const complicationSections = questContent?.sections.filter((s) => s.type === 'complication') ?? []
  const resolutionSections = questContent?.sections.filter((s) => s.type === 'resolution') ?? []
  const npcSection = questContent?.sections.find((s) => s.type === 'npc') ?? null
  const backupSections = questContent?.sections.filter((s) => s.type === 'backup') ?? []
  const pressureSections = questContent?.sections.filter((s) => s.type === 'pressure-test') ?? []
  const otherSections = questContent?.sections.filter((s) => s.type === 'other') ?? []

  // Inline NPCs from the npc section
  const inlineNPCs = npcSection ? parseInlineNPCs(npcSection.content) : []

  const checklistSuggestions = questContent?.checklistSuggestions ?? []

  return (
    <div style={{ maxWidth: 1200 }}>
      {/* Back nav */}
      <Link href="/dm/run" className="flex items-center gap-1 mb-5"
        style={{ color: 'var(--color-parchment-dim)', textDecoration: 'none', fontSize: 13, width: 'fit-content' }}>
        <ArrowLeft size={14} /> Run Session
      </Link>

      {/* Page title */}
      <div className="mb-6 flex items-start gap-3 flex-wrap">
        <div style={{ flex: 1, minWidth: 280 }}>
          <div className="flex items-center gap-2 mb-1">
            <BookOpen size={16} style={{ color: 'var(--color-gold-dim)' }} />
            <p style={{ fontSize: 11, color: 'var(--color-gold-dim)', textTransform: 'uppercase', letterSpacing: '0.1em', fontWeight: 600 }}>
              DM Handbook
            </p>
          </div>
          <h1 className="font-display" style={{ fontSize: 28, fontWeight: 600, color: 'var(--color-parchment)', lineHeight: 1.2 }}>
            {quest.title}
          </h1>
          {questContent?.meta && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', marginTop: 4 }}>{questContent.meta}</p>
          )}
          {quest.region && (
            <p style={{ fontSize: 12, color: 'var(--color-parchment-dim)', marginTop: 4 }}>
              {quest.region}
            </p>
          )}
        </div>
        <span className="badge" style={{
          background: 'rgba(201,160,68,0.12)',
          color: 'var(--color-gold-light)',
          border: '1px solid rgba(201,160,68,0.3)',
          fontSize: 11,
          padding: '4px 12px',
          alignSelf: 'flex-start',
          marginTop: 4,
        }}>
          {quest.status}
        </span>
      </div>

      {/* Two-column layout */}
      <div style={{ display: 'grid', gridTemplateColumns: '65% 35%', gap: 28, alignItems: 'start' }}>

        {/* ── LEFT: Content scroll ── */}
        <div className="flex flex-col gap-5">

          {/* A. Read Aloud */}
          {questContent?.readAloud && (
            <div style={{
              padding: '18px 22px',
              borderRadius: 8,
              background: 'rgba(180,140,60,0.08)',
              border: '2px solid rgba(201,160,68,0.3)',
            }}>
              <p style={{ fontSize: 11, fontWeight: 700, color: '#e8c870', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: 12, display: 'flex', alignItems: 'center', gap: 6 }}>
                <BookOpen size={13} />
                Read to Players
              </p>
              {questContent.readAloud.split('\n').filter(Boolean).map((line, i) => (
                <p key={i} style={{ fontSize: 15, color: 'var(--color-parchment)', lineHeight: 1.85, fontStyle: 'italic', marginBottom: i < questContent.readAloud!.split('\n').length - 1 ? 10 : 0 }}>
                  {line}
                </p>
              ))}
            </div>
          )}

          {/* B. Setup */}
          {setupSections.map((s, i) => (
            <div key={i} style={{
              padding: '14px 18px',
              borderRadius: 6,
              background: 'rgba(139,30,30,0.1)',
              border: '1px solid rgba(139,30,30,0.3)',
            }}>
              <p style={{ fontSize: 10, fontWeight: 700, color: '#fca5a5', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: 8 }}>
                DM Only — {s.label}
              </p>
              <ContentText text={s.content} />
            </div>
          ))}

          {/* C. The Complication */}
          {complicationSections.map((s, i) => (
            <div key={i} style={{
              padding: '14px 18px',
              borderRadius: 6,
              background: 'rgba(139,30,30,0.1)',
              border: '1px solid rgba(139,30,30,0.3)',
            }}>
              <p style={{ fontSize: 10, fontWeight: 700, color: '#fca5a5', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: 8 }}>
                DM Only — {s.label}
              </p>
              <ContentText text={s.content} />
            </div>
          ))}

          {/* D. Other DM sections — collapsible */}
          {otherSections.map((s, i) => (
            <CollapsibleSection key={i} label={s.label} defaultOpen={i === 0}>
              <ContentText text={s.content} />
            </CollapsibleSection>
          ))}

          {/* E. Resolution Paths */}
          {resolutionSections.length > 0 && (
            <div>
              <p style={{ fontSize: 10, fontWeight: 600, color: '#4ade80', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: 8 }}>
                Resolution Paths
              </p>
              <div className="flex flex-col gap-3">
                {resolutionSections.map((s, i) => {
                  // Split resolution content by numbered items or line-separated options
                  const rawOptions = s.content.split(/\n(?=\d+\.|[A-Z][^a-z]{0,3}[\.:])/).filter(Boolean)
                  const options = rawOptions.length > 1 ? rawOptions : [s.content]
                  return options.map((opt, j) => (
                    <div key={`${i}-${j}`} style={{
                      padding: '12px 16px',
                      borderRadius: 6,
                      background: 'rgba(42,138,72,0.08)',
                      border: '1px solid rgba(42,138,72,0.25)',
                    }}>
                      {options.length > 1 && (
                        <p style={{ fontSize: 10, fontWeight: 600, color: '#4ade80', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 6 }}>
                          Option {j + 1}
                        </p>
                      )}
                      {j === 0 && options.length === 1 && (
                        <p style={{ fontSize: 10, fontWeight: 600, color: '#4ade80', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 6 }}>
                          {s.label}
                        </p>
                      )}
                      <ContentText text={opt} />
                    </div>
                  ))
                })}
              </div>
            </div>
          )}

          {/* F. Backup Paths */}
          {backupSections.map((s, i) => (
            <div key={i} style={{
              padding: '14px 18px',
              borderRadius: 6,
              background: 'rgba(180,100,20,0.1)',
              border: '1px solid rgba(180,100,20,0.3)',
            }}>
              <p style={{ fontSize: 10, fontWeight: 700, color: '#fb923c', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: 8 }}>
                {s.label}
              </p>
              <ContentText text={s.content} />
            </div>
          ))}

          {/* G. Pressure Test Notes */}
          {pressureSections.map((s, i) => (
            <div key={i} style={{
              padding: '14px 18px',
              borderRadius: 6,
              background: 'rgba(100,42,138,0.1)',
              border: '1px solid rgba(100,42,138,0.3)',
            }}>
              <p style={{ fontSize: 10, fontWeight: 700, color: '#d8b4fe', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: 8 }}>
                {s.label}
              </p>
              <ContentText text={s.content} />
            </div>
          ))}

          {/* Fallback: plain DM notes if no parsed content */}
          {!questContent && quest.dm_notes && (
            <div style={{
              padding: '14px 18px',
              borderRadius: 6,
              background: 'rgba(139,30,30,0.08)',
              border: '1px solid rgba(139,30,30,0.25)',
            }}>
              <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 8, fontWeight: 600 }}>
                DM Notes
              </p>
              <p style={{ fontSize: 13, color: '#fca5a5', lineHeight: 1.75 }}>{quest.dm_notes}</p>
            </div>
          )}

          {!questContent && quest.description && (
            <div className="card" style={{ padding: '14px 18px' }}>
              <p style={{ fontSize: 13, color: 'var(--color-parchment-mid)', lineHeight: 1.8 }}>{quest.description}</p>
            </div>
          )}
        </div>

        {/* ── RIGHT: Sticky sidebar ── */}
        <div style={{ position: 'sticky', top: 24, display: 'flex', flexDirection: 'column', gap: 16 }}>

          {/* A. Live Checklist */}
          <div className="card" style={{ padding: '14px 14px' }}>
            <Checklist slug={slug} suggestions={checklistSuggestions} />
          </div>

          {/* B. Key NPCs */}
          {(npcs.length > 0 || inlineNPCs.length > 0) && (
            <div className="card" style={{ padding: '12px 14px' }}>
              <p style={{ fontSize: 10, fontWeight: 600, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 8, display: 'flex', alignItems: 'center', gap: 5 }}>
                <Users size={11} /> Key NPCs
              </p>
              {npcs.length > 0
                ? npcs.map((npc) => <NPCCard key={npc.id} npc={npc} />)
                : inlineNPCs.map((n, i) => (
                    <div key={i} className="card" style={{ padding: '8px 10px', marginBottom: 5 }}>
                      <p className="font-display" style={{ fontSize: 12, fontWeight: 600, color: 'var(--color-parchment)' }}>{n.name}</p>
                      {n.desc && <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginTop: 2 }}>{n.desc}</p>}
                    </div>
                  ))
              }
            </div>
          )}

          {/* C. Reward */}
          {quest.reward_notes && (
            <div style={{ padding: '12px 14px', borderRadius: 6, background: 'rgba(201,160,68,0.06)', border: '1px solid rgba(201,160,68,0.2)' }}>
              <p style={{ fontSize: 10, fontWeight: 600, color: 'var(--color-gold-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 6 }}>
                Reward
              </p>
              <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.6 }}>{quest.reward_notes}</p>
            </div>
          )}

          {/* D. Session Timer — show if time-sensitive content detected */}
          {showTimer && <SessionTimer slug={slug} />}

          {/* E. Connect To (related quests in region) */}
          {relatedQuests.length > 0 && (
            <div className="card" style={{ padding: '12px 14px' }}>
              <p style={{ fontSize: 10, fontWeight: 600, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 8 }}>
                Connect To
              </p>
              <div className="flex flex-col gap-1">
                {relatedQuests.map((rq) => (
                  <Link key={rq.id} href={`/dm/run/${rq.slug}`}
                    style={{ textDecoration: 'none', display: 'flex', alignItems: 'center', gap: 6, padding: '5px 6px', borderRadius: 4, color: 'var(--color-parchment-mid)', fontSize: 12 }}
                    className="card-hover">
                    <ChevronRight size={11} style={{ color: 'var(--color-parchment-dim)', flexShrink: 0 }} />
                    {rq.title}
                  </Link>
                ))}
              </div>
            </div>
          )}

          {/* Quick link to full quest detail */}
          <Link href={`/dm/quests/${quest.slug}`}
            style={{
              display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 6,
              padding: '8px 12px', borderRadius: 5,
              background: 'transparent',
              border: '1px solid var(--color-border)',
              color: 'var(--color-parchment-dim)',
              fontSize: 11, textDecoration: 'none',
              fontFamily: 'var(--font-display)',
              letterSpacing: '0.05em',
            }}>
            Full Quest Detail <ChevronRight size={11} />
          </Link>
        </div>
      </div>
    </div>
  )
}
