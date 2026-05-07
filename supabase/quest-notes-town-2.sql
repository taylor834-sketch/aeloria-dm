-- quest-notes-town-2.sql
-- Extended notes for 5 town quests: dunmore-merchant, millhaven-western-field,
-- millhaven-grain, vaelthorn-quiet-rooms, vaelthorn-fen-marsh
-- Aeloria: Age of Cracked Crowns campaign

-- ============================================================
-- QUEST 1: dunmore-merchant
-- ============================================================

UPDATE quests SET extended_notes = $notes$
# The Neutral Merchant
### *She traded with everyone. That's why someone wants her dead.*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Region** | Aranthor — Dunmore market district |
| **Level Range** | 4–6 |
| **Duration** | 60–90 minutes (single session or investigation thread) |
| **Quest Giver** | Gerta Foss, merchant |
| **Quest Type** | Town — Investigation, Protection |

---

## THE SITUATION

The crossbow bolt hit the support post six inches from Gerta Foss's head at the third morning bell, while she was arranging dried-herb bundles at her market stall. The shooter was in the crowd — thirty feet away, gone before the scream finished. Nobody got a clear look. The bolt itself is iron-tipped, untipped by guild mark, completely anonymous. Gerta has been sitting behind her stall for four hours since then, watching the crowd, and she is not panicking. She is reasoning.

By the time the players encounter her — either drawn by the commotion at the market or sent to find her — she has already eliminated the most obvious explanations. She trades with merchants loyal to Caedric Valemont, suppliers who work with Blackwell forces, and two factors who don't declare allegiance to anyone. She's been doing this for eleven years. Nobody has ever tried to kill her. The only thing that changed six weeks ago was the package.

---

## BACKGROUND

*(DM-only — do not share with players)*

Six weeks ago, a woman named Della — tall, grey-streaked hair, weathered traveling clothes, a courier's satchel — arrived at Gerta's stall with a sealed package and a name: a factor's office on Irongate Row in Vaelthorn, a man named Aldric Hume. Della paid Gerta three gold to carry the package south on her next supply run and deliver it discreetly. Gerta thought it was a love letter or a business dispute someone wanted deniable distance on. She made the delivery.

What she didn't know: Della is an operative in Selene's Shadow Cabal network. Aldric Hume is a colonel in Blackwell's logistics division who is quietly coordinating supply routes with Cabal forces — not allegiance, a transaction. The package contained a cipher-locked letter confirming the next phase of that coordination. Selene's network has since moved the operation forward, and someone in Blackwell's internal counterintelligence has started tracing the coordination backward. They found Aldric. Aldric, under pressure, gave them Gerta's name. The bolt this morning was their first attempt to close the thread.

Gerta kept a receipt. She always keeps receipts. The receipt has the Black Rose seal on the wax — she noticed but didn't know what it meant. That receipt, combined with Aldric Hume's name, is a working thread in Selene's Blackwell-Cabal coordination file. If players bring it to anyone embedded in the Black Rose network, it is immediately valuable.

The courier Della can be found in Vaelthorn — she works out of a chandler's shop off the Irongate Row, two doors from Aldric Hume's factor office. She is not the threat. The threat is whoever gave Blackwell's counterintelligence Gerta's name, which means the pressure on Aldric has already begun.

---

## KEY NPCs

### Gerta Foss
**Appearance:** Fifties, stocky, hair the color of iron filings, dressed for work — apron, ink-stained fingers, a ledger she carries like a second limb. The only sign of the morning's event is a small, careful stillness in her hands when she sets the ledger down.

**Manner:** Pragmatic. She does not perform distress. She's frightened but she has channeled it into the same methodical tracking she applies to inventory. She will lay out what she knows and what she doesn't know with the precision of someone giving a deposition.

**Wants:** Protection — not abstract reassurance, but a specific plan. She needs to know whether the players are the second attempt sent to finish the job or people who can actually help. She will ask, directly, within the first five minutes: "Who sent you here, and what do you want from this?"

**Secret:** She has been keeping two sets of books for years — the official ones that go to the tax authority and the real ones. Her neutral-trader status depends on nobody looking too hard at the second set. She'll protect the ledger instinctively even if it's not relevant to the current danger.

---

## RUNNING THE QUEST

> *The stall is still open. The woman behind it is maybe fifty, maybe older, watching the crowd with the fixed attention of someone memorizing faces. When you approach, she doesn't greet you. She looks at your hands first. Then: "You're not browsing for herbs. What do you want?"*

**Beat 1 — Establishing Trust:** Gerta won't share the receipt or Della's name until she believes the players aren't a second attempt. This requires either: a DC 13 Persuasion check (she responds to straightforward honesty over credentials), a DC 14 Insight reciprocal moment (a player accurately reads her fear and names it without condescension), or a third-party vouching from any established Dunmore contact.

