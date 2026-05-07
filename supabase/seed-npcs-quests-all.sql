-- Aeloria: All NPC + Quest seeds across all 7 regions
-- 102 NPCs + 79 quests derived from regional gazetteers
-- Run AFTER seed-locations-all.sql
-- Safe to re-run (ON CONFLICT DO NOTHING)

-- Batch 1: Aranthor + Darian Empire NPCs and Quests
-- Sources: gazetteer-aranthor.md, gazetteer-darian-empire.md
-- Generated CR 847 for active campaign use

-- ============================================================
-- NPCs
-- ============================================================

INSERT INTO npcs (name, slug, location_id, role, race, description, personality, secrets, is_major, is_alive)
VALUES

  -- ----------------------------------------------------------------
  -- ARANTHOR — Geographic Features
  -- ----------------------------------------------------------------

  -- River Aelwynn / Warden's Ford
  ('Cass Henner', 'cass-henner',
   (SELECT id FROM locations WHERE slug = 'wardens-ford'),
   'Royal Reeve', 'Human',
   'Meticulous old Crown toll-collector at Warden''s Ford. Has been faithfully collecting tolls for the Crown for decades without missing a day.',
   'Precise, duty-bound, deeply uncomfortable with moral ambiguity. Refuses to accept that the Crown''s authority is in question.',
   'Has 1,200gp in a locked strongbox that he cannot remit because there is no functional treasury to send it to. Every faction wants it; he wants someone to tell him who the rightful government is.',
   false, true),

  -- Salt Flats of Kettermere
  ('Emm Crane', 'emm-crane',
   (SELECT id FROM locations WHERE slug = 'kettermere-salt-works'),
   'Lead Saltworker', 'Human',
   'Fourth-generation operator of the Kettermere salt-works. Has refused Shadow Cabal purchase offers twice despite the sums being well above market value.',
   'Stubborn, self-sufficient, protective of her family''s charter. Not easily frightened — but she is sleeping worse lately.',
   'A Cabal agent has made two purchase approaches and has not come back a third time. She suspects the silence is more dangerous than the offers.',
   false, true),

  -- ----------------------------------------------------------------
  -- ARANTHOR — Villages and Hamlets
  -- ----------------------------------------------------------------

  -- Greenvale
  ('Coll Sarne', 'coll-sarne',
   (SELECT id FROM locations WHERE slug = 'greenvale'),
   'Independent Lumber Operator', 'Human',
   'Owner of Sarne Independent Lumber, operating under a 30-year charter granted by King Aldric II. Has been in a quiet legal and logistical war with Blackwell''s Crown Timber Concession for two years.',
   'Tenacious, legally meticulous, patient. Prefers winning through systems rather than confrontation.',
   'Has been rerouting drainage channels that Blackwell''s mill requires to process green timber. The sabotage means Fort Ashveil is being built with wet lumber that will fail in three to five years. Nobody has noticed yet.',
   false, true),

  -- Harwick
  ('Bram Ashely', 'bram-ashely',
   (SELECT id FROM locations WHERE slug = 'harwick'),
   'Village Headman', 'Human',
   'Former royal cavalry sergeant, now headman of Harwick. Wrote and personally delivered the letter refusing Blackwell''s grain requisition, knowing exactly what it risked.',
   'Calm, deliberate, deeply responsible. The specific brand of frightened-and-committed that holds under moderate pressure but will break under serious force.',
   'Two neighboring villages are watching Harwick''s stand. If Harwick holds — or someone helps them hold — the resistance will spread. If it breaks, it won''t.',
   false, true),

  -- Millbrook
  ('Vorel Dass', 'vorel-dass',
   (SELECT id FROM locations WHERE slug = 'millbrook'),
   'Civil Engineer', 'Human',
   'Engineer hired by the rival Oske and Corn miller families to assess the cracked limestone shelf powering Millbrook''s mills. Both families independently selected him.',
   'Professional, even-handed in manner. Uses technical work as social cover without apparent guilt.',
   'Crown Loyalist intermediary operating under the guise of an engineering contract. His real purpose in Millbrook is to establish a contact network among the mill families.',
   false, true),

  -- Fernholt
  ('Thornkeeper of Fernholt', 'thornkeeper-fernholt',
   (SELECT id FROM locations WHERE slug = 'fernholt'),
   'Shrine Tender', 'Human',
   'Elderly woman who maintains the Maerath shrine at Fernholt and knows the Thornmere paths better than anyone alive. Has been quietly sending her grandchildren west to Vaelthorn one by one.',
   'Reserved, observant, deeply rooted in Merefolk tradition. Speaks carefully and rarely volunteers more than asked.',
   'Went into the Thornmere''s central channels to investigate the dead-fish reports and came back refusing to describe what she saw. Whatever she found, she considers it severe enough to evacuate her family.',
   false, true),

  -- Thornfield
  ('Davan Cross', 'davan-cross',
   (SELECT id FROM locations WHERE slug = 'thornfield'),
   'Spice Merchant', 'Human',
   'Traveling spice merchant who happened to be in Thornfield when the headman shared the news of Thornwick''s silent bell. Well-traveled, unremarkable in appearance.',
   'Smooth, observant, economical with words. Knows how to be forgettable.',
   'Shadow Cabal courier. He recognized the significance of the bell''s silence immediately and has already sent word up the Cabal chain. Blackwell''s intelligence section is now watching Thornwick.',
   false, true),

  -- Saltmire
  ('Maevan Shore', 'maevan-shore',
   (SELECT id FROM locations WHERE slug = 'saltmire'),
   'Fisher / Elder Resident', 'Human',
   'One of Saltmire''s oldest residents. Has seen lights in the bay''s deep water on three occasions in the past two months and reported them to the Lighthaven harbormaster, who did not believe her.',
   'Blunt, certain of what she saw, frustrated at being dismissed. Has lived on this bay her entire life and knows the difference between phosphorescence and something else.',
   'The Lighthaven harbormaster has since had two boats return with parallel scoring along their keels, as if something large passed beneath them. Her report is no longer so easy to dismiss.',
   false, true),

  -- Dunwater
  ('Barge-Yard Master of Dunwater', 'barge-yard-master-dunwater',
   (SELECT id FROM locations WHERE slug = 'dunwater'),
   'Barge-Yard Master', 'Human',
   'Operates the barge repair, rental, and storage yard at Dunwater — the last stop before the Thornmere. A practical man who has been dealing with an unusual problem for fifteen days.',
   'Methodical, commercially minded. Prefers clear situations with clear resolutions. This is not that.',
   'Has a barge in storage with sealed unclaimed crates. The captain paid and left on horseback the same day. The barge-yard master has been trying to decide what to do about it and has so far decided nothing.',
   false, true),

  -- ----------------------------------------------------------------
  -- ARANTHOR — Noble House Seats
  -- ----------------------------------------------------------------

  -- House Crenn of Crennford
  ('Isobel Crenn', 'isobel-crenn',
   (SELECT id FROM locations WHERE slug = 'crennford-keep'),
   'Lady of House Crenn', 'Human',
   'Widow of Lord Aldec Crenn, ruling Crennford Keep since his death three winters ago. 45 years old, has been slow-walking Blackwell''s supply requests while declining Crown Loyalist approaches.',
   'Competent, cautious, privately frustrated. Has been doing the administrative work of the lordship for years — her husband''s death changed little except the title.',
   'Covertly sympathetic to Princess Elowen, but her son Cael is currently a page in Lord Caedric''s household in Vaelthorn. She received a letter ostensibly from him that she believes is not in his handwriting and cannot safely investigate.',
   true, true),

  ('Cael Crenn', 'cael-crenn',
   (SELECT id FROM locations WHERE slug = 'crennford-keep'),
   'Noble Page', 'Human',
   'Son of Lady Isobel Crenn, 17, currently attached to Lord Caedric''s household in Vaelthorn as a page. An arrangement his mother made before the succession crisis clarified itself.',
   'Young, earnest. His situation in Vaelthorn as an effective political hostage is not a role he chose.',
   'His mother has received a letter she believes is not in his handwriting. Whether he is being coerced, impersonated, or is in danger is unknown.',
   false, true),

  -- House Aldenn of Aldennmere
  ('Cavan Aldenn', 'cavan-aldenn',
   (SELECT id FROM locations WHERE slug = 'aldennmere-castle'),
   'Lord of House Aldenn', 'Human',
   'Hard-bitten ex-soldier, 58. Fought in the last Valemont succession war on the winning side and has held the Frostback passes for years. Solidly Crown Loyalist but skeptical of Princess Elowen personally.',
   'Direct, opinionated, militarily experienced. Drinks more than he used to and makes decisions slower — but he still knows his terrain.',
   'Has just discovered his son Merric has been conducting unauthorized negotiations with Elowen''s representatives behind his back. Currently furious enough that his garrison can hear the argument through two sets of walls.',
   true, true),

  ('Merric Aldenn', 'merric-aldenn',
   (SELECT id FROM locations WHERE slug = 'aldennmere-castle'),
   'Noble Heir', 'Human',
   'Son of Lord Cavan Aldenn, 28. A true believer in Princess Elowen''s cause who has been conducting unauthorized negotiations with her representatives without his father''s knowledge.',
   'Idealistic, bold, slightly reckless. Convinced he is right and that his father will eventually see it.',
   'His unauthorized negotiations are now known to his father and have triggered a serious family confrontation. The outcome will shape House Aldenn''s formal alignment.',
   false, true),

  -- House Vael of Vaeltower
  ('Petyr Vael', 'petyr-vael',
   (SELECT id FROM locations WHERE slug = 'vael-tower'),
   'Lord of House Vael', 'Human',
   'Nervous lord of a minor house, 38. His house''s succession charter passes to a male cousin who works for Lord Caedric''s household — which Caedric''s people exploit by assuming Petyr''s loyalty without consulting him.',
   'Anxious, cautious, politically isolated. Running a house that has always been one poor decision from insignificance.',
   'Was nominally committed to Caedric by his cousin without being consulted. Privately supports Blackwell as the stable-order option — but has told no one. Recently received a marriage offer for his eldest daughter from Blackwell''s household.',
   true, true),

  ('Sara Vael', 'sara-vael',
   (SELECT id FROM locations WHERE slug = 'vael-tower'),
   'Noble Daughter', 'Human',
   'Eldest daughter of Lord Petyr Vael, 19. Subject of a marriage offer from an intermediary connected to Blackwell''s household that would functionally realign House Vael''s faction allegiance.',
   'Sharp, strong-willed, acutely aware of what is being done with her. Has extremely strong opinions about being used as a political token.',
   'Her father is seriously considering accepting the offer. She has not been formally consulted. She is aware of this.',
   false, true),

  ('Leck Vael', 'leck-vael',
   (SELECT id FROM locations WHERE slug = 'vael-tower'),
   'Noble Cousin / Caedric Agent', 'Human',
   'Petyr Vael''s nearest male heir, thoroughly unpleasant, currently living in Vaelthorn and working in Lord Caedric''s household. Told Caedric''s people that Petyr would back Caedric without asking Petyr.',
   'Self-serving, opportunistic, contemptuous of his cousin''s weakness.',
   'Stands to inherit Vael Tower if Petyr dies. His commitment of Petyr''s loyalty was made to improve his own standing with Caedric, not out of any genuine alignment.',
   false, true),

  -- House Morwen of Morwen Crossing
  ('Aldric Morwen', 'aldric-morwen',
   (SELECT id FROM locations WHERE slug = 'morwen-hall'),
   'Lord of House Morwen', 'Human',
   'Wealthiest of the lesser lords, 52. Controls the best deep-water ford on the upper Aelwynn and has survived the succession crisis by making quiet payments and concessions to all three claimants simultaneously.',
   'Large, careful, extraordinarily patient. Has made himself very rich by never being on the wrong side of anything.',
   'A Cabal agent is assembling documentation of all three sets of payments to present to Caedric. If delivered, Caedric would move against Morwen hard. The agent is waiting for maximum political impact.',
   true, true),

  -- House Ashmore of Ashmore Castle
  ('Margret Ashmore', 'margret-ashmore',
   (SELECT id FROM locations WHERE slug = 'ashmore-castle'),
   'Lady of House Ashmore', 'Human',
   'The eldest active lord in Aranthor, 62. Has outlasted four kings, three regents, and two succession crises. Formally declared support for "restoring the throne to its rightful heir" while carefully refusing to name which heir.',
   'Unimpressed by power, unfazed by pressure, expert at saying things that are technically true and commit her to nothing.',
   'Knows Princess Elowen''s location from the first year after the Night of Broken Glass — Elowen was briefly sheltered at Ashmore Castle. Has left a specific east-wing door unlocked that leads to a room where Elowen scratched her name behind a dresser.',
   true, true),

  -- House Dunbar of Dunbar's Keep
  ('Ronn Dunbar', 'ronn-dunbar',
   (SELECT id FROM locations WHERE slug = 'dunbars-keep'),
   'Lord of House Dunbar', 'Human',
   'Lord of Dunbar''s Keep, 44. Has spent twelve years trying to stay uninvolved in the succession war. His son''s Sentinel connection has made him interesting to Crown Loyalist recruiters against his wishes.',
   'Quiet, careful, privately worried. The kind of man who stays out of trouble by not going looking for it — and is finding that trouble has come looking for him.',
   'His Sentinel son Aldec sent him a sealed letter with instructions not to open it unless "something happens to me." He has been carrying it for three months and is increasingly tempted.',
   true, true),

  ('Aldec Dunbar', 'aldec-dunbar',
   (SELECT id FROM locations WHERE slug = 'dunbars-keep'),
   'Sentinel Order Member', 'Human',
   'Son of Lord Ronn Dunbar, serving in the Sentinel Order. Sent his father a sealed letter with ominous instructions regarding its opening.',
   'Principled, secretive about operational matters. The letter suggests he anticipated something might happen to him.',
   'The contents of the sealed letter are unknown. Whatever Aldec knows, he considered it important enough to create a dead-drop for his father, and dangerous enough that he couldn''t say it directly.',
   false, true),

  -- House Caerl of Caerlhaven
  ('Emeric Caerl', 'emeric-caerl',
   (SELECT id FROM locations WHERE slug = 'caerlhaven'),
   'Lord of House Caerl', 'Human',
   'Coastal lord, 39. Commands a small fleet of six vessels and knows Aranthor''s coastal waters better than anyone. Prefers the sea to politics and has been chartering vessels to whoever pays.',
   'Practical, nautical, immoderate in drink. Genuinely skilled at navigation and fleet management. Politically, he calls himself a merchant, not an actor.',
   'One of his chartered vessels came back from a Blackwell supply run with a crewman behaving strangely — withdrawn, found staring at the water — after a night passage near the bay''s deep channel. Emeric has quietly moved the man off harbor work.',
   true, true),

  -- House Kessrel of Kessrel Towers
  ('Tannis Kessrel', 'tannis-kessrel',
   (SELECT id FROM locations WHERE slug = 'kessrel-towers'),
   'Lord of House Kessrel', 'Human',
   'Lord of the noble seat nearest Vaelthorn, 51. Has been approached by all three succession claimants annually for three years and declined all of them. Publicly demands a full Council of Lords convene in Vaelthorn.',
   'Brilliant, exhausted, deeply cynical about power after being too close to it too long. Still capable of exceptional political maneuvering when he can summon the energy.',
   'Has been holding private correspondence with Princess Elowen''s representatives for four years without committing. His Vaelthorn town house contains a room locked for twelve years — the room where a twelve-year-old Elowen sheltered the night of the Night of Broken Glass. Her dress is still there.',
   true, true),

  -- Lord Dunbar's Ferry
  ('Lord Dunbar of Dunbar''s Ferry', 'lord-dunbar-ferry',
   (SELECT id FROM locations WHERE slug = 'dunbars-ferry'),
   'Ferry Charter Lord', 'Human',
   '61-year-old lord of minor gentry operating a Crown ferry charter at the Aelwynn crossing. Takes the 200-year-old charter with complete seriousness and has declined requests from all three succession claimants to use the ferry without charge.',
   'Rigid in principle, immovable on legal matters, courteous in manner. His position is that a charter issued by a legitimate Crown predates and supersedes the current crisis.',
   'Is currently being watched simultaneously by agents of all three factions. He knows this and finds it professionally appropriate.',
   false, true),

  -- ----------------------------------------------------------------
  -- ARANTHOR — Religious Sites
  -- ----------------------------------------------------------------

  -- Wayshrine of the Open Hand
  ('Owan Fess', 'owan-fess',
   (SELECT id FROM locations WHERE slug = 'wayshrine-of-the-open-hand'),
   'Shrine Keeper', 'Human',
   'Retired merchant, now full-time keeper of the Wayshrine of the Open Hand on the King''s Road. Offers basic healing freely and maintains a small traveler''s emergency supply box.',
   'Quietly devout, unhurried, genuinely helpful. Gives the impression of a man who has found the work he was meant for.',
   'Has received reports that the Crossroads Flame 15 miles south has gone dark. The two shrines have maintained a continuous light signal between them for 80 years. Something is wrong at the Crossroads.',
   false, true),

  -- Crossroads Flame
  ('Hadric', 'hadric',
   (SELECT id FROM locations WHERE slug = 'the-crossroads-flame'),
   'Traveling Priest of Aurelion', 'Human',
   'Priest who maintains the shrine circuit between the Wayshrine of the Open Hand and the Crossroads Flame. Has not been seen in six days.',
   'Dedicated to his circuit, reliable in his schedule. His absence is itself alarming.',
   'Is currently locked in a grain cellar 3 miles east of the Crossroads by Cabal operatives who did not want a witness to the shrine''s defacement. Has been there six days and is running out of water.',
   false, true),

  -- Healing Springs of Maer's Rest
  ('Sister Aveth', 'sister-aveth',
   (SELECT id FROM locations WHERE slug = 'healing-springs-maers-rest'),
   'Maerath Tender', 'Human',
   'Senior tender of the Healing Springs of Maer''s Rest, 60 years old, has been at the site for 25 years. Has noticed the water''s healing properties subtly changing over the past six months.',
   'Calm, observant, spiritually attuned without being dramatic about it. Has been trying to get a message to the Sentinel Order for four months.',
   'Believes the spring''s change began when the Shadow Lord seals started weakening — that the springs draw on something deeper in the earth that is now disturbed. This is a significant piece of intelligence about the campaign''s larger threat.',
   false, true),

  ('Senn', 'senn-maers-rest',
   (SELECT id FROM locations WHERE slug = 'healing-springs-maers-rest'),
   'Maerath Apprentice', 'Human',
   'Apprentice tender at the Healing Springs of Maer''s Rest, 22. Works alongside Sister Aveth and assists with healing and site maintenance.',
   'Young, earnest, learning. Absorbs Sister Aveth''s calm but hasn''t yet matched her depth of perception.',
   NULL,
   false, true),

  -- Aurelion Monastery of the Seven Lanterns
  ('Caelan Morn', 'caelan-morn',
   (SELECT id FROM locations WHERE slug = 'monastery-of-seven-lanterns'),
   'Prior of the Monastery', 'Human',
   'Prior of the Aurelion Monastery of the Seven Lanterns, 71. Has given Elowen''s supporters access to three historical documents from the library — but withheld a fourth that he considers too dangerous.',
   'Deliberate, intellectually rigorous, burdened by what he knows. Has been sitting on dangerous information for three years trying to determine whether it is hope or a trap.',
   'The withheld fourth document is a complete copy of the original Crown Covenant, including clauses removed from the official version in the second century CR. One clause describes a secondary activation method for the sealing power that doesn''t require the complete Crown.',
   false, true),

  -- ----------------------------------------------------------------
  -- ARANTHOR — Inns and Crossroads
  -- ----------------------------------------------------------------

  -- The Warden's Rest
  ('Bess Orane', 'bess-orane',
   (SELECT id FROM locations WHERE slug = 'the-wardens-rest'),
   'Innkeeper', 'Human',
   'Innkeeper of The Warden''s Rest, 44. Runs a commercial operation without sentiment and holds the exclusive food supply contract for the Greenvale logging camps. A small weekly supply convoy goes north on her behalf.',
   'Practical, commercially focused, not given to unnecessary questions. Noticed weight discrepancies in the supply wagons but has not investigated.',
   'Someone is using her supply line without her knowledge — small sealed packages are being added to the wagons by a Greenvale contact. She has noticed the weight discrepancies. She doesn''t know what she''s carrying.',
   false, true),

  -- The Split Crown Inn
  ('Rellen Crae', 'rellen-crae',
   (SELECT id FROM locations WHERE slug = 'the-split-crown'),
   'Innkeeper', 'Human',
   'Owner of The Split Crown inn, 5 miles north of Vaelthorn. 48 years old. Has built a reputation for total discretion that every faction trusts and exploits.',
   'Maximum neutrality, maximum discretion, maximum profit. Genuinely does not share information between guests. Watches political situations with professional concern rather than moral reaction.',
   'Charges a 10% "discretion premium" on sensitive business — undisclosed, built into the rate. Currently hosting a mid-rank Cabal agent, a Crown Loyalist courier, and a Blackwell intelligence officer simultaneously, none of whom know about the others. She knows about all of them.',
   false, true),

  -- Aelford Bridge and Inn
  ('Tomm Reach', 'tomm-reach',
   (SELECT id FROM locations WHERE slug = 'aelford-bridge-and-inn'),
   'Innkeeper', 'Human',
   'Owner of the Aelford Inn at the upper Aelwynn bridge crossing, 50. Personal friend of royal reeve Cass Henner and has a demonstrated talent for de-escalating tense toll confrontations between factions.',
   'Steady, socially perceptive, genuinely calm under pressure. Has talked down three armed toll disputes in the past year.',
   'Witnessed the moment when Cass Henner stared down a Blackwell sergeant who had drawn his sword and made him sheathe it. Has been thinking about what Henner actually did for a week. Suspects Cass Henner is more than he appears.',
   false, true),

  -- Mereford Inn
  ('Holt Cass', 'holt-cass',
   (SELECT id FROM locations WHERE slug = 'the-mereford-inn'),
   'Innkeeper / Thornmere Guide', 'Human',
   'Former Merefolk guide, now innkeeper at the Mereford Inn at the Thornmere''s western edge, 55. Knows the western approaches of the Thornmere as well as any living person. Will guide parties for 2gp per day.',
   'Deliberate, reads people carefully, will not go into the central channels. Refuses guide contracts from travelers who ask the wrong kind of questions.',
   'Turned down two contracts in the past month from travelers who asked specifically about places in the Thornmere with no solid ground — as if that was the destination rather than the problem. He recognized the questions as coming from a Shadow Cabal survey team.',
   false, true),

  -- Warden's Ford (Alec deputy)
  ('Alec', 'alec-wardens-ford',
   (SELECT id FROM locations WHERE slug = 'wardens-ford'),
   'Crown Toll Deputy', 'Human',
   'Deputy toll-keeper at Warden''s Ford, 24. Appointed by royal reeve Cass Henner. Takes his Crown charter responsibilities with the same gravity as his superior.',
   'Young, earnest, legally meticulous. Has been recording every crossing in the ledger exactly as the charter requires for two years.',
   'Has been privately researching whether a ford-toll charter issued by a legitimate king can be voided by a succession claimant without full Council of Lords ratification. His notes represent a potentially significant piece of constitutional law. The Kessrel family''s lawyers have noticed.',
   false, true),

  -- ----------------------------------------------------------------
  -- ARANTHOR — Working Sites
  -- ----------------------------------------------------------------

  -- Kettermere Salt-Works
  ('Pell Crane', 'pell-crane',
   (SELECT id FROM locations WHERE slug = 'kettermere-salt-works'),
   'Salt-Works Laborer', 'Human',
   'Second son of Emm Crane, 22. Works at the family salt-works but has been having secret meetings with a Shadow Cabal agent — not to sell the works, but because the agent''s offers of magical training interest him.',
   'Restless, drawn to things beyond his current horizon, conflicted about deceiving his mother.',
   'Has not committed to the Cabal and has not told his mother about the meetings. He is a recruitment target the Cabal is handling carefully.',
   false, true),

  -- Frostback Quarry
  ('Toral Bress', 'toral-bress',
   (SELECT id FROM locations WHERE slug = 'frostback-quarry'),
   'Structural Engineer', 'Human',
   'Engineer hired to assess the cave breakthrough at the Frostback Quarry above Cresthollow. Has given a preliminary verdict of "structurally sound" but is visibly agitated in a way that doesn''t match that assessment.',
   'Professional composure over genuine alarm. Is trying very hard to control her reaction to what she found.',
   'Behind the quarry face: a Stone-Speaker workshop, intact, 800 years undisturbed. Tools still on the benches. She is trying to decide whether to report it to the village council or a higher authority — and if a higher authority, which one is trustworthy right now.',
   false, true),

  -- Highfeld Grain Collective
  ('Seff Oren', 'seff-oren',
   (SELECT id FROM locations WHERE slug = 'highfeld-grain-collective'),
   'Collective Manager', 'Human',
   'Administrator of the Highfeld Grain Collective, 50. Manages 800 tons of grain storage for six villages and has been navigating Blackwell''s requisitions through legal challenges and creative accounting for two years.',
   'Formidably organized, legally creative, protective of the collective''s interests. Currently sitting on an uncomfortable discovery.',
   'Has identified the village representative who has been supplying Blackwell''s officers with the collective''s storage manifests. Knows who the informant is, but acting on it risks exposing the entire cooperative to retaliation.',
   false, true),

  -- Brynn's Vineyards
  ('Issa Brynn', 'issa-brynn',
   (SELECT id FROM locations WHERE slug = 'brynns-vineyards'),
   'Vineyard Matriarch', 'Human',
   'Grandmother of the Brynn family, 84. The oldest living member of the family that has operated the vineyard for five generations. Knows the family''s oldest secret.',
   'Sharp despite her age, keeper of old things, not given to drama but very clear about what should not be touched.',
   'Her grandmother told her to leave a sealed door in the deepest section of the vintage cellar alone, saying "the man who sealed it sealed it for good reason." She does not know who sealed it or when, and she has never opened it.',
   false, true),

  -- ----------------------------------------------------------------
  -- DARIAN EMPIRE — Provincial Cities
  -- ----------------------------------------------------------------

  -- Varix
  ('Luvian Asche', 'luvian-asche',
   (SELECT id FROM locations WHERE slug = 'varix'),
   'Praetor of Caldra Prima', 'Human',
   'Provincial governor of Caldra Prima, meticulous bureaucrat who has run the province without incident for twelve years. Second in authority in the Empire''s heartland after Caldrath itself.',
   'Exacting, procedural, not given to scandal. Has managed the province through precise administration rather than personality.',
   'His youngest son has joined the Census Cheats resistance. Asche knows, has said nothing, and is quietly terrified about what the Blackguard will do when they find out.',
   true, true),

  -- Dalven
  ('Veth Orinas', 'veth-orinas',
   (SELECT id FROM locations WHERE slug = 'dalven'),
   'Arcane Vanguard Lead Commander', 'Human',
   'Commander of the Arcane Vanguard survey office in Dalven. Has compiled extensive notes on anomalous geomantic readings across the eastern territories.',
   'Analytical, thorough, increasingly uncomfortable with her own conclusions. Not a member of any resistance — she reached her findings independently.',
   'Her geomantic survey data corresponds precisely to Shadow Lord anchor points. She is deciding whether to report her findings, suppress them, or share them with someone outside official channels.',
   false, true),

  -- Sorthun
  ('Mira Tanasse', 'mira-tanasse',
   (SELECT id FROM locations WHERE slug = 'sorthun'),
   'Provincial Governor of Lithorica', 'Human',
   'First woman to hold a provincial governorship under Darius IV, appointed to Lithorica. Brilliant, politically reliable, does exactly what the Emperor says.',
   'Precise, loyal, professionally unreadable. Was appointed because of her competence and her controllability.',
   NULL,
   true, true),

  -- Caelport
  ('Amber Wake Captain', 'amber-wake-captain',
   (SELECT id FROM locations WHERE slug = 'caelport'),
   'Merchant Ship Captain', 'Human',
   'Sapphire Coast merchant captain who docks at Caelport every thirty days. Has been passing messages between Census Cheats cells for two years.',
   'Cool, professional, accustomed to managing risk. Has survived two years of courier work through disciplined operational security.',
   'The Blackguard has a file on her that is two weeks from being complete. She does not know this.',
   false, true),

  -- Caldport Annex
  ('Dessa', 'dessa-stone-wheel',
   (SELECT id FROM locations WHERE slug = 'caldport-annex'),
   'Innkeeper / Census Cheats Operator', 'Human',
   'Litorin woman who runs the Stone Wheel inn in the Caldport Annex. Took over the Census Cheats message-drop operation from her murdered brother three years ago.',
   'Cold competence over grief. Methodical, careful, runs the operation with complete professionalism.',
   'The Stone Wheel''s basement room is an informal message drop for Census Cheats operations across Caldra Prima. She is effectively the network''s Caldra Prima hub.',
   false, true),

  -- Harken Mill
  ('Doss', 'doss-harken-mill',
   (SELECT id FROM locations WHERE slug = 'harken-mill'),
   'Miller / Census Cheats Cell Coordinator', 'Human',
   'Large miller at Harken Mill, Ferrum Province. His grain warehouse has hosted Census Cheats cell meetings for seven years. Regional cell coordinator for Ferrum Province''s northern network.',
   'Calm, steady, completely unrattled in manner. His production records — which the census office audits quarterly — are immaculate.',
   'His cell has received intelligence suggesting the Arcane Vanguard''s eastern surveys correspond to sites of historical significance to every pre-Darian culture in Lithorica simultaneously. They lack the magical knowledge to interpret this.',
   false, true),

  -- Cassavar
  ('Vesha-Mir', 'vesha-mir',
   (SELECT id FROM locations WHERE slug = 'cassavar'),
   'Litorin Elder / Oral Tradition Keeper', 'Human',
   'Oldest living keeper of the oral tradition of the Litorin people, living in Cassavar. Knows things about what was sealed under Litor-Keth that the Litorin resistance members who use that temple have entirely forgotten.',
   'Ancient, precise in memory, guardedly generous with knowledge to those she trusts.',
   'Holds oral knowledge about the sealed vault beneath Litor-Keth''s temple — information predating the current Litorin resistance''s institutional memory. This knowledge could change everything about the resistance''s understanding of what they''re protecting.',
   false, true),

  -- Dunmarch
  ('Brek Aldis', 'brek-aldis',
   (SELECT id FROM locations WHERE slug = 'dunmarch'),
   'Village Foreman', 'Human',
   'Foreman of Dunmarch, a provisioning village entirely economically dependent on the Stonefall mining complex. Has discovered a census error that has been over-taxing his village for years.',
   'Persistent, procedurally patient despite repeated failure. Has been trying to get a bureaucratic error corrected for three years.',
   'The error was set by assigning production quotas from a different village''s data. Correcting it would mean a 20% improvement in village quality of life. The bureaucracy has lost his corrections twice and denied them once on procedural grounds.',
   false, true),

  -- ----------------------------------------------------------------
  -- DARIAN EMPIRE — Noble and Patrician Houses
  -- ----------------------------------------------------------------

  -- House Calen
  ('Decuria Calen', 'decuria-calen',
   (SELECT id FROM locations WHERE slug = 'house-calen-estate'),
   'Head of House Calen', 'Human',
   'Head of the oldest patrician house in the Empire, in her seventies. Has held a Senate advisory seat for generations and has been making the case for annexing Aranthor for fifty years with the patience of someone who expects to eventually win.',
   'Relentless, politically formidable, absolutely certain of her position. Age has not made her patient — it has made her more precise.',
   'Her eldest son Casren was killed in a skirmish with Aranthorian cavalry twenty years ago. The official account calls it heroic; he was actually tortured for intelligence. What he told his captors — and who those captors reported to — is unknown. She covered it up to avoid appearing weak.',
   true, true),

  -- House Mireth
  ('Verus Mireth', 'verus-mireth',
   (SELECT id FROM locations WHERE slug = 'house-mireth-estate'),
   'Praetor-Emeritus / House Head', 'Human',
   'Former Governor of Caldra Prima, now head of House Mireth, which controls the largest private grain stores in the Empire. Has the Emperor''s private ear and makes the anti-annexation argument in purely economic terms.',
   'Financially meticulous, pragmatically persuasive, patient. Knows the Emperor doesn''t respond to moral arguments and never tries to use them.',
   'Has been purchasing land in the Sapphire Coast duchy through shell merchants for three years. If Aranthor is annexed and fails to produce returns, he intends to have assets outside imperial jurisdiction. He has not told the Emperor. He also received a letter from Duchess Selene six months ago that he has read four times and not replied to.',
   true, true),

  -- House Talveth
  ('Mira Talveth', 'mira-talveth',
   (SELECT id FROM locations WHERE slug = 'house-talveth-estate'),
   'Head of House Talveth', 'Human',
   'Head of the house that administers census contracts for Caldra Prima. Has turned the civil service appointment into a private toll operation, charging "expedited service" fees at scales that corrupt the process.',
   'Administratively brilliant, entirely untroubled by her corruption, accustomed to operating without oversight.',
   'The Blackguard knows about the corruption broadly and has done nothing — Inquisitor Thane accepted a gift from her seven years ago. She recently discovered someone accessing census records through official channels with no authorization trail and has launched her own internal investigation, which is accidentally intersecting the Blackguard''s unrelated investigation.',
   true, true),

  -- House Aurantis
  ('Dral Aurantis', 'dral-aurantis',
   (SELECT id FROM locations WHERE slug = 'house-aurantis-estate'),
   'Admiral-Emeritus / House Head', 'Human',
   'Head of House Aurantis, which controls the largest private fleet in the Empire. Has been feeding money to multiple Aranthorian factions simultaneously to prolong the succession crisis, which is commercially valuable to him.',
   'Calls prolonging political instability "statecraft." Calm, long-view, has no ideological preferences — only financial ones.',
   'One of his trade ships was seized six years ago for carrying a Blackguard prisoner being secretly moved. The Emperor doesn''t know House Aurantis was involved in unauthorized Blackguard operations. Admiral Aurantis knows who told the Aranthorians. He has recently made contact with the Free Isles Compact through trade channels, and his interest is not commercial.',
   true, true),

  -- House Varix
  ('Luthor Varix', 'luthor-varix',
   (SELECT id FROM locations WHERE slug = 'varix'),
   'Praetor-General', 'Human',
   '68-year-old military commander of significant political respect. Commands House Varix''s influence and believes annexation of Aranthor is both possible and necessary. Currently dying of a slow illness.',
   'Convinced of his military judgment, impatient with his son''s dissent, unwilling to acknowledge that his illness limits him.',
   'He is dying. Caerem will inherit within the year. Whether that happens with the Emperor''s goodwill or despite it depends on the next six months of politics — and on whether Luthor''s illness becomes public knowledge.',
   true, true),

  ('Caerem Varix', 'caerem-varix',
   (SELECT id FROM locations WHERE slug = 'varix'),
   'Noble Heir / Former Border Officer', 'Human',
   'Son of Luthor Varix, 34. Has served two tours on the Aranthorian border and believes the annexation is catastrophically ill-timed given the Shadow situation. Has attempted to tell the Emperor. Was received politely. Nothing changed.',
   'Earnest, direct, frustrated by institutions that cannot hear what he is saying. Not a rebel — an insider who has reached conclusions the system refuses to acknowledge.',
   'Has been meeting privately with High Chancellor Viriath Cale for eight months under the cover of a philosophy discussion group. The two men share concerns about the annexation''s timing.',
   false, true),

  -- Aurin Bridge
  ('Cass Orren', 'cass-orren',
   (SELECT id FROM locations WHERE slug = 'aurin-bridge'),
   'Bridge Keeper', 'Human',
   'Civil servant managing the Aurin Bridge toll station. Has been recording the names of everyone who crosses — not officially, but in a personal log going back eleven years. Does it out of compulsive habit.',
   'Meticulous by nature, unaware of the significance of what he documents. Finds the record-keeping personally satisfying.',
   'His eleven-year personal log is the most complete record of Aranthorian agents entering the Empire that exists. He does not know this.',
   false, true),

  -- Veth's Crossing / Pale Arch Inn
  ('Pale Arch Innkeeper', 'pale-arch-innkeeper',
   (SELECT id FROM locations WHERE slug = 'veths-crossing'),
   'Innkeeper', 'Human',
   'Innkeeper of the Pale Arch in Veth''s Crossing. Keeps a locked cabinet behind the bar that he describes as containing overdue tabs.',
   'Professionally incurious, reliable to the people who matter to him.',
   'The cabinet contains twelve coded letters waiting for Census Cheats couriers to arrive and ask for the "house specialty." He is an active node in the Cheats'' northern courier network.',
   false, true)

