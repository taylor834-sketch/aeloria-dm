-- Aeloria: All 280+ locations across 7 regions
-- Run AFTER schema.sql
-- Safe to re-run (ON CONFLICT DO NOTHING)

-- Batch 1: Aranthor + Darian Empire locations
-- Generated from gazetteer-aranthor.md and gazetteer-darian-empire.md
-- CR 847 / Campaign: Aeloria

INSERT INTO locations (name, slug, region, location_type, population, description, dm_notes, map_x, map_y, is_major)
VALUES

  -- ============================================================
  -- ARANTHOR: GEOGRAPHIC FEATURES
  -- ============================================================

  ('The River Aelwynn', 'the-river-aelwynn', 'Aranthor', 'geographic', NULL,
   'The oldest named river in Aranthor, running 140 miles from the central highlands west to Ashcroft Bay. Broad and slow in its lower reaches, quick and rocky upstream; the primary artery for grain-barge traffic in the region.',
   'Three tolled crossings exist on the Aelwynn; one Crown toll at Warden''s Ford is uncollected for 8 months "” the royal reeve holds 1,200gp with no one to remit it to.',
   0, 0, false),

  ('The Greywood', 'the-greywood', 'Aranthor', 'geographic', NULL,
   'Dense hardwood forest covering the northern third of Aranthor, roughly 60 by 40 miles. Ancient oak, ash, and yew; the canopy in high summer blocks noon light entirely. Blackwell controls two logging operations on its southern edge.',
   'Hunters have been finding deer carcasses "” not hunted, but drained intact. Something new is in the Greywood''s northern section. The Sentinel outpost Deepwatch on the eastern edge has been dark for six months.',
   0, 0, false),

  ('The Thornmere', 'the-thornmere', 'Aranthor', 'geographic', NULL,
   'Extensive marsh district in southeastern Aranthor, 40 miles wide along the lower River Cael. A maze of reed beds, black-water channels, and thorn-willow thickets; navigable only with local Merefolk guides.',
   'A Shadow Cabal cell has operated here for two years; three Merefolk villages have gone quiet. The remaining villages know something is wrong but cannot find out what.',
   0, 0, false),

  ('Ashcroft Bay', 'ashcroft-bay', 'Aranthor', 'geographic', NULL,
   'Wide crescent bay on western Aranthor, 18 miles across, sheltered by the Ashcroft Headland. Excellent anchorage; five fishing villages rim the bay below Lighthaven, governed by the ancient Ashcroft Mariners guild.',
   'Something large moved through the bay''s deepest point three months ago, leaving a 200-foot channel in the bay floor. The Mariners know and have posted extra lookouts.',
   0, 0, false),

  ('The Highfeld Plain', 'the-highfeld-plain', 'Aranthor', 'geographic', NULL,
   'Broad agricultural plateau between the River Aelwynn and the Greywood; the richest farmland in Aeloria, worked for over 400 years. Villages every 3-4 miles, manor houses, and windmills characterize the landscape.',
   'Blackwell''s grain requisitions hit the Highfeld hardest; smaller villages have lost significant winter stores. The village of Harwick has openly stopped paying the levies.',
   0, 0, false),

  ('Warden''s Hill', 'wardens-hill', 'Aranthor', 'geographic', NULL,
   'Prominent isolated hill 15 miles north of Dunmore, 310 feet above the surrounding farmland. A Founding-era signal tower stands on the summit, currently unmaintained but structurally sound.',
   'Someone is using the summit signal tower at night with a hooded lantern sending a coded message northward toward the Greywood "” the code has not been broken.',
   0, 0, false),

  ('Salt Flats of Kettermere', 'salt-flats-of-kettermere', 'Aranthor', 'geographic', NULL,
   'Coastal salt marsh 8 miles south of Lighthaven, 3 miles wide and 6 miles long. Salt-works have operated here since before the Founding, producing roughly 40 tons of bay salt per year under the Crane family.',
   'The lead saltworker Emm Crane has been approached multiple times by a Shadow Cabal agent offering far above market value for the flats; she has refused, and the agent has stopped coming back "” which worries her more.',
   0, 0, false),

  ('Frostback Ridge', 'frostback-ridge', 'Aranthor', 'geographic', NULL,
   'Low limestone ridge marking Aranthor''s northeastern boundary, 30 miles long at 600-900 feet elevation. Only three wagon-suitable passes exist; the eastern lords fortified them during the last Succession Crisis.',
   'A dwarven survey party entered the Frostback cave system four months ago seeking Stone-Speaker workings. They have not come out, and the company that hired them has quietly stopped asking questions.',
   0, 0, false),

  ('The Barrow Down', 'the-barrow-down', 'Aranthor', 'geographic', NULL,
   'Low moorland ridge west of the King''s Road, 30 miles north of Dunmore, scattered with roughly forty pre-Founding burial mounds of unknown origin. The largest, called the King-Grave, stands nearly 40 feet tall.',
   'A Vaelthorn scholar has been camping near the King-Grave for three weeks doing legitimate historical work "” but his presence has reactivated something dormant inside the mound for a very long time.',
   0, 0, false),

  -- ============================================================
  -- ARANTHOR: VILLAGES AND HAMLETS
  -- ============================================================

  ('Ashford', 'ashford', 'Aranthor', 'village', 280,
   'A crossing village on the River Aelwynn, 12 miles east of Lighthaven, grown around the best ford on the river. Hosts three inns, a smithy, and a tannery; the ford has historically been toll-free by village council vote.',
   'A young woman was arrested by Blackwell''s six-man garrison for carrying "seditious materials" and sits in the local gaol; the town watch wants her out but lacks political cover to act.',
   0, 0, false),

  ('Kettlepost', 'kettlepost', 'Aranthor', 'hamlet', 90,
   'Crossroads hamlet 6 miles east of the King''s Road and 10 miles north of Dunmore, named for the Founding-era bronze relay post at its center. Serves as the most reliable information distribution point in northern Aranthor.',
   'Last week someone posted a notice at the crossroads listing three Blackwell supply routes with patrol schedules. It was taken down by morning, but two Crown Loyalist contacts and one Blackwell informant all read it.',
   0, 0, false),

  ('Greenvale', 'greenvale', 'Aranthor', 'village', 340,
   'The last proper village before the Greywood''s treeline, 18 miles north of Dunmore. The economy is logging, milling, and supplying the camps; half the workers are employed by Blackwell''s concession, half by independent operator Coll Sarne.',
   'Three Blackwell loggers vanished in the Greywood''s northern section two weeks ago; General Thane doubled escort patrols but has sent no search party.',
   0, 0, false),

  ('Harwick', 'harwick', 'Aranthor', 'village', 215,
   'A grain village on the Highfeld Plain that has openly refused Blackwell''s requisitions. Headman Bram Ashely, a former royal cavalry sergeant, sent back the last requisition party with a written refusal and has organized a watch rota.',
   'Two neighboring villages are watching Harwick''s defiance and will follow if Harwick holds "” or submit if Harwick is punished without resistance.',
   0, 0, false),

  ('Millbrook', 'millbrook', 'Aranthor', 'village', 170,
   'An undermill village on an Aelwynn tributary 8 miles south of Ashford, where a limestone shelf runs three mills simultaneously. Two miller families, the Oskes and the Corns, have feuded bitterly over mill rights for 40 years.',
   'The limestone shelf has developed a crack; the jointly-hired engineer Vorel Dass is secretly a Crown Loyalist intermediary using engineering work as cover.',
   0, 0, false),

  ('Fernholt', 'fernholt', 'Aranthor', 'village', 130,
   'A raised-island settlement in the Thornmere''s western margin, 30 miles east of Vaelthorn. The Merefolk community makes its living from eel fishing, willow-basket weaving, and guiding travelers through the western Thornmere.',
   'The Thornkeeper returned from investigating dead fish in the central channels and will not describe what she saw; she has been sending her grandchildren west to Vaelthorn one by one.',
   0, 0, false),

  ('Cresthollow', 'cresthollow', 'Aranthor', 'village', 200,
   'A village at the foot of the Frostback''s southernmost slope, 22 miles northeast of Vaelthorn, built around a reliable spring and sustained by limestone quarrying above the village. The council sells stone to any faction with coin.',
   'The quarry''s upper face broke into a natural cave; the sealed-off interior shows worked stone columns and flooring of unknown origin "” the hired engineer is trying to decide who to trust with the discovery.',
   0, 0, false),

  ('Dunwater', 'dunwater', 'Aranthor', 'hamlet', 110,
   'A small river settlement on the east bank of the River Cael, 15 miles east of Vaelthorn, that services the flat-bottomed barges of the lower Cael trade. Most eastern barges turn around here rather than enter the Thornmere.',
   'An off-schedule barge arrived three weeks ago with only two crew, unloaded sealed unmarked crates, and the captain left on horseback the same day. The crates remain unclaimed in the barge-yard storage shed.',
   0, 0, false),

  ('Thornfield', 'thornfield', 'Aranthor', 'village', 180,
   'The supply village for Thornwick, 5 miles to the west, providing grain, livestock, and cloth to the larger hub. The village headman was the first to notice Thornwick''s bell had gone silent.',
   'A spice merchant in the village that day was a Shadow Cabal courier; he has already passed news of Thornwick''s silence up the chain to Blackwell''s intelligence section.',
   0, 0, false),

  ('Cobbsgate', 'cobbsgate', 'Aranthor', 'village', 160,
   'A fishing village on the southern shore of Ashcroft Bay, 8 miles south of Lighthaven, renowned across Aranthor for its premium smoked mackerel and herring. The village deliberately cultivates political invisibility.',
   'A Blackwell revenue officer arrived to assess fishing output for taxation, slipped off the harbor pier on day two, and has been bedridden with fever since. The pier is perfectly safe and the timing was very convenient.',
   0, 0, false),

  ('Saltmire', 'saltmire', 'Aranthor', 'hamlet', 85,
   'A declining hamlet of fisherfolk and wildfowlers 14 miles south of Lighthaven, working the southern salt marsh. Low buildings against coastal wind; the younger generation has been leaving for generations.',
   'Resident Maevan Shore has reported seeing lights in the bay''s deep water three times in two months; the harbormaster disbelieved her, but two of his own boats have since returned with unexplained parallel scoring along their keels.',
   0, 0, false),

  ('Ravenscar', 'ravenscar', 'Aranthor', 'village', 240,
   'A village on the high cliffs 10 miles north of Lighthaven, notable for its community-maintained lighthouse and the legally ambiguous "Wreck Market" that forms whenever a ship grounds on the offshore rocks.',
   'The most recent wreck carried no cargo but had four heavy iron rings bolted below the waterline from the outside, as if something had been chained in the hold "” the chains were cut, not broken.',
   0, 0, false),

  ('Dunbar''s Ferry', 'dunbars-ferry', 'Aranthor', 'hamlet', 50,
   'A hamlet of twelve buildings around a flat-bottomed ferry crossing on the River Aelwynn, 6 miles upstream from Ashford. Operated by Lord Dunbar under a 200-year-old Crown charter; the ferry runs dawn to dusk.',
   'Lord Dunbar has declined supply-movement requests from all three succession claimants, citing equal rights of passage under his charter. He is now under simultaneous surveillance from all three factions.',
   0, 0, false),

  ('Briarvale', 'briarvale', 'Aranthor', 'village', 300,
   'The wealthiest village in the central Highfeld, 8 miles south of Dunmore, prosperous from its renowned Briarvale black cattle breed. Features a stone church, covered market building, and two inns.',
   'Blackwell''s requisitions have taken 20% of the cattle herd. One of the three cattleherding families, the Vanes, has been secretly negotiating to shelter cattle elsewhere "” and has attracted a Blackwell informant.',
   0, 0, false),

  ('Wickenford', 'wickenford', 'Aranthor', 'village', 145,
   'A ford village on the River Cael, 20 miles east of Crownbridge, that serves as the eastern market for Thornmere trade. Merefolk bring eels, fish, hides, and willow goods to the weekly Sevenday market.',
   'The Merefolk have not come to market for two weeks without explanation; the village trader who buys directly from them is growing concerned.',
   0, 0, false),

  ('Ashgate', 'ashgate', 'Aranthor', 'village', 95,
   'The western approach village to Ashgate Pass through the Frostback Ridge, 35 miles northeast of Vaelthorn. Exists to service pass traffic with a smithy specializing in wagon-wheel repair and an overnight inn.',
   'The pass has been blocked for eight days by a dangerous east-face collapse shored up with timber; House Aldenn''s engineers say two months of masonry work is needed but no one will fund it, and the timber is deteriorating.',
   0, 0, false),

  -- ============================================================
  -- ARANTHOR: NOBLE HOUSE SEATS
  -- ============================================================

  ('Crennford Keep', 'crennford-keep', 'Aranthor', 'noble_seat', 420,
   'The seat of House Crenn on the River Aelwynn, 20 miles east of Lighthaven. An 80-year-old river-stone keep with curtain wall overlooking the village of Crennford; comfortable and functional rather than impressive.',
   'Lady Isobel Crenn received a letter allegedly from her son in Vaelthorn that she believes is not in his handwriting; she needs someone to verify he is free and healthy without triggering political suspicion.',
   0, 0, true),

  ('Aldennmere Castle', 'aldennmere-castle', 'Aranthor', 'noble_seat', NULL,
   'The seat of House Aldenn, 300 feet up the eastern Frostback face with commanding views of the passes and eastern plains. A genuinely defensible fortification with three approach chokepoints and functioning catapult emplacements.',
   'Lord Cavan Aldenn just discovered his son Merric has been conducting unauthorized negotiations with Elowen''s representatives. The family argument is loud enough to be heard through two sets of walls by the garrison.',
   0, 0, true),

  ('Vael Tower', 'vael-tower', 'Aranthor', 'noble_seat', NULL,
   'The seat of House Vael, 6 miles south of the Greywood and 14 miles east of Greenvale. A single 60-foot round tower with attached hall and overgrown earthworks; more impressive from a distance than up close.',
   'Lord Petyr Vael received a marriage offer for his eldest daughter from a Blackwell intermediary that would functionally realign House Vael''s allegiance; his daughter Sara has strong opinions about being used as a political token.',
   0, 0, true),

  ('Morwen Hall', 'morwen-hall', 'Aranthor', 'noble_seat', NULL,
   'The seat of House Morwen at a key River Aelwynn ford crossing, 12 miles upstream from Ashford. A large, well-appointed stone manor with no walls, relying on the river for natural defense; the wealthiest of the lesser lords.',
   'A Shadow Cabal agent is assembling documentation proving Lord Aldric Morwen has been making payments to all three succession claimants simultaneously, waiting for the right moment to present it to Caedric.',
   0, 0, true),

  ('Ashmore Castle', 'ashmore-castle', 'Aranthor', 'noble_seat', NULL,
   'The seat of House Ashmore in southeastern Aranthor, 15 miles north of the Thornmere. A 200-year-old castle with curtain wall, moat fed by the River Cael, two towers, and a proper gatehouse capable of a six-week siege.',
   'Lady Margret Ashmore knows Elowen''s location from briefly sheltering her at the castle; she has left a specific door in the east wing unlocked that leads to the room where Elowen scratched her name in the stone.',
   0, 0, true),

  ('Dunbar''s Keep', 'dunbars-keep', 'Aranthor', 'noble_seat', NULL,
   'The seat of House Dunbar on the south bank of the River Aelwynn, 4 miles from Dunbar''s Ferry. A modest agricultural estate and fishery held by Lord Ronn Dunbar, who has spent twelve years trying to avoid the succession war.',
   'Lord Ronn has carried a sealed letter from his Sentinel-Order son for three months with instructions not to open it "unless something happens to me" "” and he is increasingly tempted.',
   0, 0, true),

  ('Caerlhaven', 'caerlhaven', 'Aranthor', 'noble_seat', NULL,
   'The seat of House Caerl on the northern end of Ashcroft Bay, 5 miles north of Lighthaven. A fortified coastal manor with signal platform and good sight lines over the bay; Lord Emeric commands a fleet of six vessels.',
   'One of Emeric''s chartered vessels returned from a Blackwell supply run with a crewman now withdrawn and staring at water after something he saw during a night passage near the bay''s deep water.',
   0, 0, true),

  ('Kessrel Towers', 'kessrel-towers', 'Aranthor', 'noble_seat', NULL,
   'The seat of House Kessrel, 10 miles southwest of Vaelthorn "” two towers of different characters joined by a great hall, architecturally peculiar and politically the most exposed noble seat in Aranthor.',
   'The Kessrel town house in Vaelthorn contains a locked room unused for twelve years, where Elowen''s dress from the night of the Night of Broken Glass still hangs; Lord Tannis has maintained secret correspondence with her agents for four years.',
   0, 0, true),

  -- ============================================================
  -- ARANTHOR: RELIGIOUS SITES
  -- ============================================================

  ('Wayshrine of the Open Hand', 'wayshrine-of-the-open-hand', 'Aranthor', 'religious', NULL,
   'The oldest continuously maintained shrine in Aranthor, on the King''s Road 5 miles south of Dunmore. A carved stone figure of Aurelion as Waykeeper in a roofed stone niche; the resident shrine-keeper offers free healing and emergency supplies.',
   'The shrine-keeper has received reports that the signal-fire link to the Crossroads Flame 15 miles south has gone dark "” if true, something is wrong at that shrine.',
   0, 0, false),

  ('The Crossroads Flame', 'the-crossroads-flame', 'Aranthor', 'religious', NULL,
   'An Aurelion shrine complex on the King''s Road 20 miles south of Dunmore, at its junction with the old Covenant Road. Features a permanent bronze oil-flame lantern, carved dedication stone, and traveler benches "” currently the flame is out and the shrine is defaced.',
   'The traveling priest Hadric is locked in a grain cellar 3 miles east of the Crossroads, imprisoned for 6 days by Cabal operatives who defaced the shrine and needed no witnesses; he is running out of water.',
   0, 0, false),

  ('Healing Springs of Maer''s Rest', 'healing-springs-of-maers-rest', 'Aranthor', 'religious', NULL,
   'A Maerath shrine and natural healing site in a wooded valley 8 miles east of Dunmore. A cold limestone spring feeds a 20-foot pool with genuine mild healing properties; maintained by two Maerath tenders and respected by all factions.',
   'Sister Aveth has noticed the water''s healing properties subtly changing for six months "” she believes it is tied to weakening Shadow Lord seals and has been trying to reach the Sentinel Order for four months.',
   0, 0, true),

  ('Aurelion Monastery of the Seven Lanterns', 'aurelion-monastery-of-the-seven-lanterns', 'Aranthor', 'religious', NULL,
   'A working Aurelion monastery 12 miles north of Vaelthorn on a wooded hill, housing twelve monks with a library containing unique copies of Founding-era documents and material no longer available in Vaelthorn''s archives.',
   'Prior Brother Caelan Morn holds a complete copy of the original Crown Covenant including removed clauses describing a secondary activation method for the sealing power that does not require the complete Crown "” he has withheld it for three years.',
   0, 0, true),

  ('Standing Flame of Highfeld', 'standing-flame-of-highfeld', 'Aranthor', 'religious', NULL,
   'An Aurelion hilltop shrine 5 miles north of Briarvale "” a single 12-foot stone pillar with bronze oil lamp bracket, visible for 8 miles. Maintained by the Briarvale parish for 90 years as a permanent harvest-thanks offering.',
   'The flame has been going out with increasing frequency; a local farmer has relit it eleven times in the past month and is frightened. The cause is Shadow Lord resonance affecting the oil''s burn rate.',
   0, 0, false),

  ('Thornmere Wayside', 'thornmere-wayside', 'Aranthor', 'religious', NULL,
   'A Maerath shrine marker at the western Thornmere edge, 2 miles south of Fernholt "” a carved yew post with Maerath''s cycle symbol where travelers entering the marsh have left offerings for generations.',
   'Someone has been leaving small animal skulls in Shadow Cabal marking patterns at the shrine; the Thornkeeper has removed them twice and they keep returning.',
   0, 0, false),

  -- ============================================================
  -- ARANTHOR: RUINS
  -- ============================================================

  ('Ashtower Keep', 'ashtower-keep', 'Aranthor', 'ruin', NULL,
   'A ruined Valemont garrison keep on the Highfeld Plain, 8 miles northwest of Dunmore. The outer curtain wall stands 10-14 feet but the tower collapsed inward; local farmers use the walled yard as a seasonal sheep pen.',
   'The rubble conceals a sealed basement vault holding garrison records from CR 620-780, including patrol logs proving the Greywood has been slowly expanding southward for 200 years.',
   0, 0, false),

  ('Burned Village of Calwick', 'burned-village-of-calwick', 'Aranthor', 'ruin', NULL,
   'The ruins of a village of roughly 300 on the Highfeld Plain, 4 miles east of Thornfield, burned in the first Valemont Succession Crisis. Foundation outlines remain visible, with one standing smithy chimney and an untended but productive pear orchard.',
   'Something has been living in Calwick''s ruins for several years "” it eats the pears, comes and goes, and has never been identified; the well cover was placed from the inside.',
   0, 0, false),

  ('The Drowned Fort', 'the-drowned-fort', 'Aranthor', 'ruin', NULL,
   'A pre-Founding ford-fort of unknown construction style submerged 8-12 feet under the River Aelwynn, 3 miles downstream from Ashford. The tops of two wall sections break the surface on low-water days in late summer.',
   'Three weeks ago a fisherman''s net came up tangled in a sealed Founding-era iron box with its seal still intact; he has been sitting on it in Ashford for three weeks, afraid to open it or report it.',
   0, 0, false),

  ('Greywood Barrow-Circle', 'greywood-barrow-circle', 'Aranthor', 'ruin', NULL,
   'A pre-Founding ritual site inside the Greywood, 6 miles from the southern treeline "” eight unworked stone uprights in a 40-foot circle around a flat central stone with cup-mark carvings. A natural clearing maintains the circle''s sky sightlines.',
   'The cup-marks filled with water reflect stars not in the actual sky; a Sentinel scholar twenty years ago noted the star pattern matches the Order''s archive chart labeled "Shadow Below Approach Configuration."',
   0, 0, false),

  ('Warden''s Folly', 'wardens-folly', 'Aranthor', 'ruin', NULL,
   'The incomplete lower two floors of a round watchtower on the Barrow Down, walls intact to 20 feet with no roof. Built 180 years ago and abandoned when the commissioning lord died; used by travelers as emergency shelter.',
   'The tower sits on a ley-line intersection used by the Shadow Cabal for amplified minor rituals; the scratched names on the lower walls collectively form a partial binding sequence (DC 16 Arcana).',
   0, 0, false),

  ('The Sunken Road', 'the-sunken-road', 'Aranthor', 'ruin', NULL,
   'A 2-mile stretch of pre-Founding road sunk 3-4 feet below the current ground level east of Ael''s Cross. The road surface is intact "” finely cut stone with a central drainage channel, better built than the King''s Road.',
   'A farmer''s dog has disappeared into the drainage channel at the road''s midpoint twice; both times it returned, and both times it subsequently refused to go near that section of road.',
   0, 0, false),

  ('Old Caerlhaven', 'old-caerlhaven', 'Aranthor', 'ruin', NULL,
   'The original Caerl family seat on a sea cliff 2 miles north of current Caerlhaven, abandoned 100 years ago after a coastal collapse undermined the seaward tower. Three-quarters of the old keep remain; currently used as a smugglers'' cache.',
   'The smugglers'' cache contains an uncollected crate of Shadow Cabal materials "” correspondence, ritual components, and a partial manifest of Cabal agent locations on the western coast. The Cabal agent who placed it was arrested on an unrelated matter.',
   0, 0, false),

  ('Ash-Pilgrim Road', 'ash-pilgrim-road', 'Aranthor', 'ruin', NULL,
   'A ruined pilgrim road and abandoned waystation 10 miles north of the Ashen Wall, where the last inn on the old route to an Aurelion temple site stands roofless with the Ashen Marches on three sides.',
   'The temple''s treasury was never evacuated when the priests fled; the sealed vault beneath the Marches holds approximately 6,000gp in Founding-era coinage. Two separate retrieval parties have tried and not returned.',
   0, 0, false),

  -- ============================================================
  -- ARANTHOR: WORKING SITES
  -- ============================================================

  ('Greenvale Sawmills', 'greenvale-sawmills', 'Aranthor', 'working_site', NULL,
   'Two competing logging operations on the south edge of the Greywood near Greenvale: Blackwell''s Crown Timber Concession processing 200 tons per month, and Coll Sarne''s older independent operation under a king-granted charter.',
   'Sarne has been secretly rerouting the drainage channels Blackwell''s mill needs to process green timber; Fort Ashveil is being built with wet lumber that will fail structurally in 3-5 years "” nobody has noticed yet.',
   0, 0, false),

  ('Kettermere Salt-Works', 'kettermere-salt-works', 'Aranthor', 'working_site', NULL,
   'The salt production operation at the Kettermere flats, run by the Crane family under a perpetual charter from House Vael. Produces roughly 40 tons of bay salt per year; has received multiple Shadow Cabal purchase approaches.',
   'The Crane family''s second son Pell, 22, has been meeting secretly with a Cabal agent "” not to sell the works but because he is interested in the offer of magical training.',
   0, 0, false),

  ('Frostback Quarry', 'frostback-quarry', 'Aranthor', 'working_site', NULL,
   'A limestone quarry 2 miles above Cresthollow on the Frostback Ridge lower slope, operated under the village council''s charter. Employs 35 workers and produces premium pale Frostback limestone for Vaelthorn construction.',
   'The quarry''s upper face broke into an intact 800-year-undisturbed Stone-Speaker workshop; the hired engineer Toral Bress is trying to decide who among the current factions can be trusted with the discovery.',
   0, 0, false),

  ('Aelwynn Fishery at Dunwater', 'aelwynn-fishery-at-dunwater', 'Aranthor', 'working_site', NULL,
   'A commercial fishery on the lower River Cael below Dunwater, operated under House Ashmore''s river fishing rights. Runs a smoking house and three fishing boats employing 12 workers; output is down 30%.',
   'A worker diving to clear a fouled anchor saw a channel cut too regularly through the river bottom, running east "” he did not follow it and will not.',
   0, 0, false),

  ('Highfeld Grain Collective', 'highfeld-grain-collective', 'Aranthor', 'working_site', NULL,
   'A multi-village grain storage cooperative 6 miles east of Briarvale, coordinated by six Highfeld villages through a 40-year-old charter. The central stone granary holds 800 tons of grain; under legal dispute with Blackwell over requisition rights.',
   'Manager Seff Oren has discovered one of the six village representatives has been supplying Blackwell''s officers with the cooperative''s detailed storage manifests "” he knows who it is but cannot act without risking all six villages.',
   0, 0, false),

  ('Brynn''s Vineyards', 'brynns-vineyards', 'Aranthor', 'working_site', NULL,
   'The only significant wine producer in Aranthor, 8 miles southeast of Vaelthorn on the River Cael. Five generations of the Brynn family have produced roughly 15,000 bottles per year from 200 acres; now under House Kessrel''s "protection."',
   'The vintage cellar''s lowest level contains a sealed door older than the current family; the 84-year-old grandmother insists it was sealed for good reason by a man she cannot name "” and no one has opened it in three generations.',
   0, 0, false),

  -- ============================================================
  -- ARANTHOR: INNS AND CROSSROADS
  -- ============================================================

  ('The Warden''s Rest', 'the-wardens-rest', 'Aranthor', 'inn', NULL,
   'A solid commercial inn at the foot of Warden''s Hill, 15 miles north of Dunmore on the King''s Road. Built 30 years ago to serve the Dunmore-to-Greenvale logging traffic; innkeeper Bess Orane holds an exclusive provisions contract for the logging camps.',
   'Someone is adding small sealed packages to Bess''s weekly supply convoy to the logging camps without her knowledge; she has noticed weight discrepancies but has not yet investigated.',
   0, 0, false),

  ('The Thornwick Cross', 'the-thornwick-cross', 'Aranthor', 'crossing', NULL,
   'A named crossroads 4 miles north of Thornwick marked by a stone post with carved directional arms, connecting roads to Dunmore, the Highfeld villages, and Thornwick. Features a small Aurelion shrine maintained by Thornwick''s church.',
   'Three days ago someone posted a carved wooden notice reading "The Thornwick bell has been silenced. Ask why." "” the handwriting matches the Sentinel Order''s regional correspondent.',
   0, 0, false),

  ('Aelford Bridge and Inn', 'aelford-bridge-and-inn', 'Aranthor', 'crossing', NULL,
   'The key crossing of the upper River Aelwynn at Aelford, 18 miles upstream from Ashford, bridged 200 years ago. The bridge toll is collected by Crown reeve Cass Henner; the adjacent Aelford Inn is run by his personal friend Tomm Reach.',
   'Last week a Blackwell convoy sergeant drew his sword on the reeve over the toll; Henner collected it anyway without moving or raising his voice, and something in his expression made the sergeant sheathe. Tomm witnessed it and has been thinking about it all week.',
   0, 0, false),

  ('The Mereford Inn', 'the-mereford-inn', 'Aranthor', 'inn', NULL,
   'The last inn before the Thornmere, a low half-concealed building 3 miles north of Fernholt on the marsh road. Owned by retired Merefolk guide Holt Cass, who also offers guiding services into the western Thornmere at 2gp per party per day.',
   'Holt has refused two guide contracts in the past month from travelers asking the wrong kind of questions "” specifically, they asked about places in the Thornmere with no solid ground, as if that were the destination.',
   0, 0, false),

  ('The Split Crown', 'the-split-crown', 'Aranthor', 'inn', NULL,
   'The last inn before Vaelthorn, 5 miles north of the capital on the King''s Road. Innkeeper Rellen Crae has run the establishment with maximum neutrality and discretion through twelve years of political crisis, making it the preferred meeting ground for all factions.',
   'A mid-rank Cabal agent, a Crown Loyalist courier, and a Blackwell intelligence officer are all currently staying at the inn without knowing about each other "” Rellen knows about all of them.',
   0, 0, false),

  ('Warden''s Ford', 'wardens-ford', 'Aranthor', 'crossing', NULL,
   'One of the few remaining Crown toll points outside Vaelthorn, on the River Aelwynn 6 miles east of the Split Crown Inn. A knee-to-thigh-deep ford with guide posts, a maintained tollhouse flying a Crown pennant, staffed by deputy reeve Alec.',
   'Alec has been researching whether a ford-toll charter issued by a legitimate king can be voided without a full Council of Lords ratification "” his notes in the tollhouse may represent significant constitutional law. The Kessrel family''s lawyers have noticed.',
   0, 0, false),

  -- ============================================================
  -- DARIAN EMPIRE: PROVINCIAL CITIES AND TOWNS
  -- ============================================================

  ('Varix', 'varix', 'Darian Empire', 'city', 38000,
   'The provincial capital of Caldra Prima and second city of the Empire, where the Aurin River meets the Via Caldra one day''s ride north of Caldrath. A conspicuously beautiful city with wide boulevards, a triumphal arch, and the Empire''s premier patrician academy.',
   'Praetor Luvian Asche''s youngest son has joined the Census Cheats resistance; Asche knows, has said nothing, and is quietly terrified about the Blackguard''s eventual discovery.',
   0, 0, true),

  ('Dalven', 'dalven', 'Darian Empire', 'city', 24000,
   'Provincial capital of Ferrum Province, three days east of Caldrath along the Ironway. A rough industrial city servicing Stonefall Vein''s mining operations; home to the IV Ferrum Legion and the Arcane Vanguard''s primary eastern survey office.',
   'Arcane Vanguard Commander Veth Orinas has independently mapped anomalous geomantic readings that precisely correspond to Shadow Lord anchor points "” she is deciding whether to report, suppress, or share her findings.',
   0, 0, true),

  ('Sorthun', 'sorthun', 'Darian Empire', 'city', 19000,
   'Provincial capital of Lithorica, built directly on top of the conquered Litorin city of Litor-Keth. The Empire replaced all major Litorin public buildings with Darian architecture; Litorin people still live here as registered citizens, speaking Darian in public.',
   'Beneath the new administrative plaza the foundations of Litor-Keth''s great temple were too deep to demolish; the temple still stands underground, used as a Litorin resistance meeting place "” and it sits atop a sealed vault the Litorin were protecting long before the Empire arrived.',
   0, 0, true),

  ('Caelport', 'caelport', 'Darian Empire', 'city', 31000,
   'The Empire''s only major sea port on the western coast, at the mouth of the Aurin River into Caldrath Bay. The most cosmopolitan city in the Empire; handles imperial naval traffic, overseas trade, and the fish market that keeps Caldrath fed.',
   'A Sapphire Coast merchant captain has been passing messages between Census Cheats cells for two years from her ship the Amber Wake, which docks every thirty days. The Blackguard''s file on her is two weeks from complete.',
   0, 0, true),

  ('Harren''s Gate', 'harrens-gate', 'Darian Empire', 'town', 7500,
   'A garrison town one hour east of Ironwatch along the Ironway, existing entirely to support the border complex with inns, bathhouses, provisioners, and a smiths'' district running three shifts producing Ironwatch replacement hardware.',
   'Several soldiers in the current rest rotation have been keeping private logs of unexplained lights and patrols that return silent from the mountain passes "” the logs have been confiscated twice and keep reappearing.',
   0, 0, true),

  ('Ruven', 'ruven', 'Darian Empire', 'town', 5200,
   'The youngest city in the Empire, founded thirty years ago as a military colony to secure the northern Lithorican frontier. Population is half veteran settlers and half reluctant conscript arrivals; more Blackguard agents per capita than anywhere else in the Empire.',
   'Three census workers in Ruven have been quietly altering records of Litorin frontier families "” paid by an unknown party who wants those families to disappear from the official record before the next eastern expansion campaign.',
   0, 0, true),

  ('Caldport Annex', 'caldport-annex', 'Darian Empire', 'town', 11000,
   'Originally a suburb immediately south of Caldrath, now its own administrative unit housing the service workers, junior clerks, and immigrant laborers who keep the capital running. Less Blackguard surveillance than Caldrath proper makes it a Census Cheats stronghold.',
   'The Annex''s largest inn, the Stone Wheel, has a basement room serving as an informal message drop for Census Cheats operations across Caldra Prima, run by a Litorin woman named Dessa who took over from her murdered brother.',
   0, 0, true),

  ('Iron Bastion', 'iron-bastion', 'Darian Empire', 'fort', 1800,
   'A forward Imperial fortification one day''s march east of Ironwatch into the Ironwall Mountains, housing two permanent cohorts of the VI Border Legion. Three concentric walls, gate mechanisms requiring six soldiers simultaneously, and a four-month cistern.',
   'A crack in the eastern wall bleeds faint blue light at midnight during new moons; the commanding officer has ordered it sealed three times and it keeps reopening.',
   0, 0, true),

  -- ============================================================
  -- DARIAN EMPIRE: IMPERIAL INFRASTRUCTURE
  -- ============================================================

  ('Via Caldra', 'via-caldra', 'Darian Empire', 'geographic', NULL,
   'The Empire''s oldest and most-traveled road, running north from Caldrath through Varix to Caldra Terminus at the northern forest border. Paved with limestone blocks, wide enough for two wagons abreast, with drainage channels and waystation fortlets every ten miles.',
   'Arcane Vanguard survey findings precisely correspond to mile-stones 40, 82, and 117 on the Via Caldra''s northern stretch "” the road itself is a map of Shadow Lord anchor points.',
   0, 0, false),

  ('The Ironway', 'the-ironway', 'Darian Empire', 'geographic', NULL,
   'The Empire''s primary strategic military road running due west from Caldrath to the Ironwatch border, wide enough for three wagons abreast. Built to allow rapid troop deployment; runs through Dalven and Harren''s Gate, six-day supply convoy travel time.',
   'Census Cheats couriers have memorized waystation schedules on the Ironway to the minute, allowing movement between stations without being logged. The Blackguard suspects a courier network but has not identified the method.',
   0, 0, false),

  ('Via Orientis', 'via-orientis', 'Darian Empire', 'geographic', NULL,
   'The road east from Dalven into Lithorica, terminating at Ruven. Newer and rougher than other imperial roads, partly incorporating original Litorin road beds; waystation fortlets are more heavily garrisoned due to frontier conditions.',
   'Several fortlets on the Via Orientis stand on ground sacred to the Litorin people; the soldiers who garrison them report persistent nightmares and a cold that no fire can shift.',
   0, 0, false),

  ('Aqueduct of Darius II', 'aqueduct-of-darius-ii', 'Darian Empire', 'geographic', NULL,
   'The main water supply for Caldrath, running 34 miles from the Aurin River''s headwaters south to the capital. Built three centuries ago, the aqueduct''s arches are the tallest structures on the Imperial Plains and supply Caldrath, three waystations, and the military baths at Varix.',
   'Census Cheats has identified a maintenance access tunnel beneath aqueduct arch 47 connecting to a pre-Darian drainage system under Caldrath''s northeast quarter "” an unrecorded six-hour underground route into the capital.',
   0, 0, false),

  ('The Aurin Bridge', 'the-aurin-bridge', 'Darian Empire', 'crossing', NULL,
   'The largest bridge in the Empire, spanning the Aurin River south of Varix. Wide enough for two legions to cross simultaneously; staffed by a permanent 500-soldier toll cohort. Built 200 years ago in a single campaign season by the III Caldran Legion.',
   'The bridge keeper Cass Orren has been recording the names of every crossing traveler in a private log for eleven years out of compulsive habit "” his log is the most complete record of Aranthorian agents entering the Empire that exists.',
   0, 0, true),

  ('Fortlet Arden', 'fortlet-arden', 'Darian Empire', 'fort', NULL,
   'Ironway waystation fortlet at mile 10, built to imperial standard: twelve-foot stone walls, one road-facing gate, one postern, housing a squad of twelve soldiers with stable, census checkpoint, and infirmary.',
   'Standard imperial waystation fortlet; travelers on major roads are required to check in or face census violations.',
   0, 0, false),

  ('Fortlet Kross', 'fortlet-kross', 'Darian Empire', 'fort', NULL,
   'Ironway waystation fortlet at mile 20, built to imperial standard: twelve-foot stone walls, one road-facing gate, one postern, housing a squad of twelve soldiers with stable, census checkpoint, and infirmary.',
   'Standard imperial waystation fortlet; travelers on major roads are required to check in or face census violations.',
   0, 0, false),

  ('Fortlet Pale', 'fortlet-pale', 'Darian Empire', 'fort', NULL,
   'Ironway waystation fortlet at mile 30, one day north of Harken Mill. Built to imperial standard but staffed entirely by Census Cheats sympathizers who faithfully log travelers but occasionally omit specific names from midnight reports to Dalven.',
   'The entire Fortlet Pale staff are Census Cheats sympathizers who have been selectively omitting names from official logs for four years "” the Blackguard has not yet identified the method.',
   0, 0, false),

  ('Fortlet Vaxa', 'fortlet-vaxa', 'Darian Empire', 'fort', NULL,
   'Ironway waystation fortlet at mile 40, built to imperial standard: twelve-foot stone walls, one road-facing gate, one postern, housing a squad of twelve soldiers with stable, census checkpoint, and infirmary.',
   'Standard imperial waystation fortlet; travelers on major roads are required to check in or face census violations.',
   0, 0, false),

  ('Fortlet Dorn', 'fortlet-dorn', 'Darian Empire', 'fort', NULL,
   'The largest Ironway waystation fortlet at mile 50, with a full century of soldiers permanently quartered there. Built to imperial standard but expanded; functions as a small garrison post rather than a simple waystation.',
   'As the largest fortlet on the Ironway, Fortlet Dorn serves as a de facto checkpoint between Caldrath-side and frontier-side imperial territory.',
   0, 0, false),

  ('Stonefall Vein Road', 'stonefall-vein-road', 'Darian Empire', 'geographic', NULL,
   'A private military road connecting Stonefall directly to Dalven, bypassing the Ironway. Shorter and meaner than imperial roads "” unpaved in stretches, narrow, nicknamed "the Scar" by the workers who travel it.',
   'Four workers have disappeared on the section passing through the Vein Hollow in the last year; the official determination is banditry, but there are no bandits in this part of the Empire.',
   0, 0, false),

  -- ============================================================
  -- DARIAN EMPIRE: VILLAGES AND SUBJECT SETTLEMENTS
  -- ============================================================

  ('Aurinford', 'aurinford', 'Darian Empire', 'village', 1100,
   'A thoroughly Darianized farming village 30 miles north of Caldrath on the Via Caldra, at the Aurin River''s first major ford. Supplies grain and vegetables to Caldrath''s outer districts; features a Soleth shrine, census office, and imperial primary school.',
   'One family, the Veth clan, has never assimilated "” they speak the old tongue at home, observe old festivals in private, and keep pre-conquest census records in a sealed farmhouse room. They are memory, not resistance.',
   0, 0, false),

  ('Kethmoor', 'kethmoor', 'Darian Empire', 'village', 640,
   'A village half a day south of the Ironway between Dalven and Harren''s Gate, destroyed during the conquest and rebuilt on the same ground with standard imperial grid layout. The original Kethmoor residents'' descendants were relocated to Dalven.',
   'The graves of original Kethmoor residents lie under the new village''s administrative center; the relocated descendants make anniversary visits leaving offerings on the steps that current residents mistake for unfamiliar religious customs.',
   0, 0, false),

  ('Litor''s Shore', 'litors-shore', 'Darian Empire', 'village', 2800,
   'A Litorin fishing community on the imperial coast, one of the oldest continuously inhabited settlements in Lithorica, predating the Empire by at least a thousand years. The Empire added a naval waystation and census office to its northern edge.',
   'Litorin fishers here have navigated coastal waters for a thousand years by stars and memory; their mental maps of sea bottom, coves, and currents are more detailed than any imperial chart "” a fact of significant strategic interest.',
   0, 0, false),

  ('Veth''s Crossing', 'veths-crossing', 'Darian Empire', 'village', 380,
   'A waystation village 5 miles off the Via Caldra, 40 miles north of Caldrath, grown around the northern approach to the Aurin Bridge. Three inns, a blacksmith, and a money-changer; the transient population makes it one of the busiest Census Cheats message exchange points.',
   'The middle inn, the Pale Arch, has a locked cabinet behind the bar containing twelve coded letters waiting for Census Cheats couriers to arrive and ask for the "house specialty."',
   0, 0, false),

  ('Cassavar', 'cassavar', 'Darian Empire', 'village', 1600,
   'A formerly Litorin agricultural village three days east of Sorthun, near the frontier, demographically split between original Litorin farming families and Darian settler families assigned adjacent land parcels with conflicting ideas about property and water rights.',
   'Litorin grandmother Vesha-Mir is the oldest living keeper of the full Litorin oral tradition and knows things about what was sealed under Litor-Keth that even the Litorins who use the underground temple have forgotten entirely.',
   0, 0, false),

  ('Dunmarch', 'dunmarch', 'Darian Empire', 'village', 1200,
   'A provisioning village between Dalven and Stonefall entirely economically dependent on Stonefall''s food demands. Its entire economy is organized around census-assigned production quotas; there is no local market.',
   'Foreman Brek Aldis discovered three years ago that Dunmarch''s quota was set from a census error measuring a different village; three attempts to correct it have been lost or denied on procedural grounds.',
   0, 0, false),

  ('Pale Shore Settlement', 'pale-shore-settlement', 'Darian Empire', 'village', 450,
   'A settlement of tieflings, half-elves, and others the Empire classifies as "racially marginal," relocated here forty years ago on the Caldrath Bay coast. Technically free citizens, but travel papers take six months to process and all residents are under extended observation.',
   'The settlement contains a disproportionate number of former Arcane Vanguard arcanists discharged as "racially incompatible with Vanguard service." Several remain in contact with current Vanguard officers, and their correspondence would embarrass multiple senior officers.',
   0, 0, false),

  ('Harken Mill', 'harken-mill', 'Darian Empire', 'village', 820,
   'A mill village one day north of the Ironway at mile marker 30, grinding grain for Dalven''s city bakers. Quiet and prosperous by provincial standards; almost entirely Census Cheats sympathizers, with the miller Doss serving as regional cell coordinator for Ferrum Province''s northern network.',
   'The Harken Mill cell has received intelligence that the Arcane Vanguard''s eastern mapping surveys correspond to sites of historical significance to every pre-Darian culture in Lithorica simultaneously "” but they lack the magical knowledge to understand what it means.',
   0, 0, false),

  ('Solport', 'solport', 'Darian Empire', 'town', 3400,
   'A self-governing shipbuilding town on the Bay of Caldrath, a short ferry ride west of Caelport. Solport negotiated protected status during the Empire''s western expansion rather than fighting; produces the Empire''s merchant fleet under a hereditary shipwright guild.',
   'The Solport shipwright guild has accepted a commission through a third-party merchant for four medium-weight transport vessels with reinforced keels and no imperial registration markings "” the Blackguard would very much like to know who placed the order.',
   0, 0, true),

  ('Gravenstone', 'gravenstone', 'Darian Empire', 'village', 910,
   'A village built around a worked-out silver seam in Ferrum Province, incorporated during pacification. Produces nothing of strategic value and sits too far from the Ironway to make a useful waystation; the least-watched community in Ferrum Province.',
   'The exhausted mine beneath Gravenstone connects to a natural cave system the original miners mapped but never reported; the system eventually connects to the same underground network that reaches Litor-Keth "” no one in the Empire knows this.',
   0, 0, false),

  -- ============================================================
  -- DARIAN EMPIRE: NOBLE AND PATRICIAN HOUSE ESTATES
  -- ============================================================

  ('Calen Court', 'calen-court', 'Darian Empire', 'noble_seat', NULL,
   'The estate of House Calen, the oldest patrician family in the Empire, 14 miles east of Caldrath in the Gold Ring hills. House Calen holds a 600-year consecutive Senate advisory seat and has invested heavily in the Ironwatch border complex.',
   'House Calen employs an Aranthorian-born secretary taken in as a refugee five years ago who is in fact a Crown Loyalist agent.',
   0, 0, true),

  ('Mireth Hall', 'mireth-hall', 'Darian Empire', 'noble_seat', NULL,
   'The estate of House Mireth, three miles north of Caldrath on the Via Caldra, controlling the largest private grain stores in the Empire and holding the primary legionary supply contract. The house opposes annexation of Aranthor on financial grounds.',
   'House Mireth has been secretly purchasing land on the Sapphire Coast for three years through shell merchants as an exit strategy if Aranthor annexation fails to produce returns.',
   0, 0, true),

  ('Talveth Towers', 'talveth-towers', 'Darian Empire', 'noble_seat', NULL,
   'The estate of House Talveth, eight miles east of Caldrath "” five towers of different heights visible from the Via Caldra. House Talveth holds the census administration contracts for Caldra Prima and has turned the position into a private extortion operation.',
   'Census Cheats was founded by a former House Talveth clerk who understood the system intimately; now House Talveth''s head Mira is running a parallel internal investigation into unauthorized record access that keeps colliding with the Blackguard''s own unrelated investigation.',
   0, 0, true),

  ('Aurantis Manor', 'aurantis-manor', 'Darian Empire', 'noble_seat', NULL,
   'The estate of House Aurantis, 20 miles southeast of Caldrath near the Bay of Caldrath. The house controls the largest private fleet in the Empire and has been profiting from the Aranthorian succession crisis by feeding money to multiple factions simultaneously to keep the conflict going.',
   'Admiral-Emeritus Dral Aurantis has recently made contact with representatives of the Free Isles Compact through legitimate trade channels "” his interest in them is not commercial.',
   0, 0, true),

  ('Varix Old House', 'varix-old-house', 'Darian Empire', 'noble_seat', NULL,
   'The estate of House Varix in the city of Varix itself, predating the city that grew up around it. The house is politically split between the aging Praetor-General Luthor Varix, who supports annexation, and his heir Caerem who has served on the Aranthorian border and opposes it.',
   'Caerem Varix has been meeting privately with High Chancellor Viriath Cale for eight months under the cover of a philosophy discussion group to coordinate opposition to the annexation''s timing; his father is dying and Caerem will inherit within the year.',
   0, 0, true),

  -- ============================================================
  -- DARIAN EMPIRE: RUINS AND CONQUERED SITES
  -- ============================================================

  ('Shattered Gate of Litor-Keth', 'shattered-gate-of-litor-keth', 'Darian Empire', 'ruin', NULL,
   'The original monumental gatehouse of the Litorin capital, deliberately left half-ruined as an imperial statement and incorporated into Sorthun''s current eastern wall. The upper third was demolished by Darian engineers; the lower arches and base remain.',
   'In absolute darkness the space where the inscription was chiseled away becomes faintly luminous "” in a script that predates the Litorin people by at least two thousand years.',
   0, 0, false),

  ('Bloodfield', 'bloodfield', 'Darian Empire', 'ruin', NULL,
   'The site four miles south of Dalven where the III and IV Legions broke the last organized resistance of the Ferrum hill clans 43 years ago, killing twelve thousand in a single afternoon. Now farmland marked by a single imperial monument.',
   'On the anniversary of the battle, the field''s crops glow faintly blue at midnight. The farmers have noticed and do not discuss it with the census office.',
   0, 0, false),

  ('Sanctum of the Unwritten', 'sanctum-of-the-unwritten', 'Darian Empire', 'ruin', NULL,
   'A Litorin sacred site three hours east of Sorthun, officially classified as "demolished and cleared" due to a bribed survey officer who filed false paperwork. A ring of standing stones carved with dense pre-Litorin script on a hilltop, maintained in secret by local families.',
   'The stones are a recording medium "” a method of storing spoken word in stone inherited from a civilization that preceded the Litorin. The stones remember the voice of something imprisoned in the earth beneath this hill long before the Litorin built around it.',
   0, 0, false),

  ('Fort Aldrus (Ruins)', 'fort-aldrus-ruins', 'Darian Empire', 'ruin', NULL,
   'The ruins of the hill clans'' primary stronghold in Ferrum Province, two days north of the Ironway on a difficult mountain track. Stormed by the IV Legion in the opening campaign of the Ferrum pacification; partially demolished and abandoned.',
   'The lowest level of Fort Aldrus "” an original pre-clan building of unknown construction "” was sealed by the IV Legion with a bronze door bearing Arcane Vanguard enchantments that predate the Vanguard''s founding by at least three hundred years.',
   0, 0, false),

  ('The Sunken Ward', 'the-sunken-ward', 'Darian Empire', 'ruin', NULL,
   'The buried foundations of whatever city occupied Caldrath''s location before the Empire built there, accessible through pre-Darian drainage tunnels beneath the northeastern quarter. Mostly flooded and partially collapsed; outer tunnels are used by Census Cheats cells.',
   'The Arcane Vanguard''s chief cartographer privately noted that geomantic readings from Caldrath''s northeastern quarter are inconsistent with natural geology and appear architecturally induced "” the anomaly has been measurably growing every year since.',
   0, 0, false),

  -- ============================================================
  -- DARIAN EMPIRE: GEOGRAPHIC FEATURES
  -- ============================================================

  ('The Aurin River', 'the-aurin-river', 'Darian Empire', 'geographic', NULL,
   'The great river of the Imperial heartland, rising in the northern forest highlands and flowing 200 navigable miles south-southwest to empty into the Bay of Caldrath. Grain barges work it constantly; the Empire maintains a complete vessel manifest.',
   'The river is sometimes called the "First Road" "” the Empire''s earliest expansion followed its course, and its regulation is one of the primary mechanisms of imperial economic control.',
   0, 0, false),

  ('The Ironwall Mountains', 'the-ironwall-mountains', 'Darian Empire', 'geographic', NULL,
   'The mountain range forming the Empire''s western border with Aranthor, running roughly north-south for 300 miles. Not impassable "” the well-traveled Ironwatch pass exists "” but high mountain routes require equipment and experience.',
   'Imperial survey maps show the Ironwall in precise topographic detail except for a northern section where three survey teams produced contradictory results and the fourth never returned.',
   0, 0, false),

  ('Bay of Caldrath', 'bay-of-caldrath', 'Darian Empire', 'geographic', NULL,
   'The protected bay roughly 30 miles across into which the Aurin empties, serving as the Empire''s primary naval anchorage. The I Naval Legion''s fleet winters here; the Emperor''s Fist, a natural rock formation, serves as a major navigational landmark.',
   'The bay''s waters are unusually clear "” you can see the bottom in 20 feet of water "” which the Vanguard attributes to Aurin freshwater dilution. Whether this is the true explanation has not been fully investigated.',
   0, 0, false),

  ('The Eastern Reaches', 'the-eastern-reaches', 'Darian Empire', 'geographic', NULL,
   'Territory east of Lithorica that the Empire has pacified but not yet fully settled "” rolling mixed forest, grassland, and scattered hills. The Vanguard''s classified reports from here are the largest single file in Vanguard archives.',
   'The local Ven people have been remarkably "” unusually "” cooperative with the census process, in ways that census officers find slightly unsettling. What they know or want is unclear.',
   0, 0, false),

  ('The Caldra Forest', 'the-caldra-forest', 'Darian Empire', 'geographic', NULL,
   'The northern temperate forest at the head of the Via Caldra, marking the effective limit of the Empire''s northern expansion. Dense enough that road-cutting would take a generation; classified as "uninhabited territory" by the census office.',
   'Northern Litorin people use the forest margin as a transit route between communities in ways that don''t appear on any census record.',
   0, 0, false),

  ('The Stonefall Vein', 'the-stonefall-vein', 'Darian Empire', 'geographic', NULL,
   'A massive geological iron and coal deposit running roughly east-west through Ferrum Province for about 60 miles, visible from the road as a dark band of exposed rock. Mining operations have worked it for 200 years with estimates of another 300 years remaining.',
   'The ground above the western end of the Vein has been showing unusual subsidence for three years; mining engineers attribute it to over-extraction, but the Arcane Vanguard team that assessed it classified their findings.',
   0, 0, false)