**Beat 2 — The Receipt:** Once trust is established, Gerta retrieves the receipt from her strongbox (behind a false panel in the stall's back shelf). The Black Rose seal is unmistakable to anyone with knowledge of the Cabal's iconography — DC 12 History or prior Black Rose contact. She can also describe Della in accurate detail and name Aldric Hume's office on Irongate Row.

**Beat 3 — The Shooter:** The bolt is still in the post. A DC 13 Investigation check on the bolt identifies the angle and therefore the approximate firing position: a second-floor window of the Malt & Tallow warehouse, currently rented to a factor named Bren who has no listed guild affiliation. Bren has fled. The room contains a folded piece of paper with two words in cipher and a crude sketch of the market stall. This is a Blackwell counterintelligence standard-format target marker.

| DC | Skill | Outcome |
|----|-------|---------|
| 11 | Perception | Notice the bolt is still embedded in the post |
| 13 | Investigation (bolt) | Determine firing angle, identify warehouse window |
| 13 | Persuasion | Gain Gerta's trust without vouching |
| 14 | Insight | Read Gerta's fear accurately — she responds with honesty |
| 12 | History | Identify the Black Rose wax seal |
| 15 | Investigation (Bren's room) | Decode the target marker as Blackwell CI format |

**Resolution Path 1 — Protect and Extract:** Players secure Gerta, identify the warehouse origin, and bring the receipt to the Black Rose network or to Selene's people in Vaelthorn. This closes the immediate threat — Blackwell CI loses their thread — and Gerta becomes a permanent, grateful contact.

**Resolution Path 2 — Follow Irongate Row:** Players escort Gerta's information to Vaelthorn themselves, find Della at the chandler's shop, and learn that Aldric Hume has already been arrested by Blackwell internal forces. The receipt and Della's testimony are now the only remaining documentation of the coordination. Delivering it intact to Selene's network is a significant Cabal favor.

---

## IF IT FAILS

**If Gerta is killed:** The receipt burns with her stall — Blackwell CI closes the thread. The Irongate Row coordination continues undetected for another season. Selene's network notes that someone was careless with an asset.

**If the receipt is taken by the wrong party:** If players hand it to Blackwell forces thinking they're helping, Aldric Hume is executed within the week and Selene's coordination file has a gap. The Shadow Cabal's Blackwell operation sets back six months. Selene is coldly displeased.

---

## REWARDS

- Gerta Foss as a permanent merchant contact in Dunmore: reliable trade prices, no questions about cargo, advance warning of market-district Blackwell movements
- The receipt itself — a direct thread into Selene's Blackwell-Cabal coordination file, significant intelligence value
- Irongate Row factor's office address (Aldric Hume) — useful for Black Rose Thorns investigation
- If the target-marker cipher is cracked: a partial list of three other "threads" Blackwell CI is currently pulling

---

## CONNECTS TO

- **Black Rose Thorns** — Selene's network; Della and Aldric Hume are both active threads
- **Succession Crisis** — Cabal-Blackwell coordination; this is one documented instance of a larger pattern
- **Dunmore** as recurring safe base — Gerta's goodwill opens the market district as a reliable operational hub
$notes$ WHERE slug = 'dunmore-merchant';


-- ============================================================
-- QUEST 2: millhaven-western-field
-- ============================================================

UPDATE quests SET extended_notes = $notes$
# The Western Field
### *The soil is dying two inches east per week. Someone needs to figure out why.*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Region** | Aranthor — Millhaven, western agricultural quarter |
| **Level Range** | 3–5 |
| **Duration** | 60–90 minutes (single session) |
| **Quest Giver** | Elder Mira Solt |
| **Quest Type** | Town — Mystery, Environmental Repair |

---

## THE SITUATION

The line runs north to south through the western fields — on the left side of it, healthy soil, green shoots, the smell of turned earth. On the right side, grey-white compaction, no color, no smell at all. Nothing rots on the dead side. Seeds placed in it last week have not changed. The boundary is a clean edge, which should not be possible. The twelve farming families of Millhaven's western quarter have been watching it move east at two inches per week for three months. Three families have already left. The twelve who remain are not optimists — they simply have nowhere to go on short notice.

Elder Mira Solt has been documenting the line's movement with stakes and string since the first month. She knows the rate. She knows the direction. She does not yet know the cause, but she has suspected — without saying it plainly to the farmers, because she does not want to cause a panic — that this is not a natural blight. Mira is a former member of the Sentinel Order. She knows what Nhal'Zeruun seepage smells like. It doesn't smell like anything. That's the tell.

---

## BACKGROUND

*(DM-only — do not share with players)*

The Ashen Marches' corrupting influence travels through ley-lines — underground channels of concentrated magical energy that predate the current civilization by several thousand years. Most ley-lines are inert or lightly active. One line passes under Millhaven's western fields, running northeast toward the Marches. Under normal conditions it would carry background resonance, harmless. The problem is the condenser.

Last year's autumn storms were severe. A standing stone at the field's edge — a flat-topped granite marker the farmers called the Boundary Stone, which is about as poetic as they got — was toppled by a fallen elm. It's now in three roughly equal sections in the drainage ditch running along the field's western boundary. What the farmers don't know, and what Mira Solt half-suspects, is that the Boundary Stone was functioning as a natural ley-anchor: an old piece of worked stone that the original settlers had inscribed with condensing runes — worn nearly smooth now, barely readable — that kept the ley-line channeled and stable.

Without the condenser, the line is bleeding Nhal'Zeruun seepage laterally. The seepage is slow. That's why the line moves two inches per week rather than consuming the field overnight. The good news: the damage is not permanent. Dead soil on a ley-seepage site recovers once the source is sealed, typically within one to three growing seasons.

Restoration is physically and ritually straightforward: the three stone sections must each be lifted back to the original marker site (each section requires a DC 15 Athletics check to maneuver without further damage — they're heavy and awkward). Then a character with Druid or Cleric training performs a ley-anchor reseat ritual, DC 12 Nature or Religion, using the worn runes as a guide. Without the ritual, physical reassembly is decorative. With it, seepage stops within twenty-four hours and the movement line ceases.

Mira Solt knows the ritual. She will not volunteer this information immediately — she wants to see whether the players can reason their way to the problem before she provides the solution. She considers this a soft evaluation.

---

## KEY NPCs

### Mira Solt
**Appearance:** Late sixties, lean, short white hair cut close. She carries a walking staff that has definitely been used as a weapon. Her Sentinel Order insignia is not visible — she keeps it on a cord inside her collar, and will touch it unconsciously when the conversation turns to the Order.

**Manner:** Methodical. She asks questions before she answers them. She's patient with people who are trying to think and direct with people who aren't. She left the Sentinel Order under circumstances she describes as "a disagreement about priorities" and will not elaborate unless a player specifically asks and she decides she trusts them — at which point she says, flatly: "I thought we were spending too much time on politics and not enough on the actual dark. I was told I was wrong. I'm still not sure I was."

**Wants:** The seepage stopped, the stone restored, and the twelve families' fields viable before winter. She is not primarily interested in credit or acknowledgment. She is interested in the problem being solved.

**Secret:** She kept two crates of Sentinel Order field materials when she left — journals, ritual components, a partial copy of the Order's ley-line survey maps for western Aranthor. She will share access to these materials if the players demonstrate competence and good faith. She has been sitting on information that could help three other situations in the region and she knows it.

### The Twelve Families — Key Three

**The Halves:** Lost their entire winter wheat stand to the seepage line last month. Bram Halve is angry in a specific, quiet way — not at the players, at the situation — and will ask blunt questions about timeline and certainty. His wife Cass is the one who actually kept the family in Millhaven when Bram wanted to leave. She asks about the other three families who already left: "Will they be able to come back?"

**The Jonns:** Pulled out last month, came back after three weeks. Sanna Jonn explains, without apparent embarrassment: "We got to the crossroads and Benn sat down in the road and said he couldn't do it. Forty years his grandfather farmed that land." They returned to find their quarter-acre on the safe side of the line, which is either luck or geography.

**The Carrs:** Four generations on the same plot. Old Devet Carr is eighty-one and will not leave and everyone knows it. His granddaughter Tessel is twenty-three, handles the actual farming, and is making contingency plans she hasn't told her grandfather about. She's the one who will ask the players, quietly, whether the dead soil can actually recover or whether she's planning for nothing.

---

## RUNNING THE QUEST

> *The boundary is visible from thirty feet away — not because there's a fence or a marker, but because the color stops. East of the line: green. West of it: the white-grey of ash, perfectly flat, not even a weed. A woman is kneeling at the line with a measuring string and a notebook. She looks up when you approach. "Come to help or come to look?"*

**Beat 1 — The Survey:** Mira shows the players the measurement stakes, the rate of movement, and the three stone sections in the drainage ditch. The worn runes on the stone are detectable with a DC 11 Arcana check — they're anchoring inscriptions, very old. A DC 13 Nature check on the dead soil identifies the complete absence of microbial activity as consistent with magical contamination rather than mundane blight.

**Beat 2 — The Restoration:** Moving the stone sections (three checks, DC 15 Athletics each, can be assisted) takes about an hour. The ritual reseat takes thirty minutes for a prepared Druid or Cleric. If no player has the ritual training, Mira will perform it herself — but she'll make them do the heavy lifting and watch closely so they understand what they're watching.

**Beat 3 — After:** The seepage line stops visibly within the day. The Halves, Jonns, and Carrs are all watching from the field edge when the last stone is set. Nothing dramatic happens — the line just doesn't move anymore. Tessel Carr walks out to the dead soil, kneels, picks up a handful. Puts it down. Looks at the players. "How long to recover?" The honest answer is one to three seasons. She nods. "That's survivable."

| DC | Skill | Outcome |
|----|-------|---------|
| 11 | Arcana | Identify worn runes as anchoring inscriptions |
| 13 | Nature | Confirm magical contamination vs. mundane blight |
| 15 | Athletics | Move each stone section without damage (×3) |
| 12 | Nature or Religion | Perform ley-anchor reseat ritual |
| 14 | History | Recognize Nhal'Zeruun seepage pattern from scholarship |
| 13 | Insight | Read Mira's evaluation posture — she's watching to see if you're competent |

**Resolution Path 1 — Players Lead the Restoration:** Players identify the standing stone, reason through the condenser function, and perform the ritual with Mira advising. She is openly satisfied by this — not effusive, but specific: "You understood what you were solving. That matters."

**Resolution Path 2 — Mira Leads, Players Support:** If players are stuck, Mira provides the ritual knowledge and performs it herself while players handle the physical work. This works — field is saved — but Mira's reference library access comes with a caveat: "Come back when you've read the survey maps and tell me what else you notice. Then we'll talk about what else I have."

---

## IF IT FAILS

**If the ritual is attempted without the stones physically repositioned:** The magic dissipates without effect. Mira notes this dryly. The seepage continues. The players can try again the following day once the stones are properly placed.

**If the players leave without completing the restoration:** The seepage line reaches the Carr family's plots within three weeks. Devet Carr dies in his fields that autumn — not from the blight, from the cold, because his granddaughter had to choose between heating the house and repairing the roof with the grain money they didn't have. Mira Solt does not send word to the players. She simply doesn't send word.

---

## REWARDS

- Mira Solt's reference library access: Sentinel Order field journals, partial ley-line survey maps for western Aranthor, ritual component stores
- Mira as a recurring ally — she will provide informed guidance on Nhal'Zeruun seepage events, ley-line disruptions, and Hungry Dark activity in the region
- The twelve Millhaven families as a network of reliable western-Aranthor contacts: shelter, food, local information, and the particular loyalty of people who remember when someone showed up and did the work
- Tessel Carr specifically will keep detailed records of the soil recovery rate — useful intelligence for any future Nhal'Zeruun assessment

---

## CONNECTS TO

- **The Hungry Dark** — Nhal'Zeruun seepage through ley-lines; this is a small, early instance of a larger regional pattern
- **Mira Solt** as recurring ally — her Sentinel Order background and ley-line knowledge are relevant to multiple campaign threads
- **Millhaven** as a recurring safe base — the western-field families represent long-term goodwill in a strategically useful western Aranthor location
$notes$ WHERE slug = 'millhaven-western-field';


-- ============================================================
-- QUEST 3: millhaven-grain
-- ============================================================

UPDATE quests SET extended_notes = $notes$
# The Apology Tour
### *Forty bushels taken at swordpoint. The man who took them is in Dunmore buying ale.*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Region** | Aranthor — Millhaven (problem) / Dunmore (resolution) |
| **Level Range** | 3–5 |
| **Duration** | 45–75 minutes; extends if players travel to Dunmore |
| **Quest Giver** | Elder Mira Solt / Millhaven village collectively |
| **Quest Type** | Town — Redress, Political Friction |

---

## THE SITUATION

Two weeks ago, a Blackwell tax collector named Voss arrived in Millhaven with two armed escorts and a collection order. The order authorized 120 bushels of grain at standard wartime assessment. Voss collected 160. The village watched him load the overage onto his own cart — not the Blackwell supply wagon — and cart it out. Nobody stopped him because he had two escorts with hands on their swords and a seal that looked official enough.

Millhaven's winter margin is already thin from the western field situation. A 40-bushel shortfall doesn't mean hunger if nothing else goes wrong. But things always go wrong, and Mira Solt — who has been doing the math since the morning Voss rode out — is sitting on a number that makes her uncomfortable. She doesn't need revenge. She needs the forty bushels back, or their coin equivalent, before the second frost. She presents this to the players without drama: "A contractor stole from us. He's still accessible. I'd like someone to go get it back."

---

## BACKGROUND

*(DM-only — do not share with players)*

Voss is not a Blackwell soldier. He's an independent contractor — a licensed tax assessor who works collection circuits for Blackwell's administrative division during wartime. His authorization document is genuine. The numbers on it are not what he collected. This is fraud. Blackwell's quartermasters are, on the whole, not interested in tolerating administrative fraud because administrative fraud makes their logistics impossible — but they're also not going to investigate every collection complaint from a village they've never heard of unless someone puts the discrepancy in front of them directly.

Voss is currently at the Tallow & Timber inn in Dunmore, three days into what appears to be a self-congratulatory recovery period. He has a room, a tab, and a casual confidence that nobody follows up on one grain overage. He has done this before — Mira has heard rumors from two other villages on his collection circuit. He has a pattern.

The quartermaster responsible for Voss's collection district is a woman named Captain Aldren Cass — stationed at the Dunmore military post, two streets from the Tallow & Timber. She is not corrupt. She is, by all accounts, aggressively not corrupt, in the way of someone who has strong opinions about people who make her paperwork inaccurate. Voss's collection discrepancy, presented to her with the original authorization document and the village's own grain records, is an administrative matter she will address immediately and with visible displeasure.

The Vaelthorn tax authority also has standing to act. Mira has contacts there from her pre-Sentinel years. Filing through them takes two weeks but produces a formal censure and a recovery order that Blackwell is obligated to honor. It's slower but politically cleaner — and it goes on Voss's permanent record in a way that the quartermaster route doesn't necessarily guarantee.

---

## KEY NPCs

### Voss
**Appearance:** Forties, soft around the middle, dressed slightly too well for a traveling assessor. He has the easy manner of someone who has never faced a meaningful consequence. His authorization documents are kept in a leather case he doesn't let out of reach.

**Manner:** Friendly and slippery in equal measure. He's good at making people feel like they're overreacting. If confronted about the overage he'll first express confusion, then mild concern, then suggest there may have been a counting error at the village end. He has a rehearsed version of this conversation and he's had it several times.

**Wants:** For this to go away quietly. He calculated that Millhaven — small, politically unimportant, currently distracted by the field problem — would not pursue him. He is wrong, but he doesn't know that yet. Under real pressure (the quartermaster, a formal complaint, or players who make clear they know about the other villages on his circuit), he folds rapidly. He is not a man who has built any infrastructure for being held accountable.

**Secret:** Two other villages, Crestwick and Anver Crossing, have similar discrepancies from his circuit this season. He has enough in the Dunmore banking house to cover all three overages plus fines if it comes to that, but he's hoping it won't.

### Captain Aldren Cass
**Appearance:** Fifties, short hair, a soldier's posture that hasn't softened with the desk assignment. She has a stack of ledgers on the left side of her desk that is visibly larger than the stack on the right, and she has opinions about this.

**Manner:** Efficient. She asks the same questions a good auditor asks: what is the authorization number, what are the documented figures, what is the discrepancy. She does not editorialize until she has the facts. When she has the facts, she editorializes briefly and then acts.

**Wants:** Accurate paperwork. The ideological content of the Succession Crisis is, to her, noise. The administrative content — collection orders, distribution records, supply chain integrity — is what she actually cares about. Players who come to her with clean documentation get clean results. Players who come to her without documentation get a request for documentation and a polite dismissal.

### Mira Solt (see also: millhaven-western-field)
**Manner here:** Mira is patient with bureaucratic process because she spent years inside a bureaucratic institution and knows how to use it. She will file the Vaelthorn tax authority complaint herself if players bring her Voss's authorization document number and the village's grain records. She does not need to be present for the Dunmore routes.

---

## RUNNING THE QUEST

> *Mira spreads a hand-drawn chart on the table — columns, dates, numbers. She taps the bottom row. "He was authorized for one hundred twenty. He took one hundred sixty. The overage is on his cart, not in a Blackwell supply wagon. I have two witnesses who watched him load it." She folds the chart. "I need someone who can go get it back."*

**Beat 1 — Gathering the Case:** Mira provides the village's own grain count records and the authorization document number (she copied it down before Voss left — she copies everything). Players can also speak to Bram Halve, who watched the loading, and to the village ledger-keeper, who has the pre-collection inventory. A DC 11 Investigation check on these records produces a clean discrepancy summary that will satisfy any administrative review.

**Beat 2 — Choosing the Route:** Three paths are visible. Dunmore-Voss: direct confrontation, fastest, most satisfying, requires finding Voss at the Tallow & Timber and making the return of the overage more appealing than the alternative. Dunmore-Cass: formal route through Blackwell administration, Cass handles it professionally, Voss loses his contractor license. Vaelthorn formal complaint: Mira's route, two weeks, permanent record, broader implications for Voss's other circuits.

**Beat 3 — Resolution and the Return:** The forty bushels (or their coin equivalent — Voss offers coin to avoid the logistics of return transport) come back to Millhaven. Bram Halve receives them without ceremony — he's not the type — but he stands at the edge of the road when the players ride back through and gives a single nod. Mira notes, precisely, that this was done correctly.

| DC | Skill | Outcome |
|----|-------|---------|
| 11 | Investigation | Compile clean discrepancy summary from village records |
| 13 | Persuasion (Voss) | Convince Voss the quartermaster route is worse for him |
| 15 | Intimidation (Voss) | Voss returns overage immediately to avoid any further attention |
| 12 | Persuasion (Cass) | Present case cleanly; Cass opens a formal investigation |
| 10 | Insight (Voss) | Recognize he's stalling; he hasn't left town yet because he feels safe |
| 14 | Investigation (Voss pattern) | Find evidence of Crestwick/Anver Crossing discrepancies — escalates consequences |

**Resolution Path 1 — Voss Directly:** Players confront Voss at the Tallow & Timber. He tries to confuse the issue. DC 13 Persuasion or DC 11 Investigation (presenting the clean records) makes clear he cannot make the discrepancy disappear by talking. He pays in coin. He leaves Dunmore the next morning. If players found the pattern evidence: Cass's investigation catches him before he leaves, and all three villages see restitution.

**Resolution Path 2 — Administrative Route (Cass or Vaelthorn):** Players bring documentation to either Cass or Mira's Vaelthorn contacts. The process works. The grain comes back slower, but Voss's contractor license is formally suspended. Millhaven is on the Blackwell administrative record as a verified complaint, which has long-term implications — future collection orders in the region are slightly more scrutinized.

---

## IF IT FAILS

**If Voss leaves Dunmore before players act:** He's gone. The grain is gone. The village absorbs the loss. Mira can still file the Vaelthorn complaint from the documentation alone, but it takes longer and produces no grain. Bram Halve's family spends a difficult winter. Mira doesn't say anything about it to the players. She just files the complaint herself.

**If players accidentally tip off Voss:** He pays back exactly what was authorized (not the overage) and produces a receipt claiming the village signed off on the total. This is forged but plausible enough to slow any complaint. DC 14 Investigation to distinguish the forged receipt from the real authorization document.

---

## REWARDS

- The forty bushels returned (or equivalent in coin — approximately 20 gold)
- Millhaven's genuine long-term goodwill: reliable shelter, no-questions-asked waypoint in western Aranthor, advance word on Blackwell movements through the region
- Mira Solt moves from cautious ally to active one — she begins proactively sharing information rather than waiting to be asked
- If Voss's full pattern is exposed: minor Loyalist reputation boost for disrupting a predatory contractor who was weakening civilian support for Blackwell in rural Aranthor

---

## CONNECTS TO

- **The Hungry Dark** — Millhaven's food security matters to the broader civilian resilience picture
- **Succession Crisis** — Blackwell's taxation practices as a political liability; this is one documented instance
- **Dunmore** — Tallow & Timber inn, Captain Aldren Cass as recurring administrative contact
- **Mira Solt** — continues her arc as recurring ally
$notes$ WHERE slug = 'millhaven-grain';


-- ============================================================
-- QUEST 4: vaelthorn-quiet-rooms
-- ============================================================

UPDATE quests SET extended_notes = $notes$
# The Quiet Rooms
### *A sealed wing. Forty years of silence. It's not silent anymore.*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Region** | Aranthor — Castle Vaelthorn, sealed north wing |
| **Level Range** | 5–7 |
| **Duration** | 60–90 minutes |
| **Quest Giver** | Wren, castle staff (anonymous, frightened) |
| **Quest Type** | Town — Horror, Discovery, Historical |

---

## THE SITUATION

The north wing of Castle Vaelthorn has been sealed since the Night of Broken Glass forty years ago. The door is locked with three different keys held by three different people; none of them have been used together since the night they were issued. Castle staff don't talk about the wing in specific terms. They say it's sealed for structural reasons. The newer staff believe this. The older staff don't say what they believe.

Three nights ago, a scullery worker named Wren was passing the sealed wing's corridor junction at the third bell. She heard, clearly, the sound of a child's footstep. Then another. Then nothing. She stood in the corridor for ten minutes and heard nothing else. She did not open the door. She did not tell her supervisor. She spent two days telling herself she misheard, then sought out the players because she has run out of explanations that don't require her to do something about it.

The other two reports: a pantry worker who heard a low, sustained resonance — "like the castle breathing wrong" — for several minutes on a different night, and a senior steward who saw a shadow pass across the crack under the sealed wing's door, moving opposite to the light source. He is the one who knows what the wing was. He filed a maintenance report to avoid thinking about it.

---

## BACKGROUND

*(DM-only — do not share with players)*

The north wing was Lady Elowen Vaelthorn's childhood home. After the Night of Broken Glass — when her father Lord Aldren Vaelthorn died under circumstances the official record calls "a fall," and which the unofficial record calls something much more specific — the wing was sealed by her mother's orders within a week. Elowen was twelve. She was taken to Sylvara that same month and placed under Sentinel Order protection, which is where she grew up.

The wing was not stripped. Everything is as it was on the night the door was locked: furniture covered in sheets, a nursery that still has Elowen's drawings on the wall, a half-finished letter on the writing desk in her room. The letter is to her father. It stops mid-sentence.

The supernatural activity is not Elowen's ghost or her father's. It's the Mother of the Last Door. The castle's north wing sits directly above the strongest reach point of a ley-line that runs toward the Vaelthorn Shard, housed in the castle crypts below. The Mother has been extending her influence upward through the foundation stones toward the Shard. The nursery is the thinnest point. The resonance, the shadow, and the footstep sound are all manifestations of her reaching — not targeted at Wren or the staff, but present in the way that a deep-sea pressure is present: indifferent, enormous, wrong.

The immediate action is straightforward: seal the reach point. A Cleric ward ritual (DC 12) at the nursery's four corners will suppress the manifestations and slow the Mother's progress through this channel. Alternatively, players who bring this intelligence to Commander Elyndra at the Sentinel Order post can have a Sentinel team perform a more permanent sealing within twenty-four hours. The Shard itself is not accessible through this route — the Mother is reaching, not arrived.

If Elowen Vaelthorn is known to the players: she can be told. Her reaction is not what people expect. She is quiet for a moment and then asks, specifically: "Did you leave it intact?" She means her drawings. If the players say yes — that the wing is undisturbed — she nods once, very slowly, and thanks them in a way that shows exactly how much she has been carrying the weight of that locked door for forty years.

---

## KEY NPCs

### Wren
**Appearance:** Mid-twenties, castle livery, the particular stillness of someone who has been trying very hard to act normally for three days. She fidgets with her sleeve hem when she talks about what she heard.

**Manner:** She is not dramatic about this. She does not want to be dramatic about this. She wants someone else to tell her there's a rational explanation. She will accept "it's handled" as an answer and go back to her work with visible relief. She will not accept "you probably misheard" — she already told herself that for two days and it didn't work.

**Wants:** For it to stop, and for someone else to be responsible for stopping it. She is not asking to be involved beyond the initial information. If players ask her to come to the wing with them, she will decline and then feel guilty about declining. She was there for eleven years before this. She would like those years back.

**Secret:** She knows which senior steward filed the maintenance report. She won't offer his name but she'll confirm it if asked. The steward's report is filed under "structural irregularities" in the castle administrative records — DC 13 Investigation to find it in the right drawer.

### Elowen Vaelthorn (if present or reachable)
**Note:** This NPC's full profile appears elsewhere. Her specific reaction to this quest is worth preparing.

She does not perform grief. If told about the wing, she asks three questions in order: Is the door intact. Is the room intact. Did they leave the drawings. She does not ask about her father. She has not asked about her father in twenty years — she has simply carried the not-asking. The players informing her about this is, depending on the campaign's current state, either a moment of unexpected intimacy or a significant political complication (if Vaelthorn succession is in play, Elowen's childhood room is a claim document in stone).

---

## RUNNING THE QUEST

> *The door at the end of the corridor is oak, iron-banded, three different locks at three different heights. The air here is different — not cold, exactly, but still in a way that indoor air shouldn't be. Still like something held its breath. Wren said the sound came from the other side. The locks are in place. Nothing has opened this door in forty years.*

**Beat 1 — Getting In:** The three keys. One is held by the castle seneschal (can be borrowed with a DC 14 Persuasion and a plausible official reason, or borrowed without question if players have Elyndra's authorization). One is held by the steward who filed the maintenance report — he gives it up with visible relief when players present as investigators rather than accusers. One is hung on a hook in the castle's lower records room, incorrectly filed under "discontinued guest suites."

**Beat 2 — Inside:** The wing is intact. Sheets over furniture, dust, the smell of old wood and old air. The nursery is at the wing's north end. Elowen's drawings are on the wall — careful, twelve-year-old cartography of imaginary countries with cramped margin notes identifying mountains, rivers, village names she invented. The half-finished letter is on the desk: "Father — I have been thinking about what you said regarding the northern boundary survey, and I believe you were right that—" It stops there. Players with DC 12 Insight feel the resonance first as a pressure behind the eyes. The drawings on the wall are faintly vibrating. This is the reach point.

**Beat 3 — The Sealing:** Cleric ward ritual at the four nursery corners: DC 12 Religion or DC 14 Arcana. If both fail, the manifestations continue but do not escalate — the Mother's reach at this point is slow. Players who report to Elyndra have a Sentinel team available within twenty-four hours. After the sealing, the castle goes quiet. Actually quiet. Wren notices it the next morning — she says the air is different. Better.

| DC | Skill | Outcome |
|----|-------|---------|
| 12 | Insight | Feel the resonance in the nursery before it manifests visually |
| 13 | Investigation | Find the third key in the records room |
| 14 | Persuasion | Borrow seneschal's key without Elyndra's authorization |
| 12 | Religion | Perform ward ritual successfully |
| 14 | Arcana | Perform ward ritual (alternative for non-Clerics) |
| 15 | Arcana | Identify the ley-line origin and its connection to the Vaelthorn Shard below |
| 13 | History | Recognize the Night of Broken Glass context from the wing's contents |

**Resolution Path 1 — Players Seal the Wing:** Ward ritual performed, manifestations stop, Elyndra is informed and notes the Shard reach-point in her operational files. Elowen (if reachable) is told. The drawings remain. The letter remains. The wing is locked again.

**Resolution Path 2 — Sentinel Team:** Players gather the intelligence and brief Elyndra directly. She sends a Sentinel team within twenty-four hours. The sealing is more thorough — a Sentinel ley-suppression anchor is installed in the nursery floor. This is the "correct" route if players suspect the Mother's involvement is more advanced than one reach point.

---

## IF IT FAILS

**If the ward fails and players don't escalate:** The manifestations intensify over the next two weeks. A night-shift guard has a breakdown. Wren requests a transfer. The senior steward's maintenance report is found by the wrong person — someone with Cabal connections who understands what ley-activity near the Shard means. This is a significant intelligence leak.

**If players tell the wrong person:** If the Shard's location and the north-wing activity are mentioned to anyone with Caedric Valemont's network, the information reaches Cabal planners within three days. They don't act immediately, but they note the Shard's vulnerability and begin planning.

---

## REWARDS

- Elyndra's gratitude for identifying an active Shadow Lord reach point: operational intelligence credit, increased Sentinel Order cooperation
- If Elowen is told and told accurately: a moment of specific trust; she shares, once, something about the night of Broken Glass that she has not told anyone — not a plot secret, a personal one. The players carry it with them.
- Access to the castle's sealed administrative records (granted by the steward in exchange for not making the maintenance report public): includes historical documents on the Vaelthorn Shard's original installation
- Wren as a reliable castle-staff informant going forward: she owes the players a significant quiet favor and she pays her debts

---

## CONNECTS TO

- **Cracked Crown** — Vaelthorn Shard location confirmed; Mother of the Last Door's reach point identified
- **Succession Crisis** — Elowen's history and her relationship to Vaelthorn; the sealed wing as a political and personal document
- **Gate of Unbecoming** — Mother of the Last Door's expansion pattern; this is one of several active reach points
$notes$ WHERE slug = 'vaelthorn-quiet-rooms';


-- ============================================================
-- QUEST 5: vaelthorn-fen-marsh
-- ============================================================

UPDATE quests SET extended_notes = $notes$
# The Vote That Costs Nothing
### *The vote needs eleven lords. Ten are seated. Lord Fen Marsh is buying rounds for strangers.*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Region** | Aranthor — Vaelthorn, Council of Lords hall and surrounding streets |
| **Level Range** | 3–5 |
| **Duration** | 30–60 minutes (fast-moving) |
| **Quest Giver** | Council administrative staff (anonymous, quietly panicking) |
| **Quest Type** | Town — Ticking Clock, Political Comedy, Hidden Stakes |

---

## THE SITUATION

The Council of Lords procedural vote requires eleven of twelve lords to achieve quorum. Quorum is required by the Charter of Governance for any survey-and-confirmation motion, and today's vote is exactly that: a routine land survey authorization covering several disputed boundary claims in the eastern reaches, including a parcel that borders Lady Veth Horne's hereditary territory. Ten lords are seated in the hall. The vote is in four hours. Lord Fen Marsh arrived in Vaelthorn three days ago, checked into his usual room at the Bellwether Inn, and has not been seen since.

The administrative staff member who finds the players — a young woman named Corris who handles the Council's logistics and is currently in the grip of a bureaucratic nightmare she did not cause and cannot solve through paperwork alone — explains this with the specific anguish of someone who has already tried every official channel. She has sent two runners to the Bellwether Inn. Neither runner came back immediately, and when the first finally did, he reported that Lord Fen Marsh was in the common room, red-faced, buying ale for everyone, and was "extremely happy about something." Corris uses the phrase "extremely happy" in a way that implies it is not a compliment.

---

## BACKGROUND

*(DM-only — do not share with players)*

Lord Fen Marsh received a letter yesterday morning via private courier. The letter was from his estate steward in the Marsh family's home village of Crestwater: his wife Lira, after seven years of waiting, has given birth to their first child. A boy. Healthy. Both Lira and the child are well. The letter included a small painted miniature of the baby.

Fen Marsh has been buying rounds in the Bellwether common room for approximately twenty-six hours. He is not incapacitated — he is a large man, cheerful by nature, and he has been drinking at a celebratory rather than a destructive pace. He can be sobered, fed, and made presentable in under thirty minutes given good food, a wash basin, and a genuine reason to care about the vote. He will not respond to administrative pressure. He will not respond to formal summons. He responds to human beings who understand why he's in that common room and treat it with appropriate gravity.

The complication the players may or may not discover: Caedric Valemont's agents know that Fen Marsh is missing from the hall. They have made no move to find him. They are not trying to keep him drunk or delay him — they're simply waiting. If the vote fails to reach quorum today, the land survey authorization is tabled for thirty days. The tabled survey delays the formal confirmation of Lady Veth Horne's eastern boundary claim. The delayed confirmation means her proxy vote in the next succession debate — which she has committed to the Loyalist bloc — cannot be formally registered until the boundary claim is resolved. It's a four-link chain: missed quorum → tabled survey → delayed boundary confirmation → missing Loyalist proxy vote. The chain is built on the passive assumption that a drunk celebrating father will simply not show up.

Players who identify the chain and flag it to the Loyalist network or to Elyndra's people earn credit for disrupting a passive Cabal operation. They don't need to prove it — recognizing the shape of it is enough.

---

## KEY NPCs

### Lord Fen Marsh
**Appearance:** Fifties, broad, the color of someone who has been in a common room for twenty-six hours and is not apologetic about it. His coat is good wool, slightly untucked. He is holding a small painted miniature with the careful attention of a man who is afraid of damaging it.

**Manner:** Genuinely delighted. He is not trying to shirk the vote — he hasn't thought about the vote. He is in the warm middle of the best day of his life and has been sharing it with anyone who will sit down. He has told the story of the letter, the courier, the miniature, and his wife Lira to at least eleven strangers already. He will tell it again.

**Wants:** To share this. To have someone actually understand what this morning was. He and Lira waited seven years. He is fifty-three. He had stopped hoping in a specific, quiet way that he had not told anyone about. He will respond to players who sit down, listen to the whole story, and treat it as the event it is. He will not respond to urgency as an abstraction. He will respond to urgency if it's connected to something real — if players tell him specifically what's at stake with the vote, why Veth Horne's survey matters, what Caedric's people are waiting for. He's a good man who will do his duty once he understands his duty is actually in play.

**Secret:** He has strong private opinions about Caedric Valemont that he keeps off the public record because his territory borders Caedric's and he has been careful. If players tell him the four-link chain — that his absence is being passively exploited — he is quietly furious in the way of someone who has been carefully neutral and just discovered that neutrality was being used as a tool.

### Corris (Administrative Staff)
**Appearance:** Late twenties, Council livery, the posture of someone who has been walking quickly for three hours and has not found any solution to the walking.

**Manner:** Efficient, specific, visibly holding together. She briefs the players in under two minutes and does not waste words. She knows exactly how much time is left. She will go back to the hall to manage the other ten lords while players handle Fen Marsh.

**Wants:** The vote to happen. She does not care about the political content of the vote. She cares about the Charter of Governance being correctly followed and about not having to explain to the Chief Clerk why quorum failed due to a missing lord. She will provide whatever administrative assistance is possible — she can issue a formal summons (useless, but she'll issue it), she can have a meal prepared at the hall (actually useful), she can stall the vote by up to forty minutes by invoking the standard preparatory review period (extremely useful if players need more time).

### The Tavern Keeper (Bellwether Inn)
**Appearance:** Sixties, comfortable, the practiced equanimity of someone who has seen lords in all conditions. He is not worried about Fen Marsh. He is slightly worried about the volume of rounds that have been purchased.

**Manner:** Helpful, mild. He's watched lords come through Vaelthorn for thirty years and has learned not to have opinions about their private business. He will tell players, matter-of-factly, that Lord Fen Marsh has been there since yesterday and is "in good spirits" and has been showing everyone a picture of a baby.

---

## RUNNING THE QUEST

> *Corris finds you near the Council hall. She does not waste time: "Lord Fen Marsh is missing. The vote is in four hours. We need eleven. He checked into the Bellwether three days ago and has not been seen since. I've sent runners. He's in the common room. He won't come." She pauses. "He's celebrating something. I don't know what. I need someone who can actually talk to him."*

**Beat 1 — Finding Fen Marsh:** The Bellwether Inn is two streets from the Council hall. Fen Marsh is in the common room, exactly where the runner said. He looks up when the players enter, spots them as official-adjacent by their manner, and immediately says: "You're from the hall. Sit down, I'll tell you why I'm not leaving yet." He doesn't wait for a response. He shows them the miniature.

**Beat 2 — The Conversation:** The players need to do two things: first, genuinely engage with Fen Marsh's news (he responds to authentic human acknowledgment, not political theater — a DC 10 Persuasion check or simply good roleplay that treats the baby as the event it is); second, give him a real reason to care about the vote today specifically. He knows about Lady Veth Horne's boundary claim in a general way. If players explain the four-link chain — even partially — he puts the miniature away very carefully and asks for a wash basin.

**Beat 3 — The Vote:** Fen Marsh arrives at the Council hall thirty-five minutes before the vote. He is presentable, sober enough, and slightly louder than normal. He votes yes on the survey authorization. The quorum holds. Corris, watching from the administrative gallery, allows herself one small expression of relief and then returns to her ledger.

| DC | Skill | Outcome |
|----|-------|---------|
| 10 | Persuasion | Engage authentically with Fen Marsh's news; he relaxes and listens |
| 13 | Insight | Recognize that Fen Marsh isn't avoiding the vote — he's simply not present to it yet |
| 12 | Persuasion | Explain the vote's stakes in a way that connects to something he actually cares about |
| 15 | Investigation | Identify the four-link chain (Cabal passive operation) from available information |
| 11 | Perception | Notice, at the inn, that no Cabal-adjacent figures have made any attempt to delay Fen Marsh further — they're waiting, not acting |

**Resolution Path 1 — Human Connection:** Players sit with Fen Marsh, hear the story, acknowledge it genuinely, then explain the stakes. He comes. This is the direct, warm route. He'll remember the players as the people who sat down.

**Resolution Path 2 — The Four-Link Chain:** Players identify the Cabal passive operation, brief Fen Marsh on it, and he comes immediately — motivated not just by duty but by the specific anger of someone who has been careful and neutral for years and just learned that his care and neutrality were being counted on. He votes. Then he quietly asks players how they'd like him to use his border territory position going forward.

---

## IF IT FAILS

**If Fen Marsh doesn't make it in time:** The vote fails quorum. The survey is tabled. Lady Veth Horne's boundary confirmation is delayed thirty days. Her Loyalist proxy vote is missing from the succession debate. Caedric's people get thirty days of room to maneuver. Corris files the most thoroughly documented quorum failure report in the Council's administrative history.

**If players tell Fen Marsh about the chain but he's too drunk to care:** He sobers. He cares. He's a good man. The only version of failure here is if players choose not to engage with him as a person at all — if they try to formally compel him, threaten consequences, or go over his head. He will refuse all of those, pleasantly, and show them the miniature again.

---

## REWARDS

- Fen Marsh as a reliable minor ally: he votes with integrity, he's honest about his limitations, he's slightly distracted whenever children under two come up in conversation
- If the four-link chain is identified and reported to the Loyalist network: Loyalist reputation credit for disrupting a passive Cabal operation at no cost and no violence
- Corris as an administrative contact in the Vaelthorn Council: access to procedural calendars, advanced notice of upcoming votes, someone who can expedite paperwork requests
- A standing invitation to Fen Marsh's estate in Crestwater, extended quietly at the end: "If you're ever in the eastern reaches. Lira will want to meet you."

---

## CONNECTS TO

- **Succession Crisis** — Council of Lords vote mechanics; Lady Veth Horne's territorial claim and Loyalist proxy vote
- **Caedric Valemont's network** — passive operations using political procedure as a tool; the four-link chain is a template for how Caedric's people work
- **Lady Veth Horne** — eastern boundary claim, Loyalist bloc commitment
$notes$ WHERE slug = 'vaelthorn-fen-marsh';
