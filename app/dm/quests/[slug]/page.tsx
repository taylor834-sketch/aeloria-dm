'use client'

import { useEffect, useState } from 'react'
import { useParams } from 'next/navigation'
import Link from 'next/link'
import { supabase } from '@/lib/supabase'
import type { Quest, NPC, Location, NPCQuestLink } from '@/types/database'
import { ArrowLeft, MapPin, Users, ScrollText, Star, ChevronRight, Zap, GitBranch, BookOpen } from 'lucide-react'

// ── Types ─────────────────────────────────────────────────────────────────────

interface QuestNPC extends NPC { link_role?: string | null }

// ── Helpers ───────────────────────────────────────────────────────────────────

function Spinner() {
  return (
    <div className="flex items-center justify-center h-64">
      <div className="w-8 h-8 rounded-full border-2 animate-spin"
        style={{ borderColor: 'var(--color-border)', borderTopColor: 'var(--color-gold)' }} />
    </div>
  )
}

function SectionHeader({ icon, title }: { icon: React.ReactNode; title: string }) {
  return (
    <div className="flex items-center gap-2 mb-3">
      <span style={{ color: 'var(--color-gold-dim)' }}>{icon}</span>
      <h2 className="font-display"
        style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment-mid)', letterSpacing: '0.08em', textTransform: 'uppercase' }}>
        {title}
      </h2>
      <div style={{ flex: 1, height: 1, background: 'var(--color-border)', marginLeft: 8 }} />
    </div>
  )
}

const STATUS_STYLES: Record<string, { bg: string; text: string; border: string; label: string }> = {
  active:    { bg: 'rgba(201,160,68,0.15)',  text: 'var(--color-gold-light)', border: 'rgba(201,160,68,0.35)', label: 'Active' },
  completed: { bg: 'rgba(42,138,72,0.15)',   text: '#4ade80',                 border: 'rgba(42,138,72,0.35)', label: 'Completed' },
  failed:    { bg: 'rgba(139,30,30,0.2)',    text: '#f87171',                 border: 'rgba(139,30,30,0.4)',  label: 'Failed' },
  available: { bg: 'rgba(74,58,40,0.3)',     text: 'var(--color-parchment-mid)', border: 'var(--color-border-bright)', label: 'Available' },
  hidden:    { bg: 'rgba(26,32,64,0.3)',     text: '#93c5fd',                 border: 'rgba(99,130,201,0.3)', label: 'Hidden' },
}

const TYPE_STYLES: Record<string, { bg: string; text: string; border: string }> = {
  main:     { bg: 'rgba(139,30,30,0.12)',   text: '#fca5a5', border: 'rgba(139,30,30,0.25)' },
  subplot:  { bg: 'rgba(130,42,138,0.12)',  text: '#d8b4fe', border: 'rgba(130,42,200,0.2)' },
  regional: { bg: 'rgba(42,62,138,0.15)',   text: '#a5b4fc', border: 'rgba(99,130,201,0.2)' },
  town:     { bg: 'rgba(74,58,40,0.2)',     text: 'var(--color-parchment-dim)', border: 'var(--color-border)' },
}

