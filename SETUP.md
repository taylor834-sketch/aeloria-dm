# Aeloria DM Tool — Setup Guide

## What you need

- A [Supabase](https://supabase.com) account (free tier works)
- An [Anthropic API key](https://console.anthropic.com/settings/keys)
- A [Vercel](https://vercel.com) account (free tier works, for deployment)
- Node.js 18+ (already installed)

---

## Step 1: Supabase

1. Go to [supabase.com](https://supabase.com) → New project
2. Name it `aeloria-dm`, pick any password and region
3. Once created, go to **Settings → API** and copy:
   - **Project URL** → `NEXT_PUBLIC_SUPABASE_URL`
   - **anon/public key** → `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - **service_role key** → `SUPABASE_SERVICE_ROLE_KEY` (keep this secret)
4. Go to **SQL Editor** and run:
   - First: paste and run the contents of `supabase/schema.sql`
   - Then: paste and run the contents of `supabase/seed.sql`

This creates all the tables and loads all the Aeloria world data.

---

## Step 2: Set up environment variables

Copy the example file:
```
cp .env.local.example .env.local
```

Fill in your values:
```
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ...
SUPABASE_SERVICE_ROLE_KEY=eyJ...
ANTHROPIC_API_KEY=sk-ant-...
```

---

## Step 3: Add your players

In Supabase SQL Editor, run:
```sql
insert into players (name, character_name, character_class, character_race, level)
values
  ('Taylor',  'Aldorath',  'Wizard',  'Elf',    1),
  ('Jordan',  'Brek Ironstone', 'Fighter', 'Dwarf', 1),
  ('Sam',     'Willa',     'Rogue',   'Halfling', 1);
```
(Replace with your actual players and characters)

---

## Step 4: Run locally

```bash
cd aeloria-dm
npm run dev
```

Open [http://localhost:3000](http://localhost:3000)

---

## Step 5: Deploy to Vercel (optional)

1. Push the `aeloria-dm` folder to GitHub as its own repo
2. Go to [vercel.com](https://vercel.com) → Import project → select the repo
3. In **Environment Variables**, add your four env vars from Step 2
4. Deploy — Vercel auto-builds on every push

Share the `/player` URL with your players. Keep `/dm` and `/dm/upload` for yourself.

---

## How to use after a session

1. Record your session (voice or notes)
2. Get a transcript (Otter.ai, Whisper, or typed notes work)
3. Go to `/dm/upload`
4. Paste the transcript, fill in session number and title
5. Hit **Process Session →**
6. Claude reads the transcript and automatically:
   - Updates NPC relationship scores for each player
   - Records memories for each interaction
   - Marks locations as discovered (updating player fog of war)
   - Changes quest statuses
   - Adjusts faction reputation
   - Writes a session summary for the journal
7. Done — open the DM Dashboard to see all changes

---

## App routes

| Route | Description |
|-------|-------------|
| `/` | Home screen with navigation |
| `/dm` | DM dashboard — NPCs, factions, quests, sessions |
| `/dm/upload` | Upload session transcript for Claude processing |
| `/map` | Full DM map — all locations, click for details |
| `/player` | Player view — fog of war map, quests, known NPCs, journal |
| `/player?player=<uuid>` | Player view for a specific player |