ON CONFLICT (slug) DO NOTHING;


-- Batch 2: Veilwood + Sapphire Coast locations
INSERT INTO locations (name, slug, region, location_type, population, description, dm_notes, map_x, map_y, is_major)
VALUES

  -- ============================================================
  -- VEILWOOD: TREELINE SETTLEMENTS
  -- ============================================================

  ('Briarhollow', 'briarhollow', 'Veilwood', 'village', 340,
   'The oldest continuously operating logging camp on the Veilwood''s southern edge, with four centuries of accumulated timber-sense and hard-won rules about which sections of the forest you don''t touch. The woodsfolk can identify choir-adjacent trees by feel and have been finding more of them lately.',
   'Head woodsman Tallic Burne knows a section of eastern treeline is going wrong but has delayed marking it to protect productive timber stands; two of his crew have been working the compromised area for six weeks and are behaving strangely.',
   0, 0, false),

  ('Greywood Post', 'greywood-post', 'Veilwood', 'village', 180,
   'A Sentinel Order waystation-town on the North Road, built forty years ago as a supply depot and now a small town that exists around that original purpose. Half the residents work for the Order as logistical staff, and the local Sentinel liaison has been sending increasingly urgent reports about Wanderer sightings.',
   'Liaison Torren Ashvale will share a current Wanderer sighting map with players willing to share what they learn "” forty-seven confirmed sightings this month versus twelve a year ago, and he has told no one how bad it has become.',
   0, 0, false),

  ('Wychfall', 'wychfall', 'Veilwood', 'village', 520,
   'A trapping and fishing community on the Veilwood''s eastern margin, built around forest-fed ponds whose water tastes of something no one can name. The town lost seven trappers last winter; four returned changed, three did not, and a row of seven empty chairs on the eastern edge marks each one.',
   'The four returned trappers live at the edge of town and are functional but described as like talking through water; one named Brine Ashford says the same sentence every night before sleep: "The cathedral is beautiful. You would not be afraid."',
   0, 0, false),

  ('Pallside', 'pallside', 'Veilwood', 'village', 90,
   'A small village two miles inside the Outer Wood that should have been abandoned and wasn''t "” nine extended families of six generations whose buildings have been grown around by the forest in ways suggesting the forest has accepted them. The path to it has narrowed from wagon-width to shoulder-width over three years.',
   'Pallside residents have no memory of their founding ancestor''s name "” it has faded to illegible pale marks in every document "” and find this unremarkable; players making Arcana or History checks will find it deeply remarkable.',
   0, 0, false),

  ('Crestholm', 'crestholm', 'Veilwood', 'town', 710,
   'The largest treeline settlement, a market town at the King''s Road junction with two inns, a market square, a Sentinel Order office, and a temple to the Leafed God. The market sells elven-sourced goods, silverleaf lumber, and dried dreamvine; the Sylvara road has been quiet for fourteen months.',
   'The temple''s founding chronicle describes a previous period of forest strangeness resolved after "the bright-singers were silenced," but the three pages documenting how it was resolved have been torn out "” an old tear, not recent.',
   0, 0, true),

  ('Thorngate', 'thorngate', 'Veilwood', 'fort', 260,
   'A fortified waystation on the forest road midway between Crestholm and Sylvara, marking the end of the safe Outer Wood and the beginning of the zone where elven escorts are expected. The gatehouse log records every party that has passed into the Veilwood; of twenty-three groups this past year, eleven have returned.',
   'Retired Sentinel guide Correm Talle has not taken a client into the Middle Wood in eight months, saying the thread is unreliable; twelve entries in the gatehouse log end with a dash and a date, waiting for a return that hasn''t come.',
   0, 0, false),

  ('Ironkeel', 'ironkeel', 'Veilwood', 'village', 430,
   'A four-hundred-year-old settlement on the forest''s northwestern edge, home to the Ironkeel Memory "” an oral tradition maintained by family elders called Remembrancers who have memorized generations of practical forest knowledge because the Pale Choir''s influence destroyed their written records.',
   'Head Remembrancer Vayne Brock has noticed two colleagues forgetting specific oral entries "” not randomly, but the exact entries about the previous Choir stirring two hundred years ago "” and at seventy-eight is running out of time to determine if the cause is age or something worse.',
   0, 0, false),

  ('Rootswatch', 'rootswatch', 'Veilwood', 'village', 140,
   'A watchtower settlement on a low hill at the Veilwood''s southern tip, built around a Sentinel Order tower with clear sightlines into the first mile of trees. Tower keeper Pell Whisker has filled six ledgers with logs of unusual treeline phenomena including an instance where the treeline visibly advanced thirty feet overnight.',
   'Pell''s most recent entry, four days ago, records the treeline moving twelve more feet "” measured three times "” and ends with "I am going to stop measuring."',
   0, 0, false),

  -- ============================================================
  -- VEILWOOD: DEEP FOREST LOCATIONS
  -- ============================================================

  ('The Threaded Way', 'the-threaded-way', 'Veilwood', 'geographic', NULL,
   'The Veilwood''s primary navigable path "” a fifteen-mile sequence of silver-banded trees maintained by elven navigators, running northeast from Mirepost through the Outer Wood to Sylvara''s ground gates. The marks have been failing for fourteen months, healing faster than navigators can recut them.',
   'Players examining the healing marks with Arcana DC 15 will find the cuts are being filled not by natural bark growth but by a warm, pale, odorless substance coming from inside the wood.',
   0, 0, false),

  ('The Silverbrook', 'the-silverbrook', 'Veilwood', 'geographic', NULL,
   'A river running east-west through the Outer Wood, named for the silver light its water produces at night. The Wading Stones crossing is a cluster of seven flat submerged stones on the Threaded Way; the brook''s navigational clarity has been slowly diminishing over three years.',
   'Objects left at the Wading Stones crossing by travelers "” coins, buttons, a child''s toy "” are always found slightly closer to the water than they were left, and the phenomenon is accelerating.',
   0, 0, false),

  ('The Pale Glade', 'the-pale-glade', 'Veilwood', 'geographic', NULL,
   'A perfectly circular two-hundred-foot clearing in the Middle Wood with short white grass that grows to exactly the same height across the whole space, does not move in wind, and leaves no footprints. Old Sentinel maps note it with "approach with caution "” identity anchor required."',
   'In the center stands a smooth waist-height stone with absorbed markings that read under Arcana DC 18: "THIS PLACE HAS BEEN SINCE BEFORE THE NAMES. HOLD YOURS." Visitors without a consciously held identity anchor may lose specific personal information after an hour inside.',
   0, 0, false),

  ('The Giant''s Stave', 'the-giants-stave', 'Veilwood', 'geographic', NULL,
   'The largest tree in the Veilwood by a wide margin "” sixty feet in circumference, three hundred feet high "” used as the primary landmark for orienting in the Middle Wood. Its bark shows patterns like thousands of overlapping handprints pressed barely into the surface.',
   'Someone has been building a camp at the Stave''s base: a lean-to, a fire circle with four-to-six-week-old ash, and deliberately arranged objects including carved human figures. The Sentinel Order believes it is a Shadow Cabal outpost.',
   0, 0, false),

  ('The Stone Circle of Mael Duin', 'the-stone-circle-of-mael-duin', 'Veilwood', 'ruin', NULL,
   'Nine standing stones of pale blue-grey granite in an oval forty feet across, twelve feet tall each, made of material matching no local geology "” they predate the human kingdoms and the elves'' arrival in the Veilwood. Animals avoid the interior but sleep against the exterior stones.',
   'This is one of the five anchor points of the Pale Choir''s prison structure; a Seal-Instrument is buried at the base of the northernmost stone with erratic but not yet critical readings, and the Sentinel Order believes the stones are an active component of the original binding.',
   0, 0, false),

  ('The Pale Road', 'the-pale-road', 'Veilwood', 'geographic', NULL,
   'A three-foot-wide path of smooth, faintly luminous, warm pale stone running through the Middle Wood, pointing directly toward the Pale Cathedral six miles further in. It appears made from inside out, as if something under the ground pushed up a strip of itself to the surface.',
   'Walking the road requires DC 12 Wisdom saves every ten minutes or the walker begins feeling growing peace and purposelessness "” a sense that everything that matters is ahead. Footprints stained into the pale stone go one direction only: toward the Cathedral.',
   0, 0, false),

  ('Wander''s Rest', 'wanders-rest', 'Veilwood', 'ruin', NULL,
   'An abandoned Sentinel Order waystation in the Middle Wood, intact but transformed: the interior has been arranged into a careful dining scene using objects travelers dropped in the forest, with six settings around improvised furniture. Something revisits and refreshes the arrangement.',
   'One "chair" "” a rotted log "” is positioned isolated from the others with no setting in front of it. Memory-Keepers of Sylvara, if told, will go very quiet and say: "That is where it sits."',
   0, 0, false),

  ('The Fog Valley', 'the-fog-valley', 'Veilwood', 'geographic', NULL,
   'A mile-long, half-mile-wide bowl-shaped depression in the Middle Wood where dense white fog collects year-round regardless of weather. Navigation inside requires either elven thread-sense or a rope line anchored at the edge; three confirmed deaths in two years from hypothermia after circular wandering.',
   'Old elven records name this place "The Place of Almost-Remembering," predating the current Choir stirring by a millennium "” it has always been this way, which the Memory-Keepers do not find reassuring.',
   0, 0, false),

  ('The River Junction', 'the-river-junction', 'Veilwood', 'geographic', NULL,
   'Where the Silverbrook meets the northward-flowing Pale Water in the Middle Wood, one of three places where multiple reliable compass directions can be established simultaneously. A large flat stone at the junction serves as an orientation base and elven navigator message board.',
   'The most recent carved message, from four days ago, reads "thread is wrong here"; another more recent mark appears to be the first four letters of a name that was not finished. On clear days the water reflects a different season than what is above.',
   0, 0, false),

  ('The Pale Cathedral Approaches', 'the-pale-cathedral-approaches', 'Veilwood', 'geographic', NULL,
   'The five-mile radius around the Pale Cathedral where the Choir''s direct influence replaces the ambient erosion of the rest of the Deep Wood, beginning roughly four days northeast of Mirepost. The Cathedral itself is visible on clear days "” genuinely beautiful, genuinely wrong, surrounded by silence.',
   'Entering without significant magical protection requires DC 16 Wisdom saves per half-hour against stacking identity-memory loss; elven scouts report the Cathedral appears larger each visit, as if always finishing something it is building.',
   0, 0, false),

  ('The Dreaming Ground', 'the-dreaming-ground', 'Veilwood', 'geographic', NULL,
   'A half-mile stretch of Middle Wood where Dreamvine has overgrown everything "” floor, undergrowth, lower tree sections, stone outcroppings "” producing pollen dense enough to guarantee memory-dreams within minutes of entry without face covering.',
   'Dreams induced here are not the dreamer''s own memories but sharp sensory fragments of strangers'' lives; Memory-Keepers believe these are memories the Choir has consumed and cast off here, still coherent enough to play back intact.',
   0, 0, false),

  -- ============================================================
  -- VEILWOOD: ELVEN SETTLEMENTS AND SITES
  -- ============================================================

  ('The Highwatch Spires', 'the-highwatch-spires', 'Veilwood', 'fort', NULL,
   'Three Sentinel Order elven monitoring stations built in the canopy two hundred feet above the forest floor, connected by rope bridges, each permanently staffed by three to five elven Sentinels covering the western and southwestern approaches to Sylvara.',
   'The southernmost Spire (Lowwatch) has been awake thirty-six hours because its crew of four is afraid to sleep while watching a pattern in the undergrowth below that appears to be mapping them.',
   0, 0, false),

  ('Ashenveil', 'ashenveil', 'Veilwood', 'ruin', NULL,
   'An ancient elven ruin in the Outer Wood, possibly three thousand residents at peak, abandoned centuries before the human kingdoms were founded. The Veilwood has grown so thoroughly back through it that elven structures are now architectural elements of enormous trees.',
   'One chamber at Ashenveil''s consumed center is completely clear of growth; carved on its wall in pre-modern elven script, repeated by the same hand over what appears to be centuries: "Do not wake it." The abandonment predates even the Memory-Keepers'' records.',
   0, 0, true),

  ('The Grove of Seven Songs', 'the-grove-of-seven-songs', 'Veilwood', 'religious', NULL,
   'A sacred elven grove in the Outer Wood with seven massive interlocking silverleaf trees whose canopy forms a silver-green vault, used for naming ceremonies, council elections, and deep meditations by all three elven factions. The trees produce harmonic singing on still evenings.',
   'In the past year the harmonics have changed "” a dissonance has entered. Three Memory-Keepers independently said, without consulting each other: "It is singing along."',
   0, 0, true),

  ('Wayfarer''s Stone at the River Fork', 'wayfarers-stone-at-the-river-fork', 'Veilwood', 'geographic', NULL,
   'An ancient elven waymarker standing stone twelve feet tall at the junction of the Pale Water and the Veilborn Stream, covered in waymark runes older than current elven script conventions and always a few degrees warmer than surrounding air.',
   'One face of the stone points to a destination in no current records "” a four-syllable name partially translating as "the place that was the center before the center moved." Players following the bearing will need three days in the Middle Wood.',
   0, 0, false),

  ('The Understory Shrines', 'the-understory-shrines', 'Veilwood', 'religious', NULL,
   'A network of small elven spirit-shrines scattered through the Outer Wood, each a day''s walk from the next, named for concepts rather than deities: the Shrine of Names, the Shrine of First Steps, the Shrine of What Was Said, the Shrine of the Wound, and others.',
   'Three shrines on the eastern circuit have been found with offerings missing and carved inscriptions absorbed "” not vandalized but consumed by Choir influence. The Shrine of What Was Said now has new unidentified script on it that looks like it is trying very hard to be language.',
   0, 0, false),

  -- ============================================================
  -- VEILWOOD: SENTINEL ORDER INFRASTRUCTURE
  -- ============================================================

  ('Watchpost Thorn', 'watchpost-thorn', 'Veilwood', 'fort', NULL,
   'The Sentinel Order''s primary secondary station one mile west of Mirepost on the treeline, housing the most active Seal-Instrument in the region. Commander Brael runs nine functional Sentinels against a post designed for twenty, methodically angry at headquarters for withholding reinforcements.',
   'Brael will ask players before anything else to carry a sealed message to Commander Elyndra in Sylvara. He says it is routine. His face says it is not.',
   0, 0, false),

  ('The Vine Station', 'the-vine-station', 'Veilwood', 'working_site', NULL,
   'A Sentinel Order research outpost inside the Outer Wood, deliberately camouflaged among undergrowth to read as deadfall from ten feet away, where three rotating researchers study active Choir influence "” memory-wisps, dreamvine acceleration, and healing Threaded Way marks.',
   'Researcher Corval''s childhood memory list grows shorter each morning; he thinks he is replacing old memories with new observations, but Liseth believes he is under early-stage Choir influence and Grundt believes it is time to leave "” the tiebreaker just arrived.',
   0, 0, false),

  ('The Five Anchor Points', 'the-five-anchor-points', 'Veilwood', 'geographic', NULL,
   'The five sites within or near the Veilwood forming the Pale Choir''s prison structure, each monitored by the Sentinel Order at varying levels. They include the Pale Cathedral, the Stone Circle of Mael Duin, the Giant''s Stave, the River Junction, and Ashenveil.',
   'Players who chart all five anchors on a map and make DC 15 Arcana recognize the prison-binding pattern; at DC 20 they notice the pattern has a sixth point "” and it is Sylvara.',
   0, 0, false),

  ('The Outer Network Watch Towers', 'the-outer-network-watch-towers', 'Veilwood', 'fort', NULL,
   'Three single-sentinel stone towers on the forest''s edge connected by signal to the main Sentinel network, each positioned to watch a specific treeline section. Tower Briarwatch is staffed by an elf five months without relief; Tower Wychwatch by a human who goes silent about deer patterns; Tower Rootwatch is currently empty.',
   'Players spending a night in Tower Rootwatch will find the previous sentinel''s logbook; the final entry is peaceful: "I think I understand now what it is trying to do... I think I''ll go ask."',
   0, 0, false),

  -- ============================================================
  -- VEILWOOD: RIVERS AND GEOGRAPHIC FEATURES
  -- ============================================================

  ('The Veilborn Stream', 'the-veilborn-stream', 'Veilwood', 'geographic', NULL,
   'The Veilwood''s main eastward drainage river, fifty miles long and navigable in its lower reaches, running east-southeast from the Deep Wood interior to the eastern treeline where it joins the King''s River. Its water carries a slight blue-grey quality that deepens toward the source.',
   'The Ironkeel Remembrancers'' oldest accounts record the Veilborn running southwest "” it changed direction during the previous Choir stirring three hundred years ago. They believe it can change again.',
   0, 0, false),

  ('The Pale Water', 'the-pale-water', 'Veilwood', 'geographic', NULL,
   'A north-south river in the Middle Wood with a white streambed of material matching no local geology and water that appears almost luminous over it, cutting across the Threaded Way route. It does not appear on any map made before three hundred years ago.',
   'The Memory-Keepers attribute the river''s appearance to the Pale Choir''s previous stirring and consider it a measure of the Choir''s reach "” the river is, in some sense, the Choir leaking into the physical world.',
   0, 0, false),

  ('The Heart', 'the-heart', 'Veilwood', 'geographic', NULL,
   'The central region of the Deep Wood, roughly ten miles in diameter centered on the Pale Cathedral, where normal forest physics do not apply: trees of impossible size, a completely closed canopy, no sun or stars, and spatial distortion operating as a constant. The Sentinel Order''s current Red Zone covers it in full.',
   'Players with accumulated Veilwood knowledge should sense the Heart''s presence as a weight in the northeast, a direction the birds don''t fly "” when they finally must enter, they will know exactly what they are entering.',
   0, 0, false),

  ('Pale Stone Ridge', 'pale-stone-ridge', 'Veilwood', 'geographic', NULL,
   'A two-mile-long, forty-foot-high ridge of the same pale stone as the Pale Road and Pale Cathedral running north-south through the western Middle Wood, geologically impossible in this location. Trees grow up to its edge and stop; the ridge itself is bare, and has grown two feet in height over the past eighteen months.',
   'Near the ridge''s northern end a forty-foot section has been shaped from below "” not cut but pressed, the stone shaped as if from underneath. The shapes are not language. They are faces.',
   0, 0, false),

  ('The Listening Hollow', 'the-listening-hollow', 'Veilwood', 'geographic', NULL,
   'A natural bowl-shaped acoustic formation in the Outer Wood where whispers at the center are audible at the rim, used by elves for centuries as a meeting ground. Since the Choir stirring began, it also amplifies things that are not sounds.',
   'At night, players at the bowl''s center who fail DC 12 Wisdom saves hear voice-fragments describing ordinary things "” a kitchen, a walk to market, a called name "” that sound like memory. A DC 15 Insight check reveals one voice describes something specific to one player''s own personal history.',
   0, 0, false),

  ('The Canopy Road', 'the-canopy-road', 'Veilwood', 'geographic', NULL,
   'The elven high route between Sylvara and the Highwatch Spires, a network of suspension bridges, platforms, and living-wood walkways three hundred feet above the forest floor that bypasses the ground-level Veilwood entirely.',
   'One section crosses above the Giant''s Stave; elven navigators who use this platform regularly report that the Stave''s crown sometimes contains blue-white light, moving slowly, not reflecting anything above it.',
   0, 0, false),

  ('The Fog Basin', 'the-fog-basin', 'Veilwood', 'geographic', NULL,
   'The geographic low point of the Veilwood, a four-mile-wide drainage basin collecting cold from the deep forest and producing semi-permanent ground fog year-round, cut through by the Pale Water and hosting the Fog Valley''s worst accumulation at its center.',
   'On certain mornings the basin produces a phenomenon the elves call "the Translation" "” the mist is lit from below with blue-white light in columns that look like a city. The elves do not explain what is being translated.',
   0, 0, false),

  -- ============================================================
  -- VEILWOOD: RUINS
  -- ============================================================

  ('The Sunken Tower', 'the-sunken-tower', 'Veilwood', 'ruin', NULL,
   'An eight-hundred-year-old stone tower that has sunk halfway into the forest floor for unclear reasons, with the top half accessible and filled with the belongings of its last occupants under centuries of dust, and the lower floors submerged in knee-deep groundwater that never changes level.',
   'The maps in the upper floors show the Veilwood eight centuries ago, significantly smaller; at the current rate of expansion the treeline will reach Mirepost in approximately eighty years.',
   0, 0, false),

  ('Greenstone Fort', 'greenstone-fort', 'Veilwood', 'ruin', NULL,
   'A pre-Crown military fortress consumed by four centuries of tree growth "” its thirty-foot-thick foundations and siege-designed walls now structurally supported by the same trees that broke through them. Its history documents the first known cases of Choir-adjacent memory erosion that prompted current Sentinel protocols.',
   'The fort''s deepest cellar holds the last garrison commander''s journal, whose final entries describe a decision about what to do with the evidence "” and whether anyone outside should know. The journal''s final page has been torn out and not found.',
   0, 0, false),

  ('The Forgotten Village', 'the-forgotten-village', 'Veilwood', 'village', 60,
   'A village in the Middle Wood where approximately sixty people have lived for at least two hundred years "” farming, trading, maintaining their houses "” but none of them know what their village is called. The name is present in their minds but connects to nothing; by morning it is just "here" again.',
   'The Pale Choir did not take their name "” it took their relationship to their name, the feeling of "this is my home, this is where I am from." The Sentinel Order archive speculates the Choir consumes not memories but the emotional significance that makes information matter; this village is the purest example.',
   0, 0, false),

  ('Ashfall Hall', 'ashfall-hall', 'Veilwood', 'ruin', NULL,
   'A pre-Crown great hall burned and rebuilt and burned again "” three distinct construction phases visible in the stonework "” now a roofless ruin one mile inside the Outer Wood. Its cellar holds a twelve-generation stone genealogy whose most recent six entries each end with the phrase "Taken by the Wood."',
   'The Veilwood elves know this family and will not speak of what happened; pressing hard with enough elven trust yields one Dreamwalker elder''s admission: "They asked us to teach them the thread. We did. Some things, once learned, cannot be unlearned."',
   0, 0, false),

  ('The Builder''s Ring', 'the-builders-ring', 'Veilwood', 'ruin', NULL,
   'A ring of sixteen low pre-Crown foundations in a circle two hundred feet in diameter in the Middle Wood, each about twenty feet across, showing signs of deliberate demolition by burning. The center is bare earth in a ten-foot circle where nothing grows, slightly cooler and finer-textured than surrounding soil.',
   'The Memory-Keepers'' oldest archive has a single entry "” added later, in a different hand "” translating as "the circle of the speakers," with no further explanation. Players speaking aloud in the bare center circle find their voice takes a moment longer to stop than it should.',
   0, 0, false),

  -- ============================================================
  -- SAPPHIRE COAST: COASTAL TOWNS AND FISHING VILLAGES
  -- ============================================================

  ('Saltmoor', 'saltmoor', 'Sapphire Coast', 'town', 3100,
   'The salt capital of the Sapphire Coast for three centuries, built around tidal salt flats that produce the finest sea salt on the continent. The Salt Guild holds collective ownership of the flats with every town family as a member, and Duchy taxes are always paid on time "” in salt.',
   'A Darian trade attachÃ© has been trying for two years to secure preferential pricing on Saltmoor salt for the Imperial legionary supply system; the Salt Guild has declined three times at Selene''s instruction, and someone higher than a trade attachÃ© in Caldrath is now involved.',
   0, 0, true),

  ('Pearlwater', 'pearlwater', 'Sapphire Coast', 'town', 1400,
   'A prosperous insular town inside a protected cove where warm and cold currents meet to create conditions for unusual oysters and occasional pearls, with pearl diving passed exclusively through family guild lines. The town hall floor is made of discarded oyster shells mortared and polished to a mirror shine.',
   'Three pearl divers have vanished in the last eight months "” not lost at sea but simply never surfacing from calm dives. The Guild has told no one outside the town because revealing the danger makes the beds public knowledge.',
   0, 0, true),

  ('Glasswind', 'glasswind', 'Sapphire Coast', 'town', 2200,
   'A prosperous artisan town producing the finest window glass and blown glass vessels on the coast using a furnace technique allegedly developed by a scholar who washed ashore two centuries ago with only a notebook of designs. The guildhall''s harbor-facing walls are glass-paneled and glow amber at sunset.',
   'The "scholar who washed ashore" was not a scholar; his notebook still exists in the master glassblower''s family, and its designs extend well beyond glass manufacturing into what a trained arcanist would recognize as enchantment schematics.',
   0, 0, true),

  ('Breakwater', 'breakwater', 'Sapphire Coast', 'town', 5800,
   'The working coast''s largest fishing community south of Dawnharbor, rough and self-reliant, serving as the Tide Gang''s southern anchor. Harbor master Corra Dex has a private understanding with the local Tide Gang cell that keeps the harbor operational and tax collectors moderately satisfied.',
   'One of Corra''s fishing boats, the Hardbottom, makes unusually short trips "” out at dusk, back before dawn with little fish and good coin. Corra knows and is not asking.',
   0, 0, true),

  ('Teal Cove', 'teal-cove', 'Sapphire Coast', 'hamlet', 680,
   'A small fishing village at the bottom of a cove that was productive a generation ago and isn''t anymore "” the deep-water shoals shifted south, half the families left, and the ones who stayed are older, harder, and considerably less welcoming to visitors. The harbormaster insists there is nothing interesting here.',
   'Teal Cove was a Tide Gang operational base twenty years ago; the "back way" that remaining villagers won''t explain is a tunnel to a sea cave used for moving contraband that has been inactive for fifteen years, which does not mean it is currently empty.',
   0, 0, false),

  ('Cinderport', 'cinderport', 'Sapphire Coast', 'town', 4600,
   'The northernmost significant harbor on the Sapphire Coast, at the boundary where the Duchy''s commercial framework gives way to less organized coastline, handling significant traffic from the Shattered Isles and vessels that change flags on approach. Two harbormasters operate: the official Duchy appointment and the one actual harbor pilots defer to.',
   'A Darian military vessel anchored three weeks ago for "routine inspection," did not find what it was looking for, and left two plainclothes observers behind who have been asking questions about north-coast traffic since.',
   0, 0, true),

  ('Salthook', 'salthook', 'Sapphire Coast', 'hamlet', 890,
   'A tight-knit fishing community four miles south of Tidecrest, sharing its anomalous fish behavior and maintaining a three-generation boundary dispute with Tidecrest that the Duchy cannot adjudicate. The fish disappearance has given both communities something to agree about for the first time in living memory.',
   'A Salthook elder has been telling anyone who will listen that the fish aren''t gone but are below "” visible from the clifftop at night, moving in patterns that don''t look like natural shoaling, lit by something faint beneath them. Nobody is listening yet.',
   0, 0, false),

  ('Westerngate', 'westerngate', 'Sapphire Coast', 'town', 2700,
   'A commercial waystation and freight hub exactly between Dawnharbor and the southern coast, the inland road to the Verdant Reach, and the Duchy and looser-attached communities. Merchants from four regions maintain warehouses here; nobody is from Westerngate but everyone passes through it.',
   'A specific warehouse (house mark 14, registered to the Aldren trading company) has been receiving sealed crates from Darian Imperial trade ships logged as "mineral samples" "” their actual contents have not been inspected by anyone with authority to understand what they are.',
   0, 0, true),

  ('Porto Verde', 'porto-verde', 'Sapphire Coast', 'town', 3900,
   'A prosperous wine town on coastal hillside vineyards producing the white variety served in Caldrath''s patrician houses and Vaelthorn''s better halls. Three of the five senior vintner families have a member in Dawnharbor''s administrative structure and are strongly pro-Selene.',
   'The eldest vintner, Marca Duve, is an original Black Rose founder who helped Selene design the network''s communication protocols twenty years ago and is the only person outside Dawnharbor who knows the location of Archive Copy 2.',
   0, 0, true),

  ('Greyanchor', 'greyanchor', 'Sapphire Coast', 'hamlet', 1100,
   'A settlement built on a broad natural rock ledge accessible only by boat in permitting weather, descended from fishers who found the ledge and decided the isolation was worth the inconvenience. The Tide Gang has never established a presence here after three attempts were rebuffed.',
   'Greyanchor''s fishing grounds sit directly over the Needles Current; in bad weather things come up in nets, and the community has a practice of unknown origin "” old enough that no one knows why "” of putting back anything that didn''t swim into the net voluntarily.',
   0, 0, false),

  -- ============================================================
  -- SAPPHIRE COAST: ISLANDS AND OFFSHORE FEATURES
  -- ============================================================

  ('Amberisle', 'amberisle', 'Sapphire Coast', 'town', 800,
   'The largest island in the Coast''s offshore waters, four miles across with a protected eastern harbor and a western lighthouse, hosting lighthouse keepers, fishers, a boatyard, and a temple to Pelanar that is significantly more elaborately maintained than its economic position would suggest.',
   'The western lighthouse keeper Rael has been logging unusual lights moving below the sea surface "” not ships "” for eleven years, with the frequency increasing. Selene also uses Amberisle''s transient sailor population as cover for Black Rose courier traffic.',
   0, 0, true),

  ('The Needles', 'the-needles', 'Sapphire Coast', 'geographic', NULL,
   'Three white limestone sea stacks rising 200 feet from the water, the Sapphire Coast''s most recognized landmark appearing on Duchy seals and merchant emblems, surrounded by the dangerous Needles Current and submerged wrecks visible through clear water.',
   'The oldest wreck visible near the Needles predates any recorded maritime traffic on the Sapphire Coast by at least 400 years, and its hull design matches nothing in the Dawnharbor maritime archives.',
   0, 0, false),

  ('Copperveil Island', 'copperveil-island', 'Sapphire Coast', 'religious', NULL,
   'A steep cliff-edged island accessible only by a single stone staircase cut into the rock, home to the Monastery of the Copper Veil whose monks study tides, stars, and "the patterns beneath patterns." The monastery''s library is reputed to be the largest private collection on the coast.',
   'Three months ago the monthly supply ship found the dock empty, the staircase blocked from above, and no response to signals. Selene dispatched an investigator who returned with a sealed report she has not acted on publicly.',
   0, 0, true),

  ('The Grey Sisters', 'the-grey-sisters', 'Sapphire Coast', 'geographic', NULL,
   'Five flat rock outcroppings fifteen miles offshore from Cinderport, too small for permanent habitation but used by smugglers as staging points for the Shattered Isles run and by ships taking the inner coast route to avoid Cinderport''s harbor fees.',
   'The largest Sister, called First Grey, has a natural hollow in its rock too regular to be natural "” the correct size and shape to be an entrance to something below the waterline.',
   0, 0, false),

  ('Hermit''s Rock', 'hermits-rock', 'Sapphire Coast', 'geographic', NULL,
   'A single isolated sea stack two miles offshore from Teal Cove, home to one man who has lived there for at least fifteen years, fishes from a tiny ledge, collects rainwater, and occasionally shouts at passing ships in an unrecognized language. Three attempts by Duchy officials to remove him ended in retreat.',
   'The Hermit is a former Arcane Vanguard officer who deserted with classified documents twelve years ago; he has been on the rock for exactly as long as the Vanguard''s eastern mapping surveys have been active, and the Vanguard has not publicly acknowledged looking for him.',
   0, 0, false),

  ('The Drowned Arch', 'the-drowned-arch', 'Sapphire Coast', 'ruin', NULL,
   'A large architectural arch of white decorated stone that projects six feet above the waterline at low tide one mile offshore from Porto Verde, made in a style matching nothing on the coast. Divers report foundations extending significantly east and west below the sand.',
   'The arch''s decorative patterns match exactly the pre-Litorin script on the Sanctum of the Unwritten in the Darian Empire "” nobody on the Sapphire Coast knows this.',
   0, 0, false),

  -- ============================================================
  -- SAPPHIRE COAST: NOBLE AND MERCHANT HOUSE SEATS
  -- ============================================================

  ('Varneth Hall', 'varneth-hall', 'Sapphire Coast', 'noble_seat', NULL,
   'The seat of House Varneth on the Amber Bluffs six miles north of Dawnharbor, the most expensive address on the coast. Lord Edric Varneth controls the largest private merchant fleet on the coast "” forty-three ships "” and is one of the handful of people who knows he works for the Black Rose.',
   'The Varneth shipping ledgers contain records of three transactions with counterparties that would reveal the Shadow Cabal''s commercial logistics network; Edric doesn''t know what he recorded, Selene does, and she has been waiting six years for the right moment.',
   0, 0, true),

  ('The Duvenne Exchange', 'the-duvenne-exchange', 'Sapphire Coast', 'noble_seat', NULL,
   'House Duvenne''s town house in Dawnharbor''s commercial quarter and their operational base for controlling the coast''s spice and luxury goods trade. Merchant-Lady Sova Duvenne has been in preliminary discussions with Darian trade attachÃ©s about a preferential commercial framework.',
   'Sova received a sealed communique from Caldrath six weeks ago, read it once, burned it, and has been noticeably more cautious in public settings since. Selene is aware of the Darian discussions and has not intervened, which Sova correctly reads as a warning.',
   0, 0, true),

  ('Carreth Keep', 'carreth-keep', 'Sapphire Coast', 'noble_seat', NULL,
   'A small fortified manor on the coastal road north of Breakwater, seat of House Carreth "” old coastal nobility predating the Duchy. Lord Bram Carreth allows the Tide Gang''s upper leadership to use the outbuildings for meetings requiring protection from Duchy interference, recording the payments as "tenant income."',
   'Bram Carreth''s younger sister Lena is a fully operational Black Rose asset who believes her brother doesn''t know she works for Selene. He does know. Neither has acknowledged this to the other.',
   0, 0, true),

  ('Talber Point', 'talber-point', 'Sapphire Coast', 'noble_seat', NULL,
   'A cliff-top manor on the headland north of Cinderport with views of fifty miles of coastline, seat of House Talber who holds the hereditary lighthouse commission for six northern lighthouses. Lady Maren Talber shares unusual maritime observations with a Dawnharbor contact she believes is a personal arrangement.',
   'Maren''s lighthouse keeper at the northernmost station, a man named Vor, has been signaling ships at night with his own unauthorized pattern; one responding ship is from the Free Isles Compact, one is not.',
   0, 0, true),

  -- ============================================================
  -- SAPPHIRE COAST: CRIMINAL AND SMUGGLER LOCATIONS
  -- ============================================================

  ('The Salted Anchor', 'the-salted-anchor', 'Sapphire Coast', 'inn', NULL,
   'A combined tavern and warehouse on Breakwater harbor''s south end serving as the Tide Gang''s Breakwater headquarters. The tavern serves fishers and sailors on the ground floor; upper floors and the full-width cellar are Tide Gang operational space. Owner Patch is the local cell leader.',
   'Patch recently received an unexpected delivery "” a crate addressed to her in Tide Gang cipher from a Caldrath sender she has never dealt with. The crate is in the cellar. She hasn''t opened it.',
   0, 0, false),

  ('Cutter''s Cove', 'cutters-cove', 'Sapphire Coast', 'geographic', NULL,
   'A natural sea cave with a broad internal shelf accessible at any tide for shallow-draft vessels and protected from visual observation by cliff configuration, used for contraband staging for at least eighty years. The Tide Gang maintains it with cached fresh water, hull repair equipment, and a compromise code system.',
   'The Duchy''s chart office has no record of Cutter''s Cove. Selene''s personal charts have it marked in red with the eleven-year-old notation, in her own handwriting: "do not act on this without consultation."',
   0, 0, false),

  ('The Westerngate Blind', 'the-westerngate-blind', 'Sapphire Coast', 'working_site', NULL,
   'A warehouse in Westerngate''s freight district registered to a courier company, serving as the Tide Gang''s financial nerve center where criminal income is laundered through legitimate-looking commercial entities. The Gang''s accountant Aldis Croft has an impeccable legal record and pays taxes on time.',
   'Aldis Croft made a complete copy of the Gang''s financial ledgers eighteen months ago. He has not decided what to do with it and has not yet found anyone he trusts enough to give it to.',
   0, 0, false),

  ('The Chapel Gap', 'the-chapel-gap', 'Sapphire Coast', 'geographic', NULL,
   'A half-mile sea channel between two rocky points seven miles south of Pearlwater, narrow enough that two medium vessels cannot pass simultaneously and impassable in rough weather "” avoided by the excise cutter and used by Tide Gang smaller boats as a standard evasion route.',
   'Selene has denied the second excise cutter request not to protect the Tide Gang but to maintain a Gap route that the Black Rose uses for its most sensitive courier traffic, operating under Tide Gang cover.',
   0, 0, false),

  ('The Dark Lantern', 'the-dark-lantern', 'Sapphire Coast', 'working_site', NULL,
   'A legitimate ship chandlery on Breakwater''s north docks with an excellent reputation for quality goods. Owner Kess Hallom''s locked back storeroom serves as a Tide Gang message dead-drop between courier runs; she has never read any of the messages and considers not reading them sufficient moral distance.',
   'One current message waiting for pickup arrived through proper channels but is in a cipher the Tide Gang does not use "” it came from outside the Gang''s network. Kess noticed the difference and is waiting to see if whoever placed it comes back.',
   0, 0, false),

  -- ============================================================
  -- SAPPHIRE COAST: RUINS AND WRECKS
  -- ============================================================

  ('Fort Corsair', 'fort-corsair', 'Sapphire Coast', 'ruin', NULL,
   'The remains of a pirate fortress built approximately three hundred years ago by the Corsair Lords on the headland north of Cinderport, its main tower collapsed a century ago but outer walls standing to eight feet. The Duchy maintains it as a historical site; teenagers use it for unsanctioned gatherings.',
   'The Corsair Lords used the fort''s sea-level foundation access as a vault for three generations of pirate wealth; the entrance was sealed when the fort fell, and a local fisherman recently found what appears to be a section of the original access mechanism exposed by winter erosion.',
   0, 0, false),

  ('The Amber Crown', 'the-amber-crown', 'Sapphire Coast', 'ruin', NULL,
   'The merchant vessel Amber Crown, sunk 140 years ago in a storm while carrying goods falsely manifested as "decorative articles," resting nearly intact in twenty feet of clear water one mile off Porto Verde. Its cargo hold''s enchanted locking mechanism remains active after 140 years.',
   'The Amber Crown''s actual cargo was five sealed boxes commissioned by a Sentinel Order chapter in Vaelthorn and addressed to a recipient at a location that no longer exists. The Sentinel Order has not forgotten this shipment.',
   0, 0, false),

  ('The Dark Lighthouse', 'the-dark-lighthouse', 'Sapphire Coast', 'ruin', NULL,
   'A lighthouse on Amber Headland that went dark ninety years ago after its keeper vanished, decommissioned and replaced but still standing intact. Adults who enter report the lamp room contains no dust, no bird nesting, no weather damage, and smells faintly of brine on windless days with sealed windows.',
   'The missing keeper''s logbook was never found; a Black Rose archive entry from eleven years ago notes the logbook was located "in private hands "” potentially significant "” acquisition under consideration." The entry has been flagged but not acted on.',
   0, 0, false),

  ('The Salted Chapel', 'the-salted-chapel', 'Sapphire Coast', 'ruin', NULL,
   'An abandoned religious structure on the coast road between Westerngate and Breakwater, too large for a shrine and too small for a temple, salt-crusted despite being a quarter mile from the water. Its inscription is in a pre-unification religious language Pelanar''s current clergy do not use.',
   'The pre-unification tradition the chapel represents was not actually about Pelanar but about a second figure the official religious synthesis deliberately submerged into the iconography "” one specifically associated with lighthouses going dark. No surviving text records what this figure represents.',
   0, 0, false),

  ('The Pearlwater Beds Old Deep Wreck', 'the-pearlwater-beds-old-deep-wreck', 'Sapphire Coast', 'ruin', NULL,
   'A wreck in eighty feet of water below the visible Needles wreck, too deep for standard pearl diving, with a hull design unlike anything on the coast and somehow preserved timber alongside cargo containers made of a material "” neither wood nor metal "” that has faint luminescence at depth.',
   'Pearlwater divers recently brought up a fragment of one container; the Glasswind artisan who analyzed it spent three days with it then urgently requested an introduction to anyone who might know what it was. The Dawnharbor arcanist who eventually saw it went pale and asked how recently it had been recovered.',
   0, 0, false),

  -- ============================================================
  -- SAPPHIRE COAST: GEOGRAPHIC FEATURES
  -- ============================================================

  ('Amber Headland', 'amber-headland', 'Sapphire Coast', 'geographic', NULL,
   'The great promontory south of Dawnharbor whose amber-colored limestone cliffs give the Amber Bluffs district its name, extending three miles into the sea and hosting the Dark Lighthouse at its seaward tip. The water below the cliff face reaches 200 feet depth within a hundred yards of the cliff.',
   'Duchess Selene''s estate sits atop the headland with commanding views of the coast; the unusual depth of the water directly below the cliff face has never been adequately explained by local geology.',
   0, 0, false),

  ('Sapphire Current', 'sapphire-current', 'Sapphire Coast', 'geographic', NULL,
   'The warm ocean current running north along the shore from the tropical south that defines the Coast''s climate, moderates temperatures, produces the distinctive blue-green water quality, and drives the predictable trade winds that make sailing reliable. It is strongest in summer and weakest in late winter.',
   'Sailors who know the Current''s variations can shave days off coast-run transit times; those who don''t can find themselves pushed offshore at inopportune moments during the current''s late-winter weakening.',
   0, 0, false),

  ('Needles Current', 'needles-current', 'Sapphire Coast', 'geographic', NULL,
   'A cold counter-current running inshore below the Sapphire Current, generated by upwelling around the Needles sea stacks and creating the most productive fishing grounds on the coast "” the conditions behind Pearlwater''s oyster beds and Tidecrest''s historically reliable fish shoals.',
   'The anomalous fish behavior in the Tidecrest region correlates precisely with a shift in the Needles Current''s depth profile that began three years ago; whatever is affecting the current is below the depth that conventional sea surveys reach.',
   0, 0, false),

  ('The Cradle', 'the-cradle', 'Sapphire Coast', 'geographic', NULL,
   'A large protected bay roughly twenty miles across midway along the coast, formed where the coast curves inward between two headlands, deep and well-protected but with no river outlet, no easy fresh water source, and no hinterland access "” so never settled, but heavily used for anchorage.',
   'The Duchy maintains nominal claim to the Cradle and has never stationed anyone in it; ships wanting to wait out weather, make repairs, or conduct business they prefer not to conduct in official harbors use it freely.',
   0, 0, false),

  ('Cape Dawnlight', 'cape-dawnlight', 'Sapphire Coast', 'geographic', NULL,
   'The northernmost significant headland before Cinderport, named for the way dawn light strikes its white quartz cliffs first each morning making it visible from ships at sea before the rest of the coast becomes distinct. Ships coming south from the northern sea use it as their primary waypoint.',
   'The Talber lighthouse on the cape is the one whose keeper Vor has been signaling ships at night with unauthorized patterns "” one responding ship is from the Free Isles Compact, and one is not.',
   0, 0, false)

