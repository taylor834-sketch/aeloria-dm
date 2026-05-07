-- Expand "Sixty Years of Wrong" with full runnable quest content
UPDATE quests SET
  description = 'Seraphel Noct has spent sixty years believing she is liberating the Shadow Lords from an unjust prison. Somewhere in her own research — on Floor 2 of the Ashen Spire — is a margin note she wrote twelve years ago and never resolved: "The Binding suppresses their nature, not their power. What survives the suppression may not be what was imprisoned." That crack in her certainty is the only non-violent path to stopping the Gate of Unbecoming. The players must find the note, survive the Spire, and decide whether to use it.',
  dm_notes = 'This is the campaign''s hardest conversation, not its hardest combat. The margin note reduces the Persuasion DC from 20 to 16. Each additional piece of Shadow Lord evidence the players have gathered (from Bloodmire Depths, from Pale Cathedral, from Frostgale Keep) reduces it by 2 more. A party that has done their homework can make this check. A party that skipped the other quests will likely have to fight. Both are valid outcomes — but the persuasion ending is the one worth building toward. Do not make the note easy to find; make it rewarding when they do.',
  quest_type = 'subplot',
  status = 'hidden',
  reward_notes = 'Persuasion path: Seraphel seals the Gate permanently, her research archive becomes available to the Sentinel Order, Ashen Marches Crown Shard retrieved, Bloodmire ritual simultaneously disrupted. Combat path: Gate stopped, Crown Shard retrieved, archive recoverable, but Gate circle remains as a permanent thin spot requiring Sentinel management.'
WHERE slug = 'sixty-years-of-wrong';

UPDATE quests SET extended_notes = $notes$
# SIXTY YEARS OF WRONG
### *The Crack in Seraphel Noct's Certainty*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Arc** | Arc 3 (setup) / Arc 4 (resolution) |
| **Levels** | 12-16 |
| **Region** | Ashen Marches — The Ashen Spire |
| **Quest Type** | Subplot (tied to The Gate of Unbecoming main quest) |
| **Status** | Hidden until players reach the Ashen Spire |
| **Quest Giver** | No formal giver — players discover it by finding Seraphel's notes |
| **Time Pressure** | Darkgate Festival (once per year); the ritual must be stopped before dawn |

---

## PREMISE

Seraphel Noct is the campaign's primary villain and she is not entirely wrong. Her belief — that the Five Shadow Lords were imprisoned unjustly by frightened kings, that freeing them would correct a centuries-old wrong — is grounded in real scholarship, real evidence, and sixty years of genuine conviction. She is not rationalizing. She believes this.

She is also catastrophically wrong about what the Shadow Lords have *become* after ten thousand years in the Shadow Below. But she doesn't know that.

Twelve years ago, in her own research notes on Floor 2 of the Ashen Spire, she wrote: *"The Binding suppresses their nature, not their power. What survives the suppression may not be what was imprisoned."* She wrote it and moved on, never resolving it. It is the only crack in sixty years of certainty.

The players who find that margin note have the only tool that can end the Gate of Unbecoming without combat — or strengthen the argument if combat happens anyway. This quest is about finding it and knowing what to do with it.

---

## HOW THE QUEST ACTIVATES

This quest is **hidden** until the players enter the Ashen Spire. It does not have a formal quest giver. It activates in one of two ways:

**Path A — Daen Orveth:** On Floor 4 of the Ashen Spire, the room of an operative named Daen Orveth contains a journal. His most recent entry, three days ago: *"She looked at the Gate today and I saw her face. I do not know what she is hoping for anymore. I think she wants to stop. I think she doesn't know how."* If the players find this and ask the right questions of him (or if they encountered him alive in the Entry Hall), he will tell them about the margin note on Floor 2. He won't give them the page number — he doesn't know that — but he'll tell them what he heard her say: *"I wrote something once that I should have chased down."*

