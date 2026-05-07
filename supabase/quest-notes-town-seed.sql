-- quest-notes-town-seed.sql
-- Extended notes for 5 town quests: mirepost-pell, tidecrest-nets,
-- ironwatch-refugees, stonefall-directive, coldrun-courier
-- Aeloria: Age of Cracked Crowns campaign

-- ============================================================
-- QUEST 1: mirepost-pell
-- ============================================================

UPDATE quests SET extended_notes = $notes$
# The Husband Forgetting
### *A man is still in there. He has thirty days left.*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Region** | Veilwood — Mirepost village, Outer Wood edge |
| **Level Range** | 3–5 |
| **Duration** | 60–90 minutes (single session) |
| **Quest Giver** | Dara Corden, wife |
| **Quest Type** | Town — Ticking Clock, Rescue |

---

## THE SITUATION

Pell Corden has been inside the Pale Choir's influence zone for thirty days. He lives in Mirepost, a village of about two hundred people on the eastern edge of the Veilwood's Outer Wood — the last human settlement before the forest becomes something else. The Pale Choir's radius expands one mile per month from its cathedral deep in the Veilwood's heart, and the nearest boundary crossed Mirepost's eastern threshold four weeks ago.

Pell doesn't know anything is wrong. That's the nature of early-stage exposure. He goes to work each morning at the mill. He eats his supper. He sleeps beside his wife. But Dara has been watching him for thirty days and she knows: he can't remember his brother's name. He laughs at jokes a beat too late, like he's copying the shape of laughter rather than feeling it. When she said their daughter's name last week, he looked at her for a moment with an expression she couldn't read — not blank, exactly, but *searching*.

The recovery window is real and specific. Remove Pell from the Choir's influence zone, keep him at distance for four weeks, and the early-stage absorption reverses on its own. The Sentinel Order in Sylvara confirms this. But Dara cannot make Pell leave — he's not aware he's ill. She has been asking every traveler who passes through Mirepost if they can help. The players are the first people who seem like they might actually do something.

---

## BACKGROUND

*(DM-only — do not share with players)*

The Pale Choir's influence at this range is subtle but measurable. Pell is not experiencing it as loss — he's experiencing it as a kind of lightness, a gentle fading of edges. The Choir doesn't cause pain. It causes ease. By day forty-five, if untreated, Pell will be mid-stage: he'll still know Dara's face but not her name. By day sixty, late-stage: he'll know her as someone who cares for him, without context. After seventy days, the absorption completes and he walks into the forest.

