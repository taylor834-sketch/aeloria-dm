'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'
import type { Player } from '@/types/database'

function Spinner() {
  return (
    <div className="flex items-center justify-center h-64">
      <div
        className="w-8 h-8 rounded-full border-2 animate-spin"
        style={{ borderColor: 'var(--color-border)', borderTopColor: 'var(--color-gold)' }}
      />
    </div>
  )
}

const CLASSES = [
  'Barbarian', 'Bard', 'Cleric', 'Druid', 'Fighter', 'Monk',
  'Paladin', 'Ranger', 'Rogue', 'Sorcerer', 'Warlock', 'Wizard', 'Artificer',
]

const RACES = [
  'Human', 'Elf', 'Half-Elf', 'Dwarf', 'Halfling', 'Gnome',
  'Half-Orc', 'Tiefling', 'Dragonborn', 'Aasimar', 'Tabaxi', 'Firbolg', 'Other',
]

const emptyForm = {
  name: '',
  character_name: '',
  character_class: '',
  character_race: '',
  level: 1,
}

export default function PlayersPage() {
  const [players, setPlayers] = useState<Player[]>([])
  const [loading, setLoading] = useState(true)
  const [showAddForm, setShowAddForm] = useState(false)
  const [form, setForm] = useState(emptyForm)
  const [saving, setSaving] = useState(false)
  const [editingId, setEditingId] = useState<string | null>(null)

  async function reload() {
    const { data } = await supabase.from('players').select('*').order('created_at')
    setPlayers(data ?? [])
  }

  useEffect(() => {
    reload().then(() => setLoading(false))
  }, [])

  async function handleAdd(e: React.FormEvent) {
    e.preventDefault()
    if (!form.name || !form.character_name) return
    setSaving(true)
    await supabase.from('players').insert({
      name: form.name,
      character_name: form.character_name,
      character_class: form.character_class || null,
      character_race: form.character_race || null,
      level: form.level,
      is_active: true,
    })
    setForm(emptyForm)
    setShowAddForm(false)
    setSaving(false)
    reload()
  }

  async function toggleActive(p: Player) {
    await supabase.from('players').update({ is_active: !p.is_active }).eq('id', p.id)
    reload()
  }

  async function adjustLevel(p: Player, delta: number) {
    const newLevel = Math.max(1, Math.min(20, p.level + delta))
    await supabase.from('players').update({ level: newLevel }).eq('id', p.id)
    setPlayers((prev) => prev.map((pl) => (pl.id === p.id ? { ...pl, level: newLevel } : pl)))
  }

  if (loading) return <Spinner />

  const inputStyle: React.CSSProperties = {
    background: 'var(--color-surface)',
    border: '1px solid var(--color-border)',
    borderRadius: 5,
    padding: '8px 12px',
    color: 'var(--color-parchment)',
    fontSize: 13,
    outline: 'none',
    width: '100%',
  }

  const labelStyle: React.CSSProperties = {
    display: 'block',
    fontSize: 11,
    fontWeight: 600,
    color: 'var(--color-parchment-dim)',
    textTransform: 'uppercase',
    letterSpacing: '0.08em',
    marginBottom: 4,
  }

  const activePlayers = players.filter((p) => p.is_active)
  const inactivePlayers = players.filter((p) => !p.is_active)

  return (
    <div style={{ maxWidth: 820 }}>
      {/* Header */}
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1
            className="font-display"
            style={{ fontSize: 26, fontWeight: 600, color: 'var(--color-gold-light)', marginBottom: 4 }}
          >
            Players
          </h1>
          <p style={{ color: 'var(--color-parchment-dim)', fontSize: 13 }}>
            {activePlayers.length} active · {inactivePlayers.length} inactive
          </p>
        </div>
        <button
          onClick={() => setShowAddForm(!showAddForm)}
          style={{
            padding: '8px 16px',
            borderRadius: 5,
            fontSize: 13,
            cursor: 'pointer',
            background: showAddForm ? 'rgba(74,58,40,0.2)' : 'rgba(201,160,68,0.1)',
            border: showAddForm ? '1px solid var(--color-border-bright)' : '1px solid var(--color-gold-dim)',
            color: showAddForm ? 'var(--color-parchment-mid)' : 'var(--color-gold-light)',
            fontFamily: 'var(--font-display)',
            letterSpacing: '0.04em',
          }}
        >
          {showAddForm ? 'Cancel' : '+ Add Player'}
        </button>
      </div>

      {/* Add player form */}
      {showAddForm && (
        <form
          onSubmit={handleAdd}
          className="card"
          style={{ padding: 20, marginBottom: 20 }}
        >
          <h3
            className="font-display"
            style={{ fontSize: 14, color: 'var(--color-gold-light)', marginBottom: 14 }}
          >
            New Player
          </h3>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12, marginBottom: 12 }}>
            <div>
              <label style={labelStyle}>Player Name *</label>
              <input
                type="text"
                value={form.name}
                onChange={(e) => setForm((f) => ({ ...f, name: e.target.value }))}
                placeholder="Real name"
                required
                style={inputStyle}
              />
            </div>
            <div>
              <label style={labelStyle}>Character Name *</label>
              <input
                type="text"
                value={form.character_name}
                onChange={(e) => setForm((f) => ({ ...f, character_name: e.target.value }))}
                placeholder="In-world name"
                required
                style={inputStyle}
              />
            </div>
            <div>
              <label style={labelStyle}>Class</label>
              <select
                value={form.character_class}
                onChange={(e) => setForm((f) => ({ ...f, character_class: e.target.value }))}
                style={inputStyle}
              >
                <option value="">Select class…</option>
                {CLASSES.map((c) => <option key={c} value={c}>{c}</option>)}
              </select>
            </div>
            <div>
              <label style={labelStyle}>Race</label>
              <select
                value={form.character_race}
                onChange={(e) => setForm((f) => ({ ...f, character_race: e.target.value }))}
                style={inputStyle}
              >
                <option value="">Select race…</option>
                {RACES.map((r) => <option key={r} value={r}>{r}</option>)}
              </select>
            </div>
            <div>
              <label style={labelStyle}>Level</label>
              <input
                type="number"
                min={1}
                max={20}
                value={form.level}
                onChange={(e) => setForm((f) => ({ ...f, level: parseInt(e.target.value) || 1 }))}
                style={inputStyle}
              />
            </div>
          </div>
          <button
            type="submit"
            disabled={saving || !form.name || !form.character_name}
            style={{
              padding: '8px 18px',
              borderRadius: 5,
              fontSize: 13,
              cursor: saving ? 'not-allowed' : 'pointer',
              background: 'rgba(42,138,72,0.12)',
              border: '1px solid rgba(42,138,72,0.3)',
              color: '#4ade80',
              fontFamily: 'var(--font-display)',
              letterSpacing: '0.04em',
              opacity: saving || !form.name || !form.character_name ? 0.5 : 1,
            }}
          >
            {saving ? 'Adding…' : 'Add Player'}
          </button>
        </form>
      )}

      {/* Players list */}
      {players.length === 0 ? (
        <div className="text-center py-16" style={{ color: 'var(--color-parchment-dim)' }}>
          <p className="font-display text-sm">No players yet</p>
          <p style={{ fontSize: 12, marginTop: 6 }}>Add your party above to get started.</p>
        </div>
      ) : (
        <>
          {/* Active players */}
          {activePlayers.length > 0 && (
            <div className="space-y-3 mb-6">
              {activePlayers.map((p) => (
                <PlayerRow
                  key={p.id}
                  player={p}
                  onToggleActive={() => toggleActive(p)}
                  onAdjustLevel={(d) => adjustLevel(p, d)}
                />
              ))}
            </div>
          )}

          {/* Inactive players */}
          {inactivePlayers.length > 0 && (
            <div>
              <p
                style={{
                  fontSize: 11,
                  fontWeight: 600,
                  color: 'var(--color-parchment-dim)',
                  textTransform: 'uppercase',
                  letterSpacing: '0.08em',
                  marginBottom: 10,
                }}
              >
                Inactive
              </p>
              <div className="space-y-3">
                {inactivePlayers.map((p) => (
                  <PlayerRow
                    key={p.id}
                    player={p}
                    onToggleActive={() => toggleActive(p)}
                    onAdjustLevel={(d) => adjustLevel(p, d)}
                  />
                ))}
              </div>
            </div>
          )}
        </>
      )}
    </div>
  )
}