**Path B — Direct Discovery:** The players are exploring Floor 2 (Research) and a player with Investigation 14+ or who spends meaningful time with the research notes finds the margin annotation themselves. It's easy to miss — it's written in the margins of a larger treatise on Shadow Lord taxonomy, thirty pages in, in smaller handwriting than her normal notes. DC 14 Investigation if actively searching the research floor, DC 18 if just passing through.

**Path C — Elyndra's Intel:** If the players have deep Sentinel Order trust (Reputation 3+) and brief Elyndra before the Spire, she will tell them: *"She was a scholar before she was a warlock. She published once, decades ago, under a different name. The paper raised exactly the right question about what the Binding did to the Shadow Lords' nature. She never published again. I have always wondered why."* This primes the players to look for the crack.

---

## THE QUEST TREE

### Step 1 — Get to the Ashen Spire

**Prerequisites the players should have coming in:**
- Knowledge of the Gate of Unbecoming ritual (from Sentinel Order or Shadowspire Ruins intel)
- Understanding of Seraphel's history (her name, her cause, her sixty-year plan)
- At least 2 Crown Shards (the Ashen Marches shard is inside the Spire)
- Ideally: evidence of what the Shadow Lords do to the world (Bloodmire Depths, Pale Cathedral, Frostgale Keep encounters)

**Getting there:** The Ashen Marches are flat, grey, and oppressive. No birdsong. No wind sound even when wind moves. The players' own heartbeats are audible in the silence. Use this. Within five miles of the Spire, the ash falls thicker and vision beyond 100 feet is poor.