The Sentinel Order in Sylvara has a standard protocol for early-stage exposure: evacuate the affected person to at least three miles beyond the influence zone, establish a temporary shelter with warding elements (specific iron bells and consecrated salt circles — Elyndra's people can provide these), and maintain four weeks of distance. There is a Sentinel waystation two days' travel south at a settlement called Harrow Crossing — outside the influence zone, staffed, capable of monitoring Pell's recovery.

Mirepost's other residents are not in immediate danger. The influence zone boundary runs through the village's eastern quarter; most homes are on the safer western side. Three other families near the eastern quarter should be evaluated, but none are as far along as Pell.

**Why Pell is resistant to leaving:** He feels fine. He has work at the mill. He loves this village. If the players tell him he's being affected by a shadow entity from the deep forest, he'll laugh and offer them another mug. The approach can't be frontal. The approach has to be Dara.

---

## DRAWING PLAYERS IN

**Hook 1 — The Direct Ask:** Dara Corden is standing outside the Mirepost inn when the players arrive, talking to the innkeeper with an intensity that's clearly not casual conversation. If the players are in earshot: "I'm not asking for magic. I'm not asking you to fight anything. I just need someone to help me convince my husband to take a trip south for a month." Her eyes are steady. She's been doing this long enough to have learned not to cry in front of strangers.

**Hook 2 — The Sentinel Order Connection:** A player with ties to the Sentinel Order or who has previously met Commander Elyndra may receive a brief note before arriving in Mirepost: *"Mirepost is inside the new boundary. There is a mill worker there — early exposure, still reversible. We cannot send an operative. If your path takes you through the Outer Wood, stop."* This is a favor ask, not an order.

**Hook 3 — Noticing Pell:** Players who spend any time in the Mirepost inn at evening meal will see Pell Corden himself. He's friendly, cheerful, and something is slightly wrong. A DC 13 Insight check reveals the lag — the half-second delay before his expressions land, the way he tracks conversations without quite joining them. A player who asks if he's feeling all right will get a warm, slightly puzzled: "Better than ever, actually." That's the tell.

---

## KEY NPCs

### Dara Corden
**Appearance:** Late thirties, dark hair worn back in a practical knot, calloused hands from helping at the mill. She looks like someone who has been sleeping in four-hour intervals and refuses to show it.

**Personality:** Precise. Not cold — she's warm when she trusts you — but she has been specific and practical about this problem for a month because falling apart won't save Pell. She will state what she needs. She will not dramatize.

**Motivation:** Get her husband out of the influence zone before he crosses the point of no return. That's the whole of it. She has already figured out the logistics — she has a cousin in Harrow Crossing with room, she knows the Sentinel waystation is there. She doesn't need a plan. She needs help convincing Pell to make the journey, and she needs the players to actually arrange the *safety* infrastructure so the journey isn't just a story she's telling to get Pell moving.

**Secret:** She knows about the Pale Choir more than she lets on. A Sentinel Order operative passed through Mirepost six weeks ago (before the boundary crossed the village) and told her exactly what was coming. She's been counting days since. She has a small notebook with dates and observations about Pell's behavior that she'll share if the players demonstrate they're serious.

**Roleplaying note:** Dara should never be played as desperate or helpless. She is a woman solving a logistical problem under time pressure, and she needs specific assistance, not rescue. If players try to take over or make large promises, she'll ask: "Can you actually do that, or are you telling me what I want to hear?"

### Pell Corden
**Appearance:** Mid-forties, big-shouldered from mill work, a beard he keeps meaning to trim. Genuinely kind face. The Choir hasn't taken his face — just its precision.

**Personality:** Easy. Good-humored. He's been the village's friendliest person for fifteen years. The Choir's early-stage effect has made him *more* affable in a way that should feel slightly wrong — too comfortable, too unbothered.

**Motivation:** He's not motivated by anything unusual right now. That's the problem. His drives are quieter than they should be.

**Secret:** Three nights ago, he dreamed of walking into the forest. He thought it was just a dream. He hasn't told Dara.

**Roleplaying note:** Pell should be likable. Players who spend time with him should genuinely want to save him — not as a quest objective but as a person. The wrongness should emerge slowly: the wrong laugh, the blank moment, the too-comfortable answer to a question that should have made him uncomfortable.

### Maret Fallow — Mirepost Elder
**Appearance:** Sixties, heavyset, runs the village council and the grain accounts with equal efficiency.

**Personality:** Skeptical of outside help; deeply loyal to her community. She knows about the Choir in the abstract (Sentinel Order has been warning the border villages for months) but hasn't acted because she doesn't want to cause a panic.

**Motivation:** Keep Mirepost stable. She will cooperate with the players if they're discreet. She will be obstructive if they start talking loudly about soul-eating forest spirits in the common room.

**What she can provide:** Official Mirepost travel papers for Pell (makes the Harrow Crossing journey legitimate and removes Pell's work-obligation objection). She'll provide these if the players convince her the risk is real and the plan is solid.

---

## RUNNING THE QUEST

### Scene 1: Arrival in Mirepost

> The village appears out of the tree-line like a sigh of relief — smoke from chimneys, the creak of a watermill, the smell of bread and sawdust. It looks ordinary. It looks fine. But as you get closer, you notice the eastern quarter: the houses there have their shutters closed. A child's toy has been left in the road outside one of them. The door is open. Nobody comes to get it.

Players who investigate the eastern quarter find three homes that feel subtly wrong — too quiet inside, nothing obviously amiss. DC 11 Arcana or DC 13 Perception to feel the influence zone's edge, described as a slight blurring at the back of the eyes, like trying to recall a word that won't come.

Dara finds the players, or they find her. She tells them about Pell in three sentences, then asks: "Do you understand what this is? Not the general thing — specifically. How long he has."

### Scene 2: Talking to Pell

This is the quest's heart. Players cannot simply tell Pell he's been contaminated by a Shadow Lord's influence and expect him to agree. He's in the influence zone right now; the lightness of the Choir makes resistance feel unnecessary.

The approach that works is honest and specific — going through Dara, or through things Pell concretely values. The mill isn't going anywhere. His brother Tam lives south of Harrow Crossing — Pell hasn't seen him in two years. Dara wants to take a month and go. Will he come?

| DC | Skill | Outcome |
|----|-------|---------|
| 10 | Persuasion (via Dara's relationship framing) | Pell is interested but wants a reason |
| 13 | Persuasion (direct appeal to Pell's love for Dara) | Pell agrees to think about it seriously |
| 15 | Insight (reading what Pell still values, then appealing to it) | Pell agrees in the same conversation |
| 12 | Medicine (recognizing his symptoms, explaining them gently) | Pell is unsettled enough to listen; advantage on next Persuasion |
| 17 | Arcana (detecting the influence on him, showing him) | He can *feel* the detection — something shifts, a moment of clarity. He's frightened. That fear is enough. |

If players fail the initial approach, Dara steps in: "Pell. Tell me what you dreamed about three nights ago." He hesitates. She already knows. This scene should feel quiet and devastating.

### Scene 3: The Logistics Problem

Pell agreeing to go is not enough. The players need to actually arrange things or this is an empty gesture. Dara is very clear about this: "If I take him south and there's nowhere safe and nothing's arranged, what happens when we run out of money in a week and he wants to come home?"

The players need to arrange at least two of the following:
- **Contact at Harrow Crossing:** The Sentinel waystation can be notified (letter of introduction from Maret Fallow, or a player with Sentinel Order reputation, or DC 14 Persuasion with Elder Fallow to get her to send official word ahead)
- **Pell's work absence:** Maret Fallow can hold his position at the mill for six weeks; she'll agree if the players make the case that this is a genuine medical situation (DC 13 Persuasion)
- **Travel resources:** Three days of provisions and coin for the journey; players can contribute or help Dara negotiate with Maret
- **The warding elements:** If players know about the Sentinel Order's recovery protocol, they may have or be able to obtain iron bells and consecrated salt (from Sylvara, from Elyndra's people, or as a purchasable item from the Sentinel waystation if they send word ahead)

The four-week timeline at distance is real. Players who arrange the full infrastructure — waystation contact, work protection, warding elements — give Pell the best possible recovery chance. Players who arrange only some of it still help; Dara can manage partial resources. Players who arrange nothing beyond convincing Pell to go are setting him up for a failed recovery when practical pressures bring him back early.

### The Complication

As the players are finalizing arrangements, one of the eastern-quarter residents approaches Dara: her neighbor Bren has been "forgetting things" and his wife is frightened. He's been in the eastern quarter for three weeks — two weeks less exposure than Pell.

> A woman about Dara's age, but she's holding herself differently — not with Dara's careful control, but like someone who's been running and has just stopped. Behind her, standing in the doorway of a house with closed shutters, is a man watching you. He's smiling. There's nothing behind it.

This is Bren Harwick, early-stage, less far along than Pell. His wife Selin is asking for the same help Dara asked for. The players must now decide: they're already stretched on resources and time. Do they make the same arrangements for a second family? Maret Fallow can hold two positions, but the provisions and waystation space have limits.

This is not a gotcha — it's the quest's point. The Choir's influence zone doesn't stop at one family. Every decision the players make here is a decision about scale.

---

## WHAT CAN GO WRONG

1. **Players convince Pell but don't arrange logistics:** He agrees to go, gets three days south, runs out of provisions, decides he feels fine actually, comes back. By the time players could return to Mirepost, he's past the window.

2. **Players tell Pell the full truth about the Pale Choir publicly:** Maret Fallow shuts down the conversation. Half the village is now frightened, Pell is resistant and embarrassed, and the players have to manage a minor social crisis before they can get back to the actual problem.

3. **Players ignore Bren Harwick:** They complete Pell's rescue and leave. Six weeks later, if they return to Mirepost, Bren is gone. Selin is in the eastern quarter watching the forest. Dara knows the players could have done more.

4. **The players delay:** Any session that passes without resolution means Pell has moved forward in exposure. After a single significant time gap (a week or more of in-game time), re-run the Insight check on Pell — he's now mid-stage. The conversation with Dara changes: "How long ago did I tell you?"

---

## RESOLUTION

**Full Success:** Pell is south at Harrow Crossing with warding elements in place, his mill position held, and Dara's cousin ready to host them for the month. Bren Harwick has the same arrangements. Both men recover fully over four weeks. In a subsequent session, if players pass through Mirepost again, Pell is there — back to himself, with something carefully whole about him. He remembers everything about the exposure except the dream about walking into the forest. Dara remembered it for him.

**Partial Success:** Pell is out of the zone but the recovery infrastructure is incomplete. He likely returns before four weeks if a specific stressor arises (money, work anxiety, Dara gets sick). Roll a d20 at the four-week mark: on a 12 or higher, Pell held on and fully recovered. On an 11 or lower, he came back too early and is now mid-stage.

**Failure:** Pell is still in Mirepost. Depending on how much time has passed, he's mid or late stage. Dara stops asking travelers for help. She stands at the edge of the eastern quarter some evenings, watching the forest with an expression the players will recognize if they've read Pell's notebook.

---

## REWARDS

- **Dara's Map:** Dara has been tracking the influence zone's expansion herself, cross-referenced with Sentinel Order information. Her map is three weeks more current than the Sentinel Order's last update. It shows the boundary's current edge and a projected one-month expansion — useful intelligence for anyone working the Veilwood situation.
- **Maret Fallow's Letter:** If the players handled this with discretion and competence, Maret writes them a letter of introduction to the Elder of Harrow Crossing — a Sentinel Order-adjacent community that functions as a waystation for Veilwood operations. This opens doors.
- **Experience:** 100 XP per player for Pell's rescue. Additional 50 XP if Bren Harwick is also helped.
- **Faction Reputation:** +1 Crown Loyalists (they have contacts in border villages; word gets around). +1 Sentinel Order if players contacted the Sylvara waystation.

---

## CONNECTIONS

- **The Forgetting (main quest):** This is a ground-level view of what that quest is about. Players who have helped Pell Corden understand, viscerally, what Velar means when she talks about the Cathedral's radius. When they finally enter the Pale Cathedral, they're not fighting an abstraction — they're fighting the thing that would have walked Pell into the forest.
- **Commander Elyndra:** If players contacted the Sentinel Order about Pell, Elyndra knows about it. It demonstrates a level of ground-level engagement with the Pale Choir that earns them more candid briefings later.

---

## DM NOTES

This quest lives or dies on Dara Corden. She is not a damsel. She is a woman who has been running triage on her husband's soul for a month and needs specific operational assistance, not comfort. Play her exactly that way and players will rise to meet her.

The logistics problem is the real quest — not the persuasion check with Pell, but the four-part infrastructure that gives the recovery a chance to stick. Players who think "we convinced him, we're done" have missed the point. Dara hasn't missed it. Let her tell them.

The ticking clock is most effective when you name it. Tell the players at the outset, through Dara: "Thirty days. Forty-five and he won't know my name. Sixty-five and he'll walk into the trees." Put that number in their heads and let it work on them.

The emotional beat to hit: when Pell, through Dara's question about the dream, *almost* understands. That moment of clarity before the Choir's lightness settles back. He's in there. He can hear you. That's the moment players need to carry into the Forgetting quest.
$notes$ WHERE slug = 'mirepost-pell';


-- ============================================================
-- QUEST 2: tidecrest-nets
-- ============================================================

UPDATE quests SET extended_notes = $notes$
# The Empty Nets
### *Three months of nothing. The fish know something the fishers don't.*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Region** | Sapphire Coast — Tidecrest village, Tidecrest Flats |
| **Level Range** | 4–6 |
| **Duration** | 45–75 minutes (single session) |
| **Quest Giver** | Elder Cas Dorn, fishing fleet coordinator |
| **Quest Type** | Town — Investigation, Diplomatic |

---

## THE SITUATION

Tidecrest is a fishing village of four hundred people on the Sapphire Coast's southern shore, at the edge of the Tidecrest Flats — shallow warm water that has supported deep-water fishing operations for six generations. The fishers work a set of established deep-water zones they know by name: the Amber Run, the Grey Shelf, the Long Cut. Their fathers worked these zones. Their fathers' fathers worked them. The fish have always come.

For three months, the catches have been empty. Not depleted — empty. The fish aren't leaving the zones exhausted and moving on; they simply aren't there. The Amber Run pulls nets that come up with nothing but cold water. The Grey Shelf, same. It happened all at once, across all three deep zones, beginning approximately ninety days ago.

The fishing families are three months into economic crisis. They're eating their savings. Two families have already sent their children to Dawnharbor to find work. The village is frightened in the quiet way of people who understand their situation clearly and can't see a way out of it.

Elder Cas Dorn has a log.

---

## BACKGROUND

*(DM-only — do not share with players)*

What's happening to the fish has nothing to do with the fish. Nhal'Zeruun's Bloodmire feeding ritual in the Ashen Marches draws on the southern ley-channel network — a series of deep-current ley-lines that run from the Ashen Marches southwest through the ocean floor. These lines carry the Void energy that Nhal'Zeruun feeds through, but they also carry something else: a resonance effect that disrupts the deep-current temperature gradients the Tidecrest Flats rely on to concentrate fish populations.

When the ritual intensified three months ago (the Bloodmire Cult's fortieth-anniversary ritual, their largest in years), the ley-channel resonance spiked. The deep-current disruption shifted the thermal zones that the fish use to find prey. The fish aren't gone — they're twelve miles east, following the thermal gradient that moved. They'll continue moving east unless the ley-channel resonance drops.

This is not fixable at the Tidecrest end. The fix is stopping the Bloodmire ritual — which is the Hungry Dark quest's problem. What the players can do here is understand what's happening and give Elder Dorn's log the context that turns it from a fishing record into campaign intelligence.

Duchess Selene's Black Rose network has filed a report on the Tidecrest anomaly. Selene knows the ley-channel theory. She hasn't shared it because she's currently determining who benefits from knowing and what the right trade is. The players finding this through independent investigation is something Selene will respect.

---

## DRAWING PLAYERS IN

**Hook 1 — The Road In:** The players pass through Tidecrest on any coastal route. The village's silence is noticeable — in the early morning, the dock should be active. Instead, the boats are tied. A few men are mending nets that don't need mending, keeping their hands busy. A DC 11 Perception or Investigation check catches the wrongness of it. Asking anyone on the dock produces a version of the same answer: "Nothing coming up. Three months of nothing."

**Hook 2 — The Merchant Connection:** A player with trade or Sapphire Coast connections may hear that Tidecrest fish prices in Dawnharbor have quietly tripled — not because of demand but because supply has collapsed. A merchant in Dawnharbor will pay for information about what's happening. This puts a small material incentive on the investigation without making the quest mercenary.

**Hook 3 — Elder Dorn's Direct Ask:** If the players stay overnight in Tidecrest, Cas Dorn will find them. He's been asking travelers if any of them know anything about ley-lines and ocean currents. He doesn't say "ley-lines" — he says "the underground water-paths, the current-sources." He has a log that he can't interpret himself, and he knows there's a pattern in it that means something.

---

## KEY NPCs

### Elder Cas Dorn
**Appearance:** Seventies, compact, deeply weathered from sixty years at sea. He still goes out on the boats — not because he needs to, but because he can't stand sitting on shore while his village starves. His hands are stained with net-dye permanently.

**Personality:** Methodical and humble about the boundaries of his knowledge. He will show the players his log without preamble: "I don't know what this means. I know it means something." He doesn't embellish. He waits.

**Motivation:** Find out what's happening so he can tell his people the truth and they can make real decisions. He is not asking for a solution right now — he's asking for an explanation. If the explanation is "this is unfixable here," he'll absorb it and figure out what to do with it.

**Secret:** He's already telling the two families whose children left for Dawnharbor that they shouldn't come back. He hasn't told the rest of the village. He's preparing for an evacuation and trying to make it look like individual choices.

**Roleplaying note:** Cas Dorn should feel like the most competent person in the room. He's asking for specialized knowledge he doesn't have. He's not helpless — he's found the limit of what he can figure out alone, and he's asking the right people in the right way. Players who patronize him will notice him become very politely distant.

### Neva Strand
**Appearance:** Late forties, runs the largest fishing boat in the Tidecrest fleet. Strong opinion about everything. Currently furious in the specific way of a person who cannot find the right target for her anger.

**Personality:** Direct to the point of bluntness. She thinks Cas Dorn is too cautious and she's been pushing for riskier solutions: taking the boats further east, petitioning Duchess Selene directly, threatening to block the coastal trade road until someone helps them.

**Motivation:** Feed her crew. They haven't been paid in eight weeks. She has six people who depend on her boat.

**Secret:** Ten days ago, she took the fleet east to fish — past where the other boats go. The nets came up half-full. She hasn't told Cas yet because she's not sure she's right and doesn't want to give false hope. If players ask her directly about recent scouting, DC 13 Insight reveals she knows something she's holding back.

**Roleplaying note:** Neva is useful for confirming the thermal shift theory — her eastern run is evidence that the fish have moved rather than disappeared. Her information, combined with Cas Dorn's log and the players' knowledge, triangulates the ley-channel explanation.

### Tam Crewe — Dock Worker
**Appearance:** Early twenties, hasn't left the dock in three days, mending the same section of net.

**Personality:** The human cost of the abstraction. His mother is the one who can't afford to keep the house heated. He will answer questions with a kind of flat exhaustion that isn't hostility, just depletion.

**Motivation:** He doesn't need information. He needs something to change. Players who give him Cas Dorn's log explained — who tell him what's actually happening — may not be giving him a solution, but they're giving him a frame. Something is doing this. It can be stopped. That's a different kind of suffering than random loss.

---

## RUNNING THE QUEST

### Scene 1: The Docks

> The Tidecrest harbor is wrong at low morning. Eight boats tied to their moorings when they should be at sea. The dock smells of salt and old nets and something underneath — not rot, exactly, but the particular smell of equipment that hasn't been used in too long. A man on the far end is mending rope. He's been mending the same two feet of rope for a while.

Players who investigate the harbor:
- DC 10 Investigation: The boats are well-maintained. This isn't equipment failure or negligence. The boats are ready. There's just nowhere to go.
- DC 12 Nature: The Tidecrest Flats' temperature feels slightly wrong for the season — colder by a degree or two than it should be. The surface doesn't explain it.

### Scene 2: Cas Dorn's Log

Cas Dorn's log is the quest's central object. He'll show it in his home above the fish-weighing house. It's three months of morning notes: date, which zones worked, depth of net, catch weight, water temperature at two standard depths. The entries three months ago show a single-day change: temperature at depth dropped in all three zones simultaneously. Every entry since then: empty.

> He lays the notebook flat on the table. The entries run in neat columns — columns he's been keeping since he was seventeen, in the same format his father used. He points to the line where it changes. "One morning," he says. "Not over a week. One morning, all three zones, same time." He looks at you. "Weather doesn't do that."

| DC | Skill | Outcome |
|----|-------|---------|
| 12 | Arcana | The simultaneous shift pattern is consistent with a ley-channel disruption, not a natural current event |
| 14 | Arcana | The temperature drop profile matches documented ley-channel resonance effects from Sentinel Order literature |
| 10 | Nature | The pattern isn't storm damage or seasonal drift — too sudden, too coordinated |
| 13 | Investigation (cross-referencing the log's dates) | The disruption began ninety days ago — aligns with a specific date the players may recognize if they've encountered Bloodmire Cult activity |
| 15 | History | The Bloodmire region to the northwest has had documented ley-channel interactions with the southern ocean floor — an old Sentinel Order reference mentions it |

### Scene 3: Neva Strand's Information

If players ask around or specifically seek out Neva (DC 11 Insight on the dock notices she's holding something back when the subject of eastern fishing comes up), she'll eventually share:

> "I took the boats east. Twelve miles, maybe fourteen. Past the Grey Shelf. Past where we ever fish." She shrugs — not casual, the kind of shrug that's a performance of casual. "Nets came up half-full. Old Amber Run fish — they haven't changed. They just moved."

This is the confirmation. The fish are twelve to fourteen miles east. The zone has shifted. If the ley-channel disruption stopped, the thermal gradient would eventually restore and the fish would return — but that could take weeks after the disruption ends.

### The Explanation Scene

When the players have enough to explain what's happening to Cas Dorn, this is the scene to run carefully.

> Cas Dorn listens to everything without interrupting. When you're done, he's quiet for a moment. He looks at his log — at the three months of nothing. Then: "The fish are alive." He says it like a fact he needed to confirm. "They're twelve miles east and they're alive."

The explanation gives him the frame. The frame changes what's possible. He asks two questions in sequence:
1. "Can this be stopped?"
2. "How long?"

The honest answers are: yes, but not from here — and months, at minimum. Cas Dorn nods at both answers. He's already running the math. He'll tell his village tonight.

### If Players Have Hungry Dark Context

Players who already know about the Bloodmire ritual can name it directly. This upgrades the intelligence: Cas Dorn's log, Neva's eastern run data, and the ley-channel explanation together form a piece of campaign evidence that is worth sharing with the Sentinel Order. The log is physical documentation of Nhal'Zeruun's feeding ritual's effects reaching the Sapphire Coast.

---

## WHAT CAN GO WRONG

1. **Players give false hope:** If players imply the fish will return soon without cause, Cas Dorn acts on it — delays the evacuation prep, holds families in place. When it doesn't happen, his trust in outside assistance is damaged in a way that matters for future Sapphire Coast interactions.

2. **Players skip the investigation, go straight to solutions:** There is no local solution. Players who promise to "fix the fish problem" without understanding the ley-channel cause will find themselves without a lever to push. The value here is diagnosis, not rescue.

3. **Players bring this to Selene before Cas Dorn gets the explanation:** Selene will be appreciative (and slightly annoyed they beat her to the connection), but the players will have given away intelligence without ensuring the village was informed first. Cas Dorn, if he finds out, notes this quietly.

4. **Players don't follow up:** Tidecrest's situation continues deteriorating. If the players come back after the Bloodmire ritual is disrupted (Hungry Dark resolution), the fish have returned — but some families left in the interim. The village is smaller. Tam Crewe is not on the dock.

---

## RESOLUTION

**Full Success:** Players explain the ley-channel mechanism fully, share the information with the Sentinel Order, and Cas Dorn has the truth. The evacuation planning he's been doing quietly becomes something the village can discuss openly. Players leave Tidecrest knowing that resolution requires stopping the Bloodmire ritual.

**Partial Success:** Players identify the fish have moved east but not the cause. Neva Strand leads the fleet east and catches half-loads — economic relief, not solution. The village survives. The mystery continues.

**Failure:** Players leave without explaining anything. Tidecrest continues in the dark. If they return after the Hungry Dark resolution, the fish are back, but the village doesn't know why — or who to thank.

---

## REWARDS

- **Cas Dorn's Log (copy):** Physical documentation of the ley-channel disruption, dated. This is evidence usable in multiple contexts: with the Sentinel Order (confirms Nhal'Zeruun's expanded radius), with Duchess Selene (demonstrates independent investigation), or with scholarly contacts examining the Shadow Lords' effects.
- **Neva Strand's Chart:** Neva will give the players a hand-drawn chart of the current eastern fish zone — not a campaign tool exactly, but it demonstrates the thermal shift and is supplementary evidence for the ley-channel argument.
- **Sapphire Coast Reputation:** +1 with Duchess Selene if players share findings with her (she'll want the log). +1 with the Sentinel Order if shared with Elyndra.
- **Experience:** 75 XP per player for completing the investigation. Additional 25 XP if the connection to the Bloodmire Cult is made and documented.

---

## CONNECTIONS

- **The Hungry Dark (main quest):** Cas Dorn's log is tangible evidence of the Bloodmire ritual's reach. Players who bring it to Elyndra get more credibility when they argue for disrupting the ritual. The Tidecrest anomaly is one data point in a pattern that points to Nhal'Zeruun's expanding pressure.
- **Duchess Selene:** She has an agent in Tidecrest who filed a preliminary report three months ago. If players bring her the full explanation before she acts on her own intelligence, she'll note their analytical capabilities. This affects how she treats them in future negotiations.
- **The Sentinel Order:** Elyndra has been waiting for a coastal data point that confirms the ley-channel theory. This is it.

---

## DM NOTES

This quest is about information. Players often arrive expecting a rescue or a fight and instead find a community asking for an explanation. That's the correct response to this situation — explanation is a genuine service, not a consolation prize for an adventure without combat.

The emotional register is quiet and specific. These are people managing a real economic catastrophe without drama — they're not wailing, they're doing the math. Cas Dorn's log is the symbol of that: sixty years of disciplined observation, and then one morning the numbers just stop making sense. Treat it with the weight it deserves.

Neva Strand's eastern run is the most satisfying discovery of the session — not because it solves anything, but because it changes "the fish are gone" to "the fish moved." The fish are alive. That distinction matters to people who've spent their lives following fish. Make sure it lands.

The players leave Tidecrest knowing more than the village does about what's coming and what would fix it. That knowledge is a kind of responsibility. Whether they act on it — whether they pursue the Bloodmire ritual — is their choice. But they leave knowing the cost of not acting is twelve miles of empty net and a village slowly deciding to become somewhere else.
$notes$ WHERE slug = 'tidecrest-nets';


-- ============================================================
-- QUEST 3: ironwatch-refugees
-- ============================================================

UPDATE quests SET extended_notes = $notes$
# The Forty-Two
### *They have been waiting three months. The Empire has no form for what they are.*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Region** | Darian Empire — Ironwatch garrison town, eastern border |
| **Level Range** | 5–7 |
| **Duration** | 60–90 minutes (single session, or two short sessions) |
| **Quest Giver** | Colonel Aris Dawn, Ironwatch garrison commander |
| **Quest Type** | Town — Political, Humanitarian |

---

## THE SITUATION

Forty-two people from the Aranthorian border region near the Veilwood edge are living in Ironwatch's garrison holding area. They fled the Pale Choir's expansion zone seven weeks before the players arrive — whole families, three generations in some cases, who had enough warning to get out but nowhere to go but east. The Darian Empire's border gate at Ironwatch was the nearest crossing.

The Empire let them in because Colonel Aris Dawn made a judgment call: she couldn't leave them on the road in winter with the influence zone behind them. She has been feeding forty-two people from garrison supplies for three months. The paperwork she filed has received two responses: an acknowledgment of receipt and a reminder that the Empire does not maintain formal refugee status protocols for persons displaced by "Aranthorian internal events."

The forty-two are not suffering dramatically. They're housed in the holding barracks, fed, cold but not dangerously so. What they are is stuck. They cannot go back — the Pale Choir's zone covers their homes now. They cannot stay — the Empire's tolerance for an unauthorized forty-two-person drain on garrison resources has a horizon. They cannot move freely inside the Empire without status documentation that the Imperial Bureaucracy doesn't know how to issue.

Colonel Dawn is not asking for a miracle. She is asking for a plan that doesn't end with forty-two people back on the road with nowhere to go.

---

## BACKGROUND

*(DM-only — do not share with players)*

The forty-two are: eleven adults of working age (six men, five women), fourteen children between the ages of four and fifteen, eight elderly who fled on the strength of their families' urgency rather than their own, and nine adults in the middle category — people who could work if there were work, could contribute if there were a community to contribute to.

Three of the eleven working-age adults were low-level Sentinel Order contacts — village-level early-warning people, not operatives. Commander Elyndra knows this and has flagged the group as a secondary concern. She would prefer them not to be abandoned on the Darian side of the border.

The administrative problem is genuinely the problem: the Empire's bureaucracy has a refugee protocol, but it's designed for war refugees from sovereign states with which the Empire has diplomatic relations. Aranthor has no functioning government capable of requesting formal refugee status on these forty-two people's behalf. The Pale Choir is not a recognized military force. "Displaced by a shadow entity's influence zone" has no bureaucratic category.

What solves this is either: a formal resettlement request from a recognized body (the Crown Loyalists, if players can get Elowen's signature on something, or a Council lord, or the Sentinel Order with Imperial recognition), or physical relocation to a part of Aranthor not under Choir influence — with Sentinel Order coordination and safe passage documentation.

Colonel Dawn knows about the Sentinel Order contacts in the group. She hasn't told anyone else.

---

## DRAWING PLAYERS IN

**Hook 1 — Through Colonel Dawn:** Players at Ironwatch for any reason (passing through, seeking intelligence on the Empire's border posture, following up on Imperial Gambit threads) will encounter Colonel Dawn. She is professional and matter-of-fact. After handling whatever brought the players to Ironwatch, she says: "I have forty-two people in my holding barracks who aren't going to be there legally in thirty days. I need an option."

**Hook 2 — The Sentinel Order:** A note from Elyndra may arrive — to players who are in contact with her — noting that three of her border contacts were caught in the Choir's expansion and are now in Ironwatch holding. "I cannot send anyone. If your path takes you through the eastern border, please."

**Hook 3 — The Holding Barracks:** If players are in Ironwatch and ask about the unusual activity around a particular barracks building, the garrison soldiers will say there are "Aranthorian civilians" in holding. DC 11 Insight reading the soldier's tone reveals mild discomfort — not cruelty, but the specific discomfort of people asked to hold a situation that isn't their problem and isn't getting better.

---

## KEY NPCs

### Colonel Aris Dawn
**Appearance:** Late forties, Darian military precision in everything including the two lines at the corner of her mouth that appeared three months ago. Dark hair shot through with grey she didn't have before the forty-two arrived. She has not stopped carrying her command ledger anywhere she goes.

**Personality:** Competent, dry, and doing the right thing in an institution that hasn't given her the tools to do it correctly. She is not sentimental about the forty-two — she doesn't know them well. She is, however, absolutely clear that abandoning them is not an option she can live with, and she has been running out of other options methodically.

**Motivation:** Get these people somewhere safe and legal before her garrison's patience and her own authority reach their limit. She has approximately thirty days before someone up her chain of command notices the supply discrepancy and asks questions she can't answer with current paperwork.

**Secret:** She filed a second report three weeks ago that she's regretting. The second report flagged three of the forty-two as "possible Sentinel Order contacts" — she thought it might get the situation escalated to someone who cared. It may instead have escalated it to someone who cares for the wrong reasons.

**Roleplaying note:** Dawn should feel like the best version of an institution's representative — someone working within a broken system with integrity, aware of its limits, not using them as excuses. Players who help her will find her genuinely grateful in a way that is useful: she remembers favors and she has institutional access.

### Mira Voss — Refugee Spokesperson
**Appearance:** Late thirties, was a grain merchant before the Choir's zone crossed her village. She organized the group's departure and has been their representative since. She is calm in the specific way of someone who burned through their fear weeks ago.

**Personality:** Practical and specific. She knows exactly what the forty-two need and she'll tell you in order of priority: documents, a destination, and information about whether their homes are gone permanently. She asks the last question last because she already knows the answer and is just confirming it.

**Motivation:** Get her people somewhere they can start building something. She stopped wanting to go home six weeks ago. She is now looking forward.

**Secret:** Her oldest daughter is one of the three Sentinel Order contacts. Mira knows. She doesn't know if that's an asset or a liability with the players.

**What she provides:** A complete manifest of the forty-two — names, ages, skills, relationships, special needs. She has been maintaining this document with the same precision she brought to grain accounts. It's the most useful single piece of information for arranging resettlement.

### Kael — Ten-Year-Old, Unofficial Barracks Mascot
**Appearance:** Small for his age, has adopted the garrison dog as his personal responsibility. The dog has a collar that says "Garrison Property" and Kael has added his name to it in chalk.

**Personality:** Specific and curious. He will ask players direct questions about their equipment and where they've been. He is not performing cuteness — he's just ten and bored and the players are interesting.

**Role:** Kael exists to make the forty-two a number that has a face. Players who spend thirty seconds talking to him will find it substantially harder to make decisions that leave him without a destination.

---

## RUNNING THE QUEST

### Scene 1: The Holding Barracks

> The barracks are warm, at least. Someone has strung rope between the bunks to give family groups a measure of privacy — not a garrison innovation, this was improvised from whatever was available. A woman is teaching three children letters on a slate in the far corner. Near the door, a man who hasn't shaved in weeks is working on a wooden toy with a pocketknife. He looks up at you with the expression of someone who has been looked at by many official-seeming people and is waiting to find out what this look means.

The first minutes in the barracks are about establishing the forty-two as real people. Players should feel the scale of the problem — not forty-two abstractions but specific faces, specific needs, specific small dignities being maintained in difficult circumstances.

Key observations available:
- DC 10 Insight: The group is organized. Mira Voss runs daily schedules, the children are occupied, the elderly are looked after. This is not passive waiting — it's active management of a terrible situation.
- DC 12 Investigation: The supply situation is tighter than the garrison is letting on. Some of the food is coming from the soldiers' own rations.

### Scene 2: The Administrative Problem

Colonel Dawn will explain the bureaucratic situation directly if asked. She has a document folder with the relevant correspondence — the two responses from the Imperial Directorate of Interior Affairs, both of which decline to establish refugee status without a formal request from a recognized sovereign.

| DC | Skill | Outcome |
|----|-------|---------|
| 11 | History | Confirms the Empire's refugee protocol requires sovereign-level request — the players know this is a real structural problem |
| 14 | History | Identifies the specific precedent: the Darian-Ashveil Compact of forty years ago, which established a refugee category for the Ashen Marches crisis. It required Imperial Chancellor-level authorization. |
| 12 | Persuasion (with Dawn) | She shares the information about the Sentinel Order contacts and what it might mean for escalation |
| 16 | Insight (reading Dawn) | She's more worried about her second report than she's said — she thinks it may have triggered something she didn't intend |

### Scene 3: The Solution Architecture

There is no single solution. The players need to identify which path is actually achievable given their current resources and reputation, and then execute it.

**Path A — Sentinel Order Resettlement:**
Elyndra can, with the players' coordination, arrange safe passage for the forty-two to the Sentinel waystation at Harrow Crossing — outside the Choir's zone, with shelter and basic resources. This requires:
- Contact with Elyndra (players must have Sentinel Order reputation +1 or current communication channel)
- A travel authorization that lets forty-two people cross the Darian border back into Aranthor (Dawn can provide this; it requires her to use a garrison commander's discretionary authority, which she'll do if the players give her documentation that the destination is legitimate)
- Coordinating the actual movement — forty-two people including elderly and children need wagon transport; this is a logistics problem that takes 1d4+1 days to arrange

**Path B — Crown Loyalist Resettlement:**
If the players have Loyalist reputation +2 or higher, Elowen (through her network) can designate a resettlement location — a village in the Thornwick Downs area where Loyalist-aligned farmers have agreed to accept refugees. This requires:
- A signed document from a recognized Loyalist authority (Elowen's seal, Lady Veth Horne's signature, or similar)
- A messager run of 3–5 days in-game to get the document back
- Dawn accepting a Loyalist document as sufficient authorization (DC 14 Persuasion; she's not politically aligned, but she wants this solved)

**Path C — Direct Imperial Pressure:**
If the players have access to High Chancellor Cale or any Imperial figure above Colonel Dawn's chain of command, they can get the status formally established. This is the cleanest solution but requires the most political capital. Even a letter of introduction from someone with Imperial standing (+1 Darian Empire reputation) drops the bureaucratic response time from months to weeks.

**Path D — Improvised Documentation:**
Players with relevant skills can attempt to create documents that satisfy the administrative requirement. DC 17 Deception (creating credible Imperial paperwork) or DC 16 Persuasion (convincing Dawn to use her discretionary authority more broadly than it technically allows). This solves the immediate problem but creates a vulnerability: if discovered, it exposes Dawn.

### The Complication: The Second Report

Three days after players arrive in Ironwatch, a Darian Intelligence Directorate agent appears — a man named Lev Garris, polite and thorough, who is there to "evaluate the status of detained persons of interest." He's been sent in response to Dawn's second report. He wants to speak to the three Sentinel Order contacts individually.

> A man in a plain grey coat arrived this morning, before you were up. Dawn found you at breakfast. "The Directorate sent someone," she says. "He's with the holding barracks now." She pauses. "I made a mistake three weeks ago."

Players must decide: let the Directorate interview the Sentinel contacts (the contacts are frightened and may say things that compromise the Sentinel Order, or may disappear into the Intelligence system), intervene (creates a direct confrontation with the Directorate that complicates Dawn's position), or find a way to handle Lev Garris that doesn't blow up anyone's situation.

Lev Garris is not a villain — he's doing his job efficiently. He can be negotiated with. DC 15 Persuasion to convince him the contacts are not intelligence assets of concern and the interview would be a waste of his time. DC 13 Deception to get the contacts moved before he can speak to them individually. DC 17 Insight to identify that Garris himself is slightly uncomfortable with this assignment and might be relieved to close the file without escalating.

---

## WHAT CAN GO WRONG

1. **Players delay:** Dawn's thirty-day window is real. If players take too long gathering political documentation, the Directorate escalates. The forty-two get dispersed — officially "resettled" to three different Imperial holding facilities, separating families.

2. **Players expose Dawn's second report publicly:** She loses her command. The forty-two lose their only advocate inside the garrison. The situation becomes much harder.

3. **Garris interviews the Sentinel contacts without intervention:** Two of the three contacts disappear into the Intelligence system. Elyndra learns of this eventually. It damages the Sentinel Order's ability to maintain border-community contacts for a year.

4. **Players use Path D and get caught:** Dawn is held responsible for fraudulent documentation. She faces military tribunal. The players have created a debt to her that may require a separate act to repay.

---

## RESOLUTION

**Full Success:** All forty-two are legally resettled with documentation, transport arranged, destination confirmed. Mira Voss gets her manifest stamped by whoever has authority to stamp it, and she holds it for a moment before putting it away. The three Sentinel contacts travel with the group and reconnect with Elyndra's network on the other side. Dawn files a clean close on the garrison record.

**Partial Success:** The forty-two reach a temporary solution — a waystation or a Loyalist-adjacent community — without full Imperial documentation. They're safer than they were but still in administrative limbo. Dawn's situation is improved but not resolved.

**Failure:** The Directorate escalates. The group is dispersed. Mira Voss is still at Ironwatch six months later, separated from most of her people, continuing to pursue formal documentation through official channels. She'll be at it for years.

---

## REWARDS

- **Colonel Dawn's Credibility:** Dawn becomes a named contact for future Imperial interactions. She can provide accurate intelligence on Ironwatch garrison movements and has the ear of two other garrison commanders on the eastern border. This is persistent and significant.
- **Mira Voss's Network:** Among the forty-two are people with specific skills — a cartographer, a former tax assessor (knows Aranthorian financial infrastructure), a herbalist trained in treating Pale Choir exposure symptoms. They become available as contacts if the players helped them reach safety.
- **Sentinel Order Intelligence:** If the three contacts are successfully evacuated, Elyndra's note to the players is brief and specific: "The three contacts you retrieved have filed three months of Choir boundary observations from inside the zone. We now have the most accurate radius map in existence. Thank you."
- **Experience:** 150 XP per player for achieving a stable resettlement path. Additional 50 XP if the Garris situation is handled without exposing Dawn.
- **Faction Reputation:** +1 Sentinel Order (regardless of path, if contacts are protected). +1 Crown Loyalists (if Loyalist path used). +1 Darian Empire or -1 (depending on how Garris situation is handled).

---

## CONNECTIONS

- **The Imperial Gambit (main quest):** Colonel Dawn's intelligence on eastern border garrison movements becomes relevant when players are navigating to Caldrath or the Ironclad Undercroft. Her access to garrison communication channels is valuable.
- **The Forgetting (main quest):** Mira Voss's group are ground-level witnesses to the Pale Choir's expansion. Their testimonies and the three Sentinel contacts' observation notes feed directly into the Choir radius intelligence that shapes Act 2 of The Forgetting.
- **Stonefall Directive (this quest set):** The Ironclad Undercroft is in Stonefall, not far from Ironwatch. Players who have established Colonel Dawn as a contact have an easier time navigating the garrison towns of eastern Darian Empire.

---

## DM NOTES

The forty-two are the campaign's most direct illustration of what the Pale Choir's expansion means at ground level — not the cosmic horror of the Choir itself, but the forty-two people who packed what they could carry and walked east because they had nowhere else to go. Every abstract threat in this campaign has a Mira Voss attached to it.

Play Kael correctly: he should appear early and briefly, ask the players about something specific and child-appropriate, and then go back to his dog. Don't belabor it. One clear, specific moment. That's enough.

The Garris complication is optional — include it if the session energy supports it or if players have been moving through this quest quickly. It adds tension without adding an enemy. Lev Garris is the most useful kind of antagonist: someone doing a job who might be reasoned with.

Colonel Dawn's line after full resolution: "I've been a garrison commander for eleven years. I've never had a situation with no form for it." She closes the ledger. "I'm glad there were people who knew how to work without one."

That's the tone.
$notes$ WHERE slug = 'ironwatch-refugees';


-- ============================================================
-- QUEST 4: stonefall-directive
-- ============================================================

UPDATE quests SET extended_notes = $notes$
# The Eleven Anomalies
### *Directive 7 has a month-end deadline. You found it. Now it's your problem.*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Region** | Darian Empire — Ironclad Undercroft, Stonefall |
| **Level Range** | 6–9 |
| **Duration** | Multi-session (typically discovered mid-Undercroft, resolved same session or next) |
| **Quest Giver** | No formal giver — players discover Directive 7 in the Administrative Level |
| **Quest Type** | Town (time-sensitive) — Rescue, dungeon sub-objective |

---

## THE SITUATION

The Ironclad Undercroft's Administrative Level contains Warden Drav Solt's office. In that office, in a sealed packet on the left side of his desk, is a document labeled "Directive 7: Final Processing." The document lists eleven prisoners by number — the "Anomalies," the Undercroft's Level 4 deep-cell residents — with a single notation: if Directorate review is not completed by month-end, "final protocol" applies.

This is an execution order.

The Directorate's review has been stalled for six weeks. There is no indication it will be completed. The month-end deadline is in approximately three weeks from the moment the players find the document — but the exact number of days depends on when in the session cycle they're here.

The eleven prisoners are:
- **Tarro Cass** (Deep Cell 7): Six years detained. Has stopped speaking. Knows about High Chancellor Cale's Founding bloodline — that's why he's here.
- **Two Crown Loyalist agents** (Deep Cells 2 and 3): Captured fourteen months ago during an Aranthorian intelligence operation. Know the names of eleven active Loyalist safehouses, four of which the Cabal has since burned.
- **Three Aranthorian traders** (Deep Cells 8, 11, 14): Detained because their cargo manifests didn't match their declared goods. The mismatch was because they were moving Sentinel Order supplies through Aranthor under commercial cover. They don't know what they were moving.
- **Three sailors from an intercepted Free Isles ship** (Deep Cells 17, 18, 19): Their ship was boarded by Darian naval vessels four months ago. They know the location of a Black Rose dead-drop near Brackwater that Selene would not want the Empire to have.
- **Two Sentinel Order junior operatives** (Deep Cells 22 and 23): The newest detainees — captured eight weeks ago during an extraction attempt gone wrong. They know the names of three Sentinel Order contacts still active in the Darian Empire.

All eleven people are real. All eleven are going to die unless someone does something about it.

---

## BACKGROUND

*(DM-only — do not share with players)*

Tarro Cass is the most important extraction target from a campaign-continuity standpoint. He is the only person alive outside the Darian Intelligence Directorate who knows about High Chancellor Cale's Caldris bloodline. Six years of solitary detention have not broken him — he simply stopped speaking as the only form of resistance available to him. He will speak to the right person with the right knowledge.

The Directive 7 document exists because the Intelligence Directorate has been conducting an internal review of which Anomaly prisoners are still generating useful intelligence and which have exhausted their value. All eleven have been classified as exhausted. The "final protocol" is not dramatic — it's a bureaucratic notation that means lethal injection administered by the garrison's medical staff. Clean, efficient, deniable.

Warden Solt knows what Directive 7 means. He is not enthusiastic about it — he's a professional, not a killer — but he will carry it out if required. If the players are in the Undercroft for other reasons when they discover Directive 7, they now have a secondary objective with a countdown that competes with whatever they came for.

The Shadow Cabal has a connection to two of the eleven: the two Crown Loyalist agents know something about a Cabal operation that was active fourteen months ago. Warden Solt has been ordered to make sure they are in the "final protocol" batch regardless of Directorate review status. This note is not in the packet — it's in a separate Cabal-coded message in Solt's personal drawer. Players who find it (DC 17 Investigation) will recognize it as Cabal script (DC 12 with Sentinel codebook, DC 17 without).

---

## DRAWING PLAYERS IN

This quest does not have a traditional hook — it has a discovery. Players who are in the Ironclad Undercroft for any reason and who access Warden Solt's office will find Directive 7. The hook is the document itself.

**If players haven't reached the Undercroft yet:** A note from either Elyndra or Selene can precede this quest: "We have two people in Stonefall. I cannot get them out myself. If you're going to be near the eastern border..." This creates a reason to be at the Undercroft that is separate from Directive 7, so that when players find the directive, they understand they're now solving a bigger problem than they came for.

**If players are mid-Undercroft:** They find the directive in Solt's office. The countdown begins. They're already inside the facility. They can act now, expand their extraction list, and face increased complexity — or they can note the directive and return later, with the countdown running.

---

## KEY NPCs

### Tarro Cass (Deep Cell 7)
**Appearance:** Sixties, gone thin over six years of detention. His hair has grown past his shoulders because no one cuts it. He's sitting with his back against the wall when the players arrive, and he doesn't look up when the cell opens.

**Personality:** Six years of silence, not because he broke but because silence was the only leverage he had. When he finally speaks, his voice is rough from disuse.

**Motivation:** He has been waiting. Not passively — he has been choosing, each day, to keep what he knows until the right moment. When the players arrive with legitimate knowledge that confirms they're pursuing the Founding bloodlines, six years of waiting ends.

**How to unlock him:** He will speak to:
- A player who says "the Crown is being rebuilt and we need the five bloodlines" — plainly and without setup
- A player who says the name "Caldris" unprompted
- A player who shows him something the Crown responds to (Elowen's seal, a Crown shard)

When he speaks: "His name is Aldric Cale. His grandmother was Sera Caldris, Aranthorian refugee, Year 776. She has a marriage record in the city of Brenn. Cale has never looked for it because he doesn't know to look." He says it in the tone of someone delivering a message they've been holding for six years. Then: "Get me out of here."

**Roleplaying note:** Tarro should not be pathetic or damaged-seeming. He's been detained six years, not broken. The silence was a choice. When it ends, it ends cleanly.

### The Two Loyalist Agents — Sera Vane and Dov Hallis
**Appearance:** Vane is mid-thirties, has a Loyalist identification tattoo on her left wrist (players with Loyalist reputation +2 will recognize it). Hallis is older, has a beard that he's been maintaining with meticulous care using a small knife fragment he found.

**Personality:** Vane is careful and assessing — she won't trust the players until they demonstrate Loyalist credentials or common knowledge. Hallis has made his peace with the possibility of dying here and is now calm in a way that can be mistaken for indifference.

**What they know:** Four safehouses that may still be active. Two Loyalist agents who've been trying to reach them for a year. The general shape of a Cabal operation that was running fourteen months ago but whose current status they can't know.

**Secret:** They know the Shadow Cabal has specifically flagged them for early execution. They've overheard enough through the cell walls to understand the Cabal has an interest in their silence. They'll share this if the players seem genuinely capable of getting them out.

### The Sailors — Brenn, Kosta, and Tar
**Appearance:** Darian naval detention hasn't been kind — they've lost weight, they've got prison pallor. But they're sailors, and sailors are practically inclined.

**Personality:** They want out. They're not invested in any of the political complexity. They'll be cooperative and uncomplicated in the extraction if the players include them.

**What they know:** The Black Rose dead-drop near Brackwater. This is Selene's intelligence and she'll want it back — or want to know the Empire has it, which amounts to the same thing.

### The Sentinel Operatives — Lira and Coran
**Appearance:** Young — mid-twenties, both. This was their third field operation.

**Personality:** Lira is trying to hold herself together and mostly succeeding. Coran is not dealing with this well and is honest about it.

**What they know:** Three Sentinel Order contacts in the Darian Empire. This is immediately sensitive — if the Empire knows they know, those contacts are compromised.

### Warden Drav Solt
**Appearance:** Fifties, career professional, doesn't look like what he does.

**Personality:** See Ironclad Undercroft source file. He'll negotiate if given real leverage.

**The Directive 7 angle:** If players confront Solt specifically about Directive 7, he'll admit it's an execution order without embarrassment. "It's administrative, not personal." If players can offer him something that makes the Anomalies less of a liability — evidence that extracting them publicly would be worse for the Directorate than losing them quietly — he'll listen to alternatives. DC 15 Persuasion with the right leverage (Directive 7 document plus the Cabal message plus a credible threat about exposure) gets him to stand down on the execution in exchange for the players' silence.

---

## RUNNING THE QUEST

### Discovery: Finding Directive 7

> Solt's desk has the organized look of a man who has been doing this for twenty years. On the left side, beside the correspondence stack, is a sealed packet. The seal is a standard Imperial Directorate mark. Someone has written on the outside, in handwriting that is precise and unhurried: "Directive 7: Final Processing."

Players who open it find the list. Eleven numbers. One annotation in the Warden's hand: "Transfer to Caldrath deferred pending Directorate review. If review not completed by month's end: final protocol."

A DC 11 Intelligence (History) check confirms what "final protocol" means in Darian administrative language. It doesn't require a check — a player who asks outright should get a plain answer.

The packet also contains the individual prisoner number-to-cell mappings. Players now know where all eleven people are.

### The Decision Point

This is the quest's first and most important beat. The players came here for specific reasons — Tarro Cass (if Elyndra or Selene sent them), intelligence files, Selwyn Brass. They now have a secondary extraction list of eleven people, with a countdown, in a dungeon they're already navigating.

Do they expand their operation?

The answer has no wrong choice, but it has consequences. Every additional extraction target:
- Requires a cell visit (time in a dungeon where time is risk)
- Adds a non-combat NPC to the extraction who may need carrying, guarding, or managing
- Increases the chance that the alarm goes up before the operation completes

Players who try to take all eleven will have a more complex extraction. Players who triage (Tarro Cass, the Loyalist agents, and whoever else they can manage) will have to make choices about who they leave. Players who take nobody will have to live with that.

| Extraction Scenario | Complexity | Notes |
|---------------------|-----------|-------|
| Tarro Cass only | Standard dungeon difficulty | Clean; he's ambulatory and cooperative |
| Tarro + 2–4 others | Moderate increase | Add 1d4 minutes per person to extraction timeline |
| All 11 | Significant | Requires distraction, alternate exit, or Solt negotiation; high alarm risk |

### Reaching the Deep Cells

Level 4 of the Undercroft is more heavily guarded than the general population. Six Blackguard heavies on the level, two stationed outside the Anomalies' block.

> Deep Cell 7's door has a different lock than the others — a secondary bolt added after the standard cell lock, which tells you something about how long this particular prisoner has been here, or about how important he is.

Getting to the cells requires either:
- Clearing or bypassing the Blackguard patrols (combat; alerts the floor)
- Impersonation of Directorate personnel (DC 16 Deception; requires props — believable documentation or Directorate insignia)
- Using a guard-turn window (DC 14 Stealth for the full team)
- Bluffing through as Directorate inspectors on a "pre-directive review" (DC 15 Deception; actually works best if players have the Directive 7 document as prop)

### The Extraction

Getting eleven people out of a functioning Darian Imperial detention facility is not quiet. The most effective approaches:

**The Negotiation Path (Solt):** Players with the Directive 7 document, the Cabal message (if found), and a credible leverage argument can negotiate with Solt before the alarm goes up. This is the cleanest path and leaves the Empire uncertain about exactly what happened — useful for future Darian interactions.

**The Distraction Path:** Create a situation on Level 1 or 2 that draws Blackguard attention upward while the extraction happens on Level 4. Works if players split the party or have a specific distraction tool (fire in the communications room, a staged fight in the general population block, using Selwyn Brass as the distraction if they've already freed him).

**The Fight Path:** Clear Level 4 and extract directly. Alerts the facility but players have the eleven people. The garrison above (Steelclad regulars) will respond in 2d4 minutes. Getting eleven non-combatants out through an alerted garrison requires either a very fast exit or an already-prepared escape route.

**The Triage Path:** Take Tarro Cass and whoever else fits the operation the players have, and get out. Morally hard. Practically viable.

### The Countdown Mechanics

If players discover Directive 7 and leave without acting, the countdown is real. Calculate the remaining days based on the in-game calendar. Check in at month-end: Warden Solt has done his paperwork. The eleven cells are empty. The administrative record is clean.

If players return after the deadline: the cells are empty. Solt, if encountered, does not bring it up unless asked. If asked: "The Directorate's review concluded. Standard administrative processing." His expression does not change. He is a professional.

---

## WHAT CAN GO WRONG

1. **Players take all eleven and the alarm goes up early:** The Steelclad garrison above has 300 regulars. Getting eleven non-combat NPCs out of a military garrison on full alert is a session in itself. Not impossible — but it requires planning the players may not have done.

2. **Players negotiate with Solt but don't find the Cabal message:** Solt stands down on the execution, players get most of the eleven out. But the Cabal's interest in the Loyalist agents isn't resolved — the agents may be targeted once out in the world.

3. **Players ignore Directive 7 entirely:** Eleven people die by administrative notation. Tarro Cass's death means the Cale bloodline lead is gone — it can be recovered through other means (the Undercroft Vault's Maris Wyn folio) but it's a slower path. Elyndra loses her two junior operatives.

4. **Players reveal the Directive publicly before extracting:** Good for exposing the Empire's practices; bad for the eleven people, who are immediately moved to Caldrath (out of reach) before the extraction can happen.

---

## RESOLUTION

**Full Success (all 11 extracted):** Tarro Cass delivers the Cale bloodline intelligence. The Loyalist agents reconnect with the network. The Sentinel operatives' contacts are protected. The sailors return to the Isles. Selene, when she learns the sailors are free, will want to know how — and will be quietly pleased that her dead-drop is still secure.

**Partial Success (Tarro + some others):** The critical intelligence survives. The campaign continues. The people left behind haunt the players in quiet ways — a Loyalist agent whose safehouse burned because she wasn't there to warn it, a sailor who didn't make it home.

**Failure (none extracted before deadline):** The Cale bloodline lead requires the harder path through the Maris Wyn folio. Two Sentinel contacts are eventually compromised. The players know what they didn't do, and the Undercroft's cells are clean.

---

## REWARDS

- **Tarro Cass's Intelligence:** The Cale bloodline lead — specific enough to bring to Cale directly and credible enough that he'll investigate. This is a pivotal Imperial Gambit advancement.
- **Loyalist Safehouse Intelligence:** Two safehouses still active; the Loyalists can use this for network repair.
- **Directive 7 Document:** Physical evidence of the Empire's Anomaly protocol. This is leverage with Solt, leverage with the Directorate, and intelligence for Elyndra.
- **The Cabal Message (if found):** Evidence that the Shadow Cabal has operational access to Warden Solt's communication channels — significant intelligence about Cabal penetration of the Darian Empire.
- **Experience:** 200 XP per player for successful extraction of Tarro Cass. 50 XP per additional Anomaly extracted. 100 XP bonus for full extraction of all eleven.
- **Faction Reputation:** +1 Crown Loyalists (Loyalist agents returned). +1 Sentinel Order (operatives returned). +1 or -1 Darian Empire depending on how cleanly the extraction was handled.

---

## CONNECTIONS

- **The Imperial Gambit (main quest):** Tarro Cass is the thread that leads to High Chancellor Cale's bloodline. Without him, the Cale reveal requires the harder path through the Vault's Maris Wyn folio.
- **Shadow Cabal:** The Cabal message in Solt's desk reveals that the Cabal has communication channels inside the Darian Intelligence apparatus. This is significant and alarming.
- **Selene / Black Rose:** The sailors' freedom returns Selene's dead-drop intelligence. She will note the players' operational awareness.

---

## DM NOTES

The emotional architecture of this quest is about choice under constraint. Players are in the Undercroft for specific reasons. They find Directive 7 and now have eleven people who will die unless they choose to do more than they came to do. That choice — to expand, to triage, to ignore, to extract all at cost — is the quest's entire content.

Tarro Cass must be done right. Six years of silence. The right question unlocking everything. His voice rough from disuse. Do not make him dramatic. Do not make him pathetic. When he speaks — "Get me out of here" — it should feel like a very specific thing being set down after a very long carry.

The countdown should be stated clearly when the players find the packet: "The month ends in eighteen days" or whatever the number is. Keep track. It matters. If the players do something else first and come back, reduce the number accordingly. The Directive 7 clock is more effective as a real constraint than as a soft "well, they could have saved them" — the fiction works best when the consequences are earned.

If players save all eleven: take a moment at the exit. Eleven non-combat NPCs standing in a Darian garrison night outside a facility they thought was going to be their last address. Mira and Dov checking on each other. Lira helping Coran. Tarro Cass standing slightly apart, looking at the sky like he needs to confirm it's still there. That's the beat. Give it room.
$notes$ WHERE slug = 'stonefall-directive';


-- ============================================================
-- QUEST 5: coldrun-courier
-- ============================================================

UPDATE quests SET extended_notes = $notes$
# What the Courier Knew
### *Brunhild Thuldrun doesn't say she's worried. She is.*

---

## AT A GLANCE

| Detail | Info |
|--------|------|
| **Region** | Dreadspire Peaks — Coldrun, dwarven border settlement |
| **Level Range** | 5–7 |
| **Duration** | 60–90 minutes (single session) |
| **Quest Giver** | Brunhild Thuldrun, Coldrun intelligence chief |
| **Quest Type** | Town — Investigation, Recovery |

---

## THE SITUATION

Davan Korr is two weeks overdue.

He left Coldrun twenty-six days ago on a standard courier run into the Dreadspire Peaks — carrying Brunhild Thuldrun's latest intelligence queries to a contact in the upper passes, scheduled to return in twelve days. Frost Giant patrols have increased since Varkhul's unification, and overdue couriers in the Peaks can mean several things. Brunhild has run through them, in order: dead in the weather (possible), captured by a Frost Giant patrol (possible), delayed by conditions (possible), defected (she has considered this and dismissed it — she knows Davan).

She has not sent anyone to look because sending another courier into the Peaks risks losing a second person, and she doesn't have the people to spare. She has been working around the gap in her operation with the precise movements of someone who has mapped the gap and doesn't let on that the map has a hole in it.

When the players arrive in Coldrun, they are the first people in two weeks who might actually be able to do something about Davan Korr.

---

## BACKGROUND

*(DM-only — do not share with players)*

Davan Korr is alive. He is being held at a Frost Giant patrol way-station approximately eleven miles into the Peaks from Coldrun's northern edge — a small fortified shelter used by patrol rotations, currently staffed by seven Frost Giants from Clan Husk under the command of a patrol-captain named Orda.

He's not being mistreated. The Frost Giants under Varkhul's unified command have standing orders: detain anyone approaching the Peaks who is not an authorized caravan or known tribute-carrier. Davan walked into a patrol zone he'd safely used six times before without incident, and this time there was a patrol rotation that wasn't there before. Orda detained him, sent a query up the command chain asking what to do with him, and has been waiting for a response that hasn't come. In the meantime, Davan is in the way-station's storage room with adequate food and blankets and a deeply frustrated awareness that his intelligence notes — two weeks of observation about patrol patterns, camp positions, and guard rotations — are going to become stale before anyone knows he has them.

Davan's family — his wife Maret and their two children, Pel (seven) and Sanna (four) — are in Coldrun. Maret knows he's overdue. She has not been told the full situation because Brunhild hasn't told her anything, which Maret is treating as a sign that the situation is bad. She's right about the silence. She's wrong about the reason.

Brunhild's relationship with Davan is professional — he's her best courier, has been for three years — but it has the quality of professional trust that goes deep. She gave him the highest-risk runs because he was the best at them. That decision is part of what she's sitting with.

---

## DRAWING PLAYERS IN

**Hook 1 — Through Brunhild:** Players who come to Coldrun pursuing Frost and Blood connections or seeking Brunhild's intelligence files will encounter her in her standard context — efficient, brief, precise. After their initial business, or as a condition of it: "I have a courier two weeks overdue in the Peaks. I need to know if he's alive. If you're going north anyway, this is not a large detour." She says it as if it's a logistical observation. It is also not that.

**Hook 2 — The Family:** Maret Korr is visible in Coldrun to anyone who spends time in the settlement. She's been managing the children with a controlled urgency — slightly too purposeful, slightly too calm. A DC 11 Insight check reading her catches the specific texture of someone waiting for news that isn't arriving. If players ask around about her, a local will explain: "Her husband runs for Thuldrun. He's late. She's not talking about it."

**Hook 3 — The Intelligence Gap:** Players who have been given access to Brunhild's files will notice a gap: the last northern observation report is dated twenty-six days ago. The patrol rotation data ends mid-cycle. Players who ask about it get a flat: "My courier is overdue. The data gap is the same problem." This is the most direct version — players who are already invested in the Frost Giant intelligence will understand immediately that Davan's survival and their operational information are the same objective.

---

## KEY NPCs

### Brunhild Thuldrun
**Appearance:** Fifties, compact and deliberate, the kind of person whose economy of movement suggests she's done this job a long time. She keeps a small logbook on the left side of her desk and writes in it at specific intervals — the players may notice she wrote something after telling them about Davan, though the book is not readable from outside.

**Personality:** Brunhild does not use more words than the situation requires. She states problems in operational terms. She does not request sympathy and would be uncomfortable with it. She is worried about Davan Korr and has separated that worry from her assessment of the situation with professional precision and not, quite, complete success.

**Motivation:** Find out if Davan is alive, and if so, get him back. Maintain her intelligence operation's integrity. Not let her people see how personally this is landing.

**Secret:** She sent Davan on that specific run because no one else had the pass familiarity to do it safely, and she knew the patrol density was increasing. She made a calculated risk. She's been doing the math on it for two weeks.

**What she provides on success:** If the players find Davan and bring him back, Brunhild opens her files. Not the summary files — the full operational archive: three years of Frost Giant behavioral analysis, patrol pattern data, camp positions, and the twenty-year behavioral profile of Varkhul that documents Vaul-Khesh's whisper influence. This is the critical intelligence for Frost and Blood's diplomatic path. She's been waiting for people she could trust with it. Retrieving Davan is the proof.

**Roleplaying note:** Brunhild's "thank you" when Davan returns will be brief and practical and the players should understand it's the most she's said in weeks.

### Davan Korr
**Appearance:** Late thirties, built for the Peaks — broad-shouldered, dressed for weather that kills unprepared people. He has a courier bag that he's been keeping systematically organized in the way-station storage room because giving it order is the only thing that's made the last two weeks feel like work rather than captivity.

**Personality:** Calm under pressure, patient in a way that suggests he's been in uncomfortable situations before and found his way out of them. He is not dramatic about having been detained. He is, however, very clear: he has two weeks of observation notes and they are going to go stale and that is unacceptable.

**Motivation:** Get his notes back to Brunhild and get home to Maret and the children. In that order — Brunhild's intelligence comes first because that's his job. Players who honor this about him will find him easier to work with.

**His Notes:** Two weeks of daily observation from an unprecedented position inside the patrol network — a location no Coldrun operative has ever been detained in before. Davan has been treating his captivity as an intelligence operation and his notes reflect this:
- Patrol rotation schedule for Clan Husk's northern circuit (exact times, headcount, winter wolf pack composition)
- Two camp positions he'd never seen in Brunhild's files
- The route Orda uses to the nearest relay point for command-chain messages (useful for understanding how quickly Frostgale Keep can be reached from this position)
- One anomaly: three Frost Giants from a different clan (not Husk) passing through the way-station eight days ago, in a hurry, carrying what looked like carved stone tablets

That last observation is the one Brunhild will ask about three times. Stone tablets. Not standard Frost Giant courier material.

**Secret:** He's made friends with one of the Frost Giants guarding him — a young one named Grull who brought him an extra blanket on day four and has been learning three words of trade-Common per day since. Davan thinks Grull might let him go if someone asked the right way. He'd feel bad about Grull getting in trouble for it.

### Patrol-Captain Orda
**Appearance:** Seven feet of Frost Giant whose face has the weathered look of someone who spends most of their time at altitude. She's not cruel — she's following orders and waiting for instructions that aren't coming.

**Personality:** Direct and frustrated. She sent her query up the command chain seventeen days ago. She's received no response. She has a prisoner she can't release and can't do anything useful with, and her patrol circuit is suffering for the distraction.

**Motivation:** Close this administrative situation. She doesn't care about Davan specifically — he's been quiet, he's not a problem, but he's not her responsibility in any category she understands. She would prefer to release him if someone with standing tells her to.

**What moves her:**
- A letter from Brunhild (which Brunhild will have provided, if asked) carrying Coldrun's official tributary-status seal — this gives Davan recognized status as a tributary representative, which fits an existing Frost Giant category
- DC 13 Persuasion demonstrating that a detained Coldrun courier creates a problem with the tribute arrangement (Orda is not political, but she understands supply chain)
- Grull's advocacy (he'll speak up if Davan asks him to; he's twenty, he's been bored, and he's been quietly hoping someone comes to sort this out so he can stop feeling responsible for the extra blanket)

**She does not respond well to:** direct confrontation, suggestions that Varkhul's orders were wrong, anything that sounds like a threat. She's seven feet tall and has a spear. The wrong approach means fighting a Frost Giant patrol in a mountain way-station.

### Maret Korr
**Appearance:** Thirties, has the look of someone managing two children in a tense household with efficiency and no margin for error. When she sees the players returning with Davan, she doesn't run — she walks, and the walking is controlled, and then her hands are on his face and that control is over.

**Personality:** She's been told nothing official, and she's been processing that nothing for two weeks. When the players bring him back, her gratitude is not directed at the players, exactly — it's directed at the situation having resolved. They'll understand.

**Roleplaying note:** The reunion scene should be brief and private. Players don't need to be in it. A door closes. That's enough.

---

## RUNNING THE QUEST

### Scene 1: Brunhild's Briefing

> Her office is what you'd expect from someone who runs intelligence for a dwarven settlement under Frost Giant rule — functional, organized, and containing exactly the information she wants you to see and none that she doesn't. The logbook is open. She closes it when you enter. "I have a courier named Davan Korr," she says, as if you've asked a question. "He has been in the Peaks for twenty-six days. He was due back in twelve. I need to know if he's alive."

Brunhild will answer specific questions without volunteering more than asked. What she'll give unprompted:
- Davan's last known route (she'll sketch it on a piece of paper — the northern pass, Clan Husk patrol territory, his contact point)
- His physical description
- A letter with Coldrun's tributary seal, addressed "To the authority detaining Coldrun's representative" — she wrote it twelve days ago, has been waiting for someone to carry it
- "He's good. If he's alive, he'll have been watching."

| DC | Skill | What players learn |
|----|-------|-------------------|
| 11 | Insight (reading Brunhild) | She's more personally invested than she's presenting |
| 13 | Insight | She made a decision to send him on this run that she's re-evaluating |
| 14 | Persuasion | She'll tell them about the patrol density increase she knew about when she sent him — and about why she sent him anyway |

### Scene 2: The Peaks Approach

The eleven-mile route to the way-station is Dreadspire Peaks terrain — cold, elevated, requiring cold protection. The patrol density is high but not impossible; Brunhild's sketch covers the three known patrol points on the route.

> The Peaks at close range are a different thing than they are from Coldrun's walls. Up here, the wind has a direction you can feel in your joints. The sky is the pale grey of a sword blade. The path Brunhild drew you is obvious once you're on it — which means a patrol who knows these passes knows you're on it too.

Random patrol encounter on this leg: 40% chance of a Frost Giant two-person patrol (if they have Brunhild's letter, the patrol lets them pass to the way-station with an escort; if they don't, DC 14 Persuasion or combat).

| DC | Skill | Outcome during Peaks approach |
|----|-------|-------------------------------|
| 12 | Survival | Navigate without alerting the northern patrol circuit; add element of surprise at way-station |
| 14 | Stealth (group) | Approach the way-station without being spotted until at the door |
| 11 | Nature | Recognize incoming weather — they have three hours before conditions drop to dangerous; they need to be moving back by then |

### Scene 3: The Way-Station

> The way-station is built into a rock face — not carved, exactly, but like someone found a natural overhang and made it into a structure by closing three sides. Smoke from inside. Two Frost Giants outside, not alert in any particular way. Through a gap in the door: someone inside, seated.

The Frost Giants outside are guards on rotation. Orda is inside with four more. Davan is in the rear storage room.

**Approach A — The Letter:** Presenting Brunhild's letter gets the players inside without combat. Orda reads it (she's been waiting for exactly this sort of response to her query), confirms Davan's status as a recognized tributary representative, and releases him with approximately zero ceremony. She does note: "The query I sent up the chain has not been answered. Note that."

**Approach B — Grull:** Players who ask around or who specifically look for a Frost Giant who seems less committed to the detainee situation will identify Grull (DC 12 Perception; he's the one who keeps looking at the storage room door). Talking to Grull produces a young Frost Giant who wants this situation resolved more than he wants to follow a rule that nobody above him is enforcing. He'll ask for the letter if the players have it. If they don't, he'll advocate to Orda on their behalf — +2 to Persuasion with Orda.

**Approach C — Negotiation:** Without the letter, DC 13 Persuasion with Orda citing the tributary arrangement. She understands supply chains. She doesn't want a problem with Coldrun's tribute over one courier.

**Approach D — Combat:** Seven Frost Giants in an enclosed mountain way-station. Davan is in the storage room. Challenging. Achievable at level 5–7 with good tactical play but a significantly worse outcome for future Peaks relations and for the patrol-network intelligence that Orda could have provided.

### Scene 4: Davan's Notes

When Davan is freed:

> He doesn't thank you first. He opens the courier bag, checks the notes are in order, and then — only then — says "I've got two weeks. Let me walk you through it on the way down." He looks at the weather. "We should walk fast."

The walk back to Coldrun is the intelligence briefing. Davan's notes cover everything listed in the Background section. The stone tablets are the anomaly: he describes them specifically, the clan insignia on the carriers (not Husk — something older, possibly pre-unification), the direction they were traveling (toward the Spires, not toward Frostgale Keep).

This anomaly is a planted detail for the Frost and Blood main quest — the tablets may be related to Vaul-Khesh's ley-node work, or to a secondary Frost Giant factional operation, to be determined by the DM's arc planning. What matters here is that players hear about them and Brunhild's eyes sharpen when Davan describes them.

### Scene 5: The Return

Brunhild's response to Davan's return: she takes the notes. She reads the patrol rotation data while still standing. Then: "The stone tablets. Tell me again." She makes Davan repeat it twice. Then she looks at the players and says: "Sit down. I have files you should see."

The reunion with Maret and the children happens offscreen — or in a brief moment the players witness from a distance. Pel and Sanna are in the doorway of their home. Davan's hands go to both of them at once.

---

## WHAT CAN GO WRONG

1. **Players go without the letter:** Negotiation becomes significantly harder. Combat becomes significantly more likely. Even if they succeed, Orda is disgruntled and Coldrun's relationship with Clan Husk patrol network is temporarily strained.

2. **Players are caught by a patrol before the way-station:** Without the letter, this is combat. With the letter, this is a twenty-minute delay and an armed escort to the way-station. Players who spend so long in the Peaks that the weather window closes face a cold-damage hazard on the return — DC 13 Constitution saves per hour in severe conditions, 1d6 cold damage on failure.

3. **Players tell Maret what happened before Brunhild releases the information:** Maret's relief at the news becomes a problem when Brunhild finds out the players told her before the operation was confirmed clean. Not a significant consequence, but Brunhild's opinion of the players drops half a notch.

4. **Davan's notes are compromised:** If combat occurs at the way-station, there's a 25% chance the courier bag is damaged in the fight — the patrol rotation data is legible, but the camp positions on two of the hand-drawn maps are water-stained beyond reading. Brunhild absorbs this without complaint. The players know what they didn't manage.

---

## RESOLUTION

**Full Success:** Davan is home. His notes are intact. Brunhild's files are open to the players. The stone tablet observation is on the board for future investigation. The patrol rotation data is three weeks current — the most accurate snapshot of Clan Husk's northern circuit in Brunhild's possession.

**Partial Success:** Davan is home but the notes are partially compromised, or the way-station encounter strained the Clan Husk relationship. Brunhild still opens the files — Davan being alive is the threshold, not the notes — but she's more reserved about what she shares initially.

**Failure:** Davan is not found or is not recovered. Brunhild closes the files and doesn't open them again for months. His notes, still in the way-station storage room, cover a patrol rotation window that will be out of date within two weeks. Maret Korr doesn't know what happened to her husband.

---

## REWARDS

- **Brunhild's Full Intelligence Archive:** Three years of Frost Giant behavioral analysis; the Varkhul behavioral profile documenting Vaul-Khesh's whisper influence; current patrol rotation data for three Clan Husk circuits; estimated army composition and readiness assessment. This is the primary resource for Frost and Blood's diplomatic path.
- **Davan's Stone Tablet Note:** A planted detail for future Peaks investigation. Brunhild will ask the players to investigate the stone tablet origin if they're interested — it's a thread she doesn't have the resources to pull herself.
- **Letter of Introduction (Brunhild to Korra):** If players have made enough progress in Frost and Blood to have contact with Korra, Brunhild can provide an introduction letter — she's met Korra twice, at tribute sessions. This is social infrastructure for the diplomatic path's final stages.
- **Experience:** 150 XP per player for recovering Davan and his notes intact. Additional 50 XP if the stone tablet anomaly is specifically identified and noted.
- **Faction Reputation:** +1 Sentinel Order (Brunhild has Sentinel Order adjacent relationships; she'll note the players' reliability to Elyndra). +1 Dreadspire Peaks faction (if applicable to your reputation tracking).

---

## CONNECTIONS

- **Frost and Blood (main quest):** Brunhild's full files are the intelligence foundation for the diplomatic path to Frostgale Keep. Without them, players have an argument but not evidence. With them, they have a twenty-year behavioral profile that can make Varkhul see his own corruption. Davan's patrol rotation data also directly feeds the Frostgale approach planning.
- **The Vaul-Khesh Scar:** The stone tablets carried by the non-Husk Frost Giants are a planted detail that can connect to secondary Vaul-Khesh ley-network operation or to a Frost Giant internal factional conflict — DM's call on which thread to pull.
- **Colonel Dawn (Ironwatch):** If players have established Dawn as a contact, she has passing intelligence about Peaks courier networks — they can cross-reference her information with Brunhild's to confirm patrol timing for the Frostgale approach.

---

## DM NOTES

This quest is a character investment quest for Brunhild Thuldrun, and it's designed to be short and specific. The dungeon crawl element is minimal — the way-station is not a complex location. The point is: who is Brunhild, what does she care about, and do the players demonstrate that they can be trusted with real stakes?

The answer to that question is Davan Korr. He's not a powerful NPC. He's a courier who's been doing his job in a very difficult environment for three years and who has been sitting in a storage room for two weeks maintaining his notes with professional precision because that's what he does. His relationship with Grull — the small, impractical friendship forged over an extra blanket and three words of Common per day — is the moment that should humanize the Frost Giants before players reach Frostgale Keep. Grull is not important. Grull is the detail that makes Varkhul's people feel like people.

The reunion between Davan and his family: don't linger in it. Show it from the outside — the doorway, the children, Davan's hands. That's all it needs. The players understand.

Brunhild opening the files should feel like a door that's been locked for the right length of time finally opening. She doesn't say "I trust you now." She says "Sit down. I have files you should see." That's her version of trust, and it's the full version.
$notes$ WHERE slug = 'coldrun-courier';