ON CONFLICT (slug) DO NOTHING;


-- ============================================================
-- QUESTS
-- ============================================================

INSERT INTO quests (title, slug, region, quest_type, status, description, dm_notes, location_id)
VALUES

  -- ----------------------------------------------------------------
  -- ARANTHOR QUESTS
  -- ----------------------------------------------------------------

  ('The Sealed Strongbox at Warden''s Ford', 'sealed-strongbox-wardens-ford',
   'Aranthor', 'town', 'available',
   'Royal reeve Cass Henner has accumulated 1,200gp in toll revenue he cannot remit — there is no functional Crown treasury to receive it, and every faction wants the money. Henner will give it only to someone who can prove they represent the legitimate government. The party must navigate competing faction pressure and answer, at least to Henner''s satisfaction, who that government actually is.',
   'No answer is technically correct — this is a test of the party''s own faction alignment and ability to make principled arguments. Henner will accept a compelling legal case, a writ from a claimant with legitimate documentation, or evidence of Crown Loyalist institutional authority. If the money is taken by force, Alec the deputy will record the perpetrators and the event becomes a future hook. Factions are watching the ford.',
   (SELECT id FROM locations WHERE slug = 'wardens-ford')),

  ('The Cabal Offer at Kettermere', 'cabal-offer-kettermere',
   'Aranthor', 'town', 'available',
   'Emm Crane, operator of the Kettermere salt-works, has refused Shadow Cabal purchase offers twice. The agent hasn''t returned for a third attempt, and she''s been sleeping worse since. The party can investigate who the Cabal agent is, why the salt-works matter so much, and what the agent''s silence signals.',
   'The Cabal wants the salt-works because it sits on a ley-line convergence that becomes relevant if they establish a ritual presence in the coastal district. The agent''s silence means he has escalated — the next approach will not be an offer. Emm''s son Pell is already in contact with the agent regarding magical training, which the party can discover and use as leverage or a warning. Resolution: expose Pell''s contact, remove the agent, or help Emm establish formal protection from a faction.',
   (SELECT id FROM locations WHERE slug = 'kettermere-salt-works')),

  ('The Mill Crack and the Loyalist Engineer', 'mill-crack-millbrook',
   'Aranthor', 'town', 'available',
   'The limestone shelf powering Millbrook''s three mills has developed a dangerous crack. The two feuding miller families have jointly hired the same engineer — Vorel Dass — who is also a Crown Loyalist intermediary using the work as cover. The party arrives as the assessment is underway and must navigate the feud, the genuine structural danger, and Vorel''s real agenda.',
   'The crack is real and will cause catastrophic mill failure within two seasons if unaddressed. Vorel''s cover is legitimate engineering work — he is genuinely competent. His Loyalist mission is to establish a contact in Millbrook for supply routing. The feud between the Oskes and the Corns can be resolved (or exploited) to determine which family controls the rebuilt mill. Complications: a Blackwell informant in the village has noticed Vorel''s unusual interest in local contacts.',
   (SELECT id FROM locations WHERE slug = 'millbrook')),

  ('What the Thornkeeper Saw', 'what-the-thornkeeper-saw',
   'Aranthor', 'town', 'available',
   'The Thornkeeper of Fernholt went into the Thornmere''s central channels to investigate reports of dead fish and silent villages, came back, and will not say what she saw. She has been quietly sending her grandchildren west one by one. The party can press her for the truth, follow her into the marsh themselves, or investigate the silent villages.',
   'The Thornkeeper saw a Shadow Cabal ritual site established on a permanently submerged platform in the central channels — thorn-willow concealment, no dry access. Three Merefolk villages have been quietly coerced into providing labor and silence. She won''t speak because she knows telling outsiders will trigger the Cabal''s response before anyone is ready to act. She will guide the party if they can convince her they can actually do something. The Mereford Inn''s Holt Cass can provide secondary confirmation that something is wrong in the eastern channels.',
   (SELECT id FROM locations WHERE slug = 'fernholt')),

  ('The Lumber Sabotage at Greenvale', 'lumber-sabotage-greenvale',
   'Aranthor', 'town', 'available',
   'Three Blackwell loggers went into the Greywood''s northern section two weeks ago to survey a new cutting zone and did not return. Blackwell doubled the armed escort on logging parties but sent no search party. Meanwhile, independent operator Coll Sarne''s quiet drainage sabotage means Fort Ashveil is being built with lumber that will fail in years.',
   'The missing loggers found something in the northern Greywood that has been killing deer — not predators, not disease. The Greywood is expanding south, slowly, and its northern sections are being reclaimed by something old. Sarne knows his sabotage is working but doesn''t know what the loggers encountered. Resolution tracks: find the loggers (probably dead), expose Sarne''s drainage sabotage (which could save Fort Ashveil or be used as political leverage), or investigate the northern Greywood threat. These are connected — whatever is in the north is pushing south.',
   (SELECT id FROM locations WHERE slug = 'greenvale')),

  ('Harwick Holds the Line', 'harwick-holds-the-line',
   'Aranthor', 'town', 'available',
   'The village of Harwick has refused Blackwell''s grain requisition and is waiting for retaliation. Two neighboring villages are watching: if Harwick holds, they will follow. If it breaks, they won''t. Blackwell has not yet responded, but that silence is its own kind of threat.',
   'Blackwell''s response will come within two weeks of the party''s arrival — a punitive force of 40 soldiers to make an example. Bram Ashely is a former cavalry sergeant who can organize a defense but is outnumbered and knows it. Options: warn Harwick and help them prepare, recruit the neighboring villages into a coordinated stand, appeal to a noble house for protection, draw Blackwell''s forces into a trap using the village''s grain stores as bait, or find evidence that Blackwell''s requisition orders exceed his legal authority. A successful defense triggers a cascade of resistance across three more Highfeld villages.',
   (SELECT id FROM locations WHERE slug = 'harwick')),

  ('The Unclaimed Crates at Dunwater', 'unclaimed-crates-dunwater',
   'Aranthor', 'town', 'available',
   'A barge arrived at Dunwater three weeks ago off schedule with a crew of only two. The captain paid for storage and left on horseback that day. The sealed crates remain in the barge-yard''s storage shed, unclaimed. The barge-yard master has been trying to decide what to do for fifteen days.',
   'The crates contain Shadow Cabal ritual materials — specifically, components for a marsh-anchoring ritual that was meant to be delivered to the Thornmere cell. The captain was arrested by Blackwell forces on an unrelated charge (smuggling, coincidentally) before collecting them. Opening the crates triggers a Cabal alert within 48 hours — they have a means of detecting the seals being broken. Contents, if inventoried carefully without breaking the detection seal: ritual circle components, a manifest of Thornmere drop points, and a sealed letter to the Thornmere cell leader.',
   (SELECT id FROM locations WHERE slug = 'dunwater')),

  ('The Notice at Thornfield', 'notice-at-thornfield',
   'Aranthor', 'town', 'available',
   'A traveling spice merchant named Davan Cross was in Thornfield when the headman shared the news of Thornwick''s silent bell — and Cross is a Shadow Cabal courier who sent the news up the chain. Blackwell''s intelligence section is now paying attention to Thornwick. The party can track Cross, cut off the information chain, or use the situation to feed Blackwell false intelligence.',
   'Cross operates a legitimate spice route as cover and is professionally difficult to pin as a Cabal asset. He has already made his report; killing him does not unring the bell. His contact in the Cabal chain is a mid-rank operative based at The Split Crown inn. The deeper play: feeding Blackwell accurate-but-misleading intelligence about Thornwick''s silence could draw his forces to the wrong location while the real situation develops. Cross can be turned if the party catches him with evidence — he is loyal to money, not ideology.',
   (SELECT id FROM locations WHERE slug = 'thornfield')),

  ('The Revenue Officer''s Convenient Fever', 'revenue-officer-cobbsgate',
   'Aranthor', 'town', 'available',
   'A Blackwell revenue officer arrived at Cobbsgate to assess fishing output for taxation and slipped off the harbor pier on his second day. He was rescued and has been bedridden with fever since. The pier is perfectly safe. No one pushed him.',
   'Nobody pushed him — but a villager did make sure his boot caught on a deliberately loosened pier plank. The villager is worried the officer will die (which would bring serious Blackwell attention) or recover and realize the fall wasn''t entirely accidental. The party can help the officer recover and quietly depart, investigate who loosened the plank and why, or use the officer''s vulnerability as an opportunity to alter his assessment records before he submits them. Complication: the officer, recovering, has begun to suspect the fall wasn''t accidental and is writing a report.',
   (SELECT id FROM locations WHERE slug = 'cobbsgate')),

  ('Lights Under the Bay', 'lights-under-the-bay',
   'Aranthor', 'town', 'available',
   'Maevan Shore of Saltmire has seen lights in the bay''s deep water three times in two months. The Lighthaven harbormaster didn''t believe her — until two of his boats returned with parallel scoring along their keels, as if something large passed beneath them. Something is moving in Ashcroft Bay''s deep channel.',
   'Connected to the 200-foot channel scored in the bay floor three months ago (see Ashcroft Bay geographic entry). The Ashcroft Mariners know about the channel and the scoring and are deeply unhappy but have closed ranks. The party must earn the Mariners'' trust or find another way to investigate the bay''s deep water. What''s there: a partially awakened entity from pre-Founding times, disturbed by the Shadow Lord resonance weakening its binding. It is not immediately hostile but is increasingly aware. The Mariners'' extra lookouts have already seen it surface once.',
   (SELECT id FROM locations WHERE slug = 'saltmire')),

  ('The Wreck at Ravenscar', 'wreck-at-ravenscar',
   'Aranthor', 'town', 'available',
   'The most recent wreck in the Ravenscar salvage grounds carried no visible cargo but had four iron rings bolted below the waterline — heavy-gauge, as if something had been chained in the hold from the outside. The chains were cut, not broken. The salvage crew found them and is saying very little.',
   'The ship was transporting something the Cabal had acquired from the eastern territories and was moving west. Whatever it was broke free during the night passage and cut the chains from inside. The salvage crew found evidence they won''t report because they know it would end the Wreck Market''s legal ambiguity if Blackwell''s forces investigated the site. The party can investigate the wreck, track what escaped (it came ashore somewhere on the Ravenscar headland), and determine what it was and where it''s going. The lighthouse volunteers have seen something moving on the cliffs at night.',
   (SELECT id FROM locations WHERE slug = 'ravenscar')),

  ('The Neutral Ferry Charter', 'neutral-ferry-charter',
   'Aranthor', 'regional', 'available',
   'Lord Dunbar of Dunbar''s Ferry has declined requests from all three succession claimants to use the ferry without charge. All three factions now have agents watching the crossing simultaneously. The ferry is a critical supply chokepoint, and everyone knows it.',
   'The immediate play is convincing or compelling Lord Dunbar to favor one faction — but this runs into a 200-year-old Crown charter with genuine legal force. The more interesting resolution: Alec the deputy toll-keeper at Warden''s Ford has been researching the same legal question and may have found a constitutional argument that changes the game entirely. The Kessrel family lawyers are also watching. A full resolution involves the legal status of Crown charters under disputed succession — which affects every Crown institution, not just the ferry. Lord Dunbar cannot be frightened; he can, potentially, be legally persuaded.',
   (SELECT id FROM locations WHERE slug = 'dunbars-ferry')),

  ('The Marriage Offer at Vael Tower', 'marriage-offer-vael-tower',
   'Aranthor', 'regional', 'available',
   'Lord Petyr Vael has received a marriage offer for his daughter Sara from Blackwell''s household. Accepting would realign House Vael from Caedric to Blackwell. Sara has strong opinions about being used as a political token and has no intention of cooperating quietly.',
   'Three parties have conflicting goals: Petyr wants to survive; Sara wants autonomy; Leck Vael (the cousin who committed Petyr to Caedric without asking) wants Petyr to die so he can inherit. The party can intervene on Sara''s behalf, help Petyr find a way to decline the offer without Blackwell''s retaliation, expose Leck''s unauthorized commitment as grounds to nullify Caedric''s claim on the house, or find a third suitor that lets Petyr maintain the form of compliance while achieving political neutrality. Sara is a potential long-term ally if freed from this situation.',
   (SELECT id FROM locations WHERE slug = 'vael-tower')),

  ('The Letter from Crennford', 'letter-from-crennford',
   'Aranthor', 'regional', 'available',
   'Lady Isobel Crenn believes a recent letter ostensibly from her son Cael — currently a page in Lord Caedric''s Vaelthorn household — is not in his handwriting. She cannot send for him without appearing to withdraw support from Caedric''s household, which could get Cael detained. She needs someone who can verify her son is still healthy and free.',
   'Cael is alive but under increasing pressure to sign correspondence his handlers draft for him — a softening exercise to make his mother cooperate. The forgery is imperfect; a comparison with earlier letters Isobel has would confirm it. Getting to Cael in Vaelthorn requires navigating Caedric''s household security. Once contact is made, Cael can pass a verification signal in his next letter. The larger hook: if Caedric is already using noble children as political leverage, documenting this would be explosive for Crown Loyalist recruitment.',
   (SELECT id FROM locations WHERE slug = 'crennford-keep')),

  ('The Unauthorized Negotiations at Aldennmere', 'unauthorized-negotiations-aldennmere',
   'Aranthor', 'regional', 'available',
   'Lord Cavan Aldenn has discovered his son Merric has been conducting secret negotiations with Princess Elowen''s representatives without his authority. The castle is experiencing a family argument audible through two sets of walls. The outcome will determine House Aldenn''s formal alignment — and the Frostback passes.',
   'Merric''s negotiations are substantively sound — he has offered Elowen use of the Aldennmere passes for supply movement, which would significantly improve her logistical position. Cavan''s objection is procedural and personal: he wasn''t consulted, and he has reservations about backing a twelve-year-old in hiding. The party can mediate, support Cavan''s position, or support Merric''s. The key to Cavan is not ideology but evidence of Elowen''s competence — something concrete she has done or decided that demonstrates she is more than a symbol. If Merric''s negotiations are ratified, House Aldenn formally commits and the Frostback passes open.',
   (SELECT id FROM locations WHERE slug = 'aldennmere-castle')),

  ('The Priest in the Cellar', 'priest-in-the-cellar',
   'Aranthor', 'regional', 'available',
   'The Crossroads Flame shrine has been dark for six days. The traveling priest Hadric has not been seen. Two benches are disturbed; the dedication stone has been defaced in a specific, deliberate way. Something happened here, and the priest is missing.',
   'Hadric is alive in a grain cellar 3 miles east of the Crossroads, locked in by Cabal operatives. He has been there six days and is almost out of water — finding him quickly matters. The defacement is a Cabal territorial marking in their shadow-ritual geography, and this Crossroads is one of three marking sites along the King''s Road corridor. Restoring the flame is straightforward; understanding why it was targeted requires recognizing the pattern across all three sites. The Cabal cell responsible is still in the area, completing a second marking before moving on.',
   (SELECT id FROM locations WHERE slug = 'the-crossroads-flame')),

  ('The Healing Spring''s Failing Voice', 'healing-spring-failing',
   'Aranthor', 'regional', 'available',
   'Sister Aveth at the Healing Springs of Maer''s Rest has noticed the water''s properties subtly changing over six months — slower healing, different taste. She believes the change is connected to something deep in the earth being disturbed, and has been trying to reach the Sentinel Order for four months without success.',
   'She is correct. The springs draw on a pre-Founding resonance point that is being disrupted by the weakening of the Shadow Lord seals nearby. If the disruption continues, the springs will lose their properties entirely within a year. This is one of several "neutral ground" sites whose degradation serves as a campaign-level indicator of seal deterioration. The Sentinel Order message she sent was intercepted. Helping her reach the right people — and identifying what specific seal anchor is causing the disruption — is the immediate resolution. The anchor is in the Thornmere''s western margin.',
   (SELECT id FROM locations WHERE slug = 'healing-springs-maers-rest')),

  ('The Fourth Document at Seven Lanterns', 'fourth-document-seven-lanterns',
   'Aranthor', 'regional', 'available',
   'Brother Caelan Morn, Prior of the Aurelion Monastery, has given Elowen''s supporters access to three historical documents. He is withholding a fourth that he considers too dangerous to share until he is certain who will use it and how. He has been making this determination for three years.',
   'The fourth document describes a secondary activation method for the Crown''s sealing power that doesn''t require the complete Crown — a contingency written into the original Covenant for exactly the kind of crisis now unfolding. Morn won''t release it to just anyone; he needs to be convinced the party has a trustworthy connection to the people who would use it responsibly. He will test the party with a smaller task: verify that the three documents already given to Elowen''s agents actually reached her, and report what she intends to do with them. If they pass, he shares the fourth. The information in it changes the campaign''s endgame.',
   (SELECT id FROM locations WHERE slug = 'monastery-of-seven-lanterns')),

  ('The Skull Markings at the Thornmere Wayside', 'skull-markings-thornmere-wayside',
   'Aranthor', 'town', 'available',
   'Someone has been leaving small animal skull arrangements at the Maerath wayside shrine on the Thornmere path — arrangements that don''t match any Maerath tradition. The Thornkeeper has removed them twice. They keep coming back.',
   'DC 15 Arcana or Religion identifies the arrangement as Shadow Cabal territorial marking. The shrine sits on the last dry ground before the Thornmere channels begin and has been used by the Cabal cell as a waypoint marker for personnel moving into the marsh. Following the markers backward from the shrine leads to a Cabal staging point one mile west. Following them forward leads into the Thornmere toward the central channel cell. The Thornkeeper will cooperate if the party can tell her what the markings mean — she suspected but wanted confirmation.',
   (SELECT id FROM locations WHERE slug = 'thornmere-wayside')),

  ('The Sealed Vault of Ashtower Keep', 'sealed-vault-ashtower-keep',
   'Aranthor', 'regional', 'available',
   'The ruined Ashtower Keep on the Highfeld Plain conceals a sealed basement vault beneath its collapsed tower interior. Inside: garrison records from CR 620-780 showing that the Greywood''s boundary was once 8 miles further south than it is now. The Greywood is expanding, slowly, and has been for 200 years.',
   'Getting to the vault requires navigating the rubble interior (DC 14 Perception to find the gap, some physical challenge). The records themselves are dry historical documents until the party realizes the implication: whatever is in the Greywood''s northern section has been pushing its boundary south for two centuries, steadily and continuously. Cross-referenced with the missing loggers and the drained deer carcasses, this establishes a pattern. The Cabal markings on the north inner wall (overlooked by the sheep farmer) are recent — within six months — suggesting the Cabal has also found the vault location significant.',
   (SELECT id FROM locations WHERE slug = 'ashtower-keep')),

  ('What Lives in Calwick', 'what-lives-in-calwick',
   'Aranthor', 'town', 'available',
   'The burned ruins of Calwick village on the Highfeld Plain show signs of habitation: the well cover was placed from inside, not outside, and travelers report seeing movement at dusk. Something has lived here for several years.',
   'A survivor of the original Calwick burning — a woman who was twelve when the village was destroyed, now in her mid-twenties — has been living in the ruins, using the well (which is not dry), eating from the old pear orchard. She is not dangerous; she is traumatized, feral in manner, and the only person who witnessed exactly which faction burned her village. She has evidence — a burned officer''s badge she found — that definitively identifies the responsible party. This information would be politically explosive if verified. She will only speak to someone who comes alone and without faction markings.',
   (SELECT id FROM locations WHERE slug = 'burned-village-of-calwick')),

  ('The Fisherman''s Sealed Box', 'fishermans-sealed-box',
   'Aranthor', 'town', 'available',
   'A fisherman near Ashford pulled a sealed iron box from the Drowned Fort''s river bottom three weeks ago. It is Founding-era construction with the seal still intact. He''s been sitting with it for three weeks, afraid to open it and afraid to tell anyone official.',
   'The box contains a property deed for land in what is now central Vaelthorn — a deed that predates the current Crown''s land grants by 200 years and is issued by an authority that doesn''t appear in any official record. Whoever holds the deed could make a legal claim that undermines several noble houses'' current land titles. Three factions would want it: the nobles whose titles it threatens (to destroy it), Crown Loyalists (to use it as leverage), and a Cabal agent who has been looking for exactly this document for years. The fisherman just wants the problem to go away.',
   (SELECT id FROM locations WHERE slug = 'the-drowned-fort')),

  ('The Cabal Crate at Old Caerlhaven', 'cabal-crate-old-caerlhaven',
   'Aranthor', 'regional', 'available',
   'A Shadow Cabal agent used the Ravenscar smuggler network to cache materials at the ruins of Old Caerlhaven — correspondence, ritual components, and a partial manifest of Cabal agent locations on the western coast. The agent was arrested before collecting it. The smugglers have no idea what''s in the crate.',
   'The smugglers'' cache is in the intact landward section of the old keep. The crate was placed three weeks ago; the Cabal will send someone to collect it within another two weeks, at which point they''ll notice the original agent''s absence and become concerned. The partial manifest is the most valuable item — it lists eight Cabal assets on the western coast by cover identity. Sharing it with the right faction cripples the Cabal''s western operations. Sharing it with the wrong faction could compromise Loyalist assets who have been watching the same agents. The smugglers will cooperate if paid and if promised no Blackwell scrutiny of the cache''s other contents.',
   (SELECT id FROM locations WHERE slug = 'old-caerlhaven')),

  ('The Split Crown Convergence', 'split-crown-convergence',
   'Aranthor', 'regional', 'available',
   'The Split Crown inn north of Vaelthorn currently houses a mid-rank Cabal agent meeting a Vaelthorn contact, a Crown Loyalist courier in the next room, and a Blackwell intelligence officer who has been here three days. None of them know about the others. Innkeeper Rellen Crae knows about all of them.',
   'The party arrives at The Split Crown and quickly realizes the situation. Rellen will not share information freely — her reputation depends on discretion for all parties — but she can be persuaded, paid, or caught in a moment of need. The Cabal meeting tomorrow evening is the most time-sensitive element. Options: surveil the meeting, intercept the Vaelthorn contact before they arrive, alert the Crown Loyalist courier without the Blackwell officer noticing, or let all three play out and pick through the aftermath. Rellen''s 10% discretion premium is the opening gambit — once the party knows about it, they have leverage over her cooperation.',
   (SELECT id FROM locations WHERE slug = 'the-split-crown')),

  ('The Signal from Warden''s Hill', 'signal-from-wardens-hill',
   'Aranthor', 'town', 'available',
   'Someone has been sending coded signals from the old signal tower on Warden''s Hill at night — not with visible fire, but with a hooded lantern. The signals go north toward the Greywood. Nobody in Dunmore has been able to decode them.',
   'The signals are sent by a Crown Loyalist contact passing movement intelligence to a Greyvale sympathizer about Blackwell''s logging escort schedules. The code is a variant of an old Sentinel cipher. Decoding it reveals operational information valuable to both Loyalists and Blackwell''s intelligence section. Climbing Warden''s Hill and watching for the signal source leads to a local shepherd who is acting as the signal operator without fully understanding what he''s transmitting — he was given the code and schedule and told it was Crown business. Finding who gave him the schedule leads up the Crown Loyalist chain.',
   (SELECT id FROM locations WHERE slug = 'wardens-hill')),

  -- ----------------------------------------------------------------
  -- DARIAN EMPIRE QUESTS
  -- ----------------------------------------------------------------

  ('The Praetor''s Reluctant Son', 'praetors-reluctant-son',
   'Darian Empire', 'regional', 'available',
   'Praetor Luvian Asche of Varix governs Caldra Prima with meticulous efficiency. His youngest son has joined the Census Cheats resistance. Asche knows, has said nothing, and is quietly terrified about what the Blackguard will do when they find out. The party can exploit this knowledge, protect the son, or use Asche''s vulnerability to gain access to provincial records.',
   'Asche''s silence is not complicity — it is a father buying time. If the Blackguard discovers the son independently, Asche will be implicated for concealment. The party can approach Asche directly with a proposal: in exchange for protection of his son (or a way to quietly extract him from the cell), Asche provides access to census records the party needs. Alternatively, warning the son that the Blackguard is getting close allows the Census Cheats cell to clean up before the file completes. The son, if contacted, is idealistic and will not simply quit — he needs a genuine alternative path.',
   (SELECT id FROM locations WHERE slug = 'varix')),

  ('Commander Orinas and the Anchor Map', 'commander-orinas-anchor-map',
   'Darian Empire', 'regional', 'available',
   'Arcane Vanguard Lead Commander Veth Orinas in Dalven has independently compiled geomantic survey data that precisely corresponds to Shadow Lord anchor points. She is deciding whether to report her findings, suppress them, or share them with someone outside official channels. The party needs this map.',
   'Orinas is not an enemy — she is a scientist who has reached dangerous conclusions and doesn''t know who to trust with them. She will not hand over the data to strangers. The party must establish credibility: demonstrate they know what the anchor points are and why they matter. She will then negotiate — she wants to know that her findings will be used to address the problem, not weaponized politically. The Arcane Vanguard''s official channels are compromised (she suspects this but can''t prove it). The data, once shared, is the most complete anchor-point map available and dramatically accelerates campaign endgame planning.',
   (SELECT id FROM locations WHERE slug = 'dalven')),

  ('The Sealed Temple Beneath Sorthun', 'sealed-temple-beneath-sorthun',
   'Darian Empire', 'regional', 'available',
   'Below the administrative plaza of Sorthun, the foundations of Litor-Keth''s great temple were too deep to demolish. The temple still stands underground, used as a meeting place by the Litorin resistance — and it sits on top of a sealed vault the Litorin were protecting long before the Empire arrived.',
   'The resistance meets here but has never opened the vault — they don''t know what''s in it and their oral tradition is fragmentary. Vesha-Mir in Cassavar holds the complete oral record of what was sealed and why. The vault contains a Litorin warding artifact that was used to contain a proto-Shadow corruption event 800 years ago — the same corruption now threatening the continent. Getting to the vault requires navigating the resistance''s trust, avoiding the Blackguard''s surveillance of Sorthun, and physically accessing a vault sealed with pre-Litorin methods that no current practitioner knows how to open without the right knowledge. Vesha-Mir is the key.',
   (SELECT id FROM locations WHERE slug = 'sorthun')),

  ('The Amber Wake''s Last Run', 'amber-wake-last-run',
   'Darian Empire', 'regional', 'available',
   'A Sapphire Coast merchant captain has been running Census Cheats messages between cells for two years. The Blackguard''s file on her is two weeks from complete. Her ship the Amber Wake docks at Caelport in three days. The party can warn her, intercept the Blackguard file, or use her network before it goes dark.',
   'The captain does not know the file exists. Her network of cell contacts is the most connected courier system in Caldra Prima. Warning her allows her to clean the network''s traces and get out — but the network goes dark. Intercepting the Blackguard file (located in the Caelport field office) is harder but preserves the network. A third option: the captain can be convinced to take one final run with deliberately planted information to mislead the Blackguard investigation, burning the file''s current evidence while creating a false trail. She will cooperate if convinced the network''s survival is worth the personal risk.',
   (SELECT id FROM locations WHERE slug = 'caelport')),

  ('The Pale Arch Cabinet', 'pale-arch-cabinet',
   'Darian Empire', 'town', 'available',
   'The Pale Arch inn at Veth''s Crossing has a locked cabinet behind the bar containing twelve coded Census Cheats letters waiting for their recipients. The innkeeper describes it as overdue tabs. The party needs access to the network — or needs to find a specific letter before the Blackguard does.',
   'The innkeeper will not simply hand over the letters — his own safety depends on maintaining the system. Access requires either the correct passphrase ("house specialty"), a compelling cover identity, or evidence that the party is already known to the network. If the Blackguard is also closing in on this location (they are, following a courier they surveilled from Caldrath), the party has a narrow window. One of the twelve letters contains information about the geomantic readings from Harken Mill — cross-referencing with Commander Orinas''s data in Dalven could be significant.',
   (SELECT id FROM locations WHERE slug = 'veths-crossing')),

  ('What Vesha-Mir Remembers', 'what-vesha-mir-remembers',
   'Darian Empire', 'regional', 'available',
   'In the village of Cassavar, an old Litorin woman named Vesha-Mir is the last keeper of the complete oral tradition of her people. She knows what was sealed under Litor-Keth and why — knowledge the current resistance has entirely lost. Getting to her means traveling to a frontier village with heightened Blackguard presence and earning the trust of someone who has kept her knowledge secret for good reason.',
   'Vesha-Mir will not speak to imperial agents, people in faction livery, or anyone who arrives with soldiers. She will speak to travelers who can demonstrate they already know enough to ask the right questions — specifically, about the vault under the temple and what was sealed there. Her knowledge: 800 years ago, a proto-Shadow corruption was contained by Litorin warding practitioners using an artifact now in the vault. The same corruption''s return is what she has been waiting for someone to come asking about. She will tell everything to the right people. She is also dying and knows it.',
   (SELECT id FROM locations WHERE slug = 'cassavar')),

  ('The Harken Mill Intelligence', 'harken-mill-intelligence',
   'Darian Empire', 'regional', 'available',
   'The Census Cheats cell at Harken Mill in Ferrum Province has received records showing that the Arcane Vanguard''s eastern surveys correspond to pre-Darian sacred sites across Lithorica simultaneously — but they lack the magical knowledge to understand what this means. Someone needs to tell them.',
   'The cell coordinator Doss is cautious about outsiders but can be approached through Census Cheats network protocols (the party needs a credential from another cell) or by demonstrating knowledge of the Vanguard''s findings independently. What the records show, to anyone with magical knowledge: every surveyed site is an anchor point in the Shadow Lord''s continental binding array — the Vanguard has been unknowingly mapping the seal network for years. This intelligence, combined with Orinas''s geomantic data from Dalven, produces a near-complete picture of the seal''s current state. Getting the records out of Ferrum Province without Blackguard interception is the logistical challenge.',
   (SELECT id FROM locations WHERE slug = 'harken-mill')),

  ('The Bronze Door at Fort Aldrus', 'bronze-door-fort-aldrus',
   'Darian Empire', 'regional', 'available',
   'The ruins of Fort Aldrus in Ferrum Province contain a lowest-level chamber of unknown construction, sealed with a bronze door bearing Arcane Vanguard enchantments that are 300 years older than the Vanguard''s founding. The IV Legion sealed it during the pacification campaign and classified the report. No one official has been back.',
   'Getting there requires two days of difficult mountain travel from Ironwatch, avoiding the Blackguard''s annual inspection team, and managing the Gravenstone villagers who make their own pilgrimage visits and are protective of the site. The door''s enchantments are pre-Vanguard — they respond to the old Litorin warding tradition, not imperial arcane technique. Vesha-Mir''s oral knowledge includes the method for opening them. Inside: a pre-Darian containment chamber housing one of the original Shadow Lord anchor stones — not a seal, but the anchor point itself, physically present and degrading. Whoever controls this site controls a critical piece of the continental crisis.',
   (SELECT id FROM locations WHERE slug = 'fort-aldrus-ruins')),

  ('The Aqueduct Tunnel and the Sunken Ward', 'aqueduct-tunnel-sunken-ward',
   'Darian Empire', 'regional', 'available',
   'Census Cheats has identified a maintenance tunnel beneath aqueduct arch 47 that connects to a pre-Darian drainage system under Caldrath — a six-hour underground route into the capital''s northeast quarter, unrecorded in any census. The Arcane Vanguard''s chief cartographer noted growing geomantic anomalies from this same quarter eight years ago. Both threads lead to the Sunken Ward.',
   'The tunnel is real and passable. The Sunken Ward is mostly flooded and partially collapsed — the outer tunnels are used by Census Cheats; the inner sections are unexplored. The geomantic anomaly is architectural: the pre-Darian city below Caldrath was built around a Shadow Lord containment site, and the construction above it has been slowly resonating with the seal''s deterioration. Reaching the containment site requires navigating the flooded inner Sunken Ward without conventional light (bioluminescent growth makes it dim but navigable) and bypassing a failed Vanguard monitoring station. What''s at the center has been growing by measurable percentage each year.',
   (SELECT id FROM locations WHERE slug = 'caldrath'))