/** Parse markdown into sections by ## headings */
function parseMarkdownSections(md: string): { heading: string; content: string }[] {
  const lines = md.split('\n')
  const sections: { heading: string; content: string }[] = []
  let current: { heading: string; lines: string[] } | null = null

  for (const line of lines) {
    if (line.startsWith('## ')) {
      if (current) sections.push({ heading: current.heading, content: current.lines.join('\n').trim() })
      current = { heading: line.replace(/^## /, '').trim(), lines: [] }
    } else if (line.startsWith('### ') && current) {
      current.lines.push('\n**' + line.replace(/^### /, '') + '**')
    } else if (current) {
      current.lines.push(line)
    }
  }
  if (current) sections.push({ heading: current.heading, content: current.lines.join('\n').trim() })
  return sections.filter((s) => s.content.length > 0)
}

/** Strip markdown syntax for plain display */
function stripMd(text: string): string {
  return text
    .replace(/\*\*(.+?)\*\*/g, '$1')
    .replace(/\*(.+?)\*/g, '$1')
    .replace(/^[#*\-|>]+\s?/gm, '')
    .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
    .trim()
}

/** Render a markdown content block as readable paragraphs */
function MarkdownBlock({ content }: { content: string }) {
  const paras = content.split(/\n\n+/).filter(Boolean)
  return (
    <div className="flex flex-col gap-3">
      {paras.map((p, i) => {
        const cleaned = p.trim()
        if (cleaned.startsWith('**') && cleaned.endsWith('**')) {
          return (
            <p key={i} className="font-display"
              style={{ fontSize: 12, fontWeight: 600, color: 'var(--color-parchment)', letterSpacing: '0.04em' }}>
              {cleaned.replace(/\*\*/g, '')}
            </p>
          )
        }
        // bullet list
        if (cleaned.includes('\n- ') || cleaned.startsWith('- ')) {
          const items = cleaned.split('\n').filter((l) => l.trim())
          return (
            <ul key={i} style={{ paddingLeft: 16, margin: 0 }}>
              {items.map((item, j) => (
                <li key={j} style={{ fontSize: 12, color: 'var(--color-parchment-mid)', lineHeight: 1.7, listStyleType: 'disc' }}>
                  {stripMd(item.replace(/^-\s*/, ''))}
                </li>
              ))}
            </ul>
          )
        }
        return (
          <p key={i} style={{ fontSize: 13, color: 'var(--color-parchment-mid)', lineHeight: 1.75 }}>
            {stripMd(cleaned)}
          </p>
        )
      })}
    </div>
  )
}

// ── Main page ─────────────────────────────────────────────────────────────────

export default function QuestDetailPage() {
  const params = useParams()
  const slug = params.slug as string

  const [quest, setQuest] = useState<Quest | null>(null)
  const [linkedNpcs, setLinkedNpcs] = useState<QuestNPC[]>([])
  const [giverNpc, setGiverNpc] = useState<NPC | null>(null)
  const [location, setLocation] = useState<Location | null>(null)
  const [relatedQuests, setRelatedQuests] = useState<Quest[]>([])
  const [campaignNotes, setCampaignNotes] = useState<{ heading: string; content: string }[]>([])
  const [loading, setLoading] = useState(true)
  const [notFound, setNotFound] = useState(false)
  const [activeSection, setActiveSection] = useState<string | null>(null)

  useEffect(() => {
    async function load() {
      const { data: q } = await supabase.from('quests').select('*').eq('slug', slug).single()
      if (!q) { setNotFound(true); setLoading(false); return }
      setQuest(q)

      const [linkRes, relRes, notesRes] = await Promise.all([
        // NPC quest links
        supabase.from('npc_quest_links').select('*').eq('quest_id', q.id),
        // Related quests in same region (exclude self)
        supabase.from('quests').select('*').eq('region', q.region ?? '').neq('id', q.id).limit(6),
        // Campaign file notes
        fetch(`/api/quest-notes/${slug}`).then((r) => r.json()).catch(() => ({ content: null })),
      ])

      // Giver NPC
      if (q.giver_npc_id) {
        const { data: giver } = await supabase.from('npcs').select('*').eq('id', q.giver_npc_id).single()
        setGiverNpc(giver ?? null)
      }

      // Location
      if (q.location_id) {
        const { data: loc } = await supabase.from('locations').select('*').eq('id', q.location_id).single()
        setLocation(loc ?? null)
      }

      // Linked NPCs
      const links: NPCQuestLink[] = linkRes.data ?? []
      if (links.length > 0) {
        const npcIds = links.map((l) => l.npc_id)
        const { data: npcs } = await supabase.from('npcs').select('*').in('id', npcIds)
        const enriched: QuestNPC[] = (npcs ?? []).map((n) => ({
          ...n,
          link_role: links.find((l) => l.npc_id === n.id)?.role ?? null,
        }))
        setLinkedNpcs(enriched)
      }

      setRelatedQuests((relRes.data ?? []).slice(0, 5))

      // Parse campaign notes if available
      if (notesRes.content) {
        const sections = parseMarkdownSections(notesRes.content)
        setCampaignNotes(sections)
        if (sections.length > 0) setActiveSection(sections[0].heading)
      }

      setLoading(false)
    }
    load()
  }, [slug])

  if (loading) return <Spinner />
  if (notFound || !quest) return (
    <div className="flex flex-col items-center justify-center h-64 gap-4">
      <p style={{ color: 'var(--color-parchment-dim)', fontSize: 14 }}>Quest not found.</p>
      <Link href="/dm/quests" style={{ color: 'var(--color-gold)', fontSize: 13, textDecoration: 'none' }}>← Quest Board</Link>
    </div>
  )

  const statusStyle = STATUS_STYLES[quest.status] ?? STATUS_STYLES.available
  const typeStyle = TYPE_STYLES[quest.quest_type] ?? TYPE_STYLES.town
  const allNpcs = [
    ...(giverNpc ? [{ ...giverNpc, link_role: 'Quest Giver' }] : []),
    ...linkedNpcs.filter((n) => n.id !== giverNpc?.id),
  ]

  // Extract TL;DR — first sentence(s) of description up to ~150 chars
  const tldr = quest.description
    ? quest.description.split(/\.\s+/)[0] + '.'
    : null

  const activeNotes = campaignNotes.find((s) => s.heading === activeSection)

  return (
    <div style={{ maxWidth: 960 }}>
      {/* Back nav */}
      <Link href="/dm/quests" className="flex items-center gap-1 mb-5"
        style={{ color: 'var(--color-parchment-dim)', textDecoration: 'none', fontSize: 13, width: 'fit-content' }}>
        <ArrowLeft size={14} /> Quest Board
      </Link>

      {/* Header */}
      <div className="mb-6">
        <div className="flex items-start gap-3 mb-3 flex-wrap">
          <h1 className="font-display flex-1"
            style={{ fontSize: 28, fontWeight: 600, color: 'var(--color-parchment)', lineHeight: 1.2, minWidth: 300 }}>
            {quest.title}
          </h1>
          <div className="flex items-center gap-2 flex-wrap">
            <span className="badge" style={{ background: statusStyle.bg, color: statusStyle.text, border: `1px solid ${statusStyle.border}`, fontSize: 12, padding: '4px 12px' }}>
              {statusStyle.label}
            </span>
            <span className="badge" style={{ background: typeStyle.bg, color: typeStyle.text, border: `1px solid ${typeStyle.border}`, fontSize: 12, padding: '4px 12px' }}>
              {quest.quest_type}
            </span>
          </div>
        </div>
        {quest.region && (
          <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)', marginBottom: 16 }}>
            <MapPin size={12} style={{ display: 'inline', verticalAlign: 'middle', marginRight: 4 }} />
            {quest.region}
          </p>
        )}

        {/* TL;DR box */}
        {tldr && (
          <div style={{
            padding: '14px 18px',
            borderRadius: 6,
            background: 'rgba(201,160,68,0.06)',
            border: '1px solid rgba(201,160,68,0.2)',
            marginBottom: 20,
          }}>
            <p style={{ fontSize: 11, color: 'var(--color-gold-dim)', textTransform: 'uppercase', letterSpacing: '0.1em', fontWeight: 600, marginBottom: 6 }}>
              TL;DR
            </p>
            <p style={{ fontSize: 14, color: 'var(--color-parchment)', lineHeight: 1.6, fontStyle: 'italic' }}>
              {tldr}
            </p>
          </div>
        )}

        {/* Full description */}
        {quest.description && (
          <p style={{ fontSize: 14, color: 'var(--color-parchment-mid)', lineHeight: 1.8, maxWidth: 760, marginBottom: 16 }}>
            {quest.description}
          </p>
        )}

        {/* Reward */}
        {quest.reward_notes && (
          <div style={{ display: 'flex', alignItems: 'flex-start', gap: 8, marginBottom: 8 }}>
            <span style={{ fontSize: 11, color: 'var(--color-gold-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', fontWeight: 600, paddingTop: 2 }}>Reward</span>
            <p style={{ fontSize: 13, color: 'var(--color-parchment-mid)', lineHeight: 1.6 }}>{quest.reward_notes}</p>
          </div>
        )}
      </div>

      {/* DM Notes */}
      {quest.dm_notes && (
        <div className="mb-6" style={{ padding: '14px 18px', borderRadius: 6, background: 'rgba(139,30,30,0.08)', border: '1px solid rgba(139,30,30,0.25)' }}>
          <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: 8, fontWeight: 600 }}>
            DM Notes
          </p>
          <p style={{ fontSize: 13, color: '#fca5a5', lineHeight: 1.75 }}>{quest.dm_notes}</p>
        </div>
      )}

      {/* Campaign file notes (full act structure) */}
      {campaignNotes.length > 0 && (
        <div className="mb-8">
          <SectionHeader icon={<BookOpen size={14} />} title="Full Quest Notes" />

          {/* Section tabs */}
          <div className="flex gap-1 flex-wrap mb-4" style={{ borderBottom: '1px solid var(--color-border)', paddingBottom: 8 }}>
            {campaignNotes.map((s) => (
              <button key={s.heading}
                onClick={() => setActiveSection(s.heading)}
                style={{
                  padding: '5px 12px',
                  borderRadius: '4px 4px 0 0',
                  background: activeSection === s.heading ? 'rgba(201,160,68,0.12)' : 'transparent',
                  border: '1px solid ' + (activeSection === s.heading ? 'rgba(201,160,68,0.3)' : 'transparent'),
                  borderBottom: 'none',
                  color: activeSection === s.heading ? 'var(--color-gold-light)' : 'var(--color-parchment-dim)',
                  fontSize: 12,
                  cursor: 'pointer',
                  fontFamily: 'var(--font-display)',
                  letterSpacing: '0.03em',
                  transition: 'all 0.15s',
                }}
              >
                {s.heading}
              </button>
            ))}
          </div>

          {activeNotes && (
            <div className="card" style={{ padding: '16px 20px' }}>
              <MarkdownBlock content={activeNotes.content} />
            </div>
          )}
        </div>
      )}

      {/* Lower grid */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 24 }}>

        {/* NPCs */}
        <div>
          <SectionHeader icon={<Users size={14} />} title={`Involved NPCs (${allNpcs.length})`} />
          {allNpcs.length === 0 ? (
            <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>No NPCs linked.</p>
          ) : (
            <div className="flex flex-col gap-2">
              {allNpcs.map((npc) => (
                <Link key={npc.id} href={`/dm/npcs/${npc.slug}`} style={{ textDecoration: 'none' }}>
                  <div className="card card-hover" style={{ padding: '10px 12px', display: 'flex', alignItems: 'center', gap: 10 }}>
                    <div style={{ flex: 1, minWidth: 0 }}>
                      <div className="flex items-center gap-2 flex-wrap">
                        <span className="font-display" style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment)' }}>
                          {npc.name}
                        </span>
                        {npc.is_major && <Star size={11} style={{ color: 'var(--color-gold)', opacity: 0.8 }} />}
                      </div>
                      <div className="flex items-center gap-2 mt-1">
                        {npc.link_role && (
                          <span className="badge" style={{ fontSize: 10, background: 'rgba(201,160,68,0.1)', color: 'var(--color-gold-dim)', border: '1px solid rgba(201,160,68,0.2)' }}>
                            {npc.link_role}
                          </span>
                        )}
                        {npc.role && <span style={{ fontSize: 11, color: 'var(--color-parchment-dim)' }}>{npc.role}</span>}
                      </div>
                    </div>
                    <ChevronRight size={13} style={{ color: 'var(--color-parchment-dim)', flexShrink: 0 }} />
                  </div>
                </Link>
              ))}
            </div>
          )}

          {/* Location */}
          {location && (
            <div className="mt-6">
              <SectionHeader icon={<MapPin size={14} />} title="Location" />
              <Link href={`/dm/locations/${location.slug}`} style={{ textDecoration: 'none' }}>
                <div className="card card-hover" style={{ padding: '10px 14px', display: 'flex', alignItems: 'center', gap: 10 }}>
                  <div style={{ flex: 1 }}>
                    <span className="font-display" style={{ fontSize: 13, fontWeight: 600, color: 'var(--color-parchment)' }}>
                      {location.name}
                    </span>
                    <p style={{ fontSize: 11, color: 'var(--color-parchment-dim)', marginTop: 2 }}>
                      {location.region} · {location.location_type}
                    </p>
                  </div>
                  <ChevronRight size={13} style={{ color: 'var(--color-parchment-dim)', flexShrink: 0 }} />
                </div>
              </Link>
            </div>
          )}
        </div>

        {/* Related quests */}
        <div>
          <SectionHeader icon={<GitBranch size={14} />} title="Related Quests" />
          {relatedQuests.length === 0 ? (
            <p style={{ fontSize: 13, color: 'var(--color-parchment-dim)', fontStyle: 'italic' }}>No related quests found.</p>
          ) : (
            <div className="flex flex-col gap-2">
              {relatedQuests.map((q) => {
                const ss = STATUS_STYLES[q.status] ?? STATUS_STYLES.available
                const ts = TYPE_STYLES[q.quest_type] ?? TYPE_STYLES.town
                return (
                  <Link key={q.id} href={`/dm/quests/${q.slug}`} style={{ textDecoration: 'none' }}>
                    <div className="card card-hover"
                      style={{ padding: '10px 12px', borderLeft: `3px solid ${ss.border}`, borderRadius: '0 6px 6px 0' }}>
                      <div className="flex items-start justify-between gap-2 mb-1">
                        <span className="font-display" style={{ fontSize: 12, fontWeight: 600, color: 'var(--color-parchment)', lineHeight: 1.3, flex: 1 }}>
                          {q.title}
                        </span>
                        <span className="badge" style={{ background: ts.bg, color: ts.text, border: `1px solid ${ts.border}`, fontSize: 10 }}>
                          {q.quest_type}
                        </span>
                      </div>
                      <span className="badge" style={{ background: ss.bg, color: ss.text, border: `1px solid ${ss.border}`, fontSize: 10 }}>
                        {ss.label}
                      </span>
                    </div>
                  </Link>
                )
              })}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