function PlayerRow({
  player,
  onToggleActive,
  onAdjustLevel,
}: {
  player: Player
  onToggleActive: () => void
  onAdjustLevel: (delta: number) => void
}) {
  return (
    <div
      className="card"
      style={{
        padding: '14px 18px',
        display: 'flex',
        alignItems: 'center',
        gap: 16,
        opacity: player.is_active ? 1 : 0.6,
      }}
    >
      {/* Level badge */}
      <div
        style={{
          width: 48,
          height: 48,
          borderRadius: 6,
          background: player.is_active ? 'rgba(201,160,68,0.1)' : 'rgba(74,58,40,0.1)',
          border: player.is_active ? '1px solid var(--color-gold-dim)' : '1px solid var(--color-border)',
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center',
          flexShrink: 0,
        }}
      >
        <span
          className="font-display"
          style={{ fontSize: 18, fontWeight: 700, color: player.is_active ? 'var(--color-gold-light)' : 'var(--color-parchment-dim)', lineHeight: 1 }}
        >
          {player.level}
        </span>
        <span style={{ fontSize: 9, color: 'var(--color-parchment-dim)', letterSpacing: '0.06em' }}>LVL</span>
      </div>

      {/* Info */}
      <div style={{ flex: 1 }}>
        <p
          className="font-display"
          style={{ fontSize: 15, fontWeight: 600, color: 'var(--color-parchment)', marginBottom: 2 }}
        >
          {player.character_name}
        </p>
        <p style={{ fontSize: 12, color: 'var(--color-parchment-mid)' }}>
          {[player.character_race, player.character_class].filter(Boolean).join(' ')}
          {player.name && (
            <span style={{ color: 'var(--color-parchment-dim)', marginLeft: 8 }}>
              · {player.name}
            </span>
          )}
        </p>
      </div>

      {/* Level controls */}
      <div className="flex items-center gap-1.5">
        <button
          onClick={() => onAdjustLevel(-1)}
          disabled={player.level <= 1}
          style={{
            width: 28,
            height: 28,
            borderRadius: 4,
            background: 'var(--color-surface-raised)',
            border: '1px solid var(--color-border)',
            color: 'var(--color-parchment-mid)',
            cursor: player.level <= 1 ? 'not-allowed' : 'pointer',
            fontSize: 16,
            lineHeight: 1,
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            opacity: player.level <= 1 ? 0.3 : 1,
          }}
        >
          −
        </button>
        <button
          onClick={() => onAdjustLevel(1)}
          disabled={player.level >= 20}
          style={{
            width: 28,
            height: 28,
            borderRadius: 4,
            background: 'var(--color-surface-raised)',
            border: '1px solid var(--color-border)',
            color: 'var(--color-parchment-mid)',
            cursor: player.level >= 20 ? 'not-allowed' : 'pointer',
            fontSize: 16,
            lineHeight: 1,
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            opacity: player.level >= 20 ? 0.3 : 1,
          }}
        >
          +
        </button>
      </div>

      {/* Active toggle */}
      <button
        onClick={onToggleActive}
        style={{
          padding: '5px 12px',
          borderRadius: 5,
          fontSize: 12,
          cursor: 'pointer',
          background: player.is_active ? 'rgba(42,138,72,0.08)' : 'rgba(74,58,40,0.12)',
          border: player.is_active ? '1px solid rgba(42,138,72,0.25)' : '1px solid var(--color-border)',
          color: player.is_active ? '#4ade80' : 'var(--color-parchment-dim)',
          transition: 'all 0.15s',
        }}
      >
        {player.is_active ? 'Active' : 'Inactive'}
      </button>
    </div>
  )
}