ON CONFLICT (slug) DO NOTHING;


-- Batch 2: Veilwood + Sapphire Coast + Dreadspire NPCs and quests
-- Generated from gazetteer-veilwood.md, gazetteer-sapphire-coast.md, gazetteer-dreadspire-peaks.md

-- ============================================================
-- NPCs
-- ============================================================

INSERT INTO npcs (name, slug, location_id, role, race, description, personality, secrets, is_major, is_alive)
VALUES

  -- ── VEILWOOD ─────────────────────────────────────────────

  -- Briarhollow
  ('Tallic Burne', 'tallic-burne', (SELECT id FROM locations WHERE slug = 'briarhollow'), 'Head Woodsman', 'Human',
   'The head woodsman of Briarhollow''s logging operation, four centuries of timber tradition resting on his shoulders. He can identify a Choir-adjacent tree by feel alone.',
   'Deliberate and protective of his crew, but increasingly paralyzed by a decision he has been putting off.',
   'He knows the eastern treeline section his crew has been working for six weeks is going wrong — Choir-touched — but it holds Briarhollow''s most productive timber stands. He has delayed marking it. Two of his crew have begun showing early signs of influence.',
   false, true),

  -- Greywood Post
  ('Torren Ashvale', 'torren-ashvale', (SELECT id FROM locations WHERE slug = 'greywood-post'), 'Sentinel Liaison', 'Half-Elf',
   'The Sentinel Order''s local liaison at Greywood Post, responsible for monitoring Wanderer activity on the North Road and relaying field reports to Sylvara.',
   'Earnest and increasingly frustrated — his urgent reports have been met with formal acknowledgments and no reinforcements.',
   'His Wanderer sighting map shows forty-seven confirmed sightings this month versus twelve this time last year. He has told no one how bad it has become.',
   false, true),

  -- Wychfall
  ('Brine Ashford', 'brine-ashford', (SELECT id FROM locations WHERE slug = 'wychfall'), 'Changed Trapper', 'Human',
   'One of four trappers who disappeared into the Veilwood''s northern pond circuit last winter and returned changed. She lives at the edge of Wychfall in the cluster of houses set aside for the returned.',
   'Functional on the surface — she works, eats, holds conversations — but her family describes speaking with her as "talking to someone through water."',
   'Every night before sleep she says the same sentence: "The cathedral is beautiful. You would not be afraid." She has no conscious awareness that she does this.',
   false, true),

  -- Crestholm
  ('Warden Calla Mourne', 'calla-mourne', (SELECT id FROM locations WHERE slug = 'crestholm'), 'Sentinel Warden', 'Human',
   'The sole Sentinel Order officer stationed at Crestholm''s Order office. Twenty-four years old, assigned to a post designed for a full garrison.',
   'Overextended and determined — she has been requesting reinforcements since her assignment and has not stopped despite receiving none.',
   'She is the only official Sentinel presence between Crestholm and the forest road to Sylvara, covering a territory that has been deteriorating for fourteen months.',
   false, true),

  -- Thorngate (Veilwood)
  ('Vela Ironroot', 'vela-ironroot', (SELECT id FROM locations WHERE slug = 'thorngate-veilwood'), 'Licensed Forest Guide', 'Elf',
   'One of three licensed guides operating out of Thorngate''s waystation, with fifty years of Veilwood experience. She is the most reliable choice for parties heading into the Middle Wood.',
   'Calm and methodical, with the deep patience of someone who has seen the forest in every condition. She does not take unnecessary risks.',
   NULL,
   false, true),

  ('Dusk-in-Reed', 'dusk-in-reed', (SELECT id FROM locations WHERE slug = 'thorngate-veilwood'), 'Licensed Forest Guide', 'Half-Elf',
   'The youngest of Thorngate''s three licensed guides — reckless, talented, and said to know the Veilwood better than most full elves despite her age.',
   'Confident to the point of carelessness, always slightly ahead of where caution would place her. Players who hire her will move fast and occasionally terrify.',
   NULL,
   false, true),

  ('Correm Talle', 'correm-talle', (SELECT id FROM locations WHERE slug = 'thorngate-veilwood'), 'Retired Sentinel / Forest Guide', 'Human',
   'A retired Sentinel in his fifties who refuses to fully leave the work. The third of Thorngate''s licensed guides — gruff, experienced, and the only one of the three who has stopped taking clients into the Middle Wood.',
   'Stubborn and direct, with the quiet authority of someone who has survived things he doesn''t discuss. His refusal to work the Middle Wood is final and not open for argument.',
   'He says the thread is unreliable and will not say more. He knows something specific about current conditions in the Middle Wood that he has not shared with anyone.',
   false, true),

  -- Ironkeel
  ('Vayne Brock', 'vayne-brock', (SELECT id FROM locations WHERE slug = 'ironkeel'), 'Head Remembrancer', 'Human',
   'The elderly head of Ironkeel''s Remembrancer caste — the oral historians who have maintained the town''s accumulated forest knowledge for four centuries, refusing to write it down after the Pale Choir destroyed their written records.',
   'Measured, precise, and quietly frightened. She has spent a life maintaining knowledge others have forgotten and now watches that same erosion reach her own people.',
   'Two of her fellow Remembrancers have begun forgetting specific entries — not randomly, but the entries describing the previous Choir stirring two centuries ago. She has not reported this and is running out of time to determine whether it is age or something else. She is seventy-eight.',
   false, true),

  -- Rootswatch
  ('Pell Whisker', 'pell-whisker', (SELECT id FROM locations WHERE slug = 'rootswatch'), 'Sentinel Tower Keeper', 'Gnome',
   'The tower keeper at Rootswatch''s Sentinel watchtower, stationed here for eleven years. He has filled six detailed ledgers with observations of unusual phenomena at the treeline.',
   'Methodical and meticulous — he measures everything three times and still trusts the measurement. His most recent entry ends with a decision to stop measuring.',
   'His logs document a treeline that has visibly advanced thirty feet in a single night. His most recent entry, four days ago: the treeline moved twelve feet. He has decided to stop measuring.',
   false, true),

  -- Watchpost Thorn
  ('Senior Sentinel Brael', 'brael-sentinel', (SELECT id FROM locations WHERE slug = 'watchpost-thorn'), 'Sentinel Commander', 'Human',
   'Commander of Watchpost Thorn, the Sentinel Order''s primary secondary station on the Veilwood treeline. Former Imperial Army officer, now eight functional Sentinels against a post designed for twenty.',
   'Methodical, understaffed, and quietly furious at the command structure that has not sent reinforcements despite eighteen months of escalating alerts.',
   'He is holding a sealed message intended for Commander Elyndra in Sylvara that he describes as routine. The look on his face when he hands it over says otherwise.',
   true, true),

  -- The Vine Station
  ('Liseth', 'liseth-vine-station', (SELECT id FROM locations WHERE slug = 'vine-station'), 'Sentinel Scholar', 'Elf',
   'An elven scholar assigned to the Vine Station research outpost, studying active Choir influence — memory-wisps, dreamvine acceleration, and the healing marks on the Threaded Way. She is two months overdue for rotation.',
   'Methodical and increasingly alarmed — both by what she is observing and by her colleague Corval''s behavior.',
   'She believes Corval is under early-stage Choir influence. Her replacement never arrived. She is effectively trapped at the outpost with a colleague she no longer trusts.',
   false, true),

  ('Corval', 'corval-vine-station', (SELECT id FROM locations WHERE slug = 'vine-station'), 'Sentinel Researcher / Memory Wizard', 'Human',
   'A human wizard specializing in memory magic, assigned to the Vine Station to study Choir influence. His fascination with his subject has begun to concern his colleagues.',
   'Intellectually captivated and increasingly disconnected from caution. He tests his memory each morning by writing everything he can recall about his childhood. The list grows shorter.',
   'He believes the shortening list is natural cognitive replacement. Liseth believes he is under early-stage Choir influence. The distinction may no longer be meaningful.',
   false, true),

  ('Grundt', 'grundt-vine-station', (SELECT id FROM locations WHERE slug = 'vine-station'), 'Sentinel Ranger', 'Dwarf',
   'A dwarven ranger stationed at the Vine Station primarily to prevent Liseth and Corval from doing anything catastrophically stupid. He has concluded it is time to leave.',
   'Blunt, practical, and done. He is the tiebreaker vote between Liseth''s alarm and Corval''s fascination, and he knows it.',
   NULL,
   false, true),

  -- Outer Network Towers
  ('Sable', 'sable-briarwatch', (SELECT id FROM locations WHERE slug = 'briarwatch-tower'), 'Sentinel Tower Keeper', 'Elf',
   'The lone Sentinel staffing Briarwatch tower on the Veilwood''s northwest edge. She has not been relieved in five months.',
   'Isolating and fraying at the edges. She has begun talking to the trees.',
   'Five months without relief. She is exhibiting early signs of the isolation-driven dissociation that precedes Choir susceptibility. No one has come to check on her.',
   false, true),

  ('Dorn', 'dorn-wychwatch', (SELECT id FROM locations WHERE slug = 'wychwatch-tower'), 'Sentinel Tower Keeper', 'Human',
   'The experienced Sentinel staffing Wychwatch tower on the Veilwood''s eastern edge, watching the treeline near Wychfall.',
   'Competent and closed-off — he goes silent when asked about the deer patterns he has been observing. Something he has seen has made him stop volunteering information.',
   'He knows something specific about the deer behavior at the eastern treeline that he will not share. The silence is deliberate.',
   false, true),

  -- ── SAPPHIRE COAST ───────────────────────────────────────

  -- Breakwater
  ('Corra Dex', 'corra-dex', (SELECT id FROM locations WHERE slug = 'breakwater'), 'Harbormaster', 'Human',
   'The Duchy-employed harbormaster of Breakwater — technically the Duchy''s representative, practically the person who runs the town. A large, capable woman who has built a working arrangement with the local Tide Gang cell.',
   'Pragmatic and self-possessed. She has concluded that being useful to multiple parties is more stable than loyalty to one. Duchess Selene has reached the same conclusion about her.',
   'She knows her fishing boat the Hardbottom is making suspicious short night runs with good coin and little fish. She is not asking about it.',
   false, true),

  -- Teal Cove
  ('Drev Marsh', 'drev-marsh', (SELECT id FROM locations WHERE slug = 'teal-cove'), 'Harbormaster', 'Human',
   'The old harbormaster of the dying fishing village of Teal Cove. He tells visitors there is nothing interesting here.',
   'Guarded and deliberately uninformative. He has survived the village''s decline by making it as unremarkable as possible to outside attention.',
   'His village contains a cellar connected to a tunnel leading to a sea cave — a former Tide Gang operational base from twenty years ago that may not be as inactive as it appears. He calls it the "back way" and does not explain further.',
   false, true),

  -- Cinderport
  ('Keth', 'keth-cinderport', (SELECT id FROM locations WHERE slug = 'cinderport'), 'Unofficial Harbor Traffic Coordinator', 'Human',
   'A retired sailor who has been running Cinderport''s actual harbor traffic coordination unofficially for fifteen years, operating alongside and above the Duchy''s official appointment.',
   'Weathered and self-reliant — he has the easy authority of someone everyone defers to without formal title.',
   'He knows every ship moving through Cinderport''s harbor, including the ones that change flags on approach. A Darian military vessel recently left two plainclothes observers behind asking questions about north-coast traffic.',
   false, true),

  -- Porto Verde
  ('Marca Duve', 'marca-duve', (SELECT id FROM locations WHERE slug = 'porto-verde'), 'Vintner / Retired Black Rose Founder', 'Human',
   'The eldest of Porto Verde''s vintner families — one of the original founders of Duchess Selene''s Black Rose intelligence network, retired from active involvement twenty years ago.',
   'Comfortable, sharp-minded, and accustomed to being underestimated by people who see only a retired wine merchant. She misses nothing.',
   'She is the only person outside Dawnharbor who knows the location of Archive Copy 2 of the Black Rose''s records. She helped Selene design the network''s original communication protocols.',
   true, true),

  -- House Varneth
  ('Lord Edric Varneth', 'lord-edric-varneth', (SELECT id FROM locations WHERE slug = 'varneth-hall'), 'Noble Patriarch / Merchant Fleet Owner', 'Human',
   'Patriarch of House Varneth, operator of the largest private merchant fleet on the Sapphire Coast — forty-three ships. He backed Duchess Selene''s consolidation of the Duchy twenty years ago and has profited enormously since.',
   'Confident, calculating, and genuinely loyal to Selene — one of the rare people who backs a cause and then agrees with the outcome. He considers his Black Rose work an honor.',
   'His shipping ledgers contain records of transactions with counterparties who are, unknowingly, the Shadow Cabal''s commercial infrastructure. Selene knows. She has been waiting six years for the right moment to use it.',
   true, true),

  -- House Duvenne
  ('Merchant-Lady Sova Duvenne', 'sova-duvenne', (SELECT id FROM locations WHERE slug = 'duvenne-exchange'), 'Merchant House Head', 'Human',
   'Head of House Duvenne, controlling the Sapphire Coast''s spice and luxury goods trade. Commercially brilliant and ideologically flexible — she deals with whoever offers the best margin.',
   'Measured and precise in public settings. She does not signal what she is thinking. She correctly interprets Selene''s lack of intervention in her Darian negotiations as a warning.',
   'Through a shell arrangement, she holds shares in two vessels operating outside the Free Isles Compact''s authority — one of which moved cargo flagged in an IV Legion classified report. She burned a communique from Caldrath six weeks ago and has been more cautious since.',
   true, true),

  -- House Carreth
  ('Lord Bram Carreth', 'lord-bram-carreth', (SELECT id FROM locations WHERE slug = 'carreth-keep'), 'Noble / Tide Gang Patron', 'Human',
   'Head of House Carreth, old coastal nobility predating the Duchy. He runs his estate with minimum political involvement and maximum tolerance for the Tide Gang''s use of his outbuildings.',
   'Large, cheerful, and deliberately uncomplicated in presentation. The cheerfulness is real; what it conceals is also real.',
   'He has already calculated that his position would be better under Darian Imperial administration than under Selene. He has had exactly one conversation with a Darian attaché on this subject and ended it without commitment. He thinks about it regularly. He also knows his sister Lena is a Black Rose asset, though neither has acknowledged this.',
   true, true),

  ('Lena Carreth', 'lena-carreth', (SELECT id FROM locations WHERE slug = 'carreth-keep'), 'Black Rose Asset', 'Human',
   'Younger sister of Lord Bram Carreth. She is a fully operational Black Rose intelligence asset working under cover of her family connection.',
   'Careful and committed to the work. She believes her brother does not know what she is.',
   'Her brother knows. Neither of them has acknowledged it to the other. This creates a situation where both are performing ignorance for the other''s benefit — or for their own.',
   false, true),

  -- Pearlwater Consortium
  ('Ree Duvalt', 'ree-duvalt', (SELECT id FROM locations WHERE slug = 'pearlwater'), 'Consortium Senior Accountant', 'Human',
   'Senior accountant for the Pearlwater Consortium''s Dawnharbor counting house. Precise, professional, and unremarkable in every external particular.',
   'Outwardly meticulous and neutral. Inwardly making peace with a decision that will ruin her if it comes to light.',
   'She has been skimming from the Consortium''s ledgers for seven years — not for personal gain, but to fund a relief network for Lithorican refugees fleeing Imperial resettlement policies. She has made peace with being caught eventually.',
   false, true),

  -- House Talber
  ('Lady Maren Talber', 'lady-maren-talber', (SELECT id FROM locations WHERE slug = 'talber-point'), 'Noble / Lighthouse Commissioner', 'Human',
   'Head of House Talber, holder of the hereditary lighthouse commission for the northern Sapphire Coast — six lighthouses between Cinderport and the northern border.',
   'Administratively competent and proud of her family''s lighthouse tradition. She believes she is doing a friend a personal favor by sharing maritime observations with a Dawnharbor contact.',
   'She does not know she is part of the Black Rose intelligence network. She does not know her northernmost lighthouse keeper Vor has been running unauthorized night signals to ships — including one vessel not from the Free Isles Compact.',
   true, true),

  -- Salted Anchor (Tide Gang)
  ('Patch', 'patch-salted-anchor', (SELECT id FROM locations WHERE slug = 'salted-anchor'), 'Tide Gang Cell Leader', 'Human',
   'Owner of the Salted Anchor tavern and warehouse in Breakwater — the Tide Gang''s local cell leader for southern coastal operations. She manages debt collection, labor disputes, and supply runs.',
   'Direct and pragmatic, with the controlled authority of someone who has earned her position through competence. She is not easily surprised.',
   'She recently received an unexpected delivery — a crate addressed to her in Tide Gang cipher from a Caldrath sender she has never dealt with. It is in the cellar. She has not opened it.',
   false, true),

  -- Westerngate Blind
  ('Aldis Croft', 'aldis-croft', (SELECT id FROM locations WHERE slug = 'westerngate'), 'Tide Gang Accountant', 'Human',
   'The Tide Gang''s financial accountant in Westerngate, operating through legitimate-looking commercial entities. No criminal record, pays taxes on time, maintains books with meticulous accuracy.',
   'Precise and quietly miserable. He is genuinely uncomfortable with the work he does and has been looking for an exit for three years.',
   'He made a complete copy of the Tide Gang''s financial ledgers for the last five years eighteen months ago. He has not yet decided who is trustworthy enough to give it to.',
   false, true),

  -- Dark Lantern
  ('Kess Hallom', 'kess-hallom', (SELECT id FROM locations WHERE slug = 'dark-lantern'), 'Ship Chandler / Tide Gang Courier Hold', 'Human',
   'Proprietor of the Dark Lantern ship chandlery in Breakwater, known for quality goods and fair rates. The locked storeroom at the back is where the Tide Gang stores messages between courier runs.',
   'Straightforward and professional in manner. She has drawn a clear line for herself: she does not read the messages. She considers that sufficient moral distance.',
   'A message currently in her storeroom is written in a cipher the Tide Gang does not use. Someone placed it through legitimate channels but it arrived from outside the network. She noticed and is waiting to see if whoever sent it comes back.',
   false, true),

  -- Amberisle
  ('Rael', 'rael-amberisle', (SELECT id FROM locations WHERE slug = 'amberisle'), 'Lighthouse Keeper', 'Human',
   'The lighthouse keeper on Amberisle''s western headland, stationed here for at least eleven years. He keeps a meticulous log of unusual lights at sea.',
   'Patient and observant, with the quiet character of someone who has spent years watching the sea at night.',
   'His log documents movement below the ocean surface — not ships, but something luminous moving at depth. The entries have been growing more frequent. His log goes back eleven years.',
   false, true),

  -- Hermit''s Rock
  ('The Hermit of Teal Cove', 'hermit-teal-cove', (SELECT id FROM locations WHERE slug = 'hermits-rock'), 'Deserter / Former Arcane Vanguard Officer', 'Human',
   'A man who has lived alone on a sea stack two miles offshore from Teal Cove for at least fifteen years. He fishes from a tiny ledge, collects rainwater, and occasionally shouts at passing ships in an unrecognized language.',
   'Aggressively uninterested in company. Three attempts by Duchy officials to remove him ended with the officials retreating faster than dignity permitted.',
   'He is a former Arcane Vanguard officer who deserted with classified documents twelve years ago. He has been on the rock for exactly as long as the Vanguard''s eastern mapping surveys have been active. The Vanguard has not publicly acknowledged looking for him.',
   false, true),

  -- ── DREADSPIRE PEAKS ─────────────────────────────────────

  -- Vaengrath's Throat
  ('Gruldrak Half-Ear', 'gruldrak-half-ear', (SELECT id FROM locations WHERE slug = 'vaengraths-throat'), 'Pass Chieftain / Toll Collector', 'Frost Giant',
   'A lesser Frost Giant chieftain whose clan has held the gate of Vaengrath''s Throat for sixty years, collecting toll in silver from every traveler. His rates are posted on a wooden board nailed to the skull of the last merchant who argued.',
   'Businesslike and satisfied with his position — toll collection suits him. He charges in silver because silver is harder to debase.',
   'He has started accepting information as partial toll payment, building a picture of Aranthor''s military movements he has not shared with Varkhul. Whether he is gathering leverage or planning betrayal, even his own kin cannot tell.',
   true, true),

  -- Coldmantle Hall
  ('Ssolvara the Spear-Broken', 'ssolvara', (SELECT id FROM locations WHERE slug = 'coldmantle-hall'), 'Frost Giant Chieftain', 'Frost Giant',
   'Chieftain of the southern Peaks, recognizable by the cold-hammered iron wrapping her right stump — she lost the arm below the elbow thirty years ago in battle. She controls the territory adjacent to the Ashen Marches.',
   'Outwardly loyal to Varkhul, inwardly building an exit. She trusts warmth as little as she trusts Frostgale''s promises.',
   'She has sent messengers to Ashval twice in the last five years — the council responded to the second. She holds information about Varkhul''s plans that she has not shared with anyone, treating it as leverage for the right moment.',
   true, true),

  -- Rimecrag Hold
  ('Vharnek Stonehands', 'vharnek-stonehands', (SELECT id FROM locations WHERE slug = 'rimecrag-hold'), 'Frost Giant Chieftain', 'Frost Giant',
   'The most straightforwardly loyal of Varkhul''s chieftains, holding the central Peaks including Greyshaft. He keeps trophies of every battle on his approach path — mostly human weapons stripped of their owners.',
   'Direct and dangerous in the way that genuine loyalty makes people — he takes perceived slights to Varkhul''s authority as personal insults and responds without subtlety.',
   'Three months ago a dream-message told him Ssolvara is sabotaging his claim to Greyshaft. Ssolvara has done nothing of the kind. Vaul-Khesh is positioning two loyal chieftains to destroy each other.',
   true, true),

  -- Blisterstone Seat
  ('Olgrak the Waiting', 'olgrak-the-waiting', (SELECT id FROM locations WHERE slug = 'blisterstone-seat'), 'Frost Giant Chieftain', 'Frost Giant',
   'The oldest and most patient of Varkhul''s chieftains — he was the dominant warlord of the northern Peaks before Varkhul unified the clans, and has never privately accepted his defeat twenty years ago. He is waiting.',
   'Formally loyal, privately patient, and recently changed in a way that none of his warriors can explain. He has begun leaving small useful gifts for human travelers at crossroads with no explanation.',
   'He has received an approach from Kuldraan the Thin suggesting a formal alliance. If he accepts, Kuldraan''s protection arrangement with Highwatch becomes a liability for everyone involved.',
   true, true),

  -- Hailcrest Redoubt
  ('Drevka Icemane', 'drevka-icemane', (SELECT id FROM locations WHERE slug = 'hailcrest-redoubt'), 'Frost Giant Chieftain', 'Frost Giant',
   'Chieftain of the eastern Peaks, holding the territory above the Aranthor approaches. She understands politics the way Varkhul understands warfare — instinctively and with patience that looks like inaction.',
   'Strategic and composed. She has been watching the Aranthor succession crisis for twelve years and has already determined the correct moment to move east.',
   'She has a human spy in Aranthor — someone exchanging information for Giant protection of their family in the Peaks. The spy wants to leave her employ. Drevka has made clear this is not possible, and the spy''s family is already categorized as acceptable losses if the calculation changes.',
   true, true),

  -- Frostmere Lodge
  ('Bragnor Two-Voice', 'bragnor-two-voice', (SELECT id FROM locations WHERE slug = 'frostmere-lodge'), 'Frost Giant Chieftain', 'Frost Giant',
   'A formerly reliable Frost Giant chieftain whose behavior became erratic four years ago after spending three nights camped near Vaul-Khesh''s Scar during a blizzard. His warriors believe he has developed prophetic ability.',
   'Always moving toward confrontation, always interpreting ambiguity as threat. He now hears a second voice layered over the first when anyone speaks — the second voice tells him what the first voice actually means.',
   'The second voice has recently given him a specific task: find a human with a particular description, alive, and bring them to the Scar. The description is surprisingly specific, including a crescent scar on the left wrist.',
   true, true),

  -- Greycrest Outpost
  ('Svendra the Young', 'svendra-the-young', (SELECT id FROM locations WHERE slug = 'greycrest-outpost'), 'Frost Giant Chieftain', 'Frost Giant',
   'The youngest chieftain in Varkhul''s confederation, having inherited Greycrest three months ago when her father died of unclear causes. She is the most obvious target for manipulation and is handling that awareness with more composure than most expected.',
   'Observant and composure-driven — the more experienced chieftains revised their assessment of her upward after watching her navigate the first months.',
   'Her father did not die of natural causes and she knows it. She has narrowed her suspicion to three possible chieftains and is actively — if quietly — investigating. She is open to outside help from parties with the same interest.',
   true, true),

  -- Highwatch
  ('Kuldraan the Thin', 'kuldraan-the-thin', (SELECT id FROM locations WHERE slug = 'highwatch-peaks'), 'Rogue Frost Giant', 'Frost Giant',
   'A Frost Giant not affiliated with any of Varkhul''s recognized holdings, operating independently outside the tribute hierarchy. For eleven years he has protected Highwatch from Varkhul''s tax collectors in exchange for the settlement''s intelligence and sightlines.',
   'Genuinely uncertain — which is unusual for him. He has received an approach from Olgrak suggesting a formal alliance and is weighing it honestly.',
   'If he accepts Olgrak''s alliance, his arrangement with Highwatch becomes a liability. He has not told Highwatch about the approach. He is deciding based on what he actually believes is the right choice, which complicates the calculation.',
   true, true),

  -- Ashford-Below
  ('Maret', 'maret-ashford-below', (SELECT id FROM locations WHERE slug = 'ashford-below'), 'Ashford Archive Keeper', 'Human',
   'An elderly woman in Ashford-Below who has committed to memory the entire pre-conquest history of the Dreadspire Peaks — settlements, mines, roads, and more — and is now teaching it to her granddaughter.',
   'Careful and selective with trust. She has been maintaining this archive for decades in a village that survives by appearing compliant, and she knows the cost of trusting the wrong person.',
   'Her archive contains a detailed description of the "Deep Name-Stone" — a Stone-Speaker monument inscribed with what sound like the names of every entity bound in the First Binding. She memorized it from a chain of older accounts and does not fully understand what she has.',
   false, true),

  -- Deepvein Crossing
  ('The Tavern Keeper of Deepvein', 'tavern-keeper-deepvein', (SELECT id FROM locations WHERE slug = 'deepvein-crossing'), 'Tavern Keeper / Information Broker', 'Human',
   'The tavern keeper at Deepvein Crossing, the informal information hub of the Dreadspire Peaks. She knows things she does not explain knowing.',
   'Guarded and precise in conversation — she trades information but shows no cards she does not have to show.',
   'The last Giant census-taker asked about a specific former Stone-Speaker title, not a person. She recognized the words but did not show it. She is getting close to understanding why Varkhul is asking about House Drakor vocabulary, and the answer is beginning to frighten her.',
   false, true),

  -- Gemcut Warren
  ('Thordrak the Patient', 'thordrak-the-patient', (SELECT id FROM locations WHERE slug = 'gemcut-warren'), 'Frost Giant Overseer', 'Frost Giant',
   'The Giant overseer of Gemcut Warren''s forced labor camp. He does not shout. He does not strike. He explains, once, what will happen if productivity falls. Then he waits.',
   'His patience is the most frightening thing in the Warren. He has never had to follow through twice.',
   'The gemstones from the Warren exceed what could be used for jewelry or trade, and they go somewhere beyond Frostgale Keep. He knows where. He is not asked, and does not offer.',
   true, true),

  -- Field of Last Standards
  ('Aldrath Harmon''s Great-Granddaughter', 'harmon-great-granddaughter', (SELECT id FROM locations WHERE slug = 'coldrun'), 'Cartographer / Historian', 'Human',
   'Great-granddaughter of General Aldrath Harmon, who commanded the last free human army at the Field of Last Standards eighty years ago. She works as a cartographer in Coldrun.',
   'Methodical and quietly purposeful. Twenty years of mapping work have built toward a single thesis she believes could change the Peaks'' balance of power.',
   'She has spent twenty years mapping every ley-node in the Dreadspire Peaks, correlating them with historical Turning incidents. She believes she has identified a pattern that Harmon didn''t know — one that, if tested, could explain and potentially counter Vaul-Khesh''s influence on organized forces.',
   false, true),

  -- Stonemarrow
  ('The Scholar at Stonemarrow', 'scholar-stonemarrow', (SELECT id FROM locations WHERE slug = 'stonemarrow'), 'University Scholar / Possible Imperial Contact', 'Human',
   'A scholar from an Aranthor university who has identified Stonemarrow as a significant Stone-Speaker site and is requesting access to take rubbings of the inscriptions.',
   'Professionally courteous and technically focused. She presents her university affiliation clearly.',
   'She has recently been seen meeting with someone from the Darian Empire. The Stonemarrow residents want to know which relationship is real before they grant access. She may not know herself.',
   false, true)

