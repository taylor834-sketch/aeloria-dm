export type Json = string | number | boolean | null | { [key: string]: Json } | Json[]

export interface Database {
  public: {
    Tables: {
      players: {
        Row: Player
        Insert: Omit<Player, 'id' | 'created_at'>
        Update: Partial<Omit<Player, 'id' | 'created_at'>>
      }
      locations: {
        Row: Location
        Insert: Omit<Location, 'id' | 'created_at'>
        Update: Partial<Omit<Location, 'id' | 'created_at'>>
      }
      npcs: {
        Row: NPC
        Insert: Omit<NPC, 'id' | 'created_at'>
        Update: Partial<Omit<NPC, 'id' | 'created_at'>>
      }
      npc_relationships: {
        Row: NPCRelationship
        Insert: Omit<NPCRelationship, 'id'>
        Update: Partial<Omit<NPCRelationship, 'id'>>
      }
      factions: {
        Row: Faction
        Insert: Omit<Faction, 'id' | 'created_at'>
        Update: Partial<Omit<Faction, 'id' | 'created_at'>>
      }
      player_faction_rep: {
        Row: PlayerFactionRep
        Insert: Omit<PlayerFactionRep, 'id'>
        Update: Partial<Omit<PlayerFactionRep, 'id'>>
      }
      quests: {
        Row: Quest
        Insert: Omit<Quest, 'id' | 'created_at'>
        Update: Partial<Omit<Quest, 'id' | 'created_at'>>
      }
      sessions: {
        Row: Session
        Insert: Omit<Session, 'id' | 'created_at'>
        Update: Partial<Omit<Session, 'id' | 'created_at'>>
      }
      session_events: {
        Row: SessionEvent
        Insert: Omit<SessionEvent, 'id' | 'created_at'>
        Update: Partial<Omit<SessionEvent, 'id' | 'created_at'>>
      }
      player_discoveries: {
        Row: PlayerDiscovery
        Insert: Omit<PlayerDiscovery, 'id'>
        Update: Partial<Omit<PlayerDiscovery, 'id'>>
      }
    }
    Views: Record<string, never>
    Functions: Record<string, never>
    Enums: Record<string, never>
  }
}

// ── Concrete row types ────────────────────────────────────────────────────────

export interface Player {
  id: string
  name: string
  character_name: string
  character_class: string | null
  character_race: string | null
  level: number
  is_active: boolean
  created_at: string
}

export interface Location {
  id: string
  name: string
  slug: string
  region: string
  location_type: string
  population: number | null
  description: string | null
  dm_notes: string | null
  map_x: number
  map_y: number
  is_major: boolean
  created_at: string
}

export interface NPC {
  id: string
  name: string
  slug: string
  location_id: string | null
  faction_id: string | null
  role: string | null
  race: string | null
  description: string | null
  personality: string | null
  secrets: string | null
  is_major: boolean
  is_alive: boolean
  created_at: string
}

export interface NPCRelationship {
  id: string
  npc_id: string
  player_id: string
  attitude: number
  last_interaction: string | null
  memories: Json
  updated_at: string
}

export interface Faction {
  id: string
  name: string
  slug: string
  alignment: string | null
  goal: string | null
  danger_rating: number
  description: string | null
  dm_notes: string | null
  created_at: string
}

export interface PlayerFactionRep {
  id: string
  player_id: string
  faction_id: string
  reputation: number
  rank_title: string
  notes: string | null
  updated_at: string
}

export interface Quest {
  id: string
  title: string
  slug: string
  region: string | null
  quest_type: string
  status: string
  description: string | null
  dm_notes: string | null
  reward_notes: string | null
  location_id: string | null
  giver_npc_id: string | null
  created_at: string
  completed_at: string | null
}

export interface Session {
  id: string
  session_number: number
  title: string | null
  played_at: string
  summary: string | null
  raw_transcript: string | null
  processed: boolean
  created_at: string
}

export interface SessionEvent {
  id: string
  session_id: string
  event_type: string
  entity_type: string | null
  entity_id: string | null
  player_id: string | null
  description: string
  data: Json
  created_at: string
}

export interface PlayerDiscovery {
  id: string
  player_id: string
  location_id: string
  discovered_at: string
  discovery_notes: string | null
}
