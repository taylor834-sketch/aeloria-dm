-- Aeloria DM Tool — Supabase Schema
-- Run this in the Supabase SQL editor to initialize your database

-- ─────────────────────────────────────────────
-- PLAYERS
-- ─────────────────────────────────────────────
create table if not exists players (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  character_name text not null,
  character_class text,
  character_race text,
  level integer default 1,
  is_active boolean default true,
  created_at timestamptz default now()
);

-- ─────────────────────────────────────────────
-- LOCATIONS
-- ─────────────────────────────────────────────
create table if not exists locations (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text unique not null,
  region text not null,
  location_type text not null, -- 'town', 'dungeon', 'landmark', 'ruins'
  population integer,
  description text,
  dm_notes text, -- DM-only, never shown to players
  map_x float not null, -- SVG coordinate
  map_y float not null,
  is_major boolean default false,
  created_at timestamptz default now()
);

-- ─────────────────────────────────────────────
-- PLAYER DISCOVERED LOCATIONS (fog of war)
-- ─────────────────────────────────────────────
create table if not exists player_discoveries (
  id uuid primary key default gen_random_uuid(),
  player_id uuid references players(id) on delete cascade,
  location_id uuid references locations(id) on delete cascade,
  discovered_at timestamptz default now(),
  discovery_notes text,
  unique(player_id, location_id)
);

-- ─────────────────────────────────────────────
-- NPCS
-- ─────────────────────────────────────────────
create table if not exists npcs (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text unique not null,
  location_id uuid references locations(id),
  faction_id uuid, -- filled after factions table
  role text,
  race text,
  description text,
  personality text,
  secrets text, -- DM-only
  is_major boolean default false,
  is_alive boolean default true,
  created_at timestamptz default now()
);

-- ─────────────────────────────────────────────
-- NPC ↔ PLAYER RELATIONSHIPS
-- ─────────────────────────────────────────────
create table if not exists npc_relationships (
  id uuid primary key default gen_random_uuid(),
  npc_id uuid references npcs(id) on delete cascade,
  player_id uuid references players(id) on delete cascade,
  attitude integer default 0 check (attitude >= -5 and attitude <= 5),
  -- -5 = hostile, 0 = neutral, +5 = trusted ally
  last_interaction text, -- brief note on most recent interaction
  memories jsonb default '[]'::jsonb,
  -- array of {session_id, summary, attitude_delta}
  updated_at timestamptz default now(),
  unique(npc_id, player_id)
);

-- ─────────────────────────────────────────────
-- FACTIONS
-- ─────────────────────────────────────────────
create table if not exists factions (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text unique not null,
  alignment text,
  goal text,
  danger_rating integer default 1 check (danger_rating >= 1 and danger_rating <= 5),
  description text,
  dm_notes text,
  created_at timestamptz default now()
);

-- wire faction_id foreign key now that factions table exists
do $$ begin
  alter table npcs add constraint fk_npc_faction
    foreign key (faction_id) references factions(id);
exception when duplicate_object then null;
end $$;

-- ─────────────────────────────────────────────
-- PLAYER ↔ FACTION REPUTATION
-- ─────────────────────────────────────────────
create table if not exists player_faction_rep (
  id uuid primary key default gen_random_uuid(),
  player_id uuid references players(id) on delete cascade,
  faction_id uuid references factions(id) on delete cascade,
  reputation integer default 0 check (reputation >= -100 and reputation <= 100),
  rank_title text default 'Unknown',
  notes text,
  updated_at timestamptz default now(),
  unique(player_id, faction_id)
);

-- ─────────────────────────────────────────────
-- QUESTS
-- ─────────────────────────────────────────────
create table if not exists quests (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  slug text unique not null,
  region text,
  quest_type text default 'side', -- 'main', 'side', 'faction', 'personal'
  status text default 'available', -- 'available', 'active', 'completed', 'failed', 'hidden'
  description text, -- player-visible
  dm_notes text, -- DM-only truth
  reward_notes text,
  location_id uuid references locations(id),
  giver_npc_id uuid references npcs(id),
  created_at timestamptz default now(),
  completed_at timestamptz
);

-- ─────────────────────────────────────────────
-- PLAYER ↔ QUEST TRACKING
-- ─────────────────────────────────────────────
create table if not exists player_quests (
  id uuid primary key default gen_random_uuid(),
  player_id uuid references players(id) on delete cascade,
  quest_id uuid references quests(id) on delete cascade,
  status text default 'active', -- 'active', 'completed', 'abandoned'
  player_notes text, -- what the player knows/has done
  updated_at timestamptz default now(),
  unique(player_id, quest_id)
);

-- ─────────────────────────────────────────────
-- SESSIONS
-- ─────────────────────────────────────────────
create table if not exists sessions (
  id uuid primary key default gen_random_uuid(),
  session_number integer not null,
  title text,
  played_at date default current_date,
  summary text,
  raw_transcript text,
  processed boolean default false,
  created_at timestamptz default now()
);

-- ─────────────────────────────────────────────
-- SESSION EVENTS (Claude-extracted facts)
-- ─────────────────────────────────────────────
create table if not exists session_events (
  id uuid primary key default gen_random_uuid(),
  session_id uuid references sessions(id) on delete cascade,
  event_type text not null,
  -- 'npc_interaction', 'location_visit', 'quest_update',
  -- 'faction_rep_change', 'relationship_change', 'discovery', 'lore_reveal'
  entity_type text, -- 'npc', 'location', 'quest', 'faction'
  entity_id uuid,
  player_id uuid references players(id),
  description text not null,
  data jsonb default '{}'::jsonb,
  created_at timestamptz default now()
);

-- ─────────────────────────────────────────────
-- ROW LEVEL SECURITY (basic setup)
-- ─────────────────────────────────────────────
alter table players enable row level security;
alter table locations enable row level security;
alter table npcs enable row level security;
alter table npc_relationships enable row level security;
alter table factions enable row level security;
alter table player_faction_rep enable row level security;
alter table quests enable row level security;
alter table player_quests enable row level security;
alter table sessions enable row level security;
alter table session_events enable row level security;
alter table player_discoveries enable row level security;

-- Allow all reads via anon key (the app handles DM-vs-player logic in code)
do $$ declare t text; begin
  foreach t in array array[
    'players','locations','npcs','npc_relationships','factions',
    'player_faction_rep','quests','player_quests','sessions',
    'session_events','player_discoveries'
  ] loop
    execute format('drop policy if exists "Public read" on %I', t);
    execute format('create policy "Public read" on %I for select using (true)', t);
    execute format('drop policy if exists "Service write" on %I', t);
    execute format('create policy "Service write" on %I for all using (auth.role() = ''service_role'')', t);
  end loop;
end $$;