ON CONFLICT (slug) DO NOTHING;


-- ============================================================
-- QUESTS
-- ============================================================

INSERT INTO quests (title, slug, region, quest_type, status, description, dm_notes, location_id)
VALUES

  -- ── VEILWOOD QUESTS ──────────────────────────────────────

  ('The Marked Stands', 'quest-marked-stands-briarhollow', 'Veilwood', 'town', 'available',
   'Briarhollow''s head woodsman Tallic Burne has been delaying the marking of a Choir-touched section of eastern treeline because it contains the settlement''s most productive timber stands. His crew has worked it for six weeks and two of them are showing signs of change. Players can investigate the infected stands, assess the crew, and force Burne''s hand before the situation worsens.',
   'The eastern stands are genuinely compromised — Arcana DC 13 confirms Choir adjacency. Two crew members (Wyla and Dant) are in early-stage influence: arriving late, leaving early, not meeting eyes. If players confront Burne, he confesses the delay. Resolution paths: mark and quarantine the section (loses Briarhollow''s primary income), cleanse the influence (requires a lead from Sylvara or the Sentinel Order), or extract the affected workers before they bring something back with them.',
   (SELECT id FROM locations WHERE slug = 'briarhollow')),

  ('Forty-Seven Sightings', 'quest-forty-seven-sightings-greywood', 'Veilwood', 'town', 'available',
   'Sentinel liaison Torren Ashvale at Greywood Post has a current Wanderer sighting map he will share with anyone willing to also share what they learn in the forest. He has not told anyone how bad the map has become: forty-seven confirmed sightings this month versus twelve this time last year.',
   'Torren is the party''s best early source of operational Wanderer data. He wants intelligence exchange, not charity. The map, once seen, makes the scale of the problem viscerally clear and can anchor the party''s understanding of how quickly the situation is escalating. If players return information, Torren becomes a reliable contact who will flag unusual sightings in real time.',
   (SELECT id FROM locations WHERE slug = 'greywood-post')),

  ('The Cathedral Is Beautiful', 'quest-brine-ashford-wychfall', 'Veilwood', 'town', 'available',
   'The changed trappers of Wychfall live at the settlement''s edge, returned from the forest but not quite returned to themselves. One of them, Brine Ashford, says the same sentence every night before sleep — a phrase about the Pale Cathedral — without apparent awareness. Players investigating the returned trappers can attempt to understand what was done to them and what Brine''s nightly phrase means.',
   'The phrase is a conditioned response — something the Choir planted that surfaces nightly. Insight DC 15 on Brine reveals she is not distressed by it, which is the disturbing part. Arcana or Wisdom checks during extended conversation with any returned trapper can surface fragmented impressions of Cathedral architecture. The DM hook leads toward the Pale Choir''s nature: it isn''t consuming these people, it''s sampling them and returning most of what it took, keeping something small. What it kept from Brine specifically can tie to a player backstory.',
   (SELECT id FROM locations WHERE slug = 'wychfall')),

  ('The Founding Name', 'quest-founding-name-pallside', 'Veilwood', 'town', 'available',
   'The isolated village of Pallside has no memory of the name of its founding ancestor. The name in every document has faded to illegible pale marks. The residents do not find this remarkable. Players with relevant skills will find it deeply remarkable and may investigate why a specific piece of history is being systematically erased.',
   'This is Choir influence targeting meaning rather than memory — the name hasn''t been forgotten, the significance has been drained. Arcana DC 15 reveals the fading is active, not degradation. History DC 14 identifies the pattern as consistent with Choir consumption of emotional anchoring. The founding ancestor''s name, if recovered (requires the Sentinel Order''s archive or a deep-forest source), reveals they were a Sentinel Order operative who helped establish one of the five anchor points nearby. Pallside was built there deliberately.',
   (SELECT id FROM locations WHERE slug = 'pallside')),

  ('The Missing Pages', 'quest-missing-pages-crestholm', 'Veilwood', 'town', 'available',
   'Crestholm''s temple chronicle contains a handwritten record going back four centuries. An entry from 180 years ago describes a previous period of forest strangeness that resolved after "the bright-singers were silenced" — but the three pages explaining how are torn out, and the tear is old. Players can investigate who removed the pages and what they described.',
   'The pages were removed during the previous Choir stirring by a priest who believed the information too dangerous to leave accessible. He hid them, not destroyed them — they are in a sealed cavity behind the altar''s foundation stone, wrapped in oilcloth. Finding them requires either a priest confidant or architectural investigation (Perception DC 16). The pages describe the bright-singers as the Choir''s first human converts, silenced by severing their connection to the anchor points. The method is partially applicable to the current crisis but requires components that no longer exist — or do they?',
   (SELECT id FROM locations WHERE slug = 'crestholm')),

  ('The Returning Log', 'quest-returning-log-thorngate', 'Veilwood', 'town', 'available',
   'Thorngate''s gatehouse log records every party entering the Veilwood and marks their return. Of twenty-three groups in the past year, eleven have returned. Twelve entries end with a dash and a waiting date. Players can investigate what happened to the missing parties, use the log to identify patterns, or find themselves looking at entries for groups whose members they later encounter.',
   'Investigation of the log reveals three patterns: groups that hired Correm Talle as guide returned at a higher rate than others; groups that entered via the northern route have a higher disappearance rate; and one group''s entry has been partially erased — Perception DC 13 reveals it was a Sentinel Order team. Correm knows what happened to that team and why he stopped taking clients. Getting it out of him is a character encounter.',
   (SELECT id FROM locations WHERE slug = 'thorngate-veilwood')),

  ('What the Remembrancers Forgot', 'quest-remembrancers-ironkeel', 'Veilwood', 'town', 'available',
   'Head Remembrancer Vayne Brock of Ironkeel has noticed two of her colleagues forgetting specific entries from the oral tradition — not randomly, but the entries describing the previous Choir stirring two centuries ago. She is seventy-eight years old and running out of time to determine whether the forgetting is natural age or something else.',
   'The forgetting is not natural. Arcana DC 14 on the Remembrancers confirms targeted erasure consistent with Choir influence. The entries being lost describe a specific technique used in the previous stirring that is not recorded anywhere else — the Remembrancers were the only repository. Vayne has partial versions of the lost entries in her own memory but is afraid to speak them aloud without knowing they''re safe. She needs the players to help her verify the technique''s content before the two affected Remembrancers lose the rest. Time pressure: Vayne believes she has two weeks before the entries are gone entirely.',
   (SELECT id FROM locations WHERE slug = 'ironkeel')),

  ('The Treeline Moved', 'quest-treeline-rootswatch', 'Veilwood', 'town', 'available',
   'Tower keeper Pell Whisker at Rootswatch has six ledgers of observations documenting the Veilwood treeline''s slow advance — including a section that moved twelve feet four days ago. He will show his current ledger to anyone who seems capable of understanding it. Players can investigate the advance, corroborate his measurements, and trace what is driving it.',
   'Pell''s measurements are accurate. The treeline advance is accelerating — his data shows a 340% increase in advance events in the past eighteen months. Investigation of the advance point (Arcana DC 12) reveals the root network beneath the soil is coordinated, not natural. Following the root network inward leads toward the nearest anchor point at the Stone Circle of Mael Duin. The advance is the Choir extending its physical footprint. Pell''s decision to stop measuring is a quiet breakdown — he needs someone to tell him his observations matter.',
   (SELECT id FROM locations WHERE slug = 'rootswatch')),

  ('The Sealed Message', 'quest-sealed-message-watchpost-thorn', 'Veilwood', 'regional', 'available',
   'Senior Sentinel Brael at Watchpost Thorn will ask the players, before anything else, to carry a sealed message to Commander Elyndra in Sylvara. He says it is routine. His face says it is not. The Seal-Instrument at Watchpost Thorn has been the basis for the Order''s escalating alerts for eighteen months and is now at critical readings.',
   'The message details the Seal-Instrument''s current readings and Brael''s assessment that the Choir''s influence radius has expanded 23% in sixty days. He has been sending versions of this message for months and getting formal acknowledgments. This one is different: he has included his personal assessment that the Order is being systematically understaffed, and his suspicion of why. Delivering the message opens the Sylvara command relationship. The players may also be asked to carry a verbal addendum Brael won''t put in writing.',
   (SELECT id FROM locations WHERE slug = 'watchpost-thorn')),

  ('The Disappearing Researcher', 'quest-vine-station-research', 'Veilwood', 'regional', 'available',
   'The Sentinel Order''s Vine Station research outpost is two months overdue for a rotation that never happened. The three researchers inside — an elven scholar, a human memory-wizard, and a dwarven ranger — have been unable to leave. The wizard is showing signs of Choir influence he doesn''t recognize in himself. Players arriving become the tiebreaker in a standoff between fascination and alarm.',
   'Corval is in early-stage Choir influence: his childhood memory list has lost seventeen entries in four months. He believes this is natural. Liseth is correct that it is not. Grundt wants everyone to leave immediately. Resolution: convincing Corval to leave requires either a DC 16 Persuasion (overcome his fascination) or demonstrating to him empirically that his memory is compromised in a way he cannot deny. If he is persuaded, he becomes a valuable scholar of Choir influence. If not, Liseth and Grundt face a decision about leaving without him. The research notes he has compiled are significant and should not be left in the station.',
   (SELECT id FROM locations WHERE slug = 'vine-station')),

  ('The Cathedral Is Finishing Something', 'quest-cathedral-approaches', 'Veilwood', 'regional', 'available',
   'Elven scouts report that the Pale Cathedral appears larger each time they observe it from the approach zone boundary — not growing, but always revealing more of itself. The Memory-Keepers say it is always finishing something it is building. Players who have accumulated enough Veilwood knowledge may be asked to observe the approach zone and attempt to determine what the Cathedral is constructing.',
   'This is a scouting and intelligence quest, not a Cathedral confrontation. Players enter the approach zone with protection (Wisdom saves DC 16 per half-hour without it) and observe from the boundary. Arcana DC 18 on the visible structure identifies new construction in the Cathedral''s western wing that matches no architectural record. History DC 15 identifies the construction pattern as consistent with a secondary anchor — the Choir is not just inhabiting the Cathedral, it is building a sixth binding point from inside. The sixth point maps to Sylvara. This discovery should feed directly into the campaign''s central conflict.',
   (SELECT id FROM locations WHERE slug = 'pale-cathedral-approaches')),

  -- ── SAPPHIRE COAST QUESTS ─────────────────────────────────

  ('The Salt Negotiation', 'quest-salt-negotiation-saltmoor', 'Sapphire Coast', 'town', 'available',
   'Someone higher in the Darian Imperial hierarchy than a trade attaché has become involved in negotiations for Saltmoor salt. Duchess Selene has told the Salt Guild to keep declining. Players can investigate who the new Darian party is, what they actually want, and why the Duchess is holding the line so firmly on a salt deal.',
   'The Darian interest in Saltmoor salt is not purely commercial — legionary supply is the stated purpose, but the actual interest is in salt as a preservation medium for something the Empire is moving north. Investigating the attaché''s local contacts (Investigation DC 14) surfaces a link to the Westerngate warehouse registered to the Aldren trading company. Selene''s opposition to the deal is partly strategic and partly because she knows what the crates contain and doesn''t want the Empire to have reliable access to this coast for that purpose.',
   (SELECT id FROM locations WHERE slug = 'saltmoor')),

  ('The Missing Divers', 'quest-missing-divers-pearlwater', 'Sapphire Coast', 'town', 'available',
   'Three pearl divers from Pearlwater have gone missing in eight months — all from the same family, all on calm days, none lost to sea. The Pearlwater Guild has sealed the information to protect their bed locations. A foreman brought a sealed report to the Consortium''s Dawnharbor office two months ago and was paid for his silence.',
   'The divers encountered something at depth near the Needles Current. The old deep wreck at 80 feet has recently yielded a fragment of an unknown container material — luminescent at depth, normal-looking at surface — and a Dawnharbor arcanist who saw it went pale. The three missing divers found this wreck on a deep breath-hold and did not come back up. Their bodies are on the bottom near the wreck, which is itself significant: something down there killed them in a way that left them on the bottom rather than floating. Investigation requires maritime resources and a contact willing to share what the foreman''s report actually said.',
   (SELECT id FROM locations WHERE slug = 'pearlwater')),

  ('The Scholar''s Notebook', 'quest-scholars-notebook-glasswind', 'Sapphire Coast', 'town', 'available',
   'The "scholar who washed ashore" two centuries ago and taught Glasswind its distinctive glass technique was not a scholar. The notebook still exists, held by the master glassblower''s family, and its designs extend well beyond glass manufacturing into what an arcanist would recognize as enchantment schematics. Players can investigate the notebook''s origins and what the designs describe.',
   'The notebook is in old Lithorican script and describes a technique for embedding enchantments into glass during the blowing process — specifically, glass that can record and replay light. The "scholar" was a Lithorican artificer fleeing the Empire''s purge of independent artificers two centuries ago. Three of the current Glasswind master''s windows contain active enchantments neither they nor their family knew about. What those windows have been recording is the question. The Black Rose has been trying to access this for years without knowing exactly what they''re looking for.',
   (SELECT id FROM locations WHERE slug = 'glasswind')),

  ('The Night Runs', 'quest-night-runs-breakwater', 'Sapphire Coast', 'town', 'available',
   'The fishing boat Hardbottom out of Breakwater has been making short night runs — out at dusk, back before dawn, little fish, good coin. Harbormaster Corra Dex knows and isn''t asking. Players can investigate what the Hardbottom is moving, for whom, and whether it connects to the unusual Darian military interest in north-coast traffic.',
   'The Hardbottom is moving sealed packages between Breakwater and the Needles — specifically, to a contact on the second of the Grey Sisters islets. The packages are coming from the Westerngate warehouse (Aldren trading company). The "good coin" is Darian Imperial coin, not local. Corra''s silence is purchased, not incurious — she knows enough to know she doesn''t want to know more. Confronting her with evidence shifts her from obstruction to reluctant cooperation; she will protect her harbor first.',
   (SELECT id FROM locations WHERE slug = 'breakwater')),

  ('The Back Way', 'quest-back-way-teal-cove', 'Sapphire Coast', 'town', 'available',
   'The dying village of Teal Cove has something the departing families left behind: a cellar connection to a sea cave the remaining residents call the "back way." It was a Tide Gang operational base fifteen years ago. It may not be currently empty.',
   'The back way is a tunnel from the harbormaster''s cellar to a sea cave accessible at low tide. It was used for contraband staging. Investigation reveals recent use: fresh marks on the cave walls, ash from a fire less than a month old, and a cached set of signal equipment. The cave is being used again — not by the Tide Gang, who abandoned this route when the fish left, but by someone who found it afterward. The signal equipment matches the pattern used by Vor at the Cape Dawnlight lighthouse. There is a connection between the unauthorized lighthouse signals and this cave that neither House Talber nor the Black Rose has identified.',
   (SELECT id FROM locations WHERE slug = 'teal-cove')),

  ('The Sealed Report', 'quest-copper-veil-monastery', 'Sapphire Coast', 'regional', 'available',
   'The Monastery of the Copper Veil on Copperveil Island went silent three months ago — no response to signals, the dock empty, the staircase blocked from above. Duchess Selene dispatched an investigator who returned with a sealed report she has not acted on publicly. Players may be hired to investigate or may discover the situation through other coast contacts.',
   'Selene''s investigator found the monks in a state of voluntary isolation — they sealed themselves in after one of their number decoded something in "the patterns beneath patterns" that they collectively agreed required quarantine from outside contact. The investigator''s sealed report contains their message to Selene, which she has not acted on because acting on it would require acknowledging what the monastery studies. The monks are alive and can communicate through the sealed staircase. What they decoded involves the Drowned Arch''s decorative patterns matching pre-Litorian script from the Sanctum of the Unwritten — and what that connection implies about what is beneath the Sapphire Coast.',
   (SELECT id FROM locations WHERE slug = 'copperveil-island')),

  ('The Lighthouse Ledger', 'quest-dark-lighthouse-amber', 'Sapphire Coast', 'regional', 'available',
   'The Dark Lighthouse on Amber Headland went dark ninety years ago when its keeper vanished. The keeper''s logbook was never found. A Black Rose archive entry from eleven years ago notes the logbook was located "in private hands — potentially significant" but the acquisition was never completed. Players can find and acquire the logbook.',
   'The logbook is held by a fishing family in Porto Verde whose great-grandmother found it floating in the water below the headland and kept it because it was a book and you kept books. They don''t know what it is. Investigation DC 12 in Porto Verde surfaces the family through old records. The logbook''s final entries describe lights below the surface of the water beneath the headland — specifically, what the keeper calls "the second lighthouse, inverted" — consistent with what Rael on Amberisle has been logging for eleven years. The keeper did not fall. He went in after the lights. The body was not recovered because he did not drown.',
   (SELECT id FROM locations WHERE slug = 'dark-lighthouse')),

  ('The Vor Problem', 'quest-vor-lighthouse-signals', 'Sapphire Coast', 'regional', 'available',
   'The lighthouse keeper Vor at House Talber''s northernmost station has been sending unauthorized night signals. One responding ship is from the Free Isles Compact. One is not. Selene''s Dawnharbor contact knows and has not yet decided whether to tell Selene or investigate first. Players can be drawn in from either side of this problem.',
   'Vor is signaling for two separate parties who do not know about each other. The Compact ship is routine smuggling — Vor takes a cut. The second ship is connected to the Darian Imperial survey effort that the deserter on Hermit''s Rock fled twelve years ago. Vor does not know who his second client actually is; he accepted payment through dead-drop and has been signaling blind. The Darian survey is mapping something specific on the north coast — the same "patterns beneath patterns" the Copperveil monks identified. Selene''s contact sits on this information because acting on it means admitting how long it went undetected. Players who surface the full picture can bring it to Selene for a significant relationship payoff.',
   (SELECT id FROM locations WHERE slug = 'cape-dawnlight')),

  -- ── DREADSPIRE PEAKS QUESTS ──────────────────────────────

  ('The False Waymarkers', 'quest-false-waymarkers-ironback', 'Dreadspire Peaks', 'regional', 'available',
   'Someone has been adding false waymarkers to Ironback Ridge''s smuggler route — subtly wrong at junctions that only become wrong six hours after you take them. Three smuggling parties have disappeared this season. Players investigating the route can attempt to identify who is placing the markers and why.',
   'The markers are being placed by a Sentinel Order operative attempting to keep the route clear for courier use by discouraging commercial smuggling traffic. The method is causing deaths and the operative knows it; they have decided the strategic value of a clear courier route outweighs the cost. Confronting them with this is a moral encounter. Alternatively: one of the disappeared smuggling parties was carrying something the operative specifically wanted intercepted, and it wasn''t on any of the three groups. It''s still on the ridge somewhere.',
   (SELECT id FROM locations WHERE slug = 'ironback-ridge')),

  ('The Broken Shaft', 'quest-broken-shaft-ironhame', 'Dreadspire Peaks', 'town', 'available',
   'Three shifts ago, Ironhame''s deep shaft broke into an older Stone-Speaker tunnel. The shift boss sealed it and reported north before anyone could read the inscription. A miner who caught a glimpse will talk for the price of a meal and a promise of discretion. Players can investigate what the inscription said and whether the tunnel connects to the broader Drakor network.',
   'The miner saw four words in Stone-Speaker script. Two he can describe by shape; one he knows means "gate" or "door"; the fourth he thinks was a name. Identifying the inscription requires a scholar with Stone-Speaker reading ability or access to Coldrun''s black-market library. The tunnel connects to a section of the Deepborn Gate network that leads toward a collapsed section — the Deadfall. What was stored in the tunnel before the collapse is what the dwarven scouting party from outside the Peaks is also looking for. The shift boss''s report to Frostgale has already arrived. A Giant overseer is on the way.',
   (SELECT id FROM locations WHERE slug = 'ironhame')),

  ('The Silver Sleds', 'quest-silver-sleds-silverlock', 'Dreadspire Peaks', 'regional', 'available',
   'A former Silverlock worker in Coldrun claims the covered silver sleds don''t go north to Frostgale Keep — they turn east, toward Wraithcol Pass. She tried to follow one once. Whatever was driving the sled noticed her well before she expected, and it wasn''t a Frost Giant. Players can investigate where the silver is actually going and what is moving it.',
   'The silver is going to Wraithcol Pass and through it into the Vaul-Khesh Scar — specifically, it is being used to construct a ritual structure inside the Scar that requires silver as a conductor for ley-channel work. The thing driving the sleds is a construct of Vaul-Khesh influence — not a creature, but a shaped intent that moves physical objects. Varkhul does not know this is happening; the silver is being diverted from his own tribute system by something acting on its own. Reaching the Scar construction site requires navigating Wraithcol''s betrayal-inducing influence. This quest connects to the campaign''s Vaul-Khesh thread.',
   (SELECT id FROM locations WHERE slug = 'silverlock')),

  ('The Counting Girl', 'quest-counting-girl-coalpit', 'Dreadspire Peaks', 'town', 'available',
   'In Coalpit Sorrow, a young woman has been writing names in coal dust on the inside of her bunk boards — the only act of sustained memory in a place designed to prevent it. She has run out of room twice and started over. Players who speak with her can learn what she is preserving and what she has begun to notice about the camp''s systematic erasure.',
   'The girl (Dara, 19) is documenting workers who disappear under circumstances that are recorded as "reassignment" in the Giant overseers'' manifests. She has noticed the reassignment rate spikes after workers show specific behaviors — asking questions about the Stone-Speaker tunnels, lingering near the old mine infrastructure. She doesn''t have the framework to understand why. Her count currently stands at thirty-one names over fourteen months. The Sentinel Order would want this information. So would the resistance network building in Gemcut Warren.',
   (SELECT id FROM locations WHERE slug = 'coalpit-sorrow')),

  ('The Warren''s Secret', 'quest-warren-secret-gemcut', 'Dreadspire Peaks', 'regional', 'available',
   'The workers of Gemcut Warren have developed a secret gestural sign language over two generations — a complete communication system that their Giant overseers do not recognize as language. Workers from the Warren can identify each other across the Peaks by three specific gestures. They are building something. Players who discover this network can attempt to learn what.',
   'The Warren''s workers are building an escape route — specifically, they have been mapping and slowly clearing the collapse at the Deepborn Gate''s secondary entrance for eleven years using tools concealed as mining equipment. They are eighteen months from having a navigable passage. What they need that they don''t have: knowledge of what is on the other side. The Deepborn Gate tunnels are abandoned dwarven construction, and the abandoned cities in the deep network are inhabited. The sign language gesture for "the other side" is the same as the one they use for "do not speak of this." They know and are going anyway.',
   (SELECT id FROM locations WHERE slug = 'gemcut-warren')),

  ('Ssolvara''s Price', 'quest-ssolvara-price-coldmantle', 'Dreadspire Peaks', 'regional', 'available',
   'Chieftain Ssolvara the Spear-Broken knows something about Varkhul''s plans that she has not shared with anyone — information is leverage, and she is building an exit strategy. She will share what she knows for the right price. Players making contact with the southern chieftain can attempt to negotiate for intelligence that could reshape the campaign''s balance of power.',
   'Ssolvara knows Varkhul has made contact with the Shadow Cabal — specifically, the Cabal has promised Frost Giant territory in Aranthor in exchange for Giant forces moving east during a specific window, creating a two-front crisis. Varkhul has not committed, but he is considering it seriously. Ssolvara wants two things: a credible path out of the Peaks for her clan if the mountains become untenable, and assurance that the humans who receive her intelligence are competent enough to use it. The second condition is what she''ll use the negotiation to assess.',
   (SELECT id FROM locations WHERE slug = 'coldmantle-hall')),

  ('Svendra''s Question', 'quest-svendras-question-greycrest', 'Dreadspire Peaks', 'regional', 'available',
   'Chieftain Svendra the Young knows her father did not die of natural causes and has narrowed her suspicion to three possible chieftains. She is open to outside help from parties who have reason to want the same answer. Players can become entangled in Frost Giant internal politics at their highest and most dangerous level.',
   'Svendra''s father was killed by a poisoned gift — a specific mineral salt that disrupts Giant biology, introduced into his food by a human intermediary who works for Drevka Icemane, who wanted Greycrest''s western territory removed from the tribute map to simplify her own eastern expansion plans. Svendra has almost reached Drevka through her investigation; what she lacks is the human contact''s identity. That contact is currently in Deepvein Crossing asking questions about transit routes east. Svendra will be a powerful ally to anyone who helps her reach the right answer. She will be a spectacular enemy to anyone who lies to her about it.',
   (SELECT id FROM locations WHERE slug = 'greycrest-outpost')),

  ('What Maret Remembers', 'quest-maret-archive-ashford', 'Dreadspire Peaks', 'regional', 'available',
   'The oral historian Maret of Ashford-Below has memorized the pre-conquest history of the Dreadspire Peaks across multiple generations — including a description of a "Deep Name-Stone," a Stone-Speaker monument she believes lists the names of every entity bound in the First Binding. She will share it if someone explains what it means.',
   'Maret''s account is third-hand but accurate — the Deep Name-Stone is a Stone-Speaker record-monument buried beneath Drakor''s Last Citadel, created as part of the First Binding process to document what was sealed and where. The Sentinel Order knows it exists in theory; no one has confirmed its location. If the Deep Name-Stone lists all bound entities, it also lists the binding conditions — which means it lists the conditions under which those entities could be released or strengthened. The information is critical and dangerous. Maret''s condition for sharing is simple: she wants to understand what she has been carrying.',
   (SELECT id FROM locations WHERE slug = 'ashford-below')),

  ('The Ledge''s Record', 'quest-ledge-concession-record', 'Dreadspire Peaks', 'regional', 'available',
   'The settlement called the Ledge keeps a record not of tribute paid, but of every concession they have extracted from their Giant overlords across four hundred years of occupation. They have built a map of what Frostgale Keep actually cares about, what it trades for, and where the pressure points are. No one has ever asked to see the record. It is available.',
   'The record is a tactical intelligence document of extraordinary value — four centuries of behavioral data on Giant political and economic priorities. Key findings: Varkhul''s absolute red lines (disruption of the Silverlock silver supply, interference with anything moving toward Wraithcol Pass); negotiable areas (labor assignment, settlement boundaries, tribute timing); and three instances in the past century where organized human action extracted meaningful concessions by targeting a specific Giant pressure point. The record also documents, without understanding its significance, a pattern of Giant overseer behavior changes that correlate precisely with the Vaul-Khesh ley-node map Harmon''s great-granddaughter is building.',
   (SELECT id FROM locations WHERE slug = 'the-ledge')),

  ('The Geomancer''s Theory', 'quest-obsidian-shield-greyshaft', 'Dreadspire Peaks', 'regional', 'available',
   'A geomancer passing through Greyshaft noticed that the obsidian deposits create a Vaul-Khesh dead-zone — the lowest rate of Turning incidents in the entire Peaks. She believes the volcanic composition disrupts ley-channels and that Greyshaft obsidian could be used to construct shielding for people, buildings, or ritual spaces. She needs funding to test the theory.',
   'The theory is correct — the obsidian''s silicate structure absorbs ley-channel resonance rather than amplifying it. Testing requires controlled exposure: a structure built with obsidian composite mortar (the Stone-Speaker method, documented in Drakor''s Citadel records) tested against a Turning-prone site. Full validation requires access to both Greyshaft''s quarry and the Citadel records, both of which are contested territory. If validated, obsidian shielding becomes a tactical asset worth fighting over — both Varkhul and the Sentinel Order will want to control it, and they will have exactly opposite intentions for its use.',
   (SELECT id FROM locations WHERE slug = 'greyshaft'))

ON CONFLICT (slug) DO NOTHING;


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
