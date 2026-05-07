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
   NULL,
   'Maerath Tender', 'Human',
   'Senior tender of the Healing Springs of Maer''s Rest, 60 years old, has been at the site for 25 years. Has noticed the water''s healing properties subtly changing over the past six months.',
   'Calm, observant, spiritually attuned without being dramatic about it. Has been trying to get a message to the Sentinel Order for four months.',
   'Believes the spring''s change began when the Shadow Lord seals started weakening — that the springs draw on something deeper in the earth that is now disturbed. This is a significant piece of intelligence about the campaign''s larger threat.',
   false, true),

  ('Senn', 'senn-maers-rest',
   NULL,
   'Maerath Apprentice', 'Human',
   'Apprentice tender at the Healing Springs of Maer''s Rest, 22. Works alongside Sister Aveth and assists with healing and site maintenance.',
   'Young, earnest, learning. Absorbs Sister Aveth''s calm but hasn''t yet matched her depth of perception.',
   NULL,
   false, true),

  -- Aurelion Monastery of the Seven Lanterns
  ('Caelan Morn', 'caelan-morn',
   NULL,
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
   NULL,
   'Head of House Calen', 'Human',
   'Head of the oldest patrician house in the Empire, in her seventies. Has held a Senate advisory seat for generations and has been making the case for annexing Aranthor for fifty years with the patience of someone who expects to eventually win.',
   'Relentless, politically formidable, absolutely certain of her position. Age has not made her patient — it has made her more precise.',
   'Her eldest son Casren was killed in a skirmish with Aranthorian cavalry twenty years ago. The official account calls it heroic; he was actually tortured for intelligence. What he told his captors — and who those captors reported to — is unknown. She covered it up to avoid appearing weak.',
   true, true),

  -- House Mireth
  ('Verus Mireth', 'verus-mireth',
   NULL,
   'Praetor-Emeritus / House Head', 'Human',
   'Former Governor of Caldra Prima, now head of House Mireth, which controls the largest private grain stores in the Empire. Has the Emperor''s private ear and makes the anti-annexation argument in purely economic terms.',
   'Financially meticulous, pragmatically persuasive, patient. Knows the Emperor doesn''t respond to moral arguments and never tries to use them.',
   'Has been purchasing land in the Sapphire Coast duchy through shell merchants for three years. If Aranthor is annexed and fails to produce returns, he intends to have assets outside imperial jurisdiction. He has not told the Emperor. He also received a letter from Duchess Selene six months ago that he has read four times and not replied to.',
   true, true),

  -- House Talveth
  ('Mira Talveth', 'mira-talveth',
   NULL,
   'Head of House Talveth', 'Human',
   'Head of the house that administers census contracts for Caldra Prima. Has turned the civil service appointment into a private toll operation, charging "expedited service" fees at scales that corrupt the process.',
   'Administratively brilliant, entirely untroubled by her corruption, accustomed to operating without oversight.',
   'The Blackguard knows about the corruption broadly and has done nothing — Inquisitor Thane accepted a gift from her seven years ago. She recently discovered someone accessing census records through official channels with no authorization trail and has launched her own internal investigation, which is accidentally intersecting the Blackguard''s unrelated investigation.',
   true, true),

  -- House Aurantis
  ('Dral Aurantis', 'dral-aurantis',
   NULL,
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
   NULL,
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
   NULL),

  ('The Fourth Document at Seven Lanterns', 'fourth-document-seven-lanterns',
   'Aranthor', 'regional', 'available',
   'Brother Caelan Morn, Prior of the Aurelion Monastery, has given Elowen''s supporters access to three historical documents. He is withholding a fourth that he considers too dangerous to share until he is certain who will use it and how. He has been making this determination for three years.',
   'The fourth document describes a secondary activation method for the Crown''s sealing power that doesn''t require the complete Crown — a contingency written into the original Covenant for exactly the kind of crisis now unfolding. Morn won''t release it to just anyone; he needs to be convinced the party has a trustworthy connection to the people who would use it responsibly. He will test the party with a smaller task: verify that the three documents already given to Elowen''s agents actually reached her, and report what she intends to do with them. If they pass, he shares the fourth. The information in it changes the campaign''s endgame.',
   NULL),

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
   NULL)

ON CONFLICT (slug) DO NOTHING;
