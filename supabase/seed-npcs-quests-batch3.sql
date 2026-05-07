-- Batch 3: Ashen Marches + Shattered Isles NPCs and quests

-- ============================================================
-- NPCs
-- ============================================================

INSERT INTO npcs (name, slug, location_id, role, race, description, personality, secrets, is_major, is_alive)
VALUES

  -- ASHEN MARCHES NPCs --

  ('Durra Stonehold', 'durra-stonehold', (SELECT id FROM locations WHERE slug = 'stonehold-farm'), 'Patriarch', 'Human', 'A woman in her seventies who has led the Stonehold Farm for decades. The farmstead produces reliable yields in blighted soil through a method she refuses to explain fully.', 'Quiet, deliberate, and guarded. She feeds travelers without hesitation but deflects any question about the farm''s secret with practiced calm.', 'The Stonehold family has unknowingly maintained a pre-Binding land-consecration — a First Binding anchor. She knows it is a ritual but does not understand what it anchors or what would happen if the family stopped performing it.', true, true),

  ('Penwick Ash', 'penwick-ash', (SELECT id FROM locations WHERE slug = 'gritmarket'), 'Trader', 'Halfling', 'Gritmarket''s longest-running permanent trader. He keeps a meticulous ledger of unusual transactions and has noticed deeply troubling patterns in Bloodmire Cult purchasing behavior.', 'Canny, cautious, and observant. He asks no questions about what others are buying or selling, but catalogues everything he sees for his own purposes. Tells information only to someone with a genuine reason to listen.', 'His ledger documents that the Bloodmire Cult has been purchasing large quantities of iron chain over six months — far more than ritual restraint requires. He has not reported this to the Sentinel Order because he does not know who to trust.', false, true),

  ('Orveth', 'orveth-cisterner', (SELECT id FROM locations WHERE slug = 'the-cisterners'), 'Head Cisterner', 'Human', 'The precise, methodical leader of the Cisterners — the specialist community maintaining the Marches'' freshwater cistern network. She has been monitoring an anomalous change in one cistern''s water for three months.', 'Exact, analytical, and quietly alarmed. She speaks in the careful language of someone who distrusts uncharacterized data but is running out of ways to explain what she has found.', 'One cistern node now produces water that tastes differently — not void-touched, but different. The intake runs through a geological layer directly above a section of the pre-Binding ley-network. She suspects it is either a serious threat or an extraordinary discovery and needs outside help to determine which.', false, true),

  ('Harrowgast', 'harrowgast', (SELECT id FROM locations WHERE slug = 'cinderpost'), 'Commander', 'Human', 'The Sentinel Order''s commander at Cinderpost. She has held the post for nine years and sent forty-seven escalating reports to Sylvara about Nhal''Zeruun''s activity, receiving only formal acknowledgments and no resources.', 'Exhausted, determined, and darkly pragmatic. She has stopped writing reports in formal Order style and now writes as someone who believes they may be composing the last record of something important.', 'She suspects the Sentinel Order''s leadership in Sylvara is either in denial, compromised, or has written the Marches off. Her instruments are staffed by a single specialist; if that person leaves, Cinderpost loses its primary monitoring capability.', true, true),

  ('Aldus', 'aldus-mirrorhill', (SELECT id FROM locations WHERE slug = 'mirrorhill'), 'Veteran Scout', 'Human', 'A Grey Scout who has staffed Mirrorhill relay station for seven years — far beyond normal rotation. He refuses reassignment without explanation and functions normally, but Cinderpost''s commander suspects void-passive drift.', 'Calm, reliable, and disturbingly serene. He performs his relay duties without complaint. He has no apparent urgency about anything.', 'He has been sending sealed personal correspondence through a passing Scout to an unknown recipient, marked with a pre-Binding symbol he found carved in the hill''s stone. He did not know it was a symbol — it simply felt right. He is further into void-passive drift than Cinderpost realizes.', false, true),

  -- SHATTERED ISLES NPCs --

  ('Dorvaine', 'dorvaine', (SELECT id FROM locations WHERE slug = 'ironspire-isle'), 'Lighthouse Keeper', 'Human', 'The keeper of the Ironspire Lighthouse for twenty-two years. One of the best-informed people in the archipelago on shipping patterns, she has been tracking temporal distortion''s effect on arrival schedules for years.', 'Patient, methodical, and quietly urgent. She has maintained careful records alone because no one has asked with genuine purpose — until now.', 'Her records definitively show the time-distortion affecting shipping routes is worsening. She knows which routes and departure windows are most dangerous and has been waiting for someone worth telling.', false, true),

  ('Orrec', 'orrec-stoneback', (SELECT id FROM locations WHERE slug = 'stoneback-isle'), 'Head Fisherman', 'Human', 'The current head fisherman of Stoneback Isle, whose legendarily stubborn community has resisted four Compact annexation attempts. He has tracked a slow eastward shift in his fishing grounds over four years.', 'Blunt, practical, and deeply suspicious of outsiders. He respects competence and nautical knowledge. He will not ask for help but will accept it from someone who earns his respect.', 'The shifting grounds connect directly to the deep trench east of Stoneback — Ulraeth''s prison is disrupting the cold-water upwelling from below. He does not know this yet, but he suspects something fundamental has changed.', false, true),

  ('Cass Breck', 'cass-breck', (SELECT id FROM locations WHERE slug = 'saltmere-isle'), 'Senior Navigator', 'Human', 'The Compact''s most senior navigator, elderly and deeply experienced. She told her apprentice last year that the Needle sea arch is being kept stable deliberately — and that she does not want to know by what.', 'Wise, evasive, and deliberately incurious about things that might upend her world. She has survived forty years in the Shattered Isles by knowing when not to look too hard.', 'Her apprentice went south to investigate the Needle''s stability six weeks ago and has not returned. She has not reported this to the Compact. She is afraid of what the investigation might have found.', false, true),

  ('Cold-Eyes', 'cold-eyes', (SELECT id FROM locations WHERE slug = 'the-cove-at-wreckers-point'), 'Harbormaster', 'Human', 'The harbormaster of the Cove at Wrecker''s Point, known only by her sobriquet. She has run the Cove for fifteen years under a minimal but absolute rule structure. For four months she has been quietly managing the arrival of ships from past decades.', 'Controlled, practical, and privately compassionate. She enforces her rules without exception but has been quietly sheltering displaced sailors and helping them find families who should be long dead. She will not ask for help.', 'She has documentation of at least two ships from past decades that arrived intact, crewed by sailors confused about the current year. She has been managing these arrivals alone and is struggling. She will accept help if it is offered without strings.', true, true),

  ('Father Ossian', 'father-ossian', (SELECT id FROM locations WHERE slug = 'harrowpoint'), 'Priest of Selindra', 'Human', 'An eighty-year-old priest who has served Harrowpoint''s chapel for forty years. He holds knowledge about the archipelago accumulated over decades and has recently opened a sealed document his predecessor left him — to be opened only if the fog came against the wind for three mornings running.', 'Gentle, deliberate, and burdened. He carries information he has not yet decided how to act on. He speaks carefully and is a genuinely sincere practitioner of his faith in a port where religion is mostly nominal.', 'The fog came against the wind for seven mornings running before he opened the document last week. He now holds information he knows will change whoever receives it. He is old enough to understand the weight of that.', false, true),

  ('Ord', 'ord-farpoint', (SELECT id FROM locations WHERE slug = 'farpoint-beacon'), 'Lighthouse Keeper', 'Human', 'The sole keeper of Farpoint Beacon — the last lighthouse before the Fog Line — who has been working alone for eight months since his assistant departed for medical reasons and the Compact failed twice to send a replacement.', 'Steady, dutiful, and quietly at the edge of his limits. He is holding together through the structure of his job. He will share everything he knows about the Fog Line without being asked. He will then ask plainly for help.', 'The Fog Line has advanced nine miles in eight months — an unprecedented acceleration. His reports have grown shorter. His most recent was three words. He is not sure how much longer he can maintain the post alone and there is no one else to do it.', false, true),

  ('Silt', 'silt-port-sullen', (SELECT id FROM locations WHERE slug = 'port-sullen'), 'Information Broker', 'Human', 'One of two information brokers operating out of Port Sullen''s only inn. Reliable and expensive. She currently holds a manifest she cannot sell because she does not know who the right buyer is.', 'Calculated, professional, and careful. She sells information for money and has sat on this particular piece for over a year because it is dangerous to the wrong buyer and she does not want to become a liability.', 'She has the manifest of a ship that transited Port Sullen fourteen months ago carrying components for an anchor-disruption ritual targeting one of Ulraeth''s binding points. The buyer was unidentified. The ship''s manifest names a Saltmere merchant who has been dead for six years.', true, true),

  ('Brother Keel', 'brother-keel', (SELECT id FROM locations WHERE slug = 'tidewatch-monastery'), 'Head Archivist', 'Human', 'The head archivist of the Tidewatch Monastery, which has spent ninety years empirically documenting temporal distortion events in the Shattered Isles. He has calculated that the next major distortion spike is four months away.', 'Methodical, scholarly, and genuinely frightened in a measured way. He presents data clearly and accurately. He will share everything the monastery has with anyone who can help, without conditions.', 'The Tidewatch records show the eleven-year spike pattern escalating: three ships lost in the spike eleven years ago, eleven ships in the spike twenty-two years ago. The monks believe the next spike will be significantly worse. They have told no one because no one has listened before.', false, true),

  ('Mira Doss', 'mira-doss', (SELECT id FROM locations WHERE slug = 'saltmere-isle'), 'Senior Harbor Pilot', 'Human', 'The Compact''s senior harbor pilot at Saltmere Bay. She has calculated that the bay''s tidal drift, currently forty minutes behind prediction and worsening, began exactly when Ulraeth''s fog first appeared in Compact records.', 'Precise, quietly anxious, and uncertain about her institutional role. She does her job superbly but is not sure it is her place to report a correlation that implicates the Compact''s foundational supernatural threat.', 'She has traced the tidal drift backward to its origin fifty years ago, when it started at exactly zero — the same moment Ulraeth''s fog first appears in Compact records. She has told no one. At the current rate, the offset reaches three hours behind prediction in a century.', false, true)

ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- Quests
-- ============================================================

