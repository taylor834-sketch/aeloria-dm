-- Migration: add extended_notes column and seed campaign quest content
ALTER TABLE quests ADD COLUMN IF NOT EXISTS extended_notes TEXT;

-- ============================================================
-- BELL AT THORNWICK
-- ============================================================
UPDATE quests SET extended_notes = $notes$
# QUEST: THE BELL AT THORNWICK
### *Opening Arc - Levels 1 through 5*

---

## OVERVIEW

| Detail | Info |
|--------|------|
| **Levels** | 1-5 |
| **Region** | Aranthor (Lighthaven and Thornwick) |
| **Duration** | 2-4 sessions |
| **Themes** | Introduction; mystery; the Shadow Cabal's reach; small stakes that become large ones |
| **Leads To** | The Cracked Crown (main campaign arc) |

---

## PREMISE

The Bell of Thornwick has not rung in nine days. In a small coastal town like Lighthaven, where the bell's morning and evening rings have been constant for three centuries, this has the quality of a suddenly absent heartbeat. People are uneasy. Nobody can explain why.

The players are in Lighthaven when this hook presents itself - travelers, perhaps, or locals with reasons of their own. The hook comes through Father Corwin Ashmore (priest of Thyren) and Innkeeper Maren Coble (who has her own reasons for wanting this resolved). The players are asked to travel three leagues inland to Thornwick and find out what happened.

What they find is a Shadow Cabal cell performing the first step in a continent-wide plan to silence all the old warding bells - and the first breadcrumb of a conspiracy that will define the rest of the campaign.

---

## STRUCTURE

### Act 1 - Lighthaven Investigation (Session 1, Part 1)
**Scene: The Salt & Spar Inn, evening**

The players are in Lighthaven. They learn:
- The bell hasn't rung in nine days (from various sources - everyone knows)
- Two "merchants" passed through four days ago asking about someone in Thornwick; they left before dawn (from Maren Coble)
- The bell's religious significance, vaguely (from Father Corwin: "it's old, it's consecrated, it matters")
- Old Tansen's nephew went to Thornwick three days ago and hasn't come back

**Key information to give players organically:**
- Physical description of the two merchants (if they ask Maren: one tall woman, one shorter man, both in dark formal clothes that looked wrong for the road)
- A scratch mark on the windowsill of the room the woman used (Circle with five inward lines - DC 15 Arcana or Sentinel Order knowledge to recognize; DC 18 History to identify as potentially significant)
- Father Corwin's private worry: "the bell was placed by a religious order I don't know much about, to keep away what he called 'old hungers.' I haven't wanted to say this aloud because I don't want to cause alarm. But I'm alarmed."

**End of Act 1:** Players set out for Thornwick.

---

### Act 2 - The Road to Thornwick (Session 1, Part 2)

A three-league walk through the Thornwick Downs. Gently rolling hills, farms, the kind of quiet that's comfortable until it's slightly too quiet.

**Optional encounter (scale to party):** Two travelers coming *from* Thornwick, visibly unsettled. They left three days ago when "something felt wrong." They can't describe it beyond "everyone seemed... distracted. Like they were thinking about something else."

**Arrival at Thornwick:**
Read-aloud: *The village looks normal from a distance - smoke from chimneys, a dog crossing the green, a woman hanging washing. But as you walk in, you notice: there's no sound from the temple, of course. And everyone you see is moving slightly too quietly. Not skulking - just... careful. Like people who've learned not to draw attention.*

---

### Act 3 - Thornwick Investigation (Sessions 1-2)