ON CONFLICT (slug) DO NOTHING;


-- Batch 3: Dreadspire Peaks + Ashen Marches + Shattered Isles locations
INSERT INTO locations (name, slug, region, location_type, population, description, dm_notes, map_x, map_y, is_major)
VALUES

  -- ============================================================
  -- DREADSPIRE PEAKS "” Mountain Passes
  -- ============================================================

  ('Vaengrath''s Throat', 'vaengraths-throat', 'Dreadspire', 'geographic', NULL,
   'The widest and lowest pass in the Peaks, the only viable trade route through the northern third of the range and the sole pass usable by armies. Controlled by Giant chieftain Gruldrak Half-Ear, who charges silver tolls posted beside the skull of the last merchant who argued.',
   'Gruldrak has started accepting information as partial payment, building a picture of Aranthor''s military movements he has not shared with Varkhul "” possible betrayal or leverage play.',
   0, 0, false),

  ('The Ashknife Pass', 'the-ashknife-pass', 'Dreadspire', 'geographic', NULL,
   'A narrow, poorly sheltered pass connecting the Ashen Marches foothills to the Dreadspire interior near Coldrun, passable only seven months a year. The stretch between its second and third switchbacks is called "the kill-zone" by guides because Vaul-Khesh influence causes escorts to murder those in their care.',
   'A Sentinel Order researcher believes the betrayals only trigger between people who have made an explicit oath within the preceding 24 hours "” a correlation too specific to be coincidence.',
   0, 0, false),

  ('Ironback Ridge', 'ironback-ridge', 'Dreadspire', 'geographic', NULL,
   'A series of connected ledge-routes used by smugglers and deserters to avoid Vaengrath''s Toll; impassable eight months of the year. Every major smuggling network in the Peaks holds a hand-drawn map of the route.',
   'Someone has been adding false waymarkers that only reveal themselves as wrong after six hours of travel "” three smuggling parties have disappeared this season and the markers appear freshly carved.',
   0, 0, false),

  ('Wraithcol Pass', 'wraithcol-pass', 'Dreadspire', 'geographic', NULL,
   'A southern pass open only four months a year, traversing the edge of Vaul-Khesh''s Scar where the influence is so dense the stone has developed an iridescent "betrayal-glass" sheen. Travelers report hearing a second voice pointing out which companions cannot be trusted.',
   'Varkhul has sealed the pass entrance with a thirty-foot stone block after a march of 400 soldiers through it killed all officers and left only 63 survivors. Someone is quietly clearing a route around the block.',
   0, 0, false),

  ('The Deepborn Gate', 'the-deepborn-gate', 'Dreadspire', 'ruin', NULL,
   'A set of forty-foot carved stone doors, hidden behind a false rockfall, that once served as the main trade artery of the House Drakor dwarven kingdom. The doors open onto a vast tunnel network connecting every major Stone-Speaker city beneath the range "” the cities are abandoned, but something has moved in.',
   'A dwarven clan has sent scouts to assess whether the tunnels could be reclaimed; their intercepted letter to the Sentinel Order suggests they seek something specific that House Drakor left behind in CR 510.',
   0, 0, false),

  ('Coldtooth Col', 'coldtooth-col', 'Dreadspire', 'geographic', NULL,
   'A narrow saddle between Dreadcrown and its secondary summit, passable roughly six weeks a year by experienced mountaineers carrying minimal gear. It connects the deep Peaks to uninhabited northern ice fields and is used only by those who need to disappear completely "” or those hunting them.',
   'A Sentinel courier used this route three years ago and never arrived; their pack with message intact was found in a crevasse, addressed to someone dead for ten years and describing events six months in the future.',
   0, 0, false),

  -- ============================================================
  -- DREADSPIRE PEAKS "” Mining Settlements
  -- ============================================================

  ('Ironhame', 'ironhame', 'Dreadspire', 'village', 900,
   'The largest iron operation in the Peaks, built into a natural shelf on the eastern face of the range. It functions as a genuine settlement with a market, healer, and three taverns because consistent skilled labor requires giving miners something to stay for.',
   'A recent deep shaft broke into older Stone-Speaker tunnels with inscriptions; the shift boss sealed the shaft before anyone could read them, and a miner who glimpsed the inscription will talk for a meal and discretion.',
   0, 0, false),

  ('Silverlock', 'silverlock', 'Dreadspire', 'working_site', 340,
   'Varkhul''s personal silver extraction operation, so prized that no local chieftain takes tribute and Giant guards rotate every thirty days to prevent relationships forming with workers. A significant portion of the silver is loaded onto covered sleds heading into the high Peaks on routes absent from any tribute manifest.',
   'A former worker claims the silver sleds don''t go north to Frostgale but turn east toward Wraithcol Pass "” and the thing driving one noticed her surveillance well before she expected, and it was not a Frost Giant.',
   0, 0, false),

  ('Coalpit Sorrow', 'coalpit-sorrow', 'Dreadspire', 'working_site', 280,
   'A fuel camp producing coal for Ironhame''s smelters and Frostgale''s hearths, where workers labor in seams so low only humans can work them. The settlement is less a community than a population broken in slightly different ways, with an average worker tenure of four years before breakdown.',
   'A young woman keeps a count of workers'' names written in coal dust on her bunk boards, the only act of memory in a place designed to prevent it "” she has run out of room twice and started over without knowing why.',
   0, 0, false),

  ('Gemcut Warren', 'gemcut-warren', 'Dreadspire', 'working_site', 450,
   'A forced labor camp in the functional sense "” workers cannot leave, receive food instead of wages, and appear on Giant manifests as inventory. Gemstones go entirely to Frostgale Keep in quantities exceeding any decorative or trade purpose, overseen by the terrifyingly patient Giant Thordrak.',
   'Workers have built a secret gestural sign language over two generations that the Giants don''t recognize as communication; workers across the Peaks identify each other by three specific gestures, and they are building something.',
   0, 0, false),

  ('Copperfall', 'copperfall', 'Dreadspire', 'village', 520,
   'A copper town that predates the Frost Giant occupation by at least a century, giving it a quality others lack: memory. Pre-conquest miners'' marks on the walls, pre-conquest naming conventions in side streets, and a festival calendar that does not match any Giant-approved holiday survive here.',
   'Beneath the oldest shaft, a sealed room bears a House Drakor inscription reading "What we could not take with us, we leave for those who come with better questions."',
   0, 0, false),

  ('Ashgrit', 'ashgrit', 'Dreadspire', 'hamlet', 180,
   'A low-yield settlement producing iron, road gravel, and quarried stone that Giant overseers have stopped visiting regularly, making it semi-independent through sheer economic irrelevance. It still sends a slightly-short tribute cart north twice a year to maintain the fiction it''s worth watching.',
   'A Sentinel Order courier left a sealed document three months ago with the village elder, with instructions to give it to "the ones who come asking the right questions" "” the elder is still waiting.',
   0, 0, false),

  ('Deepvein Crossing', 'deepvein-crossing', 'Dreadspire', 'village', 640,
   'A genuine crossroads at the junction of three shelf-routes through the Peaks, giving it unusual trader and information traffic. Residents have developed an elaborate system for making the settlement look smaller and less prosperous than it is during quarterly Giant census visits.',
   'The last census-taker asked about a specific Stone-Speaker title rather than a person; the tavern keeper recognized the words and is getting dangerously close to understanding why Varkhul is asking about House Drakor vocabulary.',
   0, 0, false),

  ('The Tallow Works', 'the-tallow-works', 'Dreadspire', 'working_site', 95,
   'A rendering operation processing animal byproducts from Giant hunting camps and human herders into candles, soap, and rendered fat "” the unglamorous infrastructure of Peak survival. Because their product goes everywhere, their gossip does too.',
   'A new worker who has clearly never rendered fat in his life is obviously learning on the fly while listening to everything "” he works for either the Sentinel Order or someone considerably more dangerous.',
   0, 0, false),

  ('Greyshaft', 'greyshaft', 'Dreadspire', 'working_site', 310,
   'An obsidian extraction settlement in an eleven-year ownership dispute between Varkhul and Chieftain Vharnek, whose residents have mastered being simultaneously useful to both parties. The obsidian has a secondary property: it disrupts Vaul-Khesh''s ley-channels, giving Greyshaft the lowest rate of Turning incidents in the range.',
   'A geomancer believes the volcanic obsidian can shield people, buildings, and ritual spaces from Vaul-Khesh''s influence and is looking for funding to test the theory "” she''s been quietly shopping it.',
   0, 0, false),

  -- ============================================================
  -- DREADSPIRE PEAKS "” Frost Giant Holdings
  -- ============================================================

  ('Coldmantle Hall', 'coldmantle-hall', 'Dreadspire', 'noble_seat', NULL,
   'The half-underground fortress-hall of Chieftain Ssolvara the Spear-Broken, controlling the southern Peaks above the Ashen Marches. Built for efficiency rather than grandeur, Ssolvara pays tribute on schedule while quietly building an exit "” she has sent messengers to Ashval twice in five years.',
   'Ssolvara knows something about Varkhul''s plans she hasn''t shared, holding the information as leverage while planning her own betrayal; she will share it for the right price.',
   0, 0, true),

  ('Rimecrag Hold', 'rimecrag-hold', 'Dreadspire', 'noble_seat', NULL,
   'The above-cloud-line fortress of Chieftain Vharnek Stonehands, Varkhul''s most straightforwardly loyal subordinate, built at extreme altitude adorned with human weapons stripped from their owners. His genuine loyalty makes him the most useful chieftain for Vaul-Khesh to redirect.',
   'Vharnek received a dream-message telling him Ssolvara is sabotaging his Greyshaft claim "” a lie, but he now watches her carefully, positioning two loyal chieftains to destroy each other through Vaul-Khesh''s manipulation.',
   0, 0, true),

  ('Blisterstone Seat', 'blisterstone-seat', 'Dreadspire', 'noble_seat', NULL,
   'The holding of Olgrak the Waiting, who was the dominant warlord of the northern Peaks before Varkhul unified the clans twenty years ago. Closest Giant holding to Frostgale Keep, Olgrak has never privately accepted his defeat and has been waiting "” though for what, he is no longer sure.',
   'Olgrak has begun leaving useful gifts for human travelers at crossroads with no explanation "” something has changed his calculation about who the useful allies are after fifteen years of silence.',
   0, 0, true),

  ('Hailcrest Redoubt', 'hailcrest-redoubt', 'Dreadspire', 'noble_seat', NULL,
   'The fortress of Chieftain Drevka Icemane in the eastern Peaks above the Aranthor approaches, the de facto staging ground for any Giant incursion into human territory. Drevka has studied the Aranthor succession crisis for twelve years and is waiting for Varkhul to commit forces before she moves east.',
   'Drevka has a human spy in Aranthor exchanging information for family protection "” the spy wants out, Drevka has already categorized their family as acceptable losses, and neither the spy nor the family knows this.',
   0, 0, true),

  ('Frostmere Lodge', 'frostmere-lodge', 'Dreadspire', 'noble_seat', NULL,
   'The holding of Bragnor Two-Voice, a formerly reliable chieftain who spent three nights camped near Vaul-Khesh''s Scar and now hears a second voice telling him what every speaker actually means. Closest Giant holding to the Scar, the stone inside has developed betrayal-glass veining.',
   'Bragnor''s second voice has given him a specific task: find a human matching a very precise description and bring them to the Scar alive "” the description includes a crescent scar on the left wrist.',
   0, 0, true),

  ('Greycrest Outpost', 'greycrest-outpost', 'Dreadspire', 'noble_seat', NULL,
   'The small, utilitarian western-Peaks holding of Svendra the Young, who inherited command three months ago when her father died of unclear causes. The youngest chieftain in Varkhul''s confederation, she is being watched by everyone for manipulation opportunities and is handling the pressure with unexpected composure.',
   'Svendra knows her father was murdered and has narrowed suspicion to three possible chieftains; she is quietly excellent at this kind of thinking and open to outside help from those who want the same answer.',
   0, 0, true),

  -- ============================================================
  -- DREADSPIRE PEAKS "” Human Settlements
  -- ============================================================

  ('Thorngate', 'thorngate', 'Dreadspire', 'town', 620,
   'The only human settlement in the Peaks that maintained formal independence until CR 801, holding a charter from House Valemont; Varkhul revoked it by standing on it. The settlement''s stone gatehouse still bears the Valemont crest, never defaced, an act of quiet defiance no one has reported to Varkhul.',
   'Behind a false wall in the gatehouse are complete pre-occupation land records for the eastern Peaks "” who owned what, which mines predate Giant control "” that could form a postwar legal framework; the family that hid it is still here and waiting.',
   0, 0, false),

  ('Highwatch', 'highwatch', 'Dreadspire', 'village', 210,
   'A cliff-cut ledge settlement with a defensible position even Frost Giants find difficult to approach, maintained by an eleven-year protection arrangement with rogue Giant Kuldraan the Thin. Highwatch provides Kuldraan with intelligence from their excellent sightlines; Kuldraan keeps Varkhul''s tax collectors away.',
   'Kuldraan has received an alliance approach from Chieftain Olgrak that could make his Highwatch arrangement a liability "” Highwatch doesn''t know, and Kuldraan is genuinely uncertain about the right choice.',
   0, 0, false),

  ('Ashford-Below', 'ashford-below', 'Dreadspire', 'village', 380,
   'A compliant-seeming village in a narrow valley at the Peaks'' descent toward the Ashen Marches, lightly watched by Giants due to its marginal location. It secretly maintains the Ashford Archive "” a lineage of oral historians who have memorized the pre-conquest history of the Peaks generation by generation.',
   'The archive''s keeper, elderly Maret, has memorized a description of the "Deep Name-Stone," a Stone-Speaker monument inscribed with what sound like every entity bound in the First Binding "” vocabulary the Sentinel Order would recognize immediately.',
   0, 0, false),

  ('The Ledge', 'the-ledge', 'Dreadspire', 'village', 450,
   'A natural shelf settlement with views in three directions that has been occupied continuously for over four hundred years, outlasting three chieftain dynasties. Its residents have a cultural philosophy of accommodation and patience "” they have been waiting for four centuries and will wait more.',
   'The council keeps a record not of tribute paid but of every concession extracted, building a picture of what Frostgale actually cares about and where the real pressure points are "” it has never been asked for, and it is available.',
   0, 0, false),

  ('Refugehome', 'refugehome', 'Dreadspire', 'hamlet', 95,
   'A tent camp outside Coldrun sheltering survivors from Embervale, destroyed by Varkhul three months ago as a demonstration for missing two tribute quotas. Mostly children whose adults died getting them out, with a handful of survivors, and no path back to what they were.',
   'A twelve-year-old survivor saw the raid''s leading Giant searching the ruins for something specific, finding it, and keeping it separate from the tribute "” she has told no one because she lacks the vocabulary for what she saw.',
   0, 0, false),

  ('Coldrun', 'coldrun', 'Dreadspire', 'city', 2400,
   'The largest human settlement in the Peaks, built into a cliff face over three natural terraces corresponding roughly to economic strata: market and inn at bottom, residential and craft in the middle, administrative at top. Functions as the de facto capital of human life in the Peaks by scale and density.',
   'Coldrun has a black market, an underground handbill newspaper, and a philosophical society debating whether accommodation is collaboration "” the Giants garrison the ridge above but daily life has real texture.',
   0, 0, true),

  ('Stonemarrow', 'stonemarrow', 'Dreadspire', 'village', 290,
   'A settlement built inside an abandoned House Drakor transit station from the Stone-Speaker tunnel network, with six-foot walls of obsidian-composite construction that resist both weather and Vaul-Khesh''s influence. It has no Turning incidents and no explanation for why "” residents simply know this patch is safe and do not tell overseers.',
   'A scholar requesting access to take rubbings of Stone-Speaker inscriptions works for an Aranthor university but has recently been seen meeting with someone from the Darian Empire "” residents want to know which relationship is real.',
   0, 0, false),

  -- ============================================================
  -- DREADSPIRE PEAKS "” Ruins and Battlefields
  -- ============================================================

  ('Drakor''s Last Citadel', 'drakors-last-citadel', 'Dreadspire', 'ruin', NULL,
   'The seat of House Drakor''s final king, carved from living rock, abandoned in CR 510 when the dwarven kingdom destroyed itself through Vaul-Khesh-amplified betrayal. The gates are sealed from the inside and have not been opened in three hundred years; two Giant expeditions turned back after hearing sounds of tools on stone within.',
   'The sounds of rhythmic tool-work on stone are still happening inside the sealed Citadel "” whatever is within has been working on something for three hundred and thirty-seven years.',
   0, 0, true),

  ('The Field of Last Standards', 'the-field-of-last-standards', 'Dreadspire', 'ruin', NULL,
   'A high valley battlefield where the last free human army was destroyed in CR 767 when three of six allied commanders turned simultaneously on General Aldrath Harmon in the first documented mass Turning incident. Varkhul''s captured battle flags still hang on the approach road to Frostgale Keep.',
   'Harmon''s great-granddaughter is alive in Coldrun, working as a cartographer, and has spent twenty years mapping ley-nodes against Turning incidents "” she believes she''s found a pattern that would have changed the battle''s outcome.',
   0, 0, false),

  ('The Hollow Spire', 'the-hollow-spire', 'Dreadspire', 'geographic', NULL,
   'A hollow volcanic rock needle rising four hundred feet above a high plateau, a natural resonance chamber charged by Vaul-Khesh''s ley-channels for centuries. Travelers at its base see moving images in the stone''s surface "” shadow-theatre of betrayal scenes, playing silently; seventeen of forty-two documented visions depicted events not yet occurred when reported.',
   'One of the vision-scenes shows a group of approximately five travelers in nondescript clothing standing at a ritual site, one turning on the others "” dated by a Sentinel scholar to "the present period" by clothing style.',
   0, 0, false),

  ('Drakor''s Wall', 'drakors-wall', 'Dreadspire', 'ruin', NULL,
   'Ruins of House Drakor''s defensive line running sixty miles across the central Peaks, varying from tumbled stone to nearly intact twenty-foot walls with guard turrets. The garrison abandoned their posts the night before the Giant crossing in CR 520 with no attack, no threat, and no message "” every soldier simply decided to leave simultaneously.',
   'Within an intact section is a garrison commander''s log that ends mid-sentence mid-word on the night before the crossing; the date appears in three documented Hollow Spire visions.',
   0, 0, false),

  ('The Unmarked Graves', 'the-unmarked-graves', 'Dreadspire', 'ruin', NULL,
   'A long earthen mound on the western edge of the Field of Last Standards holding eight hundred human soldiers including General Harmon, intentionally unmarked by Varkhul''s order so it could not become a shrine or rally point. Over eighty years, residents have accumulated small stones into an unmistakable cairn at the eastern end.',
   'Varkhul knows about the cairn and has not ordered its removal "” a restraint the Sentinel Order has noted as significant, since Varkhul almost never shows restraint without reason.',
   0, 0, false),

  ('Splitrock Shrine', 'splitrock-shrine', 'Dreadspire', 'religious', NULL,
   'A fifteen-foot-wide natural split in a major rockface, sixty feet deep, with carved stone at its base predating every known civilization''s presence in the Peaks. The influence here is dense enough to be physically tangible; animals refuse to enter, Giants avoid it, and a Sentinel research team all resigned within a year of returning.',
   'The pre-Binding symbols at the base include one that appears in the Sentinel Order''s most restricted archive associated specifically with the First Binding oath-sealing process "” if Splitrock was an anchor site, it''s the only one identified above ground, and its state suggests the anchor didn''t hold cleanly.',
   0, 0, false),

  -- ============================================================
  -- DREADSPIRE PEAKS "” Geographic Features
  -- ============================================================

  ('Dreadcrown Peak', 'dreadcrown-peak', 'Dreadspire', 'geographic', NULL,
   'The tallest mountain in Aeloria at 18,400 feet, its summit perpetually obscured by cloud cover that does not move with prevailing winds. The Sentinel Order has proposed the summit sits directly above the densest section of Vaul-Khesh''s ley-network.',
   'No recorded expedition has reached the summit in three centuries; the permanent, specific cloud cover behaves as if deliberate rather than meteorological.',
   0, 0, false),

  ('The Greymarch Glacier', 'the-greymarch-glacier', 'Dreadspire', 'geographic', NULL,
   'The largest glacier in the Peaks, seven miles long and three miles wide, retreating for thirty years after a multi-century pause. Its spring melt last year exposed a section of valley floor last seen approximately five hundred years ago, revealing a Stone-Speaker city in near-perfect flash-frozen preservation.',
   'The exposed Stone-Speaker city is structurally intact, sealed under ice before organic decomposition could occur "” an undisturbed archaeological site of the first order.',
   0, 0, false),

  ('The Aelwynn Run', 'the-aelwynn-run', 'Dreadspire', 'geographic', NULL,
   'The headwaters of the River Aelwynn "” the longest river in Aeloria "” beginning at the Greymarch Glacier base and collecting flow from a dozen subsidiary streams before exiting the Peaks near Ironhame. Half of Aranthor''s irrigation depends on the Aelwynn downstream.',
   'Water quality degrades significantly below Ironhame and Copperfall due to mining runoff; the Sapphire Coast has filed formal complaints for forty years.',
   0, 0, false),

  ('Gorgemaw', 'gorgemaw', 'Dreadspire', 'geographic', NULL,
   'A natural canyon two hundred feet wide and three hundred feet deep that every route to Frostgale Keep must cross. The only crossing is a Giant-built stone-slab bridge called "Varkhul''s Courtesy" "” local parlance for things that will definitely kill you but probably not today.',
   'No army has made it to Gorgemaw in eighty years; it is the outer gate of Frostgale Keep''s approach and the primary strategic chokepoint for any assault on the fortress.',
   0, 0, false),

  ('The Whiteshell Valley', 'the-whiteshell-valley', 'Dreadspire', 'geographic', NULL,
   'A sheltered high valley with less wind and slightly more sun than surrounding Peaks, used as pasture for eight hundred years and currently home to three semi-nomadic herding families who move animals between Whiteshell and lower pastures seasonally. Giants leave them alone for their logistical utility.',
   'The herding families know every path in the range at ground level "” an intelligence asset that any party moving through the Peaks should consider cultivating.',
   0, 0, false),

  ('The Iceblood Pools', 'the-iceblood-pools', 'Dreadspire', 'geographic', NULL,
   'Three connected glacial meltwater pools stained red by iron-oxide runoff from a high-iron substrate glacier. The water is mineral, not blood, but has produced several centuries of folklore, two religious sects, and a Sentinel Order investigation that concluded: iron oxide, not Shadow influence.',
   'The pools are navigable by small craft in summer; their striking red-pink appearance has sustained active religious movements that the Sentinel Order investigation failed to meaningfully dissuade.',
   0, 0, false),

  ('Splitwind Ridge', 'splitwind-ridge', 'Dreadspire', 'geographic', NULL,
   'A northeast-facing ridge that focuses prevailing wind into a perpetual screaming corridor audible for miles. The sustained harmonic note is the ambient background of the eastern Peaks; Sentinel acoustic research suggests the specific frequencies align with Vaul-Khesh''s ley-network resonance.',
   'Mountain-born people don''t notice the sound until they leave and then cannot sleep for the quiet "” the mountains may, in some sense, be thinking.',
   0, 0, false),

  ('Coldwater Gorge', 'coldwater-gorge', 'Dreadspire', 'geographic', NULL,
   'A narrow slot canyon barely wide enough for a Giant to squeeze through sideways, connecting the approach valley to Frostgale Keep''s plateau "” the inner strategic chokepoint after Gorgemaw. No army has successfully pushed through Coldwater Gorge in recorded history.',
   'Any force that crossed Gorgemaw and fought through the valley would then face Coldwater Gorge in single file; the geological record shows no army has ever made it through.',
   0, 0, false),

  ('The Deadfall', 'the-deadfall', 'Dreadspire', 'geographic', NULL,
   'A vast field of collapsed stone covering roughly four square miles in the central Peaks, deposited sometime between CR 490"“520, which scholars note overlaps with the House Drakor collapse. The Deadfall buried what had been the main interior road of the Stone-Speaker tunnel network and continues to shift seasonally.',
   'Stone-Speaker engineers built things to last a geological age and would not have lost a major interior road to natural collapse in the same decade their kingdom fell "” something brought the Deadfall down deliberately.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES "” Survivor Settlements
  -- ============================================================

  ('Stonehold Farm', 'stonehold-farm', 'Ashen Marches', 'working_site', 140,
   'A fortified farmstead that has produced consistent food yields for six generations in soil that has produced nothing reliable anywhere within ten miles for thirty years. The farmstead has been modified into a small fort, and the plants here look less like healthy plants than like plants being compelled to live.',
   'A Sentinel botanist found trace markers of a pre-Binding Veil-Kin land-consecration in the soil "” if the Stoneholds have been unknowingly maintaining a First Binding anchor, what happens if they stop?',
   0, 0, false),

  ('Gritmarket', 'gritmarket', 'Ashen Marches', 'crossing', 230,
   'A trading post at the last road into the Marches before it stops being a road, operating under a strict policy of asking no questions about what you''re selling or why you need it. Serves traders, scouts, cultists, Sentinel couriers, and people who are leaving the Marches and need one more thing.',
   'The longest-running trader, halfling Penwick Ash, has noticed the Bloodmire Cult purchasing large quantities of iron chain "” not rope, chain, far more than any ritual restraint would require "” over the past six months and doesn''t know who to tell.',
   0, 0, false),

  ('The Wandering Camp', 'the-wandering-camp', 'Ashen Marches', 'hamlet', NULL,
   'The current seasonal position of the Ashwalkers, a nomadic community of 80"“200 people who have moved through the Marches for at least two hundred years following routes determined by the void-pulse''s movement patterns. They have a lower rate of void-exposure symptoms than any other population in the Marches.',
   'The Ashwalkers'' two-century route-map is sung rather than written; the lead guide will share specific route segments for trade but becomes visibly distressed if pressed about the section covering the area directly above Nhal''Zeruun''s prison.',
   0, 0, false),

  ('Redwall', 'redwall', 'Ashen Marches', 'hamlet', 165,
   'A settlement built in pre-human ruins of red-tinged iron-rich stone that disrupts Nhal''Zeruun''s void-pulse, making it the safest sleeping location between Gritmarket and Ashval. It hosts an uncomfortable mix of refugees, travelers, and long-term residents who can''t bring themselves to leave the Marches.',
   'Over the past two years, someone has been adding to the old-stone carvings in the same pre-human style, with apparent fluency in the tradition "” the additions appeared after the existing residents; some show what appears to be a map.',
   0, 0, false),

  ('Lastlight', 'lastlight', 'Ashen Marches', 'town', 340,
   'The last functioning community directly north of Ashval, grown without planning as the functional outskirts of the city extending into a separate settlement with the highest population density outside Ashval in the Marches. The council has sent quarterly annexation petitions to Ashval for six years without response.',
   'Two months ago a family arrived from an easterly direction that should be uninhabited; they are not talking, they are clearly not leaving, and the woman''s kitchen produces food better than available ingredients should allow "” she is being careful not to be noticed being careful.',
   0, 0, false),

  ('The Cisterners', 'the-cisterners', 'Ashen Marches', 'working_site', 55,
   'A specialist community of engineers and maintainers who keep a network of pre-blight underground cisterns functional, providing the only reliable freshwater to Ashval, Lastlight, Cinderpost, and three smaller communities. They move between nodes on a schedule they don''t share outside the community.',
   'One cistern node has started producing water that tastes different "” not void-touched, but different "” and the head Cisterner has traced the intake to run through a geological layer directly above a section of the pre-Binding ley-network.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES "” Cult Sites
  -- ============================================================

  ('The Crimson Altar', 'the-crimson-altar', 'Ashen Marches', 'religious', NULL,
   'The primary Bloodmire Cult sacrificial site "” a stone platform of unknown age rising four feet above the Bloodmire waterline, accessible only by a stepping-stone sequence known to initiates. Sacrifices here die slowly; the Cult''s theology holds that gradual death feeds Nhal''Zeruun more completely.',
   'The Altar has been used more frequently in the last six months, shifting to twice-monthly in exact coincidence with the void-pulse frequency increase "” either the Cult is responding to the pulse, or the pulse is responding to the Cult.',
   0, 0, false),

  ('The Voidshard Cave', 'the-voidshard-cave', 'Ashen Marches', 'ruin', NULL,
   'A sixty-foot cave lined with pale void-crystals that pulse on the void-pulse frequency, used by the Bloodmire Cult for initiation. Direct exposure produces the "Empty Grace" "” removal of want and urgency the Cult calls spiritual clarity; prolonged exposure renders a person void-passive.',
   'Three of the deepest void-crystals have developed shifting inclusions visible inside the crystal; a Sentinel scholar who observed them for ten minutes afterward dreamed of an enormous dark space and an overwhelming feeling of being looked at from below.',
   0, 0, false),

  ('The Reconsecrated Temple of Aelon', 'the-reconsecrated-temple-of-aelon', 'Ashen Marches', 'religious', NULL,
   'A CR 280 harvest temple to the agricultural deity Aelon, claimed by the Bloodmire Cult in CR 780 because it sits on a pre-blight ley-node. The original harvest iconography has been altered throughout: full grain to empty husks, ripe fruit to hollow shells, fed children to children consuming nothing.',
   'Under the altar, the original priests hid their record of the ley-node''s history and the two centuries of Nhal''Zeruun''s spreading influence they observed "” primary source documentation predating any Sentinel records by a century, still dry in oil-cloth.',
   0, 0, false),

  ('The Deep Pull Site', 'the-deep-pull-site', 'Ashen Marches', 'religious', NULL,
   'A flat-topped rise in the central Marches and the closest above-ground approach to Nhal''Zeruun''s prison, called the Convergence Point by the Sentinel Order, the Navel of the World by the Bloodmire Cult, and the Place You Do Not Walk Through by the Ashwalkers. The void-pulse here is a physical pressure felt through the soles of the feet.',
   'Soil samples show a magical signature predating the Bloodmire Cult by at least two hundred years "” something performed a ritual at the Convergence Point before the Cult existed.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES "” Ruined Settlements
  -- ============================================================

  ('Harrowfield', 'harrowfield', 'Ashen Marches', 'ruin', NULL,
   'A farm settlement abandoned in CR 712 after its soil could no longer support crops, structurally intact with clay buildings and low rooflines. Unusually, weeds and vines grow here at full capacity "” the stubborn persistence of undirected life where directed growth has failed.',
   'Something in Harrowfield''s soil is different from surrounding Marches "” possibly a natural formation or residual effect of farming on a pre-Binding ley-intersection "” but every Sentinel researcher who finds it interesting gets reassigned before completing study.',
   0, 0, false),

  ('Saltfen', 'saltfen', 'Ashen Marches', 'ruin', NULL,
   'A settlement partially submerged when the Bloodmire expanded catastrophically in CR 692"“695; its lower tier is permanently underwater while upper structures emerge during dry seasons, their exteriors turned reddish-brown by the iron-oxide marsh water. Beautiful in the way things destroyed slowly can be.',
   'Saltfen''s records hall contains seventy years of void-pulse observations in the margins of tax ledgers "” predating Sentinel Order formal monitoring by a century "” sealed in an oiled-wood cabinet that proved genuinely waterproof.',
   0, 0, false),

  ('Cinders Cross', 'cinders-cross', 'Ashen Marches', 'ruin', NULL,
   'The former central market town of the Marches, destroyed in CR 779 when the Bloodmire Cult purged settlements suspected of running anti-cult information networks. Buildings stand; the population was scattered or killed. The Cult maintains a presence using the ruined market hall as a gathering point.',
   'A former resident in Gritmarket has eighteen months of spyglass observations of Cult activity in the ruins and is looking for someone to take the documentation to Cinderpost "” she believes it''s actionable; the Grey Scouts have told her it isn''t yet.',
   0, 0, false),

  ('Whitegrain', 'whitegrain', 'Ashen Marches', 'ruin', NULL,
   'The oldest of three related settlements sharing water rights, abandoned first in the CR 680"“700 sequential agricultural failure as the water table dropped. Along with Whitegrain South and Whitegrain Mill, the cluster preserves a snapshot of ordinary Marches domestic life before the blight.',
   'The Whitegrain Mill cistern is still structurally sound and could potentially be reactivated "” making the cluster habitable again "” but the Cisterners haven''t said so publicly, uncertain whether encouraging deeper settlement into the Marches is survival assistance or harm.',
   0, 0, false),

  ('Whitegrain South', 'whitegrain-south', 'Ashen Marches', 'ruin', NULL,
   'One of three related settlements in the Whitegrain cluster, abandoned in the CR 680"“700 sequential agricultural failure. The ruins show the same consistent domestic pottery style and religious iconography as the other two sites "” a coherent cultural snapshot frozen at collapse.',
   'The three settlements are close enough that travelers camp among them and treat the cluster as a single location; the ruins cluster provides useful shelter in the Ashflats approach.',
   0, 0, false),

  ('Whitegrain Mill', 'whitegrain-mill', 'Ashen Marches', 'ruin', NULL,
   'The youngest of the Whitegrain settlements, it lasted longest due to superior cistern infrastructure before abandoning in the CR 680"“700 failure. Its cistern is still structurally sound and, per the Cisterners, could potentially be reactivated to make the cluster habitable.',
   'The intact Mill cistern is the Cisterners'' known secret: reactivating it would extend habitable range deeper into the Marches, but they''re uncertain whether encouraging this is survival assistance or a different kind of harm.',
   0, 0, false),

  ('Ashen Ford', 'ashen-ford', 'Ashen Marches', 'ruin', NULL,
   'A settlement abandoned in CR 730 when its namesake ford dried up, now the primary crossing point for refugees leaving the Marches into Aranthor because the dry ash-bed requires no boat. No one stays longer than a night. Buildings are structurally sound "” residents left because there was no reason to stay.',
   'The main waystation building has a walled-up basement last visible through a mortar crack for years; people who looked described wrapped packages, sealed boxes, and a locked chest inside. The crack sealed itself eight years ago.',
   0, 0, false),

  ('The Tower Town', 'the-tower-town', 'Ashen Marches', 'ruin', NULL,
   'A settlement of approximately five hundred that existed to service a watchtower garrison, drifting away between CR 745"“755 as the garrison was drawn down and authority transferred. No single event caused it "” the population simply dispersed. The watchtower stands, structurally the best-preserved building in the Marches outside Ashval and Cinderpost.',
   'Someone has recently occupied the watchtower "” a fire appeared in the upper window three times in the past month; the first Grey Scout found no one, the second Scout hasn''t returned, and the third was told not to go.',
   0, 0, false),

  ('Fellmere', 'fellmere', 'Ashen Marches', 'ruin', NULL,
   'Abandoned in CR 800 after flooding took the lower district and the Bloodmire Cult began using the partially flooded upper district as an initiation route. Travelers camping in the upper district hear normal domestic conversations in the buildings "” including specific names of people who died there in CR 799.',
   'Fellmere''s physician left behind a complete medical log covering CR 765"“800 documenting illness patterns and mortality causes across fifteen settlements "” the best primary source on early void-sickness progression that exists.',
   0, 0, false),

  ('Hearthwall', 'hearthwall', 'Ashen Marches', 'ruin', NULL,
   'Abandoned in CR 835, the same year as the Crown''s shattering, when its entire population of four hundred walked out in a single day after livestock stopped eating, crops turned grey overnight, and well water tasted of nothing. They did not decide to leave "” they noticed there was nothing to decide between.',
   'The void-surge hit Hearthwall approximately six hours before any Sentinel instrument registered the Crown''s shattering; the records-keeper who took everything is in Ashval and wants someone to tell her whether Nhal''Zeruun''s prison cracked before or after Seraphel struck.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES "” Geographic Features
  -- ============================================================

  ('The Ashfield', 'the-ashfield', 'Ashen Marches', 'geographic', NULL,
   'The Marches'' dead heart "” a fifty-mile-wide flat wasteland of compressed void-particle accumulation over formerly fertile land, under a sky perpetually overcast in a way that feels deliberate. The void-touched wildlife that has adapted here "” grey foxes, ash-rooks, pale-eyed rabbits "” lives in reasonable numbers.',
   'Walking the Ashfield takes two days at a measured pace with nothing to navigate by; inexperienced travelers who walk in tend to use the experience of not coming out to recalibrate their understanding of the region''s scale.',
   0, 0, false),

  ('The Bloodmire', 'the-bloodmire', 'Ashen Marches', 'geographic', NULL,
   'A twenty-square-mile marsh fed by iron-rich groundwater that stains everything a deep amber-red, primary territory of the Bloodmire Cult. The Cult has built structures on firm ground within the marsh accessible only by specific channels, and void-crystal formations have been found throughout the substrate.',
   'The Bloodmire sits directly above the geological layer containing Nhal''Zeruun''s prison; crystal seepage through the marsh floor is both cause and effect of the Cult''s concentration here.',
   0, 0, false),

  ('The Scar', 'the-scar', 'Ashen Marches', 'geographic', NULL,
   'A physical crack in the ground running east-west for four miles, between one and eight feet wide, opened on the night of CR 835 Month 9 Day 17 simultaneous with the Crown''s shattering. The Scar glows pale during void-pulse peaks and emanates an oddly comfortable warmth during non-peak periods.',
   'The Scar''s four-mile length corresponds exactly to the boundary between two First Binding anchor points documented in Sentinel restricted archives "” the prison cracked along a seam that was always the weakest point, which someone who knew the anchor map could have predicted.',
   0, 0, false),

  ('The Ashflats', 'the-ashflats', 'Ashen Marches', 'geographic', NULL,
   'The wide, relatively flat plain east of the Bloodmire where the Marches are blighted but not lethally so "” the threshold through which most refugees travel on their way out. Pre-blight roads are still visible as slight depressions in the ash-crust, one or two inches lower than surrounding ground.',
   'The Ashflats are where most Marches encounters happen for outside travelers "” the place where the world starts to look wrong without having become fully wrong yet.',
   0, 0, false),

  ('The Drybed Network', 'the-drybed-network', 'Ashen Marches', 'geographic', NULL,
   'Three of the four former rivers of the Marches are now dry channels "” the Greywash, the Stillwater, and the Dustcourse "” that preserve the exact shape of the rivers that ran there and are used as roads by residents who know them. The fourth, the Ashrun, still flows as a grey-tinted trickle.',
   'The Greywash runs directly over Nhal''Zeruun''s prison; the Cisterners maintain filtration stations at two points along the surviving Ashrun.',
   0, 0, false),

  ('Ashkeel Mesa', 'ashkeel-mesa', 'Ashen Marches', 'geographic', NULL,
   'The highest point in the Marches "” sixty feet above the surrounding plain, providing twelve-mile sightlines in clear weather. The Sentinel Order used it as a watch post before Cinderpost was established. Carved into its north face thirty feet up is a pre-Binding inscription partly translated as "The hunger knows this place by its "” [untranslatable] "” those who stand here are seen."',
   'A scholar believes the untranslatable word is a proper noun "” a place-name "” and the only similar usage is in Stone-Speaker records from CR 400 referring to "the mouth of what was sealed."',
   0, 0, false),

  ('The Voidcleft', 'the-voidcleft', 'Ashen Marches', 'geographic', NULL,
   'A forty-foot triangular geological crevasse near the Bloodmire''s western edge that pulses constantly "” not just during void-pulse events "” with a pale blue-grey light at a slow rhythm like breathing. Void-crystals line its walls and the Cult considers it the second-holiest site in the Marches after the Crimson Altar.',
   'The Voidcleft''s pulse rate changed two months ago with a slight acceleration that is mathematically consistent with the void-pulse''s escalating frequency "” the Cinderpost night-watch scholar who noticed hasn''t told her commander yet because she doesn''t want to be wrong.',
   0, 0, false),

  ('The Grey Expanse', 'the-grey-expanse', 'Ashen Marches', 'geographic', NULL,
   'The northeast quadrant of the Marches where the blight is actively expanding, moving approximately two miles per year consistently northeast toward Aranthor. Twenty years ago this section had struggling but living farmland; now it has the grey crust and empty air of the Ashfield.',
   'The expansion rate doubled in CR 835 from one mile per year to two, in direct correlation with the Crown''s shattering; Sentinel models suggest forty-five years to the Heartlands'' edge at the current rate, if it doesn''t continue to accelerate.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES "” Sentinel Watch Sites
  -- ============================================================

  ('Cinderpost', 'cinderpost', 'Ashen Marches', 'fort', 300,
   'The Sentinel Order''s primary administrative and operational hub for Marches monitoring "” the largest fixed installation outside Sylvara dedicated to Shadow Lord observation, occupying a reinforced pre-existing stone fortification north of Ashval. Currently twelve active Grey Scouts, down from twenty-two after Sylvara''s recall three years ago.',
   'Commander Harrowgast has sent forty-seven formal reports about escalating Nhal''Zeruun activity and received forty-seven acknowledgments and zero resources; she has stopped writing in formal Order style and started writing as someone who believes they are making the last record of something.',
   0, 0, true),

  ('Dustwatch', 'dustwatch', 'Ashen Marches', 'fort', 3,
   'A former waystation tower repurposed in CR 837 specifically to monitor the Scar, staffed by three people on rotating ninety-day assignments "” observer, communications specialist, and a general-purpose watchman. The ninety-day rotation was set because longer exposure produces measurable void-sickness.',
   'The current observer has been here sixty of her ninety days and believes she can almost predict glow-events "” if she''s right, Nhal''Zeruun''s activity has a regularity never documented. Her rotation ends in thirty days and she is considering asking to stay.',
   0, 0, false),

  ('Mirrorhill', 'mirrorhill', 'Ashen Marches', 'fort', 3,
   'A low communications relay station on a slightly elevated hill with unobstructed sightlines to both Dustwatch (fourteen miles) and Cinderpost (eleven miles), linking the two via signal-mirror. Its permanent staff member Aldus has been stationed here seven years "” far past normal rotation "” and refuses reassignment.',
   'Aldus has been sending personal correspondence via a patrol Scout with a seal no one recognizes; the seal is a pre-Binding symbol he found in the hill''s stone one morning and started using because it seemed right "” he didn''t know it was a symbol.',
   0, 0, false),

  ('The Cache Network', 'the-cache-network', 'Ashen Marches', 'working_site', NULL,
   'Nine hidden supply caches distributed across the Marches, each holding three weeks'' rations, a signal tool, medical supplies, and a sealed Sentinel archive document relevant to the cache''s geographic area. Grey Scouts know locations through an oral mnemonic that doubles as a route map.',
   'Three of nine caches have been accessed in the past six months by someone other than a Grey Scout "” the access method showed signs of being worked from outside with a pick. Something in the Marches knows the cache locations.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES "” Existing Named Locations
  -- ============================================================

  ('Ashval', 'ashval', 'Ashen Marches', 'city', 3000,
   'A ruined city in the Ashen Marches serving as the primary population center for the blighted region, its council the closest thing the Marches has to governance. Ssolvara the Spear-Broken has sent messengers here twice in five years; the council responded to the second.',
   'Ashval''s council has ignored Lastlight''s annexation petitions for six years despite being the region''s administrative center "” the political calculation behind this silence is unclear.',
   0, 0, true),

  -- ============================================================
  -- SHATTERED ISLES "” Named Islands
  -- ============================================================

  ('Saltmere Isle', 'saltmere-isle', 'Shattered Isles', 'geographic', 22000,
   'The largest island of the Shattered Isles at roughly 40 miles long and 25 miles wide "” the anchor of the Free Isles Compact, most important port, and seat of Compact governance. Mountainous in the north (the Capstone Range) and relatively flat in the south where Saltmere city and its farmland sit.',
   'Capstone miners recently sealed off a newly opened deep chamber with unknown script and two miners who entered on the first day have been acting subtly wrong ever since; Compact offices have not responded to the foreman''s message.',
   0, 0, true),

  ('Caldera Isle', 'caldera-isle', 'Shattered Isles', 'geographic', 0,
   'The volcanic island at the center of the archipelago''s distortion, with a three-mile caldera that has not erupted in four hundred years but generates the Fog of Ulraeth. Every settlement attempt has been abandoned for the same reason: settlers start repeating themselves "” not dramatically, but word-for-word identical.',
   'The Short Colony buildings from thirty years ago are intact with personal effects, a settlement log, and thirty-seven days of entries "” each word-for-word identical to the one before, in the same hand, with the same ink.',
   0, 0, true),

  ('Greyhull', 'greyhull', 'Shattered Isles', 'geographic', 4000,
   'The Compact''s second-most important island at 20 miles long, dominated by the Free Fleet''s secondary port and the Greyhull Yards "” the best shipbuilding operation in the archipelago. Greyhull town of 3,200 runs around the Yards, supported by working farms and a western headland signal-fire relay.',
   'Three ships built at Greyhull in the past year returned with logs describing voyages almost identical but slightly different from what actually happened "” different weather, ports, and crew actions, as if documenting a parallel voyage.',
   0, 0, true),

  ('Ironspire Isle', 'ironspire-isle', 'Shattered Isles', 'geographic', 1800,
   'A medium island named for a two-hundred-foot basalt column used as a navigation landmark from twenty miles, with one good harbor at Ironspire Town and extensive sea-cliff nesting grounds for a delicacy-egg bird species. Known for its Compact Chapter and the two-century-maintained Ironspire Lighthouse.',
   'Lighthouse keeper Dorvaine has twenty-two years of shipping pattern records and has noticed ships departing certain routes at certain times arrive late while insisting they left on schedule "” she has documentation and will share it.',
   0, 0, false),

  ('Nearmark', 'nearmark', 'Shattered Isles', 'geographic', NULL,
   'The western of the Twin Islands, each roughly five miles across and separated by the quarter-mile Twin Passage, the main navigational route for ships entering from the north. Nearmark Harbor exists primarily to service passing ships and document the highest rate of time-distortion incidents of any inhabited island in the Compact.',
   'The channel between the Twins has paving stones on the seafloor thirty feet down "” a road running north-south under the water. Residents call it the Old Way and consider it unremarkable.',
   0, 0, false),

  ('Farmark', 'farmark', 'Shattered Isles', 'geographic', NULL,
   'The eastern of the Twin Islands, with Farmark Harbor serving passing ships along the main northern navigation route. The Twins together have the highest documented rate of time-distortion, with a 1-in-8 chance of arriving up to four hours displaced; residents set clocks by their own reckoning.',
   'Ships entering the Shearwater Straits now consistently arrive slightly earlier rather than randomly "” they are arriving before they entered the Straits by the harbor clock. The implications have not been formally addressed.',
   0, 0, false),

  ('Stoneback Isle', 'stoneback-isle', 'Shattered Isles', 'geographic', 300,
   'A medium island of almost entirely vertical cliffs with a notch-harbor for small vessels only, whose three hundred legendarily stubborn residents live here for the extraordinary fishing grounds in the cold-water upwelling to the east. They have resisted four annexation attempts, a trade embargo, and one actual siege.',
   'The Stoneback fishing grounds have been shifting east by a mile per year for four years, disrupted at the source by the deep trench twelve miles east that connects to the abyssal depth where Ulraeth stirs.',
   0, 0, false),

  ('Driftmark', 'driftmark', 'Shattered Isles', 'geographic', 80,
   'A small four-mile fishing island that navigation surveys have found consistently two miles further east than charted in the past three years, currently six miles from Ironspire Isle. The eighty residents are, upon investigation, the same eighty people recorded in the census forty years ago "” every adult, physically unchanged.',
   'The oldest resident, who would be 130 by the mainland census, is knitting in her doorway and will offer excellent hospitality while expressing gentle confusion about why you seem alarmed by anything.',
   0, 0, false),

  ('The Blackledge', 'the-blackledge', 'Shattered Isles', 'geographic', 0,
   'A dark basalt uninhabited volcanic island with no landing beach, notable for sea caves extending further into the interior than the island appears to be wide, and the Blackledge current that sweeps ships northeast toward the Fog Line. Ships give it a wide berth.',
   'A Free Fleet survey forty years ago produced a sealed chart of the interior cave system whose notes end: "The cave system connects to something below that is not geological. We recommend permanent exclusion zone."',
   0, 0, false),

  ('Gull''s Perch', 'gulls-perch', 'Shattered Isles', 'geographic', 120,
   'A small island of forty thousand nesting seabirds whose population lives primarily on guano collection "” unglamorous and extremely profitable. Three months ago, a ship called the Steady Hand arrived crewless with intact cargo and a log last dated four years ago "” the same date the ship was declared lost at sea.',
   'The Steady Hand is in perfect condition with four-year-old cargo preserved as if no time passed; the Compact legal dispute over salvage rights is ongoing and no explanation for where the ship has been has been found.',
   0, 0, false),

  ('Longhold', 'longhold', 'Shattered Isles', 'geographic', 900,
   'The Compact''s easternmost island, a breakwater against eastern storms with two fishing villages (Longhold North and Longhold South) on the protected western coast. Its residents are the most insular in the Compact and have maintained a strict prohibition against going on the water after midnight for as long as anyone can remember.',
   'The midnight prohibition originates in a story of fishing boats that went out at midnight two hundred years ago and returned after hours to find their families aged twenty years "” and the fishing crews decided they had missed nothing and resumed their lives.',
   0, 0, false),

  -- ============================================================
  -- SHATTERED ISLES "” Island Settlements
  -- ============================================================

  ('Capstone', 'capstone', 'Shattered Isles', 'village', 400,
   'A mining village in the northern Capstone Range mountains of Saltmere Isle. Recently opened a deep shaft and found something they''ve sealed off and won''t describe "” a chamber in very old stone with unrecognized script "” and two miners who entered that first day have been acting subtly wrong since.',
   'The mine foreman sent a message to Saltmere''s Compact offices about the chamber and the affected miners; Compact Commander Brackwater has not yet responded.',
   0, 0, false),

  ('Shoreward', 'shoreward', 'Shattered Isles', 'village', 800,
   'A fishing village on the protected eastern coast of Saltmere Isle, one of three settlements beyond Saltmere city on the main island. The sheltered eastern coast makes for reliable fishing grounds and a calm harbor.',
   'Shoreward is a routine but significant food supply village for Saltmere city, contributing to the island''s food self-sufficiency in good years.',
   0, 0, false),

  ('Tidal Farms', 'tidal-farms', 'Shattered Isles', 'working_site', 600,
   'A stretch of lowland tidal farming operations on Saltmere Isle''s southern section, organized across five family holdings. Tidal farming in the protected southern lowlands contributes significantly to Saltmere Isle''s food production.',
   'The five family holdings operate independently but collectively contribute to the island''s capacity to supply a significant fleet in good years.',
   0, 0, false),

  ('Greyhull Town', 'greyhull-town', 'Shattered Isles', 'town', 3200,
   'The main settlement of Greyhull Isle, running around the famous Greyhull Yards shipbuilding facility. Three ships built at the Yards in the past year have returned with voyage logs describing slightly different voyages from what actually occurred "” the yard-master is quietly terrified.',
   'A "Greyhull work" hull mark commands a premium in any port; the yard-master''s quiet terror about the anomalous logs has not yet become public knowledge.',
   0, 0, false),

  ('Ironspire Town', 'ironspire-town', 'Shattered Isles', 'town', 1800,
   'The only settlement on Ironspire Isle, a mixed fishing and pastoral community centered on the island''s good harbor and the profitable sea-cliff egg trade. Home to both the island''s Compact Chapter and the two-century-maintained Ironspire Lighthouse.',
   'Lighthouse keeper Dorvaine''s twenty-two years of shipping records document a pattern of ships arriving late while insisting they departed on schedule "” evidence of worsening temporal distortion she will share with genuine inquirers.',
   0, 0, false),

  ('Nearmark Harbor', 'nearmark-harbor', 'Shattered Isles', 'hamlet', NULL,
   'A small harbor town on Nearmark Island existing primarily to service ships transiting the Shearwater Straits and to provide time-recalibration services for vessels experiencing the documented 1-in-8 distortion. Residents set clocks by their own reckoning and correct for ships'' times at arrival.',
   'Ships entering from the north now consistently arrive slightly earlier rather than randomly "” ships are arriving before they entered the Straits by the harbor clock, an implication the Compact has not formally addressed.',
   0, 0, false),

  ('Farmark Harbor', 'farmark-harbor', 'Shattered Isles', 'hamlet', NULL,
   'A small harbor town on Farmark Island that, like its twin, exists to service passing ships on the northern approach. The two harbor towns together represent the Compact''s most northerly inhabited waypoints.',
   'The Twins'' consistent time-distortion zone in the Twin Passage is managed as normal business here "” the documented inconvenience of doing commerce at the archipelago''s northern gateway.',
   0, 0, false),

  ('Longhold North', 'longhold-north', 'Shattered Isles', 'village', NULL,
   'A fishing village on the harbor-facing western coast of Longhold Isle, one of two settlements on the Compact''s easternmost island. Longhold North shares the island''s midnight water prohibition and its dialect of the common tongue.',
   'The midnight prohibition is absolute and maintained without exception "” the fishing community''s intimate relationship with the sea makes the prohibition''s rigidity all the more striking.',
   0, 0, false),

  ('Longhold South', 'longhold-south', 'Shattered Isles', 'village', NULL,
   'A fishing village on the western coast of Longhold Isle, one of two settlements on the Compact''s easternmost island, insular by geography and long winters. Shares the midnight water prohibition maintained for as long as island memory extends.',
   'Long winters and minimal outside contact have produced distinct customs and a dialect that marks residents immediately to other islanders.',
   0, 0, false),

  ('Harrowpoint', 'harrowpoint', 'Shattered Isles', 'village', 400,
   'A fishing and small-craft harbour on Greyhull''s western coast, as far from the Greyhull Yards as possible while still on the island, whose residents identify as fishermen rather than shipbuilders. Hosts one of the more sincere chapels to Selindra (sea goddess) in the Compact.',
   'Father Ossian, eighty years old and forty years at Harrowpoint, opened a sealed document last week after the fog came against the wind for seven mornings running "” the threshold his predecessor specified "” and has not yet decided what to do with what it says.',
   0, 0, false),

  ('The Cove at Wrecker''s Point', 'the-cove-at-wreckers-point', 'Shattered Isles', 'hamlet', NULL,
   'An unofficial pirate harbor on Stoneback Isle''s northern coast, absent from all Compact charts and acknowledged by no Compact official, accessible only through a narrow channel non-locals cannot navigate without a guide. The Compact has pragmatically decided to leave it alone.',
   'For four months the Cove has been receiving ships from past decades "” vessels in perfect condition crewed by sailors who become confused and frightened to learn the current year. Harbormaster Cold-Eyes is managing the arrivals quietly and needs help she will not ask for but will accept.',
   0, 0, false),

  ('Tidewatch Monastery', 'tidewatch-monastery', 'Shattered Isles', 'religious', 35,
   'An Order of the Unmoored Tide monastery on a small island three miles south of Longhold, chosen precisely for its temporal distortions as spiritually instructive. Ninety years of empirical records using water-clocks versus astronomical observation make this the most comprehensive documentation of Ulraeth''s effects in the archipelago.',
   'The records show distortion events spiking every eleven years; the next spike in four months is projected significantly worse than previous "” the spike twenty-two years ago lost eleven ships, the eleven-year spike three. Head archivist Brother Keel will share data with anyone who can help.',
   0, 0, true),

  ('Ashfield Town', 'ashfield-town', 'Shattered Isles', 'ruin', NULL,
   'The ruins of the original Caldera Isle settlement, a colony of three hundred established eighty years ago that was abandoned after twelve good years as looping events escalated to crisis. Buildings are intact and the harbor infrastructure deteriorated but repairable; every resettlement attempt fails for the same reason.',
   'A Shadow Cabal research team of seven has been installed four months ago studying Ulraeth''s influence directly "” they have protections against looping, but have stopped reporting back on schedule to their Saltmere handlers.',
   0, 0, false),

  ('The Short Colony', 'the-short-colony', 'Shattered Isles', 'ruin', NULL,
   'A failed resettlement of Caldera Isle from thirty years ago, abandoned when looping reached crisis. The buildings are intact after thirty years of weathering. The settlement log''s final section contains thirty-seven days of entries, each word-for-word identical to the one before, in the same handwriting, with the same ink.',
   'The settler who kept the log apparently did not notice the identical repetition "” thirty-seven days logged with perfect fidelity, each entry unaware of the ones before.',
   0, 0, false),

  ('Farpoint Beacon', 'farpoint-beacon', 'Shattered Isles', 'fort', 25,
   'The last navigational landmark before the Fog Line "” a lighthouse on a small island at the Compact''s northwestern boundary marking the limit of safe northwest transit. The current keeper Ord has been alone for eight months after his assistant left and the Compact twice failed to send a replacement.',
   'Ord''s reports have been getting shorter; his most recent was three words: "Fog Line closer. Inform Brackwater." The Fog Line has advanced nine miles in eight months "” unprecedented acceleration.',
   0, 0, false),

  ('Port Sullen', 'port-sullen', 'Shattered Isles', 'hamlet', 180,
   'Technically a Compact waystation on Longhold''s northern tip; practically a port that processes goods without asking about origin or destination, with a harbormaster excellent at not noticing things. Hosts two reliable information brokers who can provide shipping, route, and personnel intelligence for the right fee.',
   'Broker Silt has a manifest from fourteen months ago for a ship carrying anchor-disruption ritual components targeting one of Ulraeth''s binding points "” buyer unidentified, ship home port Saltmere, named merchant on the manifest dead for six years.',
   0, 0, false),

  ('The Shore at Low Tide', 'the-shore-at-low-tide', 'Shattered Isles', 'hamlet', 60,
   'A community of sixty living along a section of the Drowned Roads exposed for three hours in every twelve, in structures engineered to survive regular immersion "” sealed stone, raised floors, waterproof storage. All social activities occur during low water; children learn to swim before they walk.',
   'The road''s stones are marked with the same notation system as the Wayfarer''s Stone in the Veilwood "” the same language, era, and possibly hand. Whoever built one built or closely influenced the other.',
   0, 0, false),

  -- ============================================================
  -- SHATTERED ISLES "” Sea Features
  -- ============================================================

  ('The Fog of Ulraeth', 'the-fog-of-ulraeth', 'Shattered Isles', 'geographic', NULL,
   'A real, navigable supernatural fog originating from Caldera Isle''s caldera and extending northwest to the Fog Line "” currently 22 miles from Caldera Isle, nine miles closer than eight months ago. Ships inside experience time distortion scaling with depth: four hours shallow, days for moderate penetration, weeks or months near the Caldera.',
   'Tidewatch records include three firsthand accounts from sailors who entered the deep Fog and returned "” all describe a moment of absolute clarity about their position in life, past and future, as the most terrifying experience of their lives.',
   0, 0, false),

  ('The Caldera Drift', 'the-caldera-drift', 'Shattered Isles', 'geographic', NULL,
   'A warm-water surface current running south-southwest from Caldera Isle, detectable by temperature differential and orange-brown mineral tint, used by navigators as a positioning reference. Its temperature has risen five degrees in three years, mineral load is increasing, and speed has increased.',
   'The Caldera Drift runs over a section of the Drowned Roads, and thermal expansion of the seabed is slowly lifting buried structures below the road surface into view "” structures buried deliberately, in a very old burial layer.',
   0, 0, false),

  ('The Widow''s Passage', 'the-widows-passage', 'Shattered Isles', 'geographic', NULL,
   'The main commercial route between Saltmere Isle and Greyhull, fourteen miles of open water passing close enough to the Fog Line''s historical position that a night fog event can push ships into time-distortion range. "Going through the Widow" is Compact parlance for taking a calculated risk.',
   'The Compact''s signal-fire relay across the Widow''s Passage has three of seven relay platforms unmanned "” the crews stationed there have not returned. The other four relay crews are aware and making plans.',
   0, 0, false),

  ('The Shearwater Straits', 'the-shearwater-straits', 'Shattered Isles', 'geographic', NULL,
   'The narrow half-mile-wide water between Nearmark and Farmark "” the main northern entry to the Shattered Isles. Well-charted and physically safe but with a documented 1-in-8 chance of arriving up to four hours displaced. The Compact has standardized procedures for this.',
   'In the past three months the distortion has become patterned: ships entering from the north now consistently arrive slightly earlier rather than randomly "” arriving before they entered the Straits by the harbor clock.',
   0, 0, false),

  ('The Drowned Roads', 'the-drowned-roads', 'Shattered Isles', 'geographic', NULL,
   'A network of underwater stone roads, six to eight feet wide, connecting major islands of the Shattered Isles to a consistent engineering standard implying a single construction program. Three sections are navigable at low tide; the roads connect to sections that are never exposed "” descending further than navigational surveys have charted.',
   'All mapped Drowned Road sections, when overlaid and extended, converge on the deep trench twelve miles east of Stoneback Isle "” where Ulraeth is imprisoned. The roads led somewhere. The somewhere is still there.',
   0, 0, false),

  ('Deadbell Reef', 'deadbell-reef', 'Shattered Isles', 'geographic', NULL,
   'The most navigationally dangerous reef complex in the archipelago, six miles southwest of Caldera Isle, named for a ship''s bell hung centuries ago on one of its stacks "” still ringing in heavy weather. The complex moves approximately a quarter-mile between each decade''s chart survey.',
   'The bell is old construction matching Drowned Road era style; its inscription in the same script reads three words translating as "When to stop."',
   0, 0, false),

  ('The Mirror Flats', 'the-mirror-flats', 'Shattered Isles', 'geographic', NULL,
   'A five-mile stretch of six-foot-deep white-sand water southeast of Saltmere Isle that produces mirror-like surface effects in calm weather, used for small craft recreation. In the past year it has begun producing reflections that are slightly wrong "” showing the sky as it was a few hours ago, or will be.',
   'On a clear day the reflection shows the sky approximately two hours in the future; observers who watch long enough can see incoming weather "” and ships on the reflection horizon that will arrive at Saltmere from that direction in two hours.',
   0, 0, false),

  ('The Deep of Ulraeth', 'the-deep-of-ulraeth', 'Shattered Isles', 'geographic', NULL,
   'An abyssal submarine trench descending to unmeasured depth, running north-south for approximately forty miles beneath the eastern Shattered Isles, where Ulraeth the Unmoored is imprisoned. The Compact''s deepest survey lines have not touched bottom. The Drowned Roads terminate here.',
   'The prison anchor is below the seabed at the trench''s deepest point "” accessing it requires depth fatal to unprotected swimmers at 200 feet and beyond all known magical breathing methods. The Sentinel Order notes this access problem and has no solution.',
   0, 0, true),

  ('Whistler''s Rock', 'whistlers-rock', 'Shattered Isles', 'geographic', 0,
   'A cluster of three uninhabited sea stacks eight miles southwest of Greyhull, the tallest sixty feet, which produce an audible two-tone whistling that serves as an audio navigation landmark in fog. Six months ago a third tone appeared "” described variously as "a voice" or "someone asking something."',
   'A fishing crew anchored here during a fog wait heard a clear statement in an archaic sea trade-pidgin; translated: "Wait here. We are coming back soon."',
   0, 0, false),

  ('The Needle', 'the-needle', 'Shattered Isles', 'geographic', NULL,
   'A natural sea arch fifteen miles south of Saltmere Isle shaped like a threading needle from the east, audible in heavy weather, marking the last landmark before open ocean. It has never moved, never changed, and has been on every chart for three hundred years "” genuinely stable in a sea of temporal disturbance.',
   'The Compact''s senior navigator told her apprentice the Needle is stable because something is keeping it stable deliberately, and that she does not want to know what. The apprentice sailed south to investigate six weeks ago and is currently missing.',
   0, 0, false),

  -- ============================================================
  -- SHATTERED ISLES "” Ruins and Wrecks
  -- ============================================================

  ('The Tidebound', 'the-tidebound', 'Shattered Isles', 'ruin', NULL,
   'The Compact''s most celebrated wreck "” a Free Fleet warship that drove off an Imperial raiding squadron forty years ago but broke her hull on Blackledge''s northern rocks in the dark afterward. The bow section is visible at low tide, forty feet down; Compact sailors make pilgrimage here and speak the captain''s name.',
   'The Tidebound is still moving "” the bow section has been in three different positions in the past decade, on a fixed rock, which the current the Stoneback fishermen know does not run where the wreck lies.',
   0, 0, false),

  ('The Long Patience', 'the-long-patience', 'Shattered Isles', 'ruin', NULL,
   'A three-masted merchant lost sixteen years ago in the fog with seventy-two passengers including a Compact trade delegate, sighted eighteen times since "” always at dawn, always from a distance, always moving. Two ships that followed it each lost one crew member while pursuing, without explanation.',
   'The most recent sighting included a woman at the stern rail appearing to be in her late fifties "” the same age as a passenger''s grandmother who boarded sixteen years ago. The Compact has formally prohibited pursuit.',
   0, 0, false),

  ('Caldera Fort', 'caldera-fort', 'Shattered Isles', 'ruin', NULL,
   'A pre-Compact fortification on Caldera Isle''s southern headland, built approximately three hundred years ago to defend against naval assault. The fort was abandoned two hundred and fifty years ago; its own records describe soldiers "doing it again" and the commanding officer''s repeated failed attempts to determine what day it was.',
   'The captain''s quarters in the still-standing central tower contains a wound, working clock stopped at 4:14 that has shown hands at exactly this position for three hundred years "” time at this exact spot stopped and has not started again.',
   0, 0, false),

  ('The Sunken City of Mereth Orn', 'the-sunken-city-of-mereth-orn', 'Shattered Isles', 'ruin', NULL,
   'A pre-Crown city visible at extreme low tide beneath the tidal shallows east of the Twin Islands "” streets, foundations, large building remains, and a public square with a raised platform, approximately half a mile across. Unknown to any chart older than sixty years. The name was found carved into a visible stone column.',
   'The central square platform has a carving kept clear of marine growth by the stone''s own properties, showing a map of the Shattered Isles as a single continuous landmass before they were shattered "” all roads on the map lead to the Deep of Ulraeth.',
   0, 0, true),

  ('The Lighthouse at Endtower', 'the-lighthouse-at-endtower', 'Shattered Isles', 'ruin', NULL,
   'A pre-Compact lighthouse one hundred and twenty feet tall on a flat rock island between Caldera Isle and the Fog Line, built from stone not native to the archipelago. The oldest standing structure in the Shattered Isles "” predating the Compact by at least five hundred years "” and its light still works every night with no mechanism, flame, or identifiable magical device.',
   'Tidewatch records show Endtower''s light went dark exactly once "” three days two hundred years ago, during the period the Veilwood records call "the previous Choir stirring." A monk who watched the north saw someone leave the tower and walk into the sea, which took them without a wave.',
   0, 0, true),

  ('The Anchor-Platform of the Old Compact', 'the-anchor-platform-of-the-old-compact', 'Shattered Isles', 'ruin', NULL,
   'A four-century-old stone platform on a tidal flat between Greyhull and Ironspire Isle, exposed three hours at low tide, carved with the seals of the original twelve founding island lords. One additional seal "” a different carving style, approximately fifty years old "” belongs to no current Compact member and no current official recognizes it.',
   'Records of a dispute forty-eight years ago describe an "unknown delegation, no island identified" presenting the same symbol as evidence of original Compact membership; they accepted rejection, walked to the harbor, and left no record of a ship.',
   0, 0, false),

  -- ============================================================
  -- SHATTERED ISLES "” Geographic Features
  -- ============================================================

  ('The Saltmere Bay', 'the-saltmere-bay', 'Shattered Isles', 'geographic', NULL,
   'The main harbor bay of Saltmere Isle "” eight miles across, deep enough for the largest Compact ships, with three natural anchorage zones and excellent shelter from north and west swells. The geographic reason Saltmere city exists where it does.',
   'The Saltmere tides now run forty minutes behind astronomical prediction, a drift that started exactly when Ulraeth''s fog first appeared in Compact records fifty years ago "” the harbor pilot who discovered this correlation has not yet reported it.',
   0, 0, false),

  ('The Capstone Passage', 'the-capstone-passage', 'Shattered Isles', 'geographic', NULL,
   'The Compact''s primary northern sea lane connecting Saltmere''s harbor to the northern islands and outside world, passing within eight miles of the Fog Line at certain points. Features a consistent three-mile compass deviation of 3"“5 degrees that Compact navigators correct for as standard practice.',
   'The deviation''s angle points directly at Caldera Isle "” a fact Compact navigators who have noticed do not discuss.',
   0, 0, false),

  ('The Teeth', 'the-teeth', 'Shattered Isles', 'geographic', NULL,
   'A reef complex of low rocks and submerged ledges covering a five-mile area at the northern archipelago entrance, navigable through three named channels (Wide, Needle, and Blind) and requiring local pilot guidance for unfamiliar captains. The first hazard encountered by any ship entering from the north.',
   'A fourth channel appeared in the past two years as subsidence shifted reef formations; pilots know it, it hasn''t been charted, it is slightly faster than the Wide Channel, and it runs exactly over the section of Drowned Roads descending toward the Deep of Ulraeth.',
   0, 0, false),

  ('The Blue Shelf', 'the-blue-shelf', 'Shattered Isles', 'geographic', NULL,
   'The western boundary of the Shattered Isles "” a broad shallow-water area where depth drops from navigable to impassable over twenty miles, studded with small unnamed rocks and islets. Its distinctive saturated-blue color from cold upwelling has been taking on a grey quality spreading from the archipelago''s center outward for three years.',
   'The grey spreading tracks exactly the Caldera Drift''s chemical composition change from increased geothermal activity; at current rates the Shelf will be fully grey in seven years "” a visible geographic symptom of Ulraeth''s increasing activity.',
   0, 0, false)

ON CONFLICT (slug) DO NOTHING;