**The Cabal Perimeter:** Forty Shadow Cabal operatives in a three-mile perimeter. These are not random guards — twelve years of service, loyal to Seraphel personally. They can be:
- Fought through (noisy, triggers alert; three patrol groups of 4-6 each)
- Snuck past (DC 14 Stealth; advantage if players have Cabal insignia from earlier encounters)
- Talked to (the operatives believe in the cause genuinely; players who engage them about *why* they're here will find 2-3 who are uncertain as Darkgate approaches)

---

### Step 2 — The Entry Hall (Floor 1)

The ground floor is administrative, not combat. Couriers, support staff, a communications board. No combatants present.

**The Ledger:** On the communications board, a sourcing ledger for ritual materials. Two pages in: a tally of sacrifices used to power the binding seals. 47. The Pale Shepherd's cult provided 18 of them. Players who did The Hungry Dark quest recognize the connection immediately.

**The Decision:** Go through (noisy, alert triggered, harder approach) or social/stealth (cleaner, preserves the element of surprise for upper floors). Two staff members are visibly scared and will not raise an alarm if the players seem competent and certain. They just want to survive Darkgate.

**Daen Orveth may be here** (Floor 4 is his room, but he may be down here on the eve of Darkgate, avoiding the preparations). If found here: he is a tall, quiet man who has been doing this for eleven years and has run out of certainty. He will not fight the players. He will tell them about the margin note if they earn even minimal trust (DC 12 Insight to read his doubt; DC 13 Persuasion to get him talking).

---

### Step 3 — The Research Floor (Floor 2)

This is where the margin note is.

**The Room:** Thirty years of research notes on the Shadow Lords. Academic, brilliant, organized. Players who read even a few pages will feel the weight of it — this is the work of someone who genuinely tried to understand something she believed the world had gotten wrong.

**Finding the Note:** The annotation is in the margins of a treatise on Shadow Lord taxonomy, page 31. DC 14 Investigation if actively searching, DC 18 if not. A player who specifically searches for anything that looks like doubt, second-guessing, or personal annotation finds it automatically.

**What the Note Says:** *"The Binding suppresses their nature, not their power. What survives the suppression may not be what was imprisoned. Follow this — [scratched out section] — no. Not tonight. After the equinox."* She never followed it. The equinox reference is from twelve years ago.

**Why This Matters:** This is the argument she can't refute. In sixty years of defending her position, she has never answered this question. She didn't answer it because answering it might have required stopping. The players who bring this to her on Floor 6 are not offering her new information — they are giving her permission to ask the question she suppressed.

**Also on Floor 2:**
- Complete Shadow Lord research (the most thorough anywhere; the Sentinel Order would give almost anything for this)
- Evidence that her belief in the Shadow Lords' "true nature" is based on pre-imprisonment records, not anything from the past ten millennia — she extrapolated what they were, not what they became

---

### Step 4 — Operations and Quarters (Floors 3-4)

**Floor 3 — Operations:**
- Current ritual status (Darkgate is tonight / tomorrow / in 3 days — set this to create appropriate urgency)
- Guard assignments and Spire security layout
- Correspondence with Lord Caedric Valemont (encrypted; DC 17 without key, key is on Floor 4)

**The Caedric Revelation (Floor 3):** If decrypted, Caedric's letters make clear he thinks Seraphel is working toward his political victory, not a Shadow Lord liberation. He does not know about the Gate of Unbecoming. He believes he is backing a powerful warlock who will put him on the throne. He is being used and does not know it. This is useful: if the players need to shatter Caedric's alliance with the Cabal, this is the evidence. More importantly, it shows the Cabal's own leadership doesn't know the full plan — Seraphel operates in isolation even from her allies.

**Floor 4 — Personal Quarters:**
Seven rooms. Combat-capable occupants are not here (they're in ritual preparation on Floor 5). What's here: letters home, journals, small personal objects. The texture of people who made a choice and lived it.

**Daen Orveth's Room:** His journal is the key find. Read the most recent entry aloud to the players: *"She looked at the Gate today and I saw her face. I do not know what she is hoping for anymore. I think she wants to stop. I think she doesn't know how."*

If Daen is here (alternatively to finding him on Floor 1): same conversation, same result. He knows about the margin note. He can tell the players its general location on Floor 2. He cannot stop Seraphel himself — he has tried to have the conversation and couldn't find the words. He has been waiting for someone who could.

---

### Step 5 — The Binding Preparation Chamber (Floor 5)

This floor is a working space, not combat. Seven carved stones arranged around a central dais, each bound with a different Shadow Lord's seal.

**The Air:** It tastes like endings. Characters with death-adjacent backgrounds feel the Mother of the Last Door's proximity. Characters who experienced the Pale Choir in The Forgetting quest feel that same weight of accumulated identity. The five Shadow Lords are present here as pressure, not presence.

**The Crown Shard:** Sealed inside the central dais, used as a power source. Seraphel found it twelve years ago and incorporated it without knowing what it was. A character with Founding bloodline who touches the dais will feel it through the stone.
- Extracting it requires disrupting the dais: DC 16 Arcana, delays the ritual by one full day (significant if Darkgate is tomorrow)
- If the players don't extract it now, they can get it during or after the Floor 6 confrontation

**Disrupting the Seal Stones:** Players can destroy individual seal stones (DC 18 Arcana, or physical damage 30 HP each). Each destroyed stone reduces Seraphel's power on Floor 6 (removes one Shadow Lord's amplification from the Gate). This is the prep work that makes the fight — or the conversation — easier.
- Destroying seal stones is not silent. It alerts the Floor 6 preparations.
- Destroying all five is possible but means Seraphel has time to prepare a harder fight.

---

### Step 6 — The Gate Floor (Boss Encounter, Floor 6)

Four hundred feet up. The ceiling has been opened. The Gate of Unbecoming occupies the entire level — a fifteen-foot binding circle with sixty sub-seals, all active, all glowing with a light that isn't light.

**Seraphel Noct is here.** She has been here for three days. She has not slept. She looks like someone who ran sixty years toward something and just arrived.

When the players arrive, she does not immediately attack. She speaks first.

---

## THE ARGUMENT (Phase 1 — Before Any Rolls)

Seraphel makes her case. She has been waiting for opposition and some part of her wanted it.

**Her argument:** The Shadow Lords were imprisoned without trial. The Founding Covenant was motivated by fear, not justice. The Binding was not an act of protection — it was an act of self-interest by five kings who were afraid of something they couldn't control. The Crown shattered, Aranthor tearing itself apart, the world already broken — what exactly is she supposed to be protecting?

She is not entirely wrong. The players should feel the pull of her argument even as they resist it.

**What the players need to give her:** The margin note. Her own doubt, returned to her.

*"The Binding suppresses their nature, not their power. What survives the suppression may not be what was imprisoned."*

She will recognize it immediately. She will go still. And then she will not have an answer.

**The argument that breaks through:**
*"You wrote this twelve years ago. You knew then. What if you were right? What if the beings you're freeing are not what you've been studying — what if ten thousand years in the Shadow Below changed them? What if you're not liberating the Shadow Lords. What if you're releasing what they became?"*

She has never answered this. She suppressed it because answering it would have required stopping.

---

## PERSUASION MECHANIC

| Condition | DC Modifier |
|-----------|-------------|
| Base DC | 20 |
| Players have the margin note | -4 |
| Players witnessed Nhal'Zeruun's effect firsthand (Hungry Dark) | -2 |
| Players have the Pale Choir encounter (The Forgetting) | -2 |
| Players have Vaul-Khesh evidence (Frost and Blood) | -2 |
| Players have Seraphel's research archive notes | -2 |
| Players threatened or insulted her previously | +3 |
| Players have Daen Orveth present | -1 |

**A party that did their homework can get this to DC 10.** A party that skipped the other quests is looking at DC 18-20. Both are possible. The persuasion attempt takes the full first round of the encounter and requires a player to be the one speaking — not shouting, speaking. If combat starts before anyone attempts it, the moment passes.

---

## IF PERSUASION SUCCEEDS

Seraphel does not become an ally immediately. She stops. The ritual stops. She looks at the Gate she spent three years building and asks, quietly: *"What do I do with sixty years?"*

This is a genuine question. The players need to answer it. Options:
- **"Give your research to the Sentinel Order."** The most complete Shadow Lord knowledge in existence, used to defend against them rather than free them. She will accept this if it's offered without mockery.
- **"Seal the Gate yourself."** She knows how. She built it. She can destroy it permanently — something the players cannot do from outside. If she does this, she will survive but be changed. The Gate's permanent destruction simultaneously collapses the Bloodmire ritual's feeding channel (she knows this; the connections run deep).
- **"Help us reforge the Crown."** She cannot do this herself — she's not a Founding bloodline. But her research is the most complete picture of the Shadow Lord prisons available. She can tell Elyndra things the Sentinel Order has been guessing at for decades.

The Cabal network, without her direct leadership, will fragment within months. Most operatives were loyal to her personally, not to the Shadow Lord cause.

**The scene on the top floor, after she agrees:** She places one hand on the Gate circle and it goes dark, seal by seal, each one a year of work extinguished. When the last seal dies, she is standing in an empty floor four hundred feet above the Ashen Marches. She says nothing for a long time. Then: *"The research is yours. All of it. Do something useful with it."*

---

## IF PERSUASION FAILS OR ISN'T ATTEMPTED

**The Fight (Phase 2):**
Seraphel Noct — CR 17. Shadow magic at highest tier, 60+ years of mastery. Key abilities:
- *Shadow Step* at will (teleports through any shadow in sight)
- *Null Zone* — suppresses all non-Shadow magic within 30 feet for 1 minute (3/day)
- Legendary Resistance (3/day)
- Gate amplification: +25% spell damage and advantage on concentration while within 10 feet of the circle (reduced by destroyed seal stones from Floor 5)

**Key mechanic:** She does not want to kill the players. She wants to complete the ritual. She uses crowd control (Hold Person, Wall of Force, Telekinesis) to keep players away from the Gate rather than to destroy them. Players who accept being incapacitated and recover are fighting someone who is not trying to end them — but that window closes if the Gate activation begins.

**The Gate Activation (Phase 3 — Round 6 onward):**
If combat continues into Round 6, Seraphel begins the activation. She is no longer attacking — she is channeling. Her defenses drop. Players have until Round 8 to stop it:
- 60 total damage to the Gate circle (DC 15 Arcana to identify where to strike)
- Dispel the ritual (DC 20 Arcana; one attempt per round)
- Tackle/grapple Seraphel to break concentration (she must maintain it without interruption)

**If the Gate fully activates:** The Shadow Lords begin crossing over. The campaign shifts — Arc 4 becomes recovery and resistance. The players are still positioned to drive them back via Crown Reforging, but it is harder and the world is irrevocably changed.

---

## FAILURE STATES

**Players never find the margin note:** The argument is possible at DC 20 straight, but very hard. Most parties fight. The combat outcome depends on their preparation. This is not a "bad" failure — it's just the harder path.

**Players find the note but don't attempt the argument:** They fight Seraphel without it. She wins at higher probability. If they survive and capture her, the argument can still happen in a cell later — different context, same crack, different emotional weight.

**Players are killed:** Seraphel completes the ritual on Darkgate. The Gate opens. Arc 4 begins: the Shadow Lords are in the world. The Crown Reforging becomes the mechanism for binding-again, not prevention. This is playable. It is a harder campaign. Make sure the players understand before Darkgate that the window is real.

**Players kill Seraphel but Gate is partially open:** Stopped mid-activation. The Gate is stuck partly open — not enough for Shadow Lords to cross, but enough that the Shadow Below presses against the Mortal Plane in a fifteen-foot radius. Sentinel Order can seal it over three weeks using six Seal-Instruments. During that time: active danger zone.

---

## WHAT YOU GET

**On the persuasion path:**
- Seraphel seals the Gate permanently (cannot be reopened without rebuilding from scratch)
- Her 30 years of research archive: the most complete Shadow Lord documentation in existence
- Ashen Marches Crown Shard (from the dais, or Seraphel retrieves it and gives it over)
- Bloodmire ritual's feeding channel simultaneously collapses (secondary blow to Nhal'Zeruun)
- Seraphel becomes a Sentinel Order asset (reluctantly; she and Elyndra will have a tense working relationship)
- Cabal network begins fragmenting without her leadership

