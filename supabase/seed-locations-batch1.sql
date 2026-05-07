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
   'Three tolled crossings exist on the Aelwynn; one Crown toll at Warden''s Ford is uncollected for 8 months — the royal reeve holds 1,200gp with no one to remit it to.',
   0, 0, false),

  ('The Greywood', 'the-greywood', 'Aranthor', 'geographic', NULL,
   'Dense hardwood forest covering the northern third of Aranthor, roughly 60 by 40 miles. Ancient oak, ash, and yew; the canopy in high summer blocks noon light entirely. Blackwell controls two logging operations on its southern edge.',
   'Hunters have been finding deer carcasses — not hunted, but drained intact. Something new is in the Greywood''s northern section. The Sentinel outpost Deepwatch on the eastern edge has been dark for six months.',
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
   'Someone is using the summit signal tower at night with a hooded lantern sending a coded message northward toward the Greywood — the code has not been broken.',
   0, 0, false),

  ('Salt Flats of Kettermere', 'salt-flats-of-kettermere', 'Aranthor', 'geographic', NULL,
   'Coastal salt marsh 8 miles south of Lighthaven, 3 miles wide and 6 miles long. Salt-works have operated here since before the Founding, producing roughly 40 tons of bay salt per year under the Crane family.',
   'The lead saltworker Emm Crane has been approached multiple times by a Shadow Cabal agent offering far above market value for the flats; she has refused, and the agent has stopped coming back — which worries her more.',
   0, 0, false),

  ('Frostback Ridge', 'frostback-ridge', 'Aranthor', 'geographic', NULL,
   'Low limestone ridge marking Aranthor''s northeastern boundary, 30 miles long at 600-900 feet elevation. Only three wagon-suitable passes exist; the eastern lords fortified them during the last Succession Crisis.',
   'A dwarven survey party entered the Frostback cave system four months ago seeking Stone-Speaker workings. They have not come out, and the company that hired them has quietly stopped asking questions.',
   0, 0, false),

  ('The Barrow Down', 'the-barrow-down', 'Aranthor', 'geographic', NULL,
   'Low moorland ridge west of the King''s Road, 30 miles north of Dunmore, scattered with roughly forty pre-Founding burial mounds of unknown origin. The largest, called the King-Grave, stands nearly 40 feet tall.',
   'A Vaelthorn scholar has been camping near the King-Grave for three weeks doing legitimate historical work — but his presence has reactivated something dormant inside the mound for a very long time.',
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
   'Two neighboring villages are watching Harwick''s defiance and will follow if Harwick holds — or submit if Harwick is punished without resistance.',
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
   'The quarry''s upper face broke into a natural cave; the sealed-off interior shows worked stone columns and flooring of unknown origin — the hired engineer is trying to decide who to trust with the discovery.',
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
   'The most recent wreck carried no cargo but had four heavy iron rings bolted below the waterline from the outside, as if something had been chained in the hold — the chains were cut, not broken.',
   0, 0, false),

  ('Dunbar''s Ferry', 'dunbars-ferry', 'Aranthor', 'hamlet', 50,
   'A hamlet of twelve buildings around a flat-bottomed ferry crossing on the River Aelwynn, 6 miles upstream from Ashford. Operated by Lord Dunbar under a 200-year-old Crown charter; the ferry runs dawn to dusk.',
   'Lord Dunbar has declined supply-movement requests from all three succession claimants, citing equal rights of passage under his charter. He is now under simultaneous surveillance from all three factions.',
   0, 0, false),

  ('Briarvale', 'briarvale', 'Aranthor', 'village', 300,
   'The wealthiest village in the central Highfeld, 8 miles south of Dunmore, prosperous from its renowned Briarvale black cattle breed. Features a stone church, covered market building, and two inns.',
   'Blackwell''s requisitions have taken 20% of the cattle herd. One of the three cattleherding families, the Vanes, has been secretly negotiating to shelter cattle elsewhere — and has attracted a Blackwell informant.',
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
   'Lord Ronn has carried a sealed letter from his Sentinel-Order son for three months with instructions not to open it "unless something happens to me" — and he is increasingly tempted.',
   0, 0, true),

  ('Caerlhaven', 'caerlhaven', 'Aranthor', 'noble_seat', NULL,
   'The seat of House Caerl on the northern end of Ashcroft Bay, 5 miles north of Lighthaven. A fortified coastal manor with signal platform and good sight lines over the bay; Lord Emeric commands a fleet of six vessels.',
   'One of Emeric''s chartered vessels returned from a Blackwell supply run with a crewman now withdrawn and staring at water after something he saw during a night passage near the bay''s deep water.',
   0, 0, true),

  ('Kessrel Towers', 'kessrel-towers', 'Aranthor', 'noble_seat', NULL,
   'The seat of House Kessrel, 10 miles southwest of Vaelthorn — two towers of different characters joined by a great hall, architecturally peculiar and politically the most exposed noble seat in Aranthor.',
   'The Kessrel town house in Vaelthorn contains a locked room unused for twelve years, where Elowen''s dress from the night of the Night of Broken Glass still hangs; Lord Tannis has maintained secret correspondence with her agents for four years.',
   0, 0, true),

  -- ============================================================
  -- ARANTHOR: RELIGIOUS SITES
  -- ============================================================

  ('Wayshrine of the Open Hand', 'wayshrine-of-the-open-hand', 'Aranthor', 'religious', NULL,
   'The oldest continuously maintained shrine in Aranthor, on the King''s Road 5 miles south of Dunmore. A carved stone figure of Aurelion as Waykeeper in a roofed stone niche; the resident shrine-keeper offers free healing and emergency supplies.',
   'The shrine-keeper has received reports that the signal-fire link to the Crossroads Flame 15 miles south has gone dark — if true, something is wrong at that shrine.',
   0, 0, false),

  ('The Crossroads Flame', 'the-crossroads-flame', 'Aranthor', 'religious', NULL,
   'An Aurelion shrine complex on the King''s Road 20 miles south of Dunmore, at its junction with the old Covenant Road. Features a permanent bronze oil-flame lantern, carved dedication stone, and traveler benches — currently the flame is out and the shrine is defaced.',
   'The traveling priest Hadric is locked in a grain cellar 3 miles east of the Crossroads, imprisoned for 6 days by Cabal operatives who defaced the shrine and needed no witnesses; he is running out of water.',
   0, 0, false),

  ('Healing Springs of Maer''s Rest', 'healing-springs-of-maers-rest', 'Aranthor', 'religious', NULL,
   'A Maerath shrine and natural healing site in a wooded valley 8 miles east of Dunmore. A cold limestone spring feeds a 20-foot pool with genuine mild healing properties; maintained by two Maerath tenders and respected by all factions.',
   'Sister Aveth has noticed the water''s healing properties subtly changing for six months — she believes it is tied to weakening Shadow Lord seals and has been trying to reach the Sentinel Order for four months.',
   0, 0, true),

  ('Aurelion Monastery of the Seven Lanterns', 'aurelion-monastery-of-the-seven-lanterns', 'Aranthor', 'religious', NULL,
   'A working Aurelion monastery 12 miles north of Vaelthorn on a wooded hill, housing twelve monks with a library containing unique copies of Founding-era documents and material no longer available in Vaelthorn''s archives.',
   'Prior Brother Caelan Morn holds a complete copy of the original Crown Covenant including removed clauses describing a secondary activation method for the sealing power that does not require the complete Crown — he has withheld it for three years.',
   0, 0, true),

  ('Standing Flame of Highfeld', 'standing-flame-of-highfeld', 'Aranthor', 'religious', NULL,
   'An Aurelion hilltop shrine 5 miles north of Briarvale — a single 12-foot stone pillar with bronze oil lamp bracket, visible for 8 miles. Maintained by the Briarvale parish for 90 years as a permanent harvest-thanks offering.',
   'The flame has been going out with increasing frequency; a local farmer has relit it eleven times in the past month and is frightened. The cause is Shadow Lord resonance affecting the oil''s burn rate.',
   0, 0, false),

  ('Thornmere Wayside', 'thornmere-wayside', 'Aranthor', 'religious', NULL,
   'A Maerath shrine marker at the western Thornmere edge, 2 miles south of Fernholt — a carved yew post with Maerath''s cycle symbol where travelers entering the marsh have left offerings for generations.',
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
   'Something has been living in Calwick''s ruins for several years — it eats the pears, comes and goes, and has never been identified; the well cover was placed from the inside.',
   0, 0, false),

  ('The Drowned Fort', 'the-drowned-fort', 'Aranthor', 'ruin', NULL,
   'A pre-Founding ford-fort of unknown construction style submerged 8-12 feet under the River Aelwynn, 3 miles downstream from Ashford. The tops of two wall sections break the surface on low-water days in late summer.',
   'Three weeks ago a fisherman''s net came up tangled in a sealed Founding-era iron box with its seal still intact; he has been sitting on it in Ashford for three weeks, afraid to open it or report it.',
   0, 0, false),

  ('Greywood Barrow-Circle', 'greywood-barrow-circle', 'Aranthor', 'ruin', NULL,
   'A pre-Founding ritual site inside the Greywood, 6 miles from the southern treeline — eight unworked stone uprights in a 40-foot circle around a flat central stone with cup-mark carvings. A natural clearing maintains the circle''s sky sightlines.',
   'The cup-marks filled with water reflect stars not in the actual sky; a Sentinel scholar twenty years ago noted the star pattern matches the Order''s archive chart labeled "Shadow Below Approach Configuration."',
   0, 0, false),

  ('Warden''s Folly', 'wardens-folly', 'Aranthor', 'ruin', NULL,
   'The incomplete lower two floors of a round watchtower on the Barrow Down, walls intact to 20 feet with no roof. Built 180 years ago and abandoned when the commissioning lord died; used by travelers as emergency shelter.',
   'The tower sits on a ley-line intersection used by the Shadow Cabal for amplified minor rituals; the scratched names on the lower walls collectively form a partial binding sequence (DC 16 Arcana).',
   0, 0, false),

  ('The Sunken Road', 'the-sunken-road', 'Aranthor', 'ruin', NULL,
   'A 2-mile stretch of pre-Founding road sunk 3-4 feet below the current ground level east of Ael''s Cross. The road surface is intact — finely cut stone with a central drainage channel, better built than the King''s Road.',
   'A farmer''s dog has disappeared into the drainage channel at the road''s midpoint twice; both times it returned, and both times it subsequently refused to go near that section of road.',
   0, 0, false),

  ('Old Caerlhaven', 'old-caerlhaven', 'Aranthor', 'ruin', NULL,
   'The original Caerl family seat on a sea cliff 2 miles north of current Caerlhaven, abandoned 100 years ago after a coastal collapse undermined the seaward tower. Three-quarters of the old keep remain; currently used as a smugglers'' cache.',
   'The smugglers'' cache contains an uncollected crate of Shadow Cabal materials — correspondence, ritual components, and a partial manifest of Cabal agent locations on the western coast. The Cabal agent who placed it was arrested on an unrelated matter.',
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
   'Sarne has been secretly rerouting the drainage channels Blackwell''s mill needs to process green timber; Fort Ashveil is being built with wet lumber that will fail structurally in 3-5 years — nobody has noticed yet.',
   0, 0, false),

  ('Kettermere Salt-Works', 'kettermere-salt-works', 'Aranthor', 'working_site', NULL,
   'The salt production operation at the Kettermere flats, run by the Crane family under a perpetual charter from House Vael. Produces roughly 40 tons of bay salt per year; has received multiple Shadow Cabal purchase approaches.',
   'The Crane family''s second son Pell, 22, has been meeting secretly with a Cabal agent — not to sell the works but because he is interested in the offer of magical training.',
   0, 0, false),

  ('Frostback Quarry', 'frostback-quarry', 'Aranthor', 'working_site', NULL,
   'A limestone quarry 2 miles above Cresthollow on the Frostback Ridge lower slope, operated under the village council''s charter. Employs 35 workers and produces premium pale Frostback limestone for Vaelthorn construction.',
   'The quarry''s upper face broke into an intact 800-year-undisturbed Stone-Speaker workshop; the hired engineer Toral Bress is trying to decide who among the current factions can be trusted with the discovery.',
   0, 0, false),

  ('Aelwynn Fishery at Dunwater', 'aelwynn-fishery-at-dunwater', 'Aranthor', 'working_site', NULL,
   'A commercial fishery on the lower River Cael below Dunwater, operated under House Ashmore''s river fishing rights. Runs a smoking house and three fishing boats employing 12 workers; output is down 30%.',
   'A worker diving to clear a fouled anchor saw a channel cut too regularly through the river bottom, running east — he did not follow it and will not.',
   0, 0, false),

  ('Highfeld Grain Collective', 'highfeld-grain-collective', 'Aranthor', 'working_site', NULL,
   'A multi-village grain storage cooperative 6 miles east of Briarvale, coordinated by six Highfeld villages through a 40-year-old charter. The central stone granary holds 800 tons of grain; under legal dispute with Blackwell over requisition rights.',
   'Manager Seff Oren has discovered one of the six village representatives has been supplying Blackwell''s officers with the cooperative''s detailed storage manifests — he knows who it is but cannot act without risking all six villages.',
   0, 0, false),

  ('Brynn''s Vineyards', 'brynns-vineyards', 'Aranthor', 'working_site', NULL,
   'The only significant wine producer in Aranthor, 8 miles southeast of Vaelthorn on the River Cael. Five generations of the Brynn family have produced roughly 15,000 bottles per year from 200 acres; now under House Kessrel''s "protection."',
   'The vintage cellar''s lowest level contains a sealed door older than the current family; the 84-year-old grandmother insists it was sealed for good reason by a man she cannot name — and no one has opened it in three generations.',
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
   'Three days ago someone posted a carved wooden notice reading "The Thornwick bell has been silenced. Ask why." — the handwriting matches the Sentinel Order''s regional correspondent.',
   0, 0, false),

  ('Aelford Bridge and Inn', 'aelford-bridge-and-inn', 'Aranthor', 'crossing', NULL,
   'The key crossing of the upper River Aelwynn at Aelford, 18 miles upstream from Ashford, bridged 200 years ago. The bridge toll is collected by Crown reeve Cass Henner; the adjacent Aelford Inn is run by his personal friend Tomm Reach.',
   'Last week a Blackwell convoy sergeant drew his sword on the reeve over the toll; Henner collected it anyway without moving or raising his voice, and something in his expression made the sergeant sheathe. Tomm witnessed it and has been thinking about it all week.',
   0, 0, false),

  ('The Mereford Inn', 'the-mereford-inn', 'Aranthor', 'inn', NULL,
   'The last inn before the Thornmere, a low half-concealed building 3 miles north of Fernholt on the marsh road. Owned by retired Merefolk guide Holt Cass, who also offers guiding services into the western Thornmere at 2gp per party per day.',
   'Holt has refused two guide contracts in the past month from travelers asking the wrong kind of questions — specifically, they asked about places in the Thornmere with no solid ground, as if that were the destination.',
   0, 0, false),

  ('The Split Crown', 'the-split-crown', 'Aranthor', 'inn', NULL,
   'The last inn before Vaelthorn, 5 miles north of the capital on the King''s Road. Innkeeper Rellen Crae has run the establishment with maximum neutrality and discretion through twelve years of political crisis, making it the preferred meeting ground for all factions.',
   'A mid-rank Cabal agent, a Crown Loyalist courier, and a Blackwell intelligence officer are all currently staying at the inn without knowing about each other — Rellen knows about all of them.',
   0, 0, false),

  ('Warden''s Ford', 'wardens-ford', 'Aranthor', 'crossing', NULL,
   'One of the few remaining Crown toll points outside Vaelthorn, on the River Aelwynn 6 miles east of the Split Crown Inn. A knee-to-thigh-deep ford with guide posts, a maintained tollhouse flying a Crown pennant, staffed by deputy reeve Alec.',
   'Alec has been researching whether a ford-toll charter issued by a legitimate king can be voided without a full Council of Lords ratification — his notes in the tollhouse may represent significant constitutional law. The Kessrel family''s lawyers have noticed.',
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
   'Arcane Vanguard Commander Veth Orinas has independently mapped anomalous geomantic readings that precisely correspond to Shadow Lord anchor points — she is deciding whether to report, suppress, or share her findings.',
   0, 0, true),

  ('Sorthun', 'sorthun', 'Darian Empire', 'city', 19000,
   'Provincial capital of Lithorica, built directly on top of the conquered Litorin city of Litor-Keth. The Empire replaced all major Litorin public buildings with Darian architecture; Litorin people still live here as registered citizens, speaking Darian in public.',
   'Beneath the new administrative plaza the foundations of Litor-Keth''s great temple were too deep to demolish; the temple still stands underground, used as a Litorin resistance meeting place — and it sits atop a sealed vault the Litorin were protecting long before the Empire arrived.',
   0, 0, true),

  ('Caelport', 'caelport', 'Darian Empire', 'city', 31000,
   'The Empire''s only major sea port on the western coast, at the mouth of the Aurin River into Caldrath Bay. The most cosmopolitan city in the Empire; handles imperial naval traffic, overseas trade, and the fish market that keeps Caldrath fed.',
   'A Sapphire Coast merchant captain has been passing messages between Census Cheats cells for two years from her ship the Amber Wake, which docks every thirty days. The Blackguard''s file on her is two weeks from complete.',
   0, 0, true),

  ('Harren''s Gate', 'harrens-gate', 'Darian Empire', 'town', 7500,
   'A garrison town one hour east of Ironwatch along the Ironway, existing entirely to support the border complex with inns, bathhouses, provisioners, and a smiths'' district running three shifts producing Ironwatch replacement hardware.',
   'Several soldiers in the current rest rotation have been keeping private logs of unexplained lights and patrols that return silent from the mountain passes — the logs have been confiscated twice and keep reappearing.',
   0, 0, true),

  ('Ruven', 'ruven', 'Darian Empire', 'town', 5200,
   'The youngest city in the Empire, founded thirty years ago as a military colony to secure the northern Lithorican frontier. Population is half veteran settlers and half reluctant conscript arrivals; more Blackguard agents per capita than anywhere else in the Empire.',
   'Three census workers in Ruven have been quietly altering records of Litorin frontier families — paid by an unknown party who wants those families to disappear from the official record before the next eastern expansion campaign.',
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
   'Arcane Vanguard survey findings precisely correspond to mile-stones 40, 82, and 117 on the Via Caldra''s northern stretch — the road itself is a map of Shadow Lord anchor points.',
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
   'Census Cheats has identified a maintenance access tunnel beneath aqueduct arch 47 connecting to a pre-Darian drainage system under Caldrath''s northeast quarter — an unrecorded six-hour underground route into the capital.',
   0, 0, false),

  ('The Aurin Bridge', 'the-aurin-bridge', 'Darian Empire', 'crossing', NULL,
   'The largest bridge in the Empire, spanning the Aurin River south of Varix. Wide enough for two legions to cross simultaneously; staffed by a permanent 500-soldier toll cohort. Built 200 years ago in a single campaign season by the III Caldran Legion.',
   'The bridge keeper Cass Orren has been recording the names of every crossing traveler in a private log for eleven years out of compulsive habit — his log is the most complete record of Aranthorian agents entering the Empire that exists.',
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
   'The entire Fortlet Pale staff are Census Cheats sympathizers who have been selectively omitting names from official logs for four years — the Blackguard has not yet identified the method.',
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
   'A private military road connecting Stonefall directly to Dalven, bypassing the Ironway. Shorter and meaner than imperial roads — unpaved in stretches, narrow, nicknamed "the Scar" by the workers who travel it.',
   'Four workers have disappeared on the section passing through the Vein Hollow in the last year; the official determination is banditry, but there are no bandits in this part of the Empire.',
   0, 0, false),

  -- ============================================================
  -- DARIAN EMPIRE: VILLAGES AND SUBJECT SETTLEMENTS
  -- ============================================================

  ('Aurinford', 'aurinford', 'Darian Empire', 'village', 1100,
   'A thoroughly Darianized farming village 30 miles north of Caldrath on the Via Caldra, at the Aurin River''s first major ford. Supplies grain and vegetables to Caldrath''s outer districts; features a Soleth shrine, census office, and imperial primary school.',
   'One family, the Veth clan, has never assimilated — they speak the old tongue at home, observe old festivals in private, and keep pre-conquest census records in a sealed farmhouse room. They are memory, not resistance.',
   0, 0, false),

  ('Kethmoor', 'kethmoor', 'Darian Empire', 'village', 640,
   'A village half a day south of the Ironway between Dalven and Harren''s Gate, destroyed during the conquest and rebuilt on the same ground with standard imperial grid layout. The original Kethmoor residents'' descendants were relocated to Dalven.',
   'The graves of original Kethmoor residents lie under the new village''s administrative center; the relocated descendants make anniversary visits leaving offerings on the steps that current residents mistake for unfamiliar religious customs.',
   0, 0, false),

  ('Litor''s Shore', 'litors-shore', 'Darian Empire', 'village', 2800,
   'A Litorin fishing community on the imperial coast, one of the oldest continuously inhabited settlements in Lithorica, predating the Empire by at least a thousand years. The Empire added a naval waystation and census office to its northern edge.',
   'Litorin fishers here have navigated coastal waters for a thousand years by stars and memory; their mental maps of sea bottom, coves, and currents are more detailed than any imperial chart — a fact of significant strategic interest.',
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
   'The Harken Mill cell has received intelligence that the Arcane Vanguard''s eastern mapping surveys correspond to sites of historical significance to every pre-Darian culture in Lithorica simultaneously — but they lack the magical knowledge to understand what it means.',
   0, 0, false),

  ('Solport', 'solport', 'Darian Empire', 'town', 3400,
   'A self-governing shipbuilding town on the Bay of Caldrath, a short ferry ride west of Caelport. Solport negotiated protected status during the Empire''s western expansion rather than fighting; produces the Empire''s merchant fleet under a hereditary shipwright guild.',
   'The Solport shipwright guild has accepted a commission through a third-party merchant for four medium-weight transport vessels with reinforced keels and no imperial registration markings — the Blackguard would very much like to know who placed the order.',
   0, 0, true),

  ('Gravenstone', 'gravenstone', 'Darian Empire', 'village', 910,
   'A village built around a worked-out silver seam in Ferrum Province, incorporated during pacification. Produces nothing of strategic value and sits too far from the Ironway to make a useful waystation; the least-watched community in Ferrum Province.',
   'The exhausted mine beneath Gravenstone connects to a natural cave system the original miners mapped but never reported; the system eventually connects to the same underground network that reaches Litor-Keth — no one in the Empire knows this.',
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
   'The estate of House Talveth, eight miles east of Caldrath — five towers of different heights visible from the Via Caldra. House Talveth holds the census administration contracts for Caldra Prima and has turned the position into a private extortion operation.',
   'Census Cheats was founded by a former House Talveth clerk who understood the system intimately; now House Talveth''s head Mira is running a parallel internal investigation into unauthorized record access that keeps colliding with the Blackguard''s own unrelated investigation.',
   0, 0, true),

  ('Aurantis Manor', 'aurantis-manor', 'Darian Empire', 'noble_seat', NULL,
   'The estate of House Aurantis, 20 miles southeast of Caldrath near the Bay of Caldrath. The house controls the largest private fleet in the Empire and has been profiting from the Aranthorian succession crisis by feeding money to multiple factions simultaneously to keep the conflict going.',
   'Admiral-Emeritus Dral Aurantis has recently made contact with representatives of the Free Isles Compact through legitimate trade channels — his interest in them is not commercial.',
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
   'In absolute darkness the space where the inscription was chiseled away becomes faintly luminous — in a script that predates the Litorin people by at least two thousand years.',
   0, 0, false),

  ('Bloodfield', 'bloodfield', 'Darian Empire', 'ruin', NULL,
   'The site four miles south of Dalven where the III and IV Legions broke the last organized resistance of the Ferrum hill clans 43 years ago, killing twelve thousand in a single afternoon. Now farmland marked by a single imperial monument.',
   'On the anniversary of the battle, the field''s crops glow faintly blue at midnight. The farmers have noticed and do not discuss it with the census office.',
   0, 0, false),

  ('Sanctum of the Unwritten', 'sanctum-of-the-unwritten', 'Darian Empire', 'ruin', NULL,
   'A Litorin sacred site three hours east of Sorthun, officially classified as "demolished and cleared" due to a bribed survey officer who filed false paperwork. A ring of standing stones carved with dense pre-Litorin script on a hilltop, maintained in secret by local families.',
   'The stones are a recording medium — a method of storing spoken word in stone inherited from a civilization that preceded the Litorin. The stones remember the voice of something imprisoned in the earth beneath this hill long before the Litorin built around it.',
   0, 0, false),

  ('Fort Aldrus (Ruins)', 'fort-aldrus-ruins', 'Darian Empire', 'ruin', NULL,
   'The ruins of the hill clans'' primary stronghold in Ferrum Province, two days north of the Ironway on a difficult mountain track. Stormed by the IV Legion in the opening campaign of the Ferrum pacification; partially demolished and abandoned.',
   'The lowest level of Fort Aldrus — an original pre-clan building of unknown construction — was sealed by the IV Legion with a bronze door bearing Arcane Vanguard enchantments that predate the Vanguard''s founding by at least three hundred years.',
   0, 0, false),

  ('The Sunken Ward', 'the-sunken-ward', 'Darian Empire', 'ruin', NULL,
   'The buried foundations of whatever city occupied Caldrath''s location before the Empire built there, accessible through pre-Darian drainage tunnels beneath the northeastern quarter. Mostly flooded and partially collapsed; outer tunnels are used by Census Cheats cells.',
   'The Arcane Vanguard''s chief cartographer privately noted that geomantic readings from Caldrath''s northeastern quarter are inconsistent with natural geology and appear architecturally induced — the anomaly has been measurably growing every year since.',
   0, 0, false),

  -- ============================================================
  -- DARIAN EMPIRE: GEOGRAPHIC FEATURES
  -- ============================================================

  ('The Aurin River', 'the-aurin-river', 'Darian Empire', 'geographic', NULL,
   'The great river of the Imperial heartland, rising in the northern forest highlands and flowing 200 navigable miles south-southwest to empty into the Bay of Caldrath. Grain barges work it constantly; the Empire maintains a complete vessel manifest.',
   'The river is sometimes called the "First Road" — the Empire''s earliest expansion followed its course, and its regulation is one of the primary mechanisms of imperial economic control.',
   0, 0, false),

  ('The Ironwall Mountains', 'the-ironwall-mountains', 'Darian Empire', 'geographic', NULL,
   'The mountain range forming the Empire''s western border with Aranthor, running roughly north-south for 300 miles. Not impassable — the well-traveled Ironwatch pass exists — but high mountain routes require equipment and experience.',
   'Imperial survey maps show the Ironwall in precise topographic detail except for a northern section where three survey teams produced contradictory results and the fourth never returned.',
   0, 0, false),

  ('Bay of Caldrath', 'bay-of-caldrath', 'Darian Empire', 'geographic', NULL,
   'The protected bay roughly 30 miles across into which the Aurin empties, serving as the Empire''s primary naval anchorage. The I Naval Legion''s fleet winters here; the Emperor''s Fist, a natural rock formation, serves as a major navigational landmark.',
   'The bay''s waters are unusually clear — you can see the bottom in 20 feet of water — which the Vanguard attributes to Aurin freshwater dilution. Whether this is the true explanation has not been fully investigated.',
   0, 0, false),

  ('The Eastern Reaches', 'the-eastern-reaches', 'Darian Empire', 'geographic', NULL,
   'Territory east of Lithorica that the Empire has pacified but not yet fully settled — rolling mixed forest, grassland, and scattered hills. The Vanguard''s classified reports from here are the largest single file in Vanguard archives.',
   'The local Ven people have been remarkably — unusually — cooperative with the census process, in ways that census officers find slightly unsettling. What they know or want is unclear.',
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