INSERT INTO quests (title, slug, region, quest_type, status, description, dm_notes, location_id)
VALUES

  -- ASHEN MARCHES QUESTS --

  ('The Root Beneath the Ruin',
   'the-root-beneath-the-ruin',
   'Ashen Marches',
   'town',
   'available',
   'Stonehold Farm defies the blight — its crops grow green and deliberate in dead soil. A Sentinel Order botanist''s soil sample revealed the trace signature of a pre-Binding land-consecration, the kind used before Nhal''Zeruun was imprisoned. The players must determine what the Stoneholds have been maintaining and whether stopping it would be catastrophic.',
   'The Stonehold family has unknowingly perpetuated a First Binding anchor ritual through six generations of farming practice — specific planting cycles, prayers, and seed-keeping that encode the ritual without anyone understanding it. If the anchor fails, the area becomes another void-sink. Durra Stonehold will cooperate only if the players can demonstrate genuine stakes. Resolution paths: document the ritual and reinforce it, help the family understand what they''re doing, or report findings to Cinderpost to trigger Order intervention.',
   (SELECT id FROM locations WHERE slug = 'stonehold-farm')),

  ('Iron and Intent',
   'iron-and-intent',
   'Ashen Marches',
   'town',
   'available',
   'Penwick Ash, Gritmarket''s most careful trader, has been tracking the Bloodmire Cult''s supply purchases. He has noticed the Cult has acquired enough iron chain over six months to restrain something far larger than a person. He needs someone with ties to the Sentinel Order or the authority to act on the intelligence.',
   'The iron chain is intended for a large binding frame the Cult is constructing at the Deep Pull Site — not to restrain a prisoner but to create a physical conduit structure that directs the void-pulse into a focused ritual. Penwick will share his ledger freely with players who explain their purpose. Following the chain''s trail leads to a Cult quartermaster in Cinders Cross who can be intercepted, and ultimately to the construction site. The chain is nearly complete.',
   (SELECT id FROM locations WHERE slug = 'gritmarket')),

  ('The Navigation Song',
   'the-navigation-song',
   'Ashen Marches',
   'regional',
   'available',
   'The Ashwalkers have survived two centuries in the Marches by following a route-song encoding every location where the void-pulse is strong or weak. Their current lead guide will trade specific route segments for supplies or favors, but refuses to share the section that covers the ground directly above Nhal''Zeruun''s prison — and becomes visibly distressed if pressed.',
   'The guide, whose name is Veth, knows that the song''s restricted section documents a location where the pulse vanishes entirely — a dead zone directly above the prison''s primary anchor. The Ashwalker tradition holds this as sacred and dangerous. She is distressed because she recently sang the forbidden section in her sleep and woke with no memory of it. Someone or something is extracting the route data from her subconscious. Players can help her identify the source (a void-crystal shard she carried for years), recover the missing memory, and determine whether the dead zone is a weakness in the prison or an artifact of its construction.',
   (SELECT id FROM locations WHERE slug = 'the-wandering-camp')),

  ('The New Carvings at Redwall',
   'the-new-carvings-at-redwall',
   'Ashen Marches',
   'town',
   'available',
   'Someone has been adding to the pre-human stone carvings at Redwall in the original style, with apparent fluency. The additions appeared over two years and no resident admits to making them. Some of the new carvings appear to form a map.',
   'The additions were made by a Stone-Speaker — a surviving member of the pre-human tradition that originally built Redwall. He has been observing the settlement from outside for two years, waiting for someone capable of reading the additions. The map shows three First Binding anchor locations in the region, one of which is beneath Redwall itself. He will reveal himself to players who demonstrate they can read even partial pre-Binding script or who treat the carvings with genuine scholarly interest. He is not hostile but is deeply uncertain whether humans can be trusted with what he knows.',
   (SELECT id FROM locations WHERE slug = 'redwall')),

  ('The Woman Who Feeds Everyone',
   'the-woman-who-feeds-everyone',
   'Ashen Marches',
   'town',
   'available',
   'Two months ago, a family arrived in Lastlight from an uninhabited direction and have quietly set down roots. The woman of the family has opened a kitchen serving meals to anyone who comes — food better than the available ingredients should produce. She is clearly being careful not to be noticed being careful.',
   'The family fled from a failed settlement east of the Grey Expanse that the Marches'' official records don''t acknowledge. The woman, Sera, has a minor innate land-magic she does not understand — the same suppressed fertility that Nhal''Zeruun''s influence reduces in crops does not reduce in her. She can coax sustenance from near-nothing. She is hiding because the last place she used this ability was found by Bloodmire Cult recruiters who tried to take her. She will be truthful once she trusts the players. The Cult is still looking for her.',
   (SELECT id FROM locations WHERE slug = 'lastlight')),

  ('The Tainted Node',
   'the-tainted-node',
   'Ashen Marches',
   'regional',
   'available',
   'Orveth, head of the Cisterners, has spent three months monitoring a cistern node producing water that tastes wrong — not void-touched, but fundamentally different. The intake runs through a geological layer directly above a section of the pre-Binding ley-network. She needs outside expertise to characterize whether this is a threat or an opportunity.',
   'The cistern water is being altered by residual energy from a damaged ley-network segment — the network that originally sustained the First Binding. The water is not harmful; it carries a faint attunement to the old anchor-magic, and prolonged consumption slightly sharpens sensitivity to void-pulse events. This could be weaponizable against the Cult (increased awareness of ritual timing) or could attract Cult attention to the Cisterners. Orveth will share everything she has. The resolution depends on whether the players suppress, exploit, or report the phenomenon.',
   (SELECT id FROM locations WHERE slug = 'the-cisterners')),

  ('Twice-Monthly Blood',
   'twice-monthly-blood',
   'Ashen Marches',
   'regional',
   'available',
   'The Crimson Altar''s sacrifice frequency has doubled in six months, matching the void-pulse''s own escalating rhythm exactly. Sentinel researchers believe the Cult is either responding to the pulse or driving it. Someone needs to determine which is true and whether the altar can be disrupted.',
   'The Cult is not driving the pulse — the pulse is driving the Cult''s high priest, who receives the doubled frequency as a compulsion he experiences as divine instruction. Disrupting the altar would not stop the pulse but would break the high priest''s connection to Nhal''Zeruun and potentially create a fracture in the Cult''s leadership. The altar is accessible only by the Cult''s stepping-stone route. An Ashwalker guide or captured Cult initiate is needed to navigate it. The high priest, Vorath, is not entirely beyond reason — he was a Sentinel scholar before his conversion and still has intellectual habits that can be reached.',
   (SELECT id FROM locations WHERE slug = 'the-crimson-altar')),

  ('The Empty Grace',
   'the-empty-grace',
   'Ashen Marches',
   'regional',
   'available',
   'Three void-crystals at the deepest point of the Voidshard Cave have developed inclusions that move with apparent purpose when observed. A Sentinel scholar who examined them through a magnifying glass afterward reported a specific dream: an enormous still darkness, and the overwhelming sensation of being watched from below.',
   'The moving inclusions are not random — they are a form of communication, Nhal''Zeruun testing the interface between its prison and the material world. The dreaming scholar, Mireth, is being slowly attuned; each night she spends near the cave, the dream becomes more detailed. Players who enter the cave will experience attenuated versions of this contact. The resolution path: destroy the three crystals (suppresses the contact but alerts the Cult, who consider the crystals sacred), seal the cave''s entrance (buys time), or allow a carefully prepared scholar to attempt structured communication with whatever is trying to reach through.',
   (SELECT id FROM locations WHERE slug = 'voidshard-cave')),

  ('The Hidden Scripture',
   'the-hidden-scripture',
   'Ashen Marches',
   'regional',
   'available',
   'Under the altar of the Reconsecrated Temple of Aelon — now a Bloodmire Cult worship site — the original priests hid a document before they fled: their record of what the temple''s ley-node was, what it connected to, and what they witnessed over two centuries of Nhal''Zeruun''s spreading influence. It predates any Sentinel Order documentation by a century.',
   'The document is wrapped in oilcloth under the altar and is intact. Retrieving it requires entering an active Cult worship site, which has rotating guard presence and a resident void-priest. The document itself contains two critical pieces of intelligence: the original ley-node''s connection points (which could allow partial restoration of the suppressed anchor network) and the priests'' firsthand observation that Nhal''Zeruun''s influence accelerated sharply in CR 619 after what they describe as "a deliberate opening from without." Someone helped the blight spread. The document names no names but describes a ritual signature.',
   (SELECT id FROM locations WHERE slug = 'reconsecrated-temple-of-aelon')),

  ('What the Soil Remembers',
   'what-the-soil-remembers',
   'Ashen Marches',
   'regional',
   'available',
   'Soil samples from the Convergence Point — the closest above-ground approach to Nhal''Zeruun''s prison — have revealed a ritual signature predating the Bloodmire Cult by two hundred years. Whatever it is, someone performed a significant ritual at the most powerful point above the prison long before the Cult existed.',
   'The pre-Cult ritual was a deliberate attempt to weaken the First Binding from outside — not by a Shadow Lord or their agents, but by a faction within the original Binding''s own tradition who believed Nhal''Zeruun''s imprisonment was unjust. The signature matches records in the Sentinel Order''s restricted archive. Following this lead requires accessing those archives in Sylvara and then returning to the Convergence Point to determine whether the weakening was successful and whether it can be reversed. The Cult now performs rituals here without knowing they''re building on someone else''s deliberate excavation.',
   (SELECT id FROM locations WHERE slug = 'the-deep-pull-site')),

  ('The Documented Purge',
   'the-documented-purge',
   'Ashen Marches',
   'town',
   'available',
   'A former resident of Cinders Cross has spent eighteen months documenting Bloodmire Cult activity in the ruins from a safe distance. She has detailed records of ritual timings, personnel movements, and supply patterns. Every Grey Scout she''s approached has said the information isn''t actionable yet. She disagrees.',
   'The woman, Tura, has identified a pattern the Scouts missed: the Cult uses Cinders Cross as a transit point for moving void-crystals westward. Her records show the transit schedule and the Cult members involved. The information is highly actionable — it could allow the Scouts to intercept a transit, capture a mid-rank Cult operative, and recover crystals before they reach the Bloodmire. What the Scouts mean by "not actionable" is that they don''t have enough personnel. The players can either act directly on Tura''s intelligence or help her get it to someone at Cinderpost who outranks the Scouts who dismissed her.',
   (SELECT id FROM locations WHERE slug = 'cinders-cross')),

  ('The Sealed Basement',
   'the-sealed-basement',
   'Ashen Marches',
   'town',
   'available',
   'Under Ashen Ford''s old waystation — used by travelers crossing the former ford for three centuries — the last residents walled up a basement before leaving. For a decade, a crack in the mortar showed wrapped packages and a locked chest inside. The crack sealed itself eight years ago. The contents are unknown.',
   'The basement was sealed by the waystation''s last keeper, who was also a low-ranking agent of the pre-Sentinel Order predecessor organization. The sealed packages are agent reports from CR 720–730 — documentation of early Bloodmire Cult formation that was never delivered because the agent''s handler disappeared and the keeper didn''t know who else to give it to. The locked chest contains a First Binding translation key, partial — the keeper had been working with a Stone-Speaker contact who was killed before the work was finished. Breaking through the walled-up entrance requires significant effort but no special knowledge. The contents are invaluable to the Sentinel Order and dangerous if the Cult finds them first.',
   (SELECT id FROM locations WHERE slug = 'ashen-ford')),

  ('Who Lit the Tower',
   'who-lit-the-tower',
   'Ashen Marches',
   'regional',
   'available',
   'A fire was spotted three times in the upper window of Tower Town''s watchtower in the past month. A Grey Scout reported finding no one there. A second Scout sent to investigate has not returned. A third was told not to go. Someone or something has occupied the best-preserved building in the Marches.',
   'The tower''s occupant is the missing second Scout, Davan, who is alive but has been void-passivized by proximity to a void-crystal formation in the tower''s basement that the Sentinel Order''s historical surveys missed. He is not a Cult member and is not hostile — he simply stopped wanting to leave and cannot clearly articulate why. The Cult does not know about the crystal formation yet. Players who reach the tower will encounter Davan in a state of dreamy inertia, the crystal formation below, and the decision of whether to destroy the crystals (curing Davan but alerting the Cult to the location), report the find to Cinderpost, or use the formation as bait for a Cult operation.',
   (SELECT id FROM locations WHERE slug = 'tower-town')),

  ('Six Hours Before the Shattering',
   'six-hours-before-the-shattering',
   'Ashen Marches',
   'regional',
   'available',
   'Hearthwall''s records-keeper holds a complete account of the settlement''s CR 835 abandonment — including the observation that the void-surge hit Hearthwall approximately six hours before any Sentinel instrument registered the Crown''s shattering. Either the instruments were wrong, or Nhal''Zeruun''s prison cracked before Seraphel struck.',
   'The records-keeper, Esten, is in Ashval''s eastern quarter with her documents intact. She will share them with anyone who treats the question seriously. The answer the records imply — that Nhal''Zeruun''s prison cracked first, independently, and the Crown''s shattering followed as a cascade — has profound implications for the Sentinel Order''s understanding of cause and effect. If Nhal''Zeruun''s prison was already failing before Seraphel acted, then the Shadow Lord''s release may be inevitable regardless of the Crown''s status. Players must verify the claim by cross-referencing with Cinderpost''s instrument logs (which the commander will reluctantly share) and then decide who to tell and what it means for the campaign against Nhal''Zeruun.',
   (SELECT id FROM locations WHERE slug = 'hearthwall')),

  ('The Scar''s Blueprint',
   'the-scars-blueprint',
   'Ashen Marches',
   'regional',
   'available',
   'The Scar — the four-mile fissure that opened in CR 835 — maps precisely onto the boundary between two First Binding anchor points documented in the Sentinel Order''s restricted archives. The prison did not crack randomly. It cracked along its weakest seam, which means someone who knew the anchor map could have predicted, or caused, this exact failure.',
   'The Sentinel Order''s restricted archive confirms the anchor map correlation. Cross-referencing the archive with the Convergence Point''s pre-Cult ritual signature (from the "What the Soil Remembers" quest) reveals the same faction''s involvement — the people who tried to weaken the Binding from inside the tradition deliberately targeted the seam. They may have been working toward a controlled release rather than a catastrophic one, believing they could manage Nhal''Zeruun''s freedom. They were wrong or were stopped. Players must determine whether any members of this faction or their records survive, and whether the seam can be resealed before the Scar widens further.',
   (SELECT id FROM locations WHERE slug = 'the-scar')),

  ('Aldus and the Marked Hill',
   'aldus-and-the-marked-hill',
   'Ashen Marches',
   'regional',
   'available',
   'Mirrorhill''s permanent scout, Aldus, has been at his post seven years past normal rotation and is sending sealed personal messages to an unknown recipient via a passing patrol Scout. The messages are marked with a pre-Binding symbol he found carved in the hill''s stone and claims to have adopted instinctively.',
   'Aldus is not void-passive — he is in the early stages of something different: the hill''s pre-Binding carvings are a communication interface, and his repeated contact with them is creating a channel. The messages he sends are not personal correspondence. They are, without his conscious knowledge, responses to signals he is receiving from the carvings — he is acting as a relay for something that was already using the hill as a communication point before the Sentinel Order arrived. Determining what is communicating through him requires a scholar with pre-Binding literacy and access to Aldus, who will be cooperative and confused. The communicating entity is benign but not human and has been waiting for someone to notice for decades.',
   (SELECT id FROM locations WHERE slug = 'mirrorhill')),

  -- SHATTERED ISLES QUESTS --

  ('The Sealed Chamber',
   'the-sealed-chamber',
   'Shattered Isles',
   'regional',
   'available',
   'Capstone miners on Saltmere Isle have opened a deep shaft into a sealed chamber of very old stone with unidentifiable markings. Two miners who entered the first day have been behaving strangely since — not dangerously, just wrong. The mine foreman''s message to the Compact offices has gone unanswered.',
   'The chamber is a pre-Compact temporal anchor point — a node in the same network that keeps the Needle sea arch stable, built by whoever constructed the Drowned Roads. The two miners are experiencing mild time-loop symptoms: they are reliving approximately four hours of their lives on a very slow cycle, imperceptible to them. Without intervention the loop will tighten. The chamber must be assessed by someone with knowledge of the Drowned Road construction era. Brother Keel at Tidewatch Monastery has the closest relevant expertise. The chamber''s anchor function can be restored (stabilizing that section of the island) or harvested (providing power for one significant ritual, destroying the node).',
   (SELECT id FROM locations WHERE slug = 'saltmere-isle')),

  ('The Yards'' False Logs',
   'the-yards-false-logs',
   'Shattered Isles',
   'regional',
   'available',
   'Three ships built at the Greyhull Yards in the past year have returned from maiden voyages with precise, detailed logs describing voyages that are slightly different from what actually happened — different weather, different ports, near-identical but not identical crew actions. No one on any of the three ships can explain this.',
   'The ships are experiencing a temporal echo during construction: the Yards are built on the Greyhull connecting spur of the Drowned Roads, and the road''s time-distortion is imprinting "ghost voyages" onto the ships'' logs during the construction process. The logs describe voyages the ships will take in a near-future that is slightly different from the actual future — a predictive echo. The yard-master, who is quietly terrified, will cooperate fully. If the players realize the logs are predictive rather than retrospective, they can use them to avoid a disaster that is described in one log but has not yet occurred: a collision in the Widow''s Passage during a fog event three weeks from now.',
   (SELECT id FROM locations WHERE slug = 'greyhull')),

  ('The Lighthouse Keeper''s Records',
   'the-lighthouse-keepers-records',
   'Shattered Isles',
   'town',
   'available',
   'Dorvaine, keeper of the Ironspire Lighthouse for twenty-two years, has compiled detailed records showing that time-distortion is worsening on specific shipping routes. She has been waiting for someone with genuine purpose to share this with.',
   'Her records cross-reference with the Tidewatch Monastery''s distortion logs in ways that reveal the distortion is not random but directional — it is strongest along lines that converge on the Deep of Ulraeth. She will share everything freely. The critical finding buried in her records: one specific departure window from Ironspire Town, on a specific heading, reliably produces distortion in the same direction — earlier, not later. Ships on that heading are arriving before they left. One ship on that heading left last month. Its crew does not yet know they have a problem. They will realize it when they return to Ironspire and find Dorvaine three days younger than when they left.',
   (SELECT id FROM locations WHERE slug = 'ironspire-isle')),

  ('The Shifting Grounds',
   'the-shifting-grounds',
   'Shattered Isles',
   'regional',
   'available',
   'Stoneback Isle''s fishing grounds have been moving east, a mile per year for four years. The current head fisherman, Orrec, believes the cold-water upwelling is changing and wants to know why. His livelihood and the island''s economy depend on it.',
   'The upwelling is being disrupted at the source — twelve miles east, the abyssal trench where Ulraeth is imprisoned. Ulraeth''s increasing consciousness is disturbing the deep-water circulation patterns. Reaching this conclusion requires an oceanographic investigation (diving surveys of the upwelling, cross-referencing with Tidewatch distortion records, possibly consulting with Port Sullen''s information brokers about recent deep-water reports). Orrec will provide boats and navigation support. The conclusion he and the players will reach is disturbing: the fishing grounds will be unworkable within two years and there is no conventional remedy. The only resolution is addressing Ulraeth''s activity directly.',
   (SELECT id FROM locations WHERE slug = 'stoneback-isle')),

  ('The Fog Came Against the Wind',
   'the-fog-came-against-the-wind',
   'Shattered Isles',
   'regional',
   'available',
   'Father Ossian of Harrowpoint has opened a sealed document his predecessor left — to be opened only if the fog came against the wind for three mornings running. It came against the wind for seven. He now holds information he has not decided what to do with.',
   'The sealed document contains the previous priest''s observations of an eleven-year cycle of fog intensification — the same cycle the Tidewatch monks have independently documented. The priest''s account adds a detail the monks lack: a record of what the previous cycle''s peak produced in Harrowpoint specifically. Three fishing boats went missing from the harbor during the peak. One returned six months later, crew intact, with no memory of the intervening time and a cargo of fish species extinct for three hundred years. The document ends: "If the fog comes against the wind, the next peak is near. Find the boat. The boat knows the way." The boat — the same design, same hull markings — is currently docked at Gull''s Perch. It is the Steady Hand.',
   (SELECT id FROM locations WHERE slug = 'harrowpoint')),

  ('The Cove''s Displaced Sailors',
   'the-coves-displaced-sailors',
   'Shattered Isles',
   'regional',
   'available',
   'Cold-Eyes, harbormaster of the Cove at Wrecker''s Point, has been receiving ships from past decades for four months — vessels arriving in perfect condition crewed by sailors who become confused and frightened when informed of the current year. She needs help and will not ask for it but will accept it.',
   'Four ships have arrived so far, from periods ranging from fifteen to sixty years past. Their crews are healthy and disoriented. Cold-Eyes has been sheltering them, helping them process the news, and in two cases locating surviving family members (now aged or with adult children). She needs help with three things: a scholar to assess why the Cove is receiving these arrivals (the Cove sits at a convergence point in the Drowned Roads network, which is beginning to conduct temporal displacement), a linguist or historian for one crew who speaks only archaic trade-pidgin, and someone to quietly inform the Compact without triggering an official response that would shut the Cove down. The players can build significant goodwill here with Cold-Eyes, which will matter for any operation requiring a discreet harbor.',
   (SELECT id FROM locations WHERE slug = 'the-cove-at-wreckers-point')),

  ('The Eleven-Year Spike',
   'the-eleven-year-spike',
   'Shattered Isles',
   'regional',
   'available',
   'The Tidewatch Monastery''s ninety years of distortion records reveal an eleven-year spike pattern in temporal events, escalating in severity each cycle. Brother Keel has calculated the next spike is four months away and believes it will be significantly worse than the previous ones.',
   'The monastery''s data is solid and their timeline is accurate. The players can verify it against Dorvaine''s shipping records and the Compact''s own (scattered, unanalyzed) distortion logs. The spike can be mitigated in one of three ways: reinforcing one of Ulraeth''s binding anchor points before the spike (requires access to the Deep of Ulraeth, which is currently a fatal dive), disrupting the Ashfield Town Shadow Cabal team''s research (the Cabal may be deliberately amplifying the spike for study purposes), or placing the Tidewatch monks'' water-clock array at three specific positions around the archipelago to create a dampening resonance. The third option is within current reach. The monks designed it forty years ago and never had the resources to implement it.',
   (SELECT id FROM locations WHERE slug = 'tidewatch-monastery')),

  ('The Ghost Town''s Guests',
   'the-ghost-towns-guests',
   'Shattered Isles',
   'regional',
   'available',
   'Ashfield Town on Caldera Isle has been reoccupied by a Shadow Cabal research team of seven people studying Ulraeth''s influence directly. They have protections against the looping. They have not reported back to their Cabal handlers in Saltmere for four months.',
   'The team is not looping. They are stuck in a different way: the lead researcher found what she came for — a method to communicate with Ulraeth — and the team has been in ongoing contact for four months. They are not compromised in the conventional sense; they are deeply ambivalent. The lead researcher, Sera Callow, believes Ulraeth is not malevolent but simply very large and very confused about time. Her four months of communication logs are extraordinary primary source material. She will not willingly hand them to the Compact or the Cabal. She will share them with players who demonstrate they will use the information responsibly. Her Cabal handlers in Saltmere are about to send a retrieval team.',
   (SELECT id FROM locations WHERE slug = 'ashfield-town')),

  ('The Keeper at the Edge',
   'the-keeper-at-the-edge',
   'Shattered Isles',
   'town',
   'available',
   'Ord, the sole keeper of Farpoint Beacon, has been maintaining the Fog Line''s last warning lighthouse alone for eight months. His reports have grown shorter. His most recent was three words. The Fog Line has advanced nine miles in that time — an unprecedented acceleration.',
   'Ord is functionally stable but at the edge of what one person can maintain alone. He will tell players everything about the Fog Line''s movement immediately and without prompting. He will then ask plainly for a replacement assistant. The practical quest is supply delivery and personnel: someone must either bring a replacement keeper from Saltmere (requiring Compact authorization that has already failed twice, suggesting bureaucratic obstruction or deliberate neglect) or find an unconventional candidate willing to take the posting. The deeper thread: Ord''s logs contain something the Compact''s officer who declined to send replacements has not seen. The nine-mile advance in eight months suggests the Fog Line will reach the Capstone Passage in under two years. Someone in the Compact knows this and is not acting on it.',
   (SELECT id FROM locations WHERE slug = 'farpoint-beacon')),

  ('The Manifest of a Dead Man',
   'the-manifest-of-a-dead-man',
   'Shattered Isles',
   'regional',
   'available',
   'Silt, an information broker at Port Sullen, holds a manifest from a ship that transited fourteen months ago — a ship carrying components for an anchor-disruption ritual targeting one of Ulraeth''s binding points. The buyer was unidentified. The ship''s manifest names a Saltmere merchant who has been dead for six years.',
   'The manifest is genuine. The dead merchant''s name was used by a Shadow Cabal cell operating in Saltmere that has been running procurement through the dead man''s still-active trade licenses for three years. The anchor-disruption ritual components were delivered to the Ashfield Town research team (connecting to the "Ghost Town''s Guests" quest) but the Cabal handlers in Saltmere did not authorize that use — the lead researcher obtained the components through the cell without the handlers'' knowledge. The cell''s current members can be identified through the manifest''s port-entry records, which Silt can access for an additional fee. Silt will sell the manifest for a fair price. Her terms: whoever buys it cannot let it be known she had it.',
   (SELECT id FROM locations WHERE slug = 'port-sullen')),

  ('The Road Under the Water',
   'the-road-under-the-water',
   'Shattered Isles',
   'regional',
   'available',
   'The Shore at Low Tide community lives on a section of the Drowned Roads and uses the ancient path''s markings as good-luck symbols without knowing their meaning. A scholar has recognized the marks match those at the Veilwood''s Wayfarer''s Stone exactly — the same language, era, and hand.',
   'The Drowned Roads were built by the same civilization that built the Veilwood''s waymarker network — an empire that predates the Compact by at least a millennium. The Shore community has been inadvertently preserving a critical section of the road by maintaining their structures on it. The marks, when translated (requiring a scholar with access to both the Shore and Veilwood marker records), form a directional guide to the road''s terminus — the Deep of Ulraeth. The Shore community will cooperate fully with a respectful investigation. The oldest resident can show players the three marks that "have always brought good luck," which are, in the original language, a warning: "Beyond this point: the locked door. Do not knock."',
   (SELECT id FROM locations WHERE slug = 'the-shore-at-low-tide')),

  ('The Clock Stopped at 4:14',
   'the-clock-stopped-at-414',
   'Shattered Isles',
   'regional',
   'available',
   'Caldera Fort on Caldera Isle contains the records of a three-hundred-year-old garrison that did not transfer so much as stop knowing what day it was. The fort''s captain''s quarters contain a wound, working clock that has been stopped at exactly 4:14 for three hundred years — because time at that position stopped and has not resumed.',
   'The clock is a temporal anchor point, frozen at the moment Ulraeth''s first significant manifestation disrupted the local timeline. It is also a key: a scholar who understands the Drowned Road construction tradition will recognize the clock''s face is inscribed in the same notation system as the road markers. The time it displays — 4:14 — corresponds to a position in the road-marker sequence that indicates a transition point. Players who bring the clock (or a precise copy of its face) to the Shore at Low Tide community''s marked section of road will find the marks they were told "do not knock" are followed immediately by the sequence 4:14 in the road-marker language. The clock is showing the combination.',
   (SELECT id FROM locations WHERE slug = 'caldera-isle'))

ON CONFLICT (slug) DO NOTHING;