**On the combat path:**
- Crown Shard retrieved
- Archive intact and recoverable
- Gate circle remains as a permanent thin spot (Sentinel management required)
- If Seraphel captured alive: the "sixty years" conversation can still happen, in a cell, for less complete but still meaningful stakes

---

## DM NOTES

**Run the silence on the way there.** The Ashen Marches' oppressive quiet makes the players' own bodies feel loud. A heartbeat, warm breath, the weight of a pack against their back. They should arrive at the Spire understanding why someone might want to transform a world this broken.

**Seraphel never raises her voice.** She does not threaten — she states consequences. She is courteous to enemies she respects. She does not gloat; she explains, when asked, which is worse. When she makes her case on Floor 6, it should feel reasonable. The players should feel the pull of it. That's intentional.

**The margin note is not just a tool.** When Seraphel reads it — when she hears her own twelve-year-old doubt read back to her — she does not perform recognition. She goes still. There is a long pause. Then she says: *"I should have followed that."* That pause is the sixty years. Let it sit.

**Daen Orveth deserves a moment.** If he's present on the top floor when Seraphel stops — if he came up behind the players, not to fight, just to see — his face when the Gate seals is worth describing. He has been waiting eleven years for this. He doesn't celebrate. He just exhales.

**The "what do I do with sixty years" question is the emotional climax.** Not the fight. Not the Gate. That question. Players who have a good answer — one that isn't dismissive, one that treats her conviction as real even as it was wrong — will feel the weight of giving it. Players who say "that's your problem" will watch her close up. Both responses are valid. Only one of them is memorable.
$notes$ WHERE slug = 'sixty-years-of-wrong';