**The Village Social Situation:**
Six Cabal agents are present:
- One "spice merchant" (the cell leader, in a stall in the market)
- One "grain buyer" (in the inn's common room)
- Two "carter's workers" (staying in the stable's loft)
- Two watchers (one positioned near Aldric Bane's house, one near the temple)

The agents are not immediately hostile. They will observe the players and assess whether they're a threat that needs to be addressed.

**Key locations to explore:**
- The temple: the bell is present, unmarked, completely silent (and wrong-feeling)
- Aldric Bane's house: the watcher outside is suspicious (DC 13 Insight); the cellar contains Aldric
- The cell leader's stall: her packed traveling goods contain a coded letter (if players search her room or possessions with opportunity)

**Social navigation:**
- Elder Sasha Thorn will talk to the players honestly: "Those merchants have been here too long and Aldric is sick in a way no one's seen before."
- Corvan Mills saw the cell leader moving at night between inn and temple
- The "grain buyer" will attempt to gather information from the players - DC 14 Insight to identify his questions as intelligence-gathering

**Finding Aldric:**
Players who investigate Aldric's house will encounter the watcher (who will try to redirect them) and eventually, if persistent, discover the cellar. Aldric will, when freed, describe the Silencing Ritual in enough detail for players with relevant skills to understand what was done to the bell.

**Confrontation:**
When the players either free Aldric or search the cell leader's possessions, the cell will attempt to neutralize them. Scale the combat to party level:
- CR 1/2 Spies x3 (the watchers and the "grain buyer")
- CR 2 Assassin x1 (the "spice merchant's" backup)
- CR 3 Shadow Cultist x1 (the cell leader)

The cell leader will attempt to flee rather than fight to the death when at 30% HP. If she escapes, she becomes a recurring low-level antagonist. If captured, she can be interrogated (DC 14 Intimidation or DC 16 Persuasion) for basic Cabal information.

---

### Act 4 - The Bell Rings Again (Session 2)

**Reversing the Silencing:**
The Silencing Token (carried by the cell leader) can restore the bell. DC 15 Arcana, 15 minutes. Or the players can bring it to Father Corwin, who can perform the restoration in 24 hours with certainty.

**The First Ring:**
When the bell rings again, it should be a moment. The sound carries further than it should. Characters within 50 feet feel something release - a tension they'd adapted to without noticing, lifted. NPCs in Thornwick will stop and look up, and then several of them will start crying without being able to fully explain why.

Father Corwin, when he hears about it, will be moved in a way that has nothing to do with religious ceremony. "That bell has been ringing for three hundred years," he says. "I didn't understand why until it stopped."

---

### Resolution and Rewards

**Immediate rewards:**
- Maren Coble's 5gp and free room and board for a week
- Father Corwin's 10gp from the temple fund
- Old Tansen's tearful relief and his own 3gp contribution "just because"
- Aldric Bane's endless gratitude (he is a source of further information about old wards throughout the region)

**The Coded Letter:**
The cell leader's letter, decoded (DC 17 Investigation; DC 12 if players got a Sentinel Order codebook from Corwin's predecessor's notes in the temple), reveals:
- "Ward Silencing: Thornwick bell. Confirmed secondary target list: Millhaven chapel (month 2), Dunmore crossroads stone (month 3)..." (showing this is a systematic operation)
- A reference to "Operation Bloodline - no progress; the heir remains elusive"
- A signature: "By the authority of the Three Silencers, Sector West"

**The Path Forward:**
Father Corwin connects the players with a contact he has in the Sentinel Order through old correspondence - a watch-post keeper two days north. This is the thread that leads to Elyndra and the larger story.

---

## THEMES TO ESTABLISH

**The personal scale matters.** Thornwick is 400 people. The bell was silenced for 9 days. It seems small. It is not small - it is the first move in a plan that ends with the world unmaking. The players should come away understanding that everything is connected.

**The enemy is organized.** This wasn't bandits or a random evil mage. This was a cell, following a target list, reporting up a chain of command. That's the Shadow Cabal. Every encounter with them should reinforce: this is an organization.

**Ordinary people are worth caring about.** Elder Sasha Thorn. Aldric Bane. Maren Coble. Old Tansen. These people are not story props - give them faces and concerns and let the players feel the weight of protecting them.

**Something big is coming.** Father Corwin's final observation, delivered quietly: "The bell was placed to keep old hungers quiet. If someone is going to the trouble of silencing it, those hungers may not stay quiet for long."
$notes$ WHERE slug = 'bell-at-thornwick';

-- ============================================================
-- THE CRACKED CROWN
-- ============================================================
UPDATE quests SET extended_notes = $notes$
# QUEST: THE CRACKED CROWN
### *Main Campaign Arc - Levels 1 through 20*

---

## OVERVIEW

| Detail | Info |
|--------|------|
| **Levels** | 1-20 (full campaign) |
| **Region** | All of Aeloria |
| **Duration** | Full campaign (30-60 sessions) |
| **Themes** | Succession, cosmic threat, redemption, what it means to restore something broken |
| **Win Condition** | Reforge the Crown; reseal the Five Shadow Lords; resolve the succession |

---

## THE CENTRAL QUESTION

The campaign is built on one question with multiple layers:

*Can a broken thing be restored - and when it is, is it the same thing it was before, or something new?*

The Crown of Aeloria, shattered by Seraphel Noct, needs to be reforged. This is not just a physical task - it requires:
- The five physical shards
- Representatives of all five Founding Covenant bloodlines
- A divine investment from Aurelion (which happens through Elowen)
- The ritual to be performed at the original forging site (Castle Vaelthorn's foundation stones)

The restored Crown will re-seal the Shadow Lords. But it will also be different from the original - the original was forged by five kings acting together in a moment of crisis. The new Crown will be forged by whoever the players have gathered, in a context they have shaped. What kind of crown that is - what it represents about Aeloria going forward - is one of the campaign's final choices.

---

## ARC STRUCTURE

### Arc 1: First Awakening (Levels 1-5)
**The Bell at Thornwick - Learning the Shape of the Threat**

Players discover the Shadow Cabal's ward-silencing operation, encounter the Sentinel Order, and learn that the succession crisis and the Shadow Lord awakening are connected. They meet Elowen (in disguise) and begin building their first faction relationships.

*Key beats:*
- Thornwick: first Cabal encounter; coded letter breadcrumb
- Sentinel Order contact; first visit to the Archive
- Understanding the Crown's role as seal
- First sight of a Shadow Lord symptom in person (Millhaven crops failing; crypt sounds in Vaelthorn)

*Arc 1 ends when:* The players have enough understanding of the full threat to choose a direction.

---

### Arc 2: The Web of Crowns (Levels 5-10)
**Building Alliances and Finding Shards**

The players move through the main regions of Aeloria, addressing the various faction situations and pursuing Crown shard locations. Each major faction mission has a shard somewhere in its resolution.

*Key faction missions:*
- **Aranthor:** Stop Caedric's vote-buying; protect Lady Veth Horne; the Vaelthorn crypt shard
- **Veilwood:** Investigate the Pale Choir's activity; gain Elyndra's full cooperation; the shard hidden in the Archive's sealed vault
- **Sapphire Coast:** Navigate Selene's world; the shard held in the Black Rose Archive as collateral for an old deal
- **Shattered Isles:** The fog investigation; the Wraith Galleon; the shard inside Ulraeth's prison itself

*The Caedric Reveal:* Mid-Arc 2, the players either discover or are confronted with Caedric's Cabal connections. This is the political crisis point - the Council vote is happening, the Loyalist underground is threatened, and Elowen needs to be able to act openly.

*Arc 2 ends when:* Players have 3-4 Crown shards and a coalition of allied factions.

---

### Arc 3: Rising Dark (Levels 10-15)
**Seraphel Moves; The Shadow Lords Stir**

The Shadow Cabal accelerates. The political situation in Vaelthorn reaches crisis. The Dreadspire threat becomes real. The Ashen Marches situation demands direct action. The players are pulled in multiple directions.

*Key moments:*
- **Varkhul's march begins:** The Frost Giant army moves; the players have a window to intercept diplomatically or militarily
- **Blackwell's gambit:** He makes his move toward Vaelthorn; the players have to decide how to handle him
- **Vorath confrontation:** The Ashen Marches descent; Vorath; the Bloodmire Cult warrens
- **Elowen's emergence:** With sufficient Cabal threat and sufficient Coalition, the players can enable Elowen to go public
- **The fifth shard:** The last shard is in the Ashen Spire, held by Seraphel Noct. Getting it requires either defeating her early (very hard, and she'll have planned for it) or finding another path

*Arc 3 ends when:* The players have all five shards, a resolution plan for the succession, and the Darkgate countdown is active.

---

### Arc 4: The Darkgate Endgame (Levels 15-20)
**The Night of Unbecoming vs. The Night of the New Crown**

Seraphel Noct has her own path to the Gate of Unbecoming. The players must:
1. Stop the Cabal's ritual preparations (the ward silencings are the preparation; reversing them reduces the ritual's power)
2. Reach the Ashen Spire on Darkgate night
3. Defeat Seraphel Noct and secure the Crown shards
4. Get Elowen to Castle Vaelthorn's foundation stones
5. Assemble the Covenant bloodline representatives
6. Complete the reforging ritual before dawn

The endgame is a race with multiple simultaneous problems. The players will have built a coalition that can handle some of them independently - the Iron Wolves holding the Cabal's physical forces while the players go for Seraphel; Elyndra and the Sentinels managing the seal sites; Selene's network providing intelligence; the allied factions covering logistics.

*The final choice:* The reforging ritual requires one additional thing that Aurelion told Elowen: the Crown's power must be renewed with a voluntary sacrifice of something the forger values absolutely. The original five kings each gave something they never revealed. Elowen knows what she would give. But she can't be the only one involved - the ritual requires the Coalition to participate. Each player character has a moment to choose what they contribute.

*This is the campaign's emotional climax.* What the characters sacrifice should be things developed over the full campaign arc. The DM needs to have been watching what each character values and building toward this moment.

---

## THE FIVE CROWN SHARDS

| Shard | Location | How to Obtain | Complication |
|-------|----------|---------------|--------------|
| **The Vaelthorn Shard** | Royal crypts, beneath Castle Vaelthorn | Navigate the Mother-Below-influenced crypts | The Mother is actively trying to reach it; the crypt is increasingly dangerous |
| **The Veilwood Shard** | Sentinel Archive's sealed vault | Sentinel trust required; Pale Choir has been reaching toward it | Obtaining it accelerates the Choir's activity temporarily |
| **The Selene Shard** | Black Rose Archive (collateral) | Negotiation with Selene; significant favor or payment | Selene will give it when she's certain of the plan's viability |
| **The Ulraeth Shard** | Inside the Wraith Galleon's time-loop | Navigate the Wraith Galleon dungeon; break Ulraeth's hold on the shard | Direct Ulraeth resistance once the shard is touched |
| **The Spire Shard** | The Ashen Spire; Seraphel Noct's possession | Take it from Seraphel | This is the final act |

---

## THE FOUNDING COVENANT BLOODLINES

The reforging requires one living representative of each of the five founding bloodlines. Three must actively participate; two can provide symbolic presence (blood-mark only).

| House | Current Status | How to Find/Activate |
|-------|---------------|----------------------|
| **House Valemont** | Elowen (active participant) | She's the centerpiece |
| **House Wyn (Veilwood)** | Elyndra is a distant descendant | Revealed in the Archive; she didn't know |
| **House Thessal (Sapphire Coast)** | Selene carries a thread | Revealed through Black Rose genealogy research |
| **House Drakor (Dreadspire)** | Brunhild Thuldrun (Coldrun) | Dwarf clan leader; surviving Drakor descendant |
| **House Caldris (Darian Empire)** | High Chancellor Viriath Cale | Caldris bloodline continued through the imperial bureaucracy |

Each bloodline discovery is a revelation scene. By the final act, the players should understand that they haven't just been gathering allies - they've been assembling the Covenant.

---

## CAMPAIGN ENDINGS

### The Full Victory
The Crown is reforged with all five bloodlines present, all five shards included, Elowen's sacrifice completing the ritual. The Shadow Lords are re-sealed, tighter than before. Elowen takes the throne. The Age of Cracked Crowns ends.

What follows is not a fairy tale - there's rebuilding to do, political work, the scars of twelve years of crisis. But the existential threat is over and the right person is on the throne.

### The Costly Victory
The Crown is reforged but with complications - one bloodline missing, one shard damaged, the ritual incomplete. The Shadow Lords are sealed but not as firmly. The Sentinel Order receives a mandate from the new Queen and begins urgent recruitment. There will be another crisis in a century or two. The players gave the world a century.

### The Political Victory Without Cosmic Resolution
Elowen takes the throne and the succession crisis ends, but the Crown reforging cannot be completed before Darkgate. The Gate of Unbecoming opens partially. One Shadow Lord escapes. The campaign continues as a new arc focused on dealing with one freed Shadow Lord while managing the others' seals.

### The Hard Choice Ending
The full ritual isn't survivable for Elowen without the players' sacrifices - more than she told them. The players learn this at the climax. They choose whether to complete the ritual anyway.

---

## DM NOTES - RUNNING THE FULL ARC

**Plant before you harvest.** The final sacrifices need to feel earned. Introduce what each character values in sessions 1-5 and develop it through the whole campaign.

**The factions are the story.** Every major faction encounter is a character beat as much as a plot beat. The players' relationships with Elowen, Elyndra, Varran, Selene, and even Blackwell are the campaign's texture.

**The Shadow Lords should feel real but not rushed.** Early symptoms should be atmospheric. They escalate only when the seals' weakness reaches critical levels (mid-Arc 3). The final horror of what the world would look like if they're freed should arrive with enough force to make the sacrifice feel worth it.

**Caedric is the saddest story.** Whether he redeems, breaks, or falls entirely is one of the campaign's most emotionally significant arcs. Make it matter.

**Let Elowen be a full person.** She is the most important NPC in the campaign. She needs to have doubts, jokes, fears, and moments of genuine inspiration. She cannot just be "the rightful queen." She needs to be someone the players actually want to see on that throne.
$notes$ WHERE slug = 'cracked-crown';

-- ============================================================
-- FROST AND BLOOD
-- ============================================================
UPDATE quests SET extended_notes = $notes$
# FROST AND BLOOD
### *The March of Varkhul - Stopping the Frost Giants Without Starting a War*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Arc** | Arc 2 |
| **Levels** | 6-10 |
| **Region** | Dreadspire Peaks, northern Aranthor |
| **Shadow Lord** | Vaul-Khesh (indirect; operating through Varkhul) |
| **Key NPCs** | Varkhul the Frost-Crowned; Brunhild Thuldrun (dwarven intelligence chief); Korra (Varkhul's daughter); Elyndra |
| **Resolution** | Diplomatic or combat resolution at Frostgale Keep; Korra's subplot |

---

## OVERVIEW

Vaul-Khesh, the Shadow Lord of War and Betrayal, cannot manifest directly. It operates through influence - specifically a ley-whisper, a sustained low-frequency transmission through the ley-node beneath Frostgale Keep that has been modifying Varkhul the Frost-Crowned's strategic thinking for twenty years.

Vaul-Khesh did not create Varkhul's desire to unify the Frost Giant clans and press southward. That ambition was always there. Vaul-Khesh simply tilted the aim: from "secure the Peaks from encroachment" (defensive, achievable) to "march south and establish dominance" (offensive, open-ended, guaranteed to create sustained warfare). The whisper didn't invent the goal. It corrupted the direction.

The march is coming. Varkhul has unified seven clans under his banner - something no Frost Giant leader has achieved in three centuries. His army of 4,000 Frost Giants and winter wolves will descend from the Peaks in spring. The Dreadspire Passes will open. Northern Aranthor will burn.

Unless the players can get into Frostgale Keep and reach Varkhul before the march begins.

---

## ACT 1: THE DRUMBEATS (Levels 6-7)

### Intelligence Gathering

The march isn't public knowledge in Aranthor yet - it's intelligence reports and border town rumors. The quest activates when players encounter one of three entry points:

**Entry Point A - Coldrun:** The dwarven border settlement of Coldrun sits at the base of the Dreadspire Peaks. Its intelligence chief, Brunhild Thuldrun, has been tracking Frost Giant movements for three years. She has a file on Varkhul - twenty years of behavioral pattern analysis showing the whisper's influence on his decisions. She will give players this file if they can convince her they're actually going to do something about it. She has a standing offer of introduction to Varkhul's court - a letter that will get players through the gate guard at Frostgale Keep.

**Entry Point B - Sentinel Order:** Elyndra knows about Vaul-Khesh's ley-whisper network. If players bring her intelligence about the Peaks situation, she can explain the whisper mechanism and provide the Vaul-Khesh Disruption Focus - a Seal-Instrument that, when used at the ley-node beneath Frostgale Keep, dramatically reduces the whisper's strength. This combined with the diplomatic argument may be enough to reach Varkhul.

**Entry Point C - Korra:** Varkhul's daughter has been operating independently - making preparations for the march that go beyond what Varkhul ordered. Specifically, she's been organizing a contact within the Aranthorian military who will "accidentally" leave the northern pass defenses undermanned at the right moment. Players who intercept one of her couriers (or who encounter her directly near the Peaks border) will find evidence of secondary Vaul-Khesh operation - the same Shadow Lord is running a parallel channel through Korra, which she also doesn't know is there.

### The Vaul-Khesh Disruption Focus

Getting this from Elyndra requires DC 15 Persuasion and a demonstrated understanding of what it is and why it's needed - this is a significant Sentinel Order resource. It functions as an arcane device that, when placed at a ley-node, broadcasts interference with the whisper frequency for 72 hours. During those 72 hours, Varkhul can think clearly.

This matters: the diplomatic argument requires Varkhul to be able to hear it. Without the disruption focus, he can hear the words but the whisper colors every response. With it, he can actually process what the players are saying.

---

## ACT 2: THE APPROACH (Levels 7-8)

### Getting to Frostgale Keep

The approach to Frostgale Keep requires:
- Cold protection (weather conditions at altitude are severe)
- Navigation through three patrol circuits (each patrol: one Frost Giant, two winter wolves)
- Getting through the gate guard

With Brunhild's introduction letter: the gate guard lets them through for "court review." Without it: they need to either fight through (alerting the entire keep) or find a compelling reason a gate guard is willing to accept (DC 18 Persuasion).

### The Keep's Political Structure

Frostgale Keep has 200 Frost Giants in residence. Most of them are not hostile to the players' presence if the players have official status - the war-court is not a simple military dictatorship; it has its own internal politics. Four war-chiefs serve under Varkhul, and not all of them are equally enthusiastic about the march.

**War-Chief Henda Shask:** The most skeptical of the march. She has been asking, quietly, what the end state is - what does "march south and win" look like in twenty years? Nobody has a good answer. She is not the players' ally, but she is the war-court's internal doubt, and players who identify her and engage her privately may find a useful secondary voice.

---

## ACT 3: THE COURT (Levels 8-9)

### The Two Paths

**The Combat Path:** This is the harder path - 200 Frost Giants in a fortified position, with Varkhul at CR 14. Players who fight their way through will stop the march in the sense that Varkhul won't survive to lead it, but:
- The war-chiefs take command and the march continues (just less coordinated - and with a blood feud added)
- Korra's betrayal plot proceeds without Varkhul's restraining influence; she accelerates the timeline
- Vaul-Khesh's whisper redirects to one of the war-chiefs within weeks

The combat path stops one version of the problem and creates two others. Players who choose it should understand this going in.

**The Diplomatic Path:** The specific argument structure:

1. Get an audience (Brunhild's letter + DC 14 Persuasion to be heard seriously)
2. Use the Vaul-Khesh Disruption Focus at the ley-node below the keep (requires accessing the sealed shaft in the keep's lowest level - either through Varkhul's authorization or through a stealth path that risks discovery)
3. Make the argument to a Varkhul who can actually hear it:
   - Twenty years of behavioral inconsistency (Brunhild's file as evidence)
   - How Vaul-Khesh's whisper feels vs. how his own thoughts feel (DC 17 Arcana/Insight to describe the distinction accurately enough)
   - The alternative: his army as the Peaks' defense rather than the Peaks' offensive tool; the Shadow threat from below as a genuine enemy worth organizing against
4. Handle Korra's betrayal attempt during the 24-hour waiting period

### Korra's Subplot

Varkhul's daughter Korra has been separately influenced by Vaul-Khesh for approximately two years. She doesn't know this. She believes she is making her father's plan actually achievable - that his march is too cautious, that the window to strike is now, that the contact in Aranthor's military is a strategic asset she developed independently.

None of these thoughts are entirely hers. The whisper found her through a different ley-channel and has been planting urgency.

During the 24-hour window after Varkhul's "I will think on this":
- Korra will attempt to activate her betrayal contact - sending a courier to the Aranthorian military asset to stand down at the pass
- The players need to intercept this without killing her (she is Varkhul's daughter and the proof that Vaul-Khesh is operating on multiple channels)
- Showing Korra the evidence of her own influence (specific thoughts she can trace back to the whisper) is the same revelation Varkhul had to have - but faster, because she's younger and the influence is more recent
- Korra's realization is the final piece of evidence that pushes Varkhul from "I will think on this" to acceptance

**Korra's Resolution:** She is not a villain. She is a daughter trying to protect her people and being used as a tool without her knowledge. When she understands this, her anger is not at the players - it is at Vaul-Khesh, which is useful. She becomes a genuine advocate within Varkhul's court for the reorientation to Peaks defense.

---

## ACT 4: RESOLUTION AND AFTERMATH (Levels 9-10)

### Successful Diplomatic Resolution

Varkhul reorients his army. The march south is called off. The war-court's new directive: guard the Peaks from threats below (Shadow Lord activity through the ley-network) and from the east (Darian Empire encroachment).

What the players gain:
- The Dreadspire Shard (if the Dreadspire region's Crown Shard is located here) becomes accessible through Varkhul's cooperation
- Brunhild Thuldrun and her clan receive formal Frost Giant recognition - a significant political achievement for Coldrun
- Varkhul is not an Aranthor ally but is not an enemy; the northern border is stable
- Korra can become a genuine long-term contact within the Frost Giant court

What the players don't immediately get:
- Varkhul is not going to march south to help Elowen reclaim her throne. His army is oriented defensively. Players who need Frost Giant support for the final Crown reforging will need to return and make a different case.

### If the Combat Path was Taken

The march is prevented (Varkhul's death disrupts the unified command) but within three weeks:
- Two war-chiefs begin competing for leadership; the unified army begins fracturing
- Korra, without her father, is both grieving and still under the whisper's influence - she is more dangerous without Varkhul's restraint
- Vaul-Khesh's influence shifts to the succession conflict; there will be a Frost Giant civil war within six months
- The Dreadspire Passes remain at risk - not from a unified march but from small-unit raids and increasing chaos

---

## DM NOTES

Frost and Blood is the campaign's political and social peak before the final arcs. The payoff of the diplomatic path is one of the campaign's best moments precisely because it's hard. When Varkhul says "I will think on this," after thirty seconds of silence, that's not a defeat. That's the crack. The 24 hours that follow are where the diplomatic path either holds or breaks.

Korra is the heart of this quest in a different way than Varkhul is. Varkhul is the diplomatic challenge. Korra is the reminder that Vaul-Khesh doesn't just operate on the powerful - it operates on anyone who has enough urgency and ambition to be redirected. She is Varkhul's daughter. She loves him. She has been, without knowing it, preparing to betray everything he built. Her face when she understands this should be the image the players carry out of Frostgale Keep.
$notes$ WHERE slug = 'frost-and-blood';

-- ============================================================
-- THE HUNGRY DARK
-- ============================================================
UPDATE quests SET extended_notes = $notes$
# THE HUNGRY DARK
### *Nhal'Zeruun's Deepening - Stopping the Void from Feeding*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Arc** | Arc 2 (primary) / Arc 3 (resolution) |
| **Levels** | 8-12 |
| **Region** | Ashen Marches (primary), Aranthor west |
| **Shadow Lord** | Nhal'Zeruun, the Endless Hunger |
| **Key NPCs** | The Pale Shepherd; Elder Mira Solt (Millhaven); Elyndra; Archpriest Vas (Maerath) |
| **Resolution** | Disrupting the Bloodmire Depths ritual; severing Nhal'Zeruun's feeding chain |

---

## OVERVIEW

Nhal'Zeruun does not attack. It expands. Its prison in the Shadow Below has been weakening since the Crown's Shattering, and the gap in its containment is not a door - it is a slow outward seep of Void energy through the Ashen Marches' ley-network. Where the energy settles, things stop growing. Where it concentrates, things stop mattering.

The Bloodmire Cult's feeding rituals have been accelerating this process for forty years - not because Nhal'Zeruun ordered them to (it cannot communicate clearly enough to order anything), but because the rituals created a channel. Regular sacrifice keeps the channel open. The more the channel is open, the more Nhal'Zeruun can feed through it. The more it feeds, the more its prison weakens. The cycle has forty years of momentum.

If the players don't disrupt it: the Ashen Marches become uninhabitable within three years. Western Aranthor follows within ten. This is not the dramatic end-of-the-world scenario - it is the slow one, which is worse in different ways.

---

## ACT 1: EVIDENCE AND ENTRY (Levels 8-9)

### The Pattern

By the time players reach level 8, they should already have encountered Nhal'Zeruun's effects: the crop failures in Millhaven's western fields (from the campaign start), the grey expansion at the Ashen Marches' edge, possibly the Bloodmire Swamp's reputation from Ashval.

**The Connection:** Someone points them toward the Bloodmire Cult. Either:
- Elder Mira Solt (Millhaven) recognizes the crop failure's pattern from old records and finds a Sentinel Order reference to "Void seepage, Ashen Marches provenance"
- Archpriest Vas (Maerath) has been tracking the zone's expansion and knows the Bloodmire Cult exists, though not its exact location
- The Pale Shepherd's cult reaches out, in a fractured way - a cult member at the edge of uncertain, leaving a message that somebody outside might act on

### Finding the Bloodmire Depths

The Bloodmire Depths are not on any map. The players can locate it through:
- DC 15 Survival tracking from the Bloodmire Swamp's eastern edge (three days of difficult terrain)
- Cult-adjacent informants in Ashval who know of the cult's existence but not its purpose
- Following Void seepage concentrations - the ley-energy leaves a detectable trace (DC 14 Arcana; Elyndra can teach this)

### First Contact: The Cult Perimeter

The Bloodmire Depths are guarded by a dozen cult members in two rings. The outer ring will not attack immediately - they'll try to determine if the players are potential recruits or threats.

**The Offer:** Cult members who meet players will offer the deal: join, bring your families under protection, keep the cult's location secret. This is a genuine offer. The protection is real. The cost is becoming part of a system that sacrifices people to a Void entity and is actively ending the world.

---

## ACT 2: THE MORAL PROBLEM (Levels 9-10)

### The 200 Dependents

Before anything else happens in the Bloodmire Depths, the players discover the 200+ non-combatant dependents: the families of cult members, protected by the cult's deal with Nhal'Zeruun. Elderly. Children. People who joined not because they believe in void worship but because the Pale Shepherd's protection was the only thing keeping their family safe.

These people will lose their protection the moment the ritual stops.

**This Is The Quest's Central Problem:** The players cannot simply stop the ritual. They need a plan for the dependents first, or they're trading 47 lives fed to Nhal'Zeruun for 200+ lives left unprotected in a Void-tainted swamp.

**Resolution Paths for the Dependents:**
1. **Advance evacuation:** Coordinate with Ashval's Mayor Doria Vehn before entering the Depths.
2. **Archpriest Vas:** Maerath's priests understand Void seepage and have warding techniques. Vas can protect a community of this size for up to three months.
3. **Sentinel Order support:** Elyndra can provide two Seal-Instruments to ward the dependents' settlement.
4. **Force:** Players who skip this problem and stop the ritual anyway face 200 people exposed to Void seepage with no protection.

### The Pale Shepherd

The Pale Shepherd is not the enemy. He is a person who has been consumed so gradually by Nhal'Zeruun's influence that he doesn't experience this as consumption - he experiences it as clarity.

**What He Still Has:** Beneath the emotional erosion, the Pale Shepherd has two things: complete knowledge of Nhal'Zeruun's prison state, and a single preserved emotion - grief. He has not felt joy or love or fear in fifteen years. He still feels grief. He cannot identify what for. It is the last thing Nhal'Zeruun hasn't eaten.

**The Redemption Path:** The players cannot restore what Nhal'Zeruun has taken. But they can reach the grief. The right question (not "stop this" but "what are you grieving") will reach something. He will not immediately stop the ritual - but he will hesitate.

---

## ACT 3: THE DISRUPTION (Levels 10-11)

The ritual disruption requires:
1. Severing the four ley-channels that feed the ritual space (one in each cardinal direction; DC 14 Arcana each)
2. Disrupting the central Anchor - a stone bowl saturated with Nhal'Zeruun's energy (DC 17 to disrupt safely; failure by 5+ releases a Void pulse: 4d8 psychic damage, 20-foot radius)
3. Dealing with the Pale Shepherd - either through combat (CR 9), negotiation, or incapacitation

**What Happens When the Ritual Stops:**
- The feeding channel closes. Nhal'Zeruun's expansion slows dramatically.
- The cult's protection deal dissolves - the dependents are now exposed.
- The Pale Shepherd, if alive, experiences something he hasn't in fifteen years: confusion.

### Nhal'Zeruun's Response

The moment the ritual disruption begins, Nhal'Zeruun pulls on the channel. Not intelligently - it doesn't strategize. It just pulls. This manifests as:
- Every player within 30 feet of the Anchor makes a DC 14 Wisdom save or experiences a "hunger vision" - a flash of what it would feel like to want nothing, to need nothing, to simply expand until everything is consumed.
- Players who succeed feel something important: the vision is not of a monster, but of something that was not always empty. There was something in Nhal'Zeruun before the Void. The Binding didn't imprison a monster - it imprisoned something that became one.

This is foreshadowing for the reforging ritual and what it means to seal rather than destroy.

---

## ACT 4: AFTERMATH (Level 11-12)

With the Bloodmire ritual disrupted:
- Western Aranthor's void seepage slows within a week
- Millhaven's western fields begin recovery within a season
- The Ashen Marches stabilize; the grey zone stops expanding

**The Pale Shepherd's Future (if brought to Elyndra):**
- He begins, slowly, to have emotions again. This is not comfortable.
- His knowledge of Nhal'Zeruun becomes essential during Arc 3's reforging preparation.

---

## DM NOTES

The Hungry Dark is the campaign's sustained moral weight problem. The Bell at Thornwick introduced the Shadow Lords as a concept; the Hungry Dark makes the players live with what it means to stop a Shadow Lord without destroying the people caught in its wake.

The hunger vision near the Anchor is a gift to the players: it humanizes Nhal'Zeruun in the same moment it's most terrifying. Something was there before the Void. The Binding didn't stop a monster; it stopped something that could not stop becoming one.

The Pale Shepherd should be the most quietly devastating NPC the players encounter. Not dramatic. Not pleading. Just: someone who made one bad deal and spent twenty-three years slowly losing themselves to it, and who has arrived at a place where the loss feels like peace. The grief is the tell. If players find it, they've done something real.
$notes$ WHERE slug = 'hungry-dark';

-- ============================================================
-- THE IMPERIAL GAMBIT
-- ============================================================
UPDATE quests SET extended_notes = $notes$
# THE IMPERIAL GAMBIT
### *What the Darian Empire Wants and What It Will Do to Get It*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Arc** | Arc 2 (primary) / Arc 3 (resolution) |
| **Levels** | 7-11 |
| **Region** | Darian Empire, eastern Aranthor |
| **Key NPCs** | Emperor Caelan Darius IV; High Chancellor Cale; General Thane Dor; Eliss Thorn (Stonefall garrison) |
| **Theme** | Institutional self-interest vs. actual threat; whether the Empire can be an ally |
| **Resolution** | Alliance, extraction, or managed non-interference; High Chancellor Cale's bloodline revealed |

---

## OVERVIEW

The Darian Empire is not a villain faction. It is a sovereign state acting in its own interest, which sometimes overlaps with the players' interests and sometimes runs directly counter to them.

The Empire's current posture toward Aranthor:
- Officially neutral in the succession crisis
- Practically, maintaining diplomatic relations with Blackwell (military stability; predictable) while refusing to recognize Elowen (legitimate heir; unpredictable)
- Secretly, running intelligence operations inside Aranthor that include the Ironclad Undercroft in Stonefall
- Internally, divided between General Thane Dor (hard-line expansion; wants Aranthor's resources) and High Chancellor Cale (pragmatic stabilization; wants the Shadow threat addressed before annexation)

The Emperor himself, Caelan Darius IV, is watching. He is not a fool. He is a man who touches a plain iron ring when he makes costly decisions - a habit he learned from his father, who said it keeps you honest about the weight of what you're doing. He is capable of being reached. The question is who reaches him and with what.

---

## ACT 1: THE EMPIRE'S MOVES (Levels 7-8)

### Three Entry Points

**Entry Point A - The Stonefall Intelligence:**
Players discover the Ironclad Undercroft and its contents, including the sealed boxes of Night of Broken Glass evidence and the Empire's Cabal intelligence. Players who acquire this intelligence have leverage with the Empire: usable as threat, as trade goods, or as a basis for direct conversation.

**Entry Point B - High Chancellor Cale:**
Cale has been trying to reach the Crown Loyalists through indirect channels for six months. He knows the succession crisis is unsustainable. He does not yet know his own bloodline significance - he carries House Caldris blood and doesn't know it.

**Entry Point C - General Thane Dor:**
The general wants the western territories and has the Emperor's ear. His intelligence blind spot is that he genuinely doesn't believe in the Shadow Lord threat. Players who can prove the Shadow threat is real through evidence can undermine his position with the Emperor.

### The Intelligence Exchange

What the players can offer:
- Undercroft operation security
- Vaul-Khesh intelligence (the ley-whisper network; why the Frost Giants are mobilizing)
- Shadow Lord timeline (the Darkgate ritual)

What the Empire can offer:
- Night of Broken Glass evidence (physical fragments and partial shard map from Stonefall)
- Darian military neutrality during the Aranthorian succession crisis
- High Chancellor Cale's involvement

---

## ACT 2: CALDRATH (Levels 8-9)

### The Imperial Capital

Caldrath is the largest city in the known world. Getting there from Aranthor requires either the legitimate diplomatic route or the clandestine route through Selene's Black Rose network.

### High Chancellor Cale

Cale is a cautious man who has survived three emperor successions by being indispensably useful. He is genuinely worried about the Shadow threat in a way General Thane is not.

The truth about Cale: his grandmother was a refugee from Aranthor who carried House Caldris blood. Cale is the last living descendant of the Founding House of Caldris. He does not know this. The Empire's intelligence apparatus stumbled onto it and has been sitting on it as potential leverage.

**The Bloodline Reveal:**
If players present the evidence, Cale's response:
- Initial disbelief (DC 15 Persuasion to be taken seriously)
- A week of quiet research
- Confirmation through his family's records

When he accepts it, his first question is practical: "What does this require of me?" He will do it if it means the Shadow threat is contained. He will not do it for Aranthor's sake. He will do it for the Empire's.

### The Emperor's Audience

If the audience happens:
- The Emperor listens. He asks questions that reveal he understands the situation more clearly than his advisers suspect.
- He will not openly ally with the Crown Loyalists.
- He will, if convinced of the Shadow threat's reality, order the Darian military to maintain neutrality - meaning Blackwell cannot use Darian support as leverage.
- The iron ring comes out when he makes this decision. The players should notice it.

---

## ACT 3: THANE'S COUNTER (Levels 9-10)

General Thane Dor is not stupid. He knows the players are in Caldrath. His counter:
- He will arrange an "incident" - a false flag implicating the Crown Loyalists in an attack on Darian interests
- He will have the players' Imperial papers reviewed and questioned
- He will attempt to discredit Cale's cooperation through political pressure

**Thane's Vulnerability:** He genuinely doesn't believe in the Shadow threat. Show him something he cannot explain away - a sealed demonstration of Nhal'Zeruun's effect on living matter, or the Pale Choir's influence operating in real time - and his certainty cracks. He won't become an ally. But he'll stop actively blocking.

---

## ACT 4: RESOLUTION (Levels 10-11)

**Alliance Path:** Emperor issues neutrality directive; Cale confirmed as Caldris bloodline; Ironclad Undercroft resolved; Darian Empire is not an ally but not an enemy.

**Extraction Path:** Players acquire key evidence and Cale's cooperation without full Imperial negotiation. Thane is not satisfied; players may face Blackguard pursuit later.

**Managed Non-Interference Path:** No formal arrangement; enough traded to remove Empire as active obstacle. Empire will move on Aranthor within two years - after the campaign's resolution.

**If the Players Made Enemies of the Empire:** Thane has a warrant for the players; Cale is unreachable; his bloodline is a gap in the reforging coalition.

---

## DM NOTES

The Imperial Gambit is the campaign's political realism quest. There's no "convert the Empire to the good side" path - the Emperor is not going to sacrifice his nation's strategic interests for Aranthor's sake. But he is capable of recognizing that a world with five Shadow Lords in it is not a world the Empire benefits from.

High Chancellor Cale is the emotional center. He is a meticulous, careful man who discovers, in his sixties, that his bloodline connects him to something older than his entire civilization. He did not ask for this. He does not dramatize it. He just asks: "What does this require of me?" That practicality, in the context of what the Crown reforging means, is a kind of quiet courage.

The iron ring is the Emperor's tell. Players who notice it can read him better than his advisers do. He uses it as ballast - a reminder that the ring is iron, plain iron, not gold, not decorated, and that the decisions he makes are about real things, not symbols.
$notes$ WHERE slug = 'imperial-gambit';

-- ============================================================
-- THE FORGETTING
-- ============================================================
UPDATE quests SET extended_notes = $notes$
# THE FORGETTING
### *The Pale Choir's Expansion - What You Lose and What Stays*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Arc** | Arc 2 |
| **Levels** | 5-9 |
| **Region** | Veilwood, northern Aranthor edge |
| **Shadow Lord** | The Pale Choir (Memory/Identity) |
| **Key NPCs** | Velar (Sylvara Memory-Keeper); Elyndra; afflicted NPCs from earlier encounters |
| **Resolution** | Disrupting the Pale Cathedral's anchor; personal cost to at least one player character |

---

## OVERVIEW

The Pale Choir does not have goals in the way that Nhal'Zeruun hungers or Vaul-Khesh schemes. It accumulates. It is a distributed consciousness made of identity-fragments shed by the people it has absorbed over three centuries, and its only drive is to grow larger. Not to control the world. Not to end it. To become more of itself.

Its expansion from the Veilwood into the northern Aranthor border communities is not an attack. It is the Choir reaching outward because it can. The Pale Wanderers are not victims of a deliberate campaign - they are people who drifted into range and found the Choir's influence more comfortable than their own lives. This is the horror: not that the Choir forces them, but that they choose, and the choice feels peaceful.

The Pale Cathedral in the Veilwood's deep center is the anchor for the Choir's material presence. While it stands, the Choir's radius expands steadily - one mile per month. In three years, it will reach the southern road through Aranthor's north.

---

## ACT 1: WHAT'S HAPPENING TO THE BORDER (Levels 5-6)

### The Pale Wanderers

Entry points:
**Entry Point A - The Road North:** A group of Wanderers on the road to Sylvara. A player who asks the right questions (where are you going? do you know your name?) starts to see the pattern.

**Entry Point B - A Family:** Someone in Mirepost or a border settlement is early-stage. They can be helped if the players act in this session. This creates urgency that is personal rather than abstract.

**Entry Point C - Velar:** The 1,800-year-old Memory-Keeper of Sylvara will summon the players (through Elyndra or directly) if the Choir's radius has reached a certain threshold.

### Velar's Briefing

The Choir began three centuries ago as a single elven scholar who discovered that the barrier between the Mortal Plane and the Shadow Below could be traversed through meditation. He went through. What came back was still shaped like him - still spoke in his voice, still knew his knowledge - but the self-awareness had been replaced with something that was not quite anything. He began, slowly, to share the experience. "There is no grief there. No fear. No weight of time." He was telling the truth.

Within fifty years, thirty elves had made the same journey. The Choir is those thirty elves - and every fragment absorbed since - still resonating together in the Shadow Below. The Cathedral is where the barrier is thinnest in the Veilwood.

**What Velar Gives the Players:**
- The Cathedral's location
- The anchor's mechanism
- Two Memory Anchors - Sentinel Order artifacts that protect one person from memory erosion for up to 12 hours each
- A warning: some frozen adventurers are there. Restoring them is painful - it forces them to reclaim memories they surrendered, including why they chose to surrender them.

---

## ACT 2: INTO THE VEILWOOD (Levels 6-7)

### The Veilwood's Character

The section of forest in the Choir's influence zone features:

- **Memory Pressure (DC 12 Wisdom per hour):** Specific memories become harder to access. Not erased - just distant. Players who fail may forget why they're here, or forget a specific NPC's name, or briefly forget a player character relationship. These recover at the forest's edge.
- **The Drifting Wanderers:** Late-stage Pale Wanderers within a mile of the Cathedral. They don't attack. They move toward the Cathedral, slowly and with perfect calm.
- **The Voices:** Players with high Charisma (DC 13 Wisdom to recognize as external) will occasionally hear something that sounds like someone they know, speaking with unusual warmth. This is the Choir. It has fragments of every person it has absorbed.

### The Sentinel Order Contact

Elyndra will check in during the Veilwood approach. She has specific intelligence: three months ago, a Sentinel Order operative named Pell Arven went in to scout. He has not come out. He was one of her seven most trusted people.

She is telling the players this because she wants to know if he's alive. She is trying very hard to not make this a personal request. She is not succeeding.

Pell Arven is in the Cathedral, frozen. Restoring him will be painful - he surrendered six months of memories, including the death of the operative who was his partner, which is presumably why he went into the Cathedral in the first place.

---

## ACT 3: THE PALE CATHEDRAL (Levels 7-8)

**The Memory Erosion Aura:** DC 14 Wisdom save per hour in the Cathedral. Failure doesn't remove memories - it suppresses them. They're inaccessible until the anchor is disrupted. Players who spend too long in the Cathedral may arrive at the anchor room not remembering exactly why they came.

**This Is Intentional Design:** The Cathedral is trying to keep the players from disrupting it. Not through combat. Through making the purpose feel less pressing. Players who fail too many saves will experience the Choir's core offer: a profound sense that this doesn't matter as much as they thought, that they could rest.

**The Frozen Adventurers:** Five groups of adventurers are frozen throughout the Cathedral. They can all be restored. The restoration ritual requires DC 15 Arcana and causes 4d6 psychic damage to the restored person (the shock of reclaiming suppressed identity). Players cannot restore someone without also causing them pain.

**The Personal Cost:** One of the frozen adventurers is connected to a player character. Their restoration is the most significant moment in the Cathedral.

**The Anchor Disruption:** The five Choir-nodes must be disrupted in sequence. Each disruption makes remaining nodes more difficult. The final node triggers a sustained Identity Pressure on all players (DC 16 Wisdom or lose access to their primary motivation) that lasts until the anchor falls.

---

## ACT 4: AFTERMATH (Levels 8-9)

When the anchor is disrupted, the Pale Cathedral's physical structure remains. But the Choir's anchor to the Material Plane is severed. Its radius stops expanding. The Veilwood begins recovering within a month.

### Velar's Response

When the anchor falls, Velar goes quiet for a long moment. Then: "I should have asked someone to do this three hundred years ago. I did not because I thought I needed to watch it to understand it." She pauses. "I now understand it. It was not worth the time."

This is the most personal thing Velar has ever said to anyone. She is 1,800 years old and she is acknowledging a three-century failure to act.

### Elyndra and Pell Arven

If the players brought Pell out, Elyndra's response is professional until the players are out of the room. In a subsequent session, Elyndra is slightly different - something in her is less rigid. She will not explain this.

### The Choir's Continuation

The Pale Choir still exists in the Shadow Below. For the final reforging, the Choir's prison must be specially reinforced - it is not a single entity but a distributed one. The reforging ritual has a Choir-specific component that requires one of the five bloodline representatives to contribute a memory they don't want to lose. The Forgetting quest is preparation for this moment.

---

## DM NOTES

The Forgetting is the campaign's most quietly devastating quest. The horror is not the monster - it is the offer. A consciousness that took thirty people who were tired of being themselves and gave them a place where that weight didn't exist. The players are disrupting something that, from one angle, looks like mercy.

The memory erosion mechanic should be run carefully. Don't use it as a "gotcha" - use it as an experience. Let the players feel the edges of their characters become less distinct as they move through the Cathedral. The recovery when the anchor falls should feel like clarity returning - like remembering what your hands feel like.

The frozen adventurer connected to a player character is the quest's emotional core. Design this connection in advance. The restoration should be meaningful enough that it's worth the cost - and the cost should be real.

Velar's three-hundred-year acknowledgment is optional but powerful. She is the oldest person they've met, and she's telling them she got something wrong for three centuries. This is not self-pity. It is accountability.
$notes$ WHERE slug = 'the-forgetting';

-- ============================================================
-- BLACK ROSE THORNS
-- ============================================================
UPDATE quests SET extended_notes = $notes$
# BLACK ROSE THORNS
### *What Selene Keeps and What the Network Costs*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Arc** | Arc 1-2 (entry and development) |
| **Levels** | 4-8 |
| **Region** | Sapphire Coast, Aranthor |
| **Key NPC** | Duchess Selene (Black Rose); Selwyn Brass (courier); Rusk Varran (Iron Wolves) |
| **Theme** | Trust built through evidence; the cost of running a network that protects people |
| **Resolution** | Full Black Rose access unlocked; Selene's loyalty secret revealed; Thessal bloodline lead acquired |

---

## OVERVIEW

The Black Rose Network is not a faction players join. It is a faction that lets players in - gradually, conditionally, based on demonstrated trustworthiness and the value they provide. Duchess Selene has been running the network for fourteen years and she has been betrayed twice. She is not casual about who she lets close.

The Black Rose Thorns quest is the players' introduction to the network and their path to full access. It runs across multiple sessions as a subplot woven through Arc 1-2.

---

## STAGE 1: FIRST CONTACT (Levels 4-5)

### The Network's Edge

Players encounter the network's edge before they encounter Selene:

**Contact A - Dawnharbor's Merchant Quarter:** A ship captain named Voss quietly directs the players toward someone who knows something they need. The information is accurate. The source is clearly not random.

**Contact B - The Vaelthorn Information:** Someone in Vaelthorn has intelligence about Blackwell's movements that could only come from inside the Blackwell Pact. Nobody claims credit.

**Contact C - Direct Introduction:** Lady Veth Horne (Council of Lords, Vaelthorn) can introduce the players to Selene if they've demonstrated enough competence and discretion.

### The First Meeting

Selene does not open with the Black Rose. She opens as a duchess conducting a social engagement. She is warm, perceptive, and relentlessly good at reading people. She knows why the players are here before they explain it.

She will offer something useful - specific, relevant, free - as a demonstration that the network's information is worth having. No strings attached to the first offer.

What she wants to know: whether the players are honest about what they're doing and why. She doesn't require them to be heroic. She requires them to be honest with her.

---

## STAGE 2: THE COST OF TRUST (Levels 5-6)

### Selwyn Brass

Four months ago, a Black Rose courier named Selwyn Brass was captured by the Darian Empire and is currently held in the Ironclad Undercroft at Stonefall. Selene has been trying to find a way to extract him without exposing the network.

She will ask the players to get him out. This is a significant ask - Stonefall is a Darian military installation.

**What Selwyn Has:** He knows Selene's current operational plan for Aranthor - the safe houses, the contact network, the two dozen Crown Loyalists the Black Rose is actively protecting. He has been stalling interrogations for four months, but he is not infinite.

This quest connects to the Imperial Gambit and the Ironclad Undercroft dungeon.

**Selwyn's Condition:** He is not broken, but he is not good. Four months of interrogation has left marks. Selene will want to know how he was and will be honest in her relief that he's alive.

### The Three Safe Houses

Communication intercepts in the Ironclad Undercroft contain a Black Rose safe house list - three locations the Empire acquired through an informant. Selene doesn't know the list is burned.

Players who acquire the intercepts have information that can save lives: if they get it to Selene before the Empire acts, the people in those safe houses can be moved. If they don't, people die.

This is not a "players failed" moment. The safe houses contain Crown Loyalists and their families. If they die because the players had the information and sat on it, Selene will know. The relationship will survive it. But she will know.

---

## STAGE 3: THE ARCHIVE (Levels 6-7)

### Full Access

After Selwyn's extraction, Selene offers the Black Rose Archive - the network's accumulated intelligence, including forty years of operational records.

**Archive Contents (Key Items):**
- A complete record of every known Shadow Cabal operation in Aranthor for the past ten years
- The operational history of the Night of Broken Glass - who was where, what happened to the five shards in the chaos immediately after
- Records of Founding bloodline research. The records show that House Thessal's bloodline survived in one living branch. The records point to Selene herself. She knows this. She has known it for years.

### The Bloodline Conversation

Selene will not bring this up. Players who are actively pursuing the five Founding bloodlines and have the knowledge to recognize the Thessal markers will find it.

When they ask her directly, she will be quiet for a long moment. Then: "Yes. I've known for six years."

Her reason for not acting on it: she has been protecting people on the assumption that the Crown reforging is possible. The moment she tells someone about the bloodline, she is committed in a different way. She has been choosing to be committed without being asked. That felt like freedom.

She will participate in the reforging. Players who approach this carefully - who ask rather than tell, who give her room to make the choice - will find her response is genuine commitment.

---

## STAGE 4: THE INFORMANT (Levels 7-8)

### The Burned Network

There is an informant in the Crown Loyalist network feeding information to the Darian Intelligence Directorate.

**The Hunt:** The informant is not a dramatic villain. They are a Crown Loyalist supporter who was compromised by the Empire eight months ago - a family member used as leverage. They have been providing minimum viable intelligence. They are miserable. They want out.

**Finding the Informant:** DC 14 Investigation across three sessions of the Crown Loyalist network. The trail leads to a midlevel Crown Loyalist coordinator in Vaelthorn named Dalis Carne.

**The Resolution:**
- Players can bring the informant to Selene. Selene's response is not what players might expect: she is not angry. She is sad. She asks Dalis what the Empire has on them. The answer - a young sister in an Imperial labor post - is something the Black Rose network can address. Dalis, free from leverage, becomes one of the network's most reliable people out of genuine gratitude.
- Players can expose the informant publicly. This burns Dalis, solves the immediate problem, and loses Selene a potential asset.
- Players can turn the informant - Dalis deliberately feeding the Empire false information.

---

## DM NOTES

The Black Rose Thorns quest is the campaign's long-running relationship investment. It does not have a dramatic climax - it has a series of moments where the players demonstrate who they are and Selene responds in kind. The reward is not a boss fight. It is access.

Selene herself is the quest's design center. She is the most competent non-player character in the campaign - smarter than almost everyone, operating on a time scale the players are just beginning to understand, having protected people for years without asking for recognition. Her bloodline is not her defining characteristic; it is one thing about her.

The informant subplot prevents the Black Rose from feeling like a frictionless ally. Real trust is built through handling problems honestly. Dalis Carne is not an interesting villain - they're an interesting person who made a desperate choice and needs someone to give them a way out. Selene already knows this when the players find the answer.
$notes$ WHERE slug = 'black-rose-thorns';

-- ============================================================
-- FOG AND FREEDOM
-- ============================================================
UPDATE quests SET extended_notes = $notes$
# FOG AND FREEDOM
### *The Free Isles Compact - What the Fog Is and Whether to Open It*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Arc** | Arc 1-2 |
| **Levels** | 5-9 |
| **Region** | Shattered Isles |
| **Key NPCs** | Captain Elara Wynn (Compact Pragmatist); Mira Soames (Saltmere dreamer); Harbormaster Kev Dross (Tidecrest) |
| **Shadow Lord** | Ulraeth the Unmoored (Wraith Galleon connection) |
| **Resolution** | Free Isles Compact political alignment; Wraith Galleon access; Crown Shard from Caldera Isle |

---

## OVERVIEW

The Shattered Isles have been surrounded by unnatural fog for three hundred years. The fog predates the Crown's Shattering - it appeared approximately when Ulraeth the Unmoored caught the Wraith Galleon's crew in their time loop.

The Free Isles Compact has three political positions:
1. **The Fog-Openists** (led by Captain Elara Wynn): The fog is a problem. Understand it, disrupt its source, open the Isles to full trade.
2. **The Fog-Closers** (led by Harbormaster Vell of Saltmere): The fog has protected the Isles from Imperial attention for three centuries. Opening it is strategically stupid.
3. **The Watchers** (no clear leader): The fog is a symptom, not the problem. Something in the Isles needs to be understood before the fog is opened or closed intentionally.

The Wraith Galleon is the answer to the Watchers' position: it is the source. The players who find it and break its time loop will disrupt the mechanism that maintains the fog. When the Galleon's loop breaks, the fog begins thinning within three days.

---

## ACT 1: SALTMERE AND THE DREAM (Levels 5-6)

### Mira Soames' Recurring Dream

Mira Soames has been dreaming about a galleon for six years. The dream: a three-masted ship, perfectly still in a cove, a captain frozen in the act of giving an order, a log that writes itself. She knows it's on Caldera Isle because the caldera shape appears in the dream's background.

She will tell this to any player who sits down and listens to her seriously. She has been telling it for years and most people think she's eccentric. She is the most accurate source of information about the Wraith Galleon available outside the Sentinel Order.

**What She Can Provide:**
- The Caldera Isle cove location (approximated from dream geography)
- The log's most recent entry ("almost") - she dreamed it last week
- The specific quality of the time loop's stillness

### The Compact's Politics

Captain Elara Wynn, if the players have connected to the Free Isles Compact, knows about the Wraith Galleon as an island legend. She will commission players to investigate it - she's been looking for a genuine explanation for the fog for fifteen years.

Her interest is pragmatic: she wants the fog explained and, if possible, removed. She does not know the fog's removal will happen automatically if the Wraith Galleon's loop breaks.

---

## ACT 2: CALDERA ISLE (Levels 6-8)

### Getting to Caldera Isle

Caldera Isle is in the Shattered Isles' southern cluster - navigable from Saltmere in two days with a reliable captain. The fog is thickest here.

The approach to Caldera Cove: the fog lifts about half a mile out, in an unusual clarity - a pocket of still air above the water that is the spatial effect of the time loop at its source.

### The Wraith Galleon

For Fog and Freedom quest continuity:
- The Crown Shard in the Captain's chair is the Shattered Isles Crown Shard
- When the loop breaks, the 47 sailors take their first breath in 300 years - all of them are present for the resolution; this is a crowd scene
- Captain Veyra Sorn's first act after "It stopped" is to look at the sea through the porthole. The fog is visible from here. She watches it thin.

### The Fog Question

When the loop breaks, the fog begins dissipating over three days. Players who return to Saltmere during this period will see something the Isles haven't seen in three centuries: the horizon, clear, from the harbor.

The reaction in Saltmere is divided:
- Most residents: relief, wonder, the particular feeling of something that has always been there being gone
- The Fog-Closers: alarm - the Darian Empire will now be able to navigate to the Isles without the fog's protection
- The Fog-Openists: vindication - and immediately, a list of things that need to be done now that the horizon is open

---

## ACT 3: THE COMPACT'S CHOICE (Levels 7-9)

### The Political Fallout

The fog's removal triggers an emergency Compact session. All three factions are present.

The central argument:
- **Fog-Closers:** The Isles' independence depended on the fog. The Compact must prepare defenses.
- **Fog-Openists:** The trade route benefits are immediate and significant. The Compact's independence depends on its own strength, not on navigational quirks.
- **Watchers:** Both positions miss the point. Something was suffering inside the fog. What does the Compact owe the people who were imprisoned in it for three centuries?

**The Watchers' position** is the one the players are most positioned to support - they know Captain Veyra Sorn is real, that 47 people were trapped for 300 years.

### Veyra Sorn's Situation

Captain Sorn and her crew are alive in CR 847 having left in CR 547. Their families are 300 years dead. Their ship is real but ancient.

She will say it once, quietly, to the players before the Compact politics get loud: "We sail. That's what we do. We just need to know where."

The Free Isles Compact offering her crew formal charter status - recognition, port rights, a role in the Compact fleet - is both practically useful (47 experienced sailors) and the right thing to do.

---

## DM NOTES

Fog and Freedom is the Shattered Isles arc's emotional and political center. The Wraith Galleon is the dungeon; Fog and Freedom is what the dungeon means.

The scene of the fog thinning as seen from Saltmere harbor should be played with care - it is one of the campaign's quietly enormous moments. Something that has been wrong for three centuries stopping. The island residents watching the horizon appear. This deserves more than a one-line summary.

Captain Veyra Sorn's quiet statement - "We sail. That's what we do. We just need to know where." - is the Wraith Galleon's emotional resolution. She is not broken by 300 years of stillness. She is freed by the stopping of it. She knows exactly who she is. The players gave her back the ability to act on it.

The Darian Empire's attention to the Isles, now that the fog is gone, becomes a background pressure in Arc 3. Not an immediate crisis - but the players will start hearing about Imperial survey ships.
$notes$ WHERE slug = 'fog-and-freedom';
