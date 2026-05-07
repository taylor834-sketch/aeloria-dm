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
   'Liaison Torren Ashvale will share a current Wanderer sighting map with players willing to share what they learn — forty-seven confirmed sightings this month versus twelve a year ago, and he has told no one how bad it has become.',
   0, 0, false),

  ('Wychfall', 'wychfall', 'Veilwood', 'village', 520,
   'A trapping and fishing community on the Veilwood''s eastern margin, built around forest-fed ponds whose water tastes of something no one can name. The town lost seven trappers last winter; four returned changed, three did not, and a row of seven empty chairs on the eastern edge marks each one.',
   'The four returned trappers live at the edge of town and are functional but described as like talking through water; one named Brine Ashford says the same sentence every night before sleep: "The cathedral is beautiful. You would not be afraid."',
   0, 0, false),

  ('Pallside', 'pallside', 'Veilwood', 'village', 90,
   'A small village two miles inside the Outer Wood that should have been abandoned and wasn''t — nine extended families of six generations whose buildings have been grown around by the forest in ways suggesting the forest has accepted them. The path to it has narrowed from wagon-width to shoulder-width over three years.',
   'Pallside residents have no memory of their founding ancestor''s name — it has faded to illegible pale marks in every document — and find this unremarkable; players making Arcana or History checks will find it deeply remarkable.',
   0, 0, false),

  ('Crestholm', 'crestholm', 'Veilwood', 'town', 710,
   'The largest treeline settlement, a market town at the King''s Road junction with two inns, a market square, a Sentinel Order office, and a temple to the Leafed God. The market sells elven-sourced goods, silverleaf lumber, and dried dreamvine; the Sylvara road has been quiet for fourteen months.',
   'The temple''s founding chronicle describes a previous period of forest strangeness resolved after "the bright-singers were silenced," but the three pages documenting how it was resolved have been torn out — an old tear, not recent.',
   0, 0, true),

  ('Thorngate', 'thorngate', 'Veilwood', 'fort', 260,
   'A fortified waystation on the forest road midway between Crestholm and Sylvara, marking the end of the safe Outer Wood and the beginning of the zone where elven escorts are expected. The gatehouse log records every party that has passed into the Veilwood; of twenty-three groups this past year, eleven have returned.',
   'Retired Sentinel guide Correm Talle has not taken a client into the Middle Wood in eight months, saying the thread is unreliable; twelve entries in the gatehouse log end with a dash and a date, waiting for a return that hasn''t come.',
   0, 0, false),

  ('Ironkeel', 'ironkeel', 'Veilwood', 'village', 430,
   'A four-hundred-year-old settlement on the forest''s northwestern edge, home to the Ironkeel Memory — an oral tradition maintained by family elders called Remembrancers who have memorized generations of practical forest knowledge because the Pale Choir''s influence destroyed their written records.',
   'Head Remembrancer Vayne Brock has noticed two colleagues forgetting specific oral entries — not randomly, but the exact entries about the previous Choir stirring two hundred years ago — and at seventy-eight is running out of time to determine if the cause is age or something worse.',
   0, 0, false),

  ('Rootswatch', 'rootswatch', 'Veilwood', 'village', 140,
   'A watchtower settlement on a low hill at the Veilwood''s southern tip, built around a Sentinel Order tower with clear sightlines into the first mile of trees. Tower keeper Pell Whisker has filled six ledgers with logs of unusual treeline phenomena including an instance where the treeline visibly advanced thirty feet overnight.',
   'Pell''s most recent entry, four days ago, records the treeline moving twelve more feet — measured three times — and ends with "I am going to stop measuring."',
   0, 0, false),

  -- ============================================================
  -- VEILWOOD: DEEP FOREST LOCATIONS
  -- ============================================================

  ('The Threaded Way', 'the-threaded-way', 'Veilwood', 'geographic', NULL,
   'The Veilwood''s primary navigable path — a fifteen-mile sequence of silver-banded trees maintained by elven navigators, running northeast from Mirepost through the Outer Wood to Sylvara''s ground gates. The marks have been failing for fourteen months, healing faster than navigators can recut them.',
   'Players examining the healing marks with Arcana DC 15 will find the cuts are being filled not by natural bark growth but by a warm, pale, odorless substance coming from inside the wood.',
   0, 0, false),

  ('The Silverbrook', 'the-silverbrook', 'Veilwood', 'geographic', NULL,
   'A river running east-west through the Outer Wood, named for the silver light its water produces at night. The Wading Stones crossing is a cluster of seven flat submerged stones on the Threaded Way; the brook''s navigational clarity has been slowly diminishing over three years.',
   'Objects left at the Wading Stones crossing by travelers — coins, buttons, a child''s toy — are always found slightly closer to the water than they were left, and the phenomenon is accelerating.',
   0, 0, false),

  ('The Pale Glade', 'the-pale-glade', 'Veilwood', 'geographic', NULL,
   'A perfectly circular two-hundred-foot clearing in the Middle Wood with short white grass that grows to exactly the same height across the whole space, does not move in wind, and leaves no footprints. Old Sentinel maps note it with "approach with caution — identity anchor required."',
   'In the center stands a smooth waist-height stone with absorbed markings that read under Arcana DC 18: "THIS PLACE HAS BEEN SINCE BEFORE THE NAMES. HOLD YOURS." Visitors without a consciously held identity anchor may lose specific personal information after an hour inside.',
   0, 0, false),

  ('The Giant''s Stave', 'the-giants-stave', 'Veilwood', 'geographic', NULL,
   'The largest tree in the Veilwood by a wide margin — sixty feet in circumference, three hundred feet high — used as the primary landmark for orienting in the Middle Wood. Its bark shows patterns like thousands of overlapping handprints pressed barely into the surface.',
   'Someone has been building a camp at the Stave''s base: a lean-to, a fire circle with four-to-six-week-old ash, and deliberately arranged objects including carved human figures. The Sentinel Order believes it is a Shadow Cabal outpost.',
   0, 0, false),

  ('The Stone Circle of Mael Duin', 'the-stone-circle-of-mael-duin', 'Veilwood', 'ruin', NULL,
   'Nine standing stones of pale blue-grey granite in an oval forty feet across, twelve feet tall each, made of material matching no local geology — they predate the human kingdoms and the elves'' arrival in the Veilwood. Animals avoid the interior but sleep against the exterior stones.',
   'This is one of the five anchor points of the Pale Choir''s prison structure; a Seal-Instrument is buried at the base of the northernmost stone with erratic but not yet critical readings, and the Sentinel Order believes the stones are an active component of the original binding.',
   0, 0, false),

  ('The Pale Road', 'the-pale-road', 'Veilwood', 'geographic', NULL,
   'A three-foot-wide path of smooth, faintly luminous, warm pale stone running through the Middle Wood, pointing directly toward the Pale Cathedral six miles further in. It appears made from inside out, as if something under the ground pushed up a strip of itself to the surface.',
   'Walking the road requires DC 12 Wisdom saves every ten minutes or the walker begins feeling growing peace and purposelessness — a sense that everything that matters is ahead. Footprints stained into the pale stone go one direction only: toward the Cathedral.',
   0, 0, false),

  ('Wander''s Rest', 'wanders-rest', 'Veilwood', 'ruin', NULL,
   'An abandoned Sentinel Order waystation in the Middle Wood, intact but transformed: the interior has been arranged into a careful dining scene using objects travelers dropped in the forest, with six settings around improvised furniture. Something revisits and refreshes the arrangement.',
   'One "chair" — a rotted log — is positioned isolated from the others with no setting in front of it. Memory-Keepers of Sylvara, if told, will go very quiet and say: "That is where it sits."',
   0, 0, false),

  ('The Fog Valley', 'the-fog-valley', 'Veilwood', 'geographic', NULL,
   'A mile-long, half-mile-wide bowl-shaped depression in the Middle Wood where dense white fog collects year-round regardless of weather. Navigation inside requires either elven thread-sense or a rope line anchored at the edge; three confirmed deaths in two years from hypothermia after circular wandering.',
   'Old elven records name this place "The Place of Almost-Remembering," predating the current Choir stirring by a millennium — it has always been this way, which the Memory-Keepers do not find reassuring.',
   0, 0, false),

  ('The River Junction', 'the-river-junction', 'Veilwood', 'geographic', NULL,
   'Where the Silverbrook meets the northward-flowing Pale Water in the Middle Wood, one of three places where multiple reliable compass directions can be established simultaneously. A large flat stone at the junction serves as an orientation base and elven navigator message board.',
   'The most recent carved message, from four days ago, reads "thread is wrong here"; another more recent mark appears to be the first four letters of a name that was not finished. On clear days the water reflects a different season than what is above.',
   0, 0, false),

  ('The Pale Cathedral Approaches', 'the-pale-cathedral-approaches', 'Veilwood', 'geographic', NULL,
   'The five-mile radius around the Pale Cathedral where the Choir''s direct influence replaces the ambient erosion of the rest of the Deep Wood, beginning roughly four days northeast of Mirepost. The Cathedral itself is visible on clear days — genuinely beautiful, genuinely wrong, surrounded by silence.',
   'Entering without significant magical protection requires DC 16 Wisdom saves per half-hour against stacking identity-memory loss; elven scouts report the Cathedral appears larger each visit, as if always finishing something it is building.',
   0, 0, false),

  ('The Dreaming Ground', 'the-dreaming-ground', 'Veilwood', 'geographic', NULL,
   'A half-mile stretch of Middle Wood where Dreamvine has overgrown everything — floor, undergrowth, lower tree sections, stone outcroppings — producing pollen dense enough to guarantee memory-dreams within minutes of entry without face covering.',
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
   'In the past year the harmonics have changed — a dissonance has entered. Three Memory-Keepers independently said, without consulting each other: "It is singing along."',
   0, 0, true),

  ('Wayfarer''s Stone at the River Fork', 'wayfarers-stone-at-the-river-fork', 'Veilwood', 'geographic', NULL,
   'An ancient elven waymarker standing stone twelve feet tall at the junction of the Pale Water and the Veilborn Stream, covered in waymark runes older than current elven script conventions and always a few degrees warmer than surrounding air.',
   'One face of the stone points to a destination in no current records — a four-syllable name partially translating as "the place that was the center before the center moved." Players following the bearing will need three days in the Middle Wood.',
   0, 0, false),

  ('The Understory Shrines', 'the-understory-shrines', 'Veilwood', 'religious', NULL,
   'A network of small elven spirit-shrines scattered through the Outer Wood, each a day''s walk from the next, named for concepts rather than deities: the Shrine of Names, the Shrine of First Steps, the Shrine of What Was Said, the Shrine of the Wound, and others.',
   'Three shrines on the eastern circuit have been found with offerings missing and carved inscriptions absorbed — not vandalized but consumed by Choir influence. The Shrine of What Was Said now has new unidentified script on it that looks like it is trying very hard to be language.',
   0, 0, false),

  -- ============================================================
  -- VEILWOOD: SENTINEL ORDER INFRASTRUCTURE
  -- ============================================================

  ('Watchpost Thorn', 'watchpost-thorn', 'Veilwood', 'fort', NULL,
   'The Sentinel Order''s primary secondary station one mile west of Mirepost on the treeline, housing the most active Seal-Instrument in the region. Commander Brael runs nine functional Sentinels against a post designed for twenty, methodically angry at headquarters for withholding reinforcements.',
   'Brael will ask players before anything else to carry a sealed message to Commander Elyndra in Sylvara. He says it is routine. His face says it is not.',
   0, 0, false),

  ('The Vine Station', 'the-vine-station', 'Veilwood', 'working_site', NULL,
   'A Sentinel Order research outpost inside the Outer Wood, deliberately camouflaged among undergrowth to read as deadfall from ten feet away, where three rotating researchers study active Choir influence — memory-wisps, dreamvine acceleration, and healing Threaded Way marks.',
   'Researcher Corval''s childhood memory list grows shorter each morning; he thinks he is replacing old memories with new observations, but Liseth believes he is under early-stage Choir influence and Grundt believes it is time to leave — the tiebreaker just arrived.',
   0, 0, false),

  ('The Five Anchor Points', 'the-five-anchor-points', 'Veilwood', 'geographic', NULL,
   'The five sites within or near the Veilwood forming the Pale Choir''s prison structure, each monitored by the Sentinel Order at varying levels. They include the Pale Cathedral, the Stone Circle of Mael Duin, the Giant''s Stave, the River Junction, and Ashenveil.',
   'Players who chart all five anchors on a map and make DC 15 Arcana recognize the prison-binding pattern; at DC 20 they notice the pattern has a sixth point — and it is Sylvara.',
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
   'The Ironkeel Remembrancers'' oldest accounts record the Veilborn running southwest — it changed direction during the previous Choir stirring three hundred years ago. They believe it can change again.',
   0, 0, false),

  ('The Pale Water', 'the-pale-water', 'Veilwood', 'geographic', NULL,
   'A north-south river in the Middle Wood with a white streambed of material matching no local geology and water that appears almost luminous over it, cutting across the Threaded Way route. It does not appear on any map made before three hundred years ago.',
   'The Memory-Keepers attribute the river''s appearance to the Pale Choir''s previous stirring and consider it a measure of the Choir''s reach — the river is, in some sense, the Choir leaking into the physical world.',
   0, 0, false),

  ('The Heart', 'the-heart', 'Veilwood', 'geographic', NULL,
   'The central region of the Deep Wood, roughly ten miles in diameter centered on the Pale Cathedral, where normal forest physics do not apply: trees of impossible size, a completely closed canopy, no sun or stars, and spatial distortion operating as a constant. The Sentinel Order''s current Red Zone covers it in full.',
   'Players with accumulated Veilwood knowledge should sense the Heart''s presence as a weight in the northeast, a direction the birds don''t fly — when they finally must enter, they will know exactly what they are entering.',
   0, 0, false),

  ('Pale Stone Ridge', 'pale-stone-ridge', 'Veilwood', 'geographic', NULL,
   'A two-mile-long, forty-foot-high ridge of the same pale stone as the Pale Road and Pale Cathedral running north-south through the western Middle Wood, geologically impossible in this location. Trees grow up to its edge and stop; the ridge itself is bare, and has grown two feet in height over the past eighteen months.',
   'Near the ridge''s northern end a forty-foot section has been shaped from below — not cut but pressed, the stone shaped as if from underneath. The shapes are not language. They are faces.',
   0, 0, false),

  ('The Listening Hollow', 'the-listening-hollow', 'Veilwood', 'geographic', NULL,
   'A natural bowl-shaped acoustic formation in the Outer Wood where whispers at the center are audible at the rim, used by elves for centuries as a meeting ground. Since the Choir stirring began, it also amplifies things that are not sounds.',
   'At night, players at the bowl''s center who fail DC 12 Wisdom saves hear voice-fragments describing ordinary things — a kitchen, a walk to market, a called name — that sound like memory. A DC 15 Insight check reveals one voice describes something specific to one player''s own personal history.',
   0, 0, false),

  ('The Canopy Road', 'the-canopy-road', 'Veilwood', 'geographic', NULL,
   'The elven high route between Sylvara and the Highwatch Spires, a network of suspension bridges, platforms, and living-wood walkways three hundred feet above the forest floor that bypasses the ground-level Veilwood entirely.',
   'One section crosses above the Giant''s Stave; elven navigators who use this platform regularly report that the Stave''s crown sometimes contains blue-white light, moving slowly, not reflecting anything above it.',
   0, 0, false),

  ('The Fog Basin', 'the-fog-basin', 'Veilwood', 'geographic', NULL,
   'The geographic low point of the Veilwood, a four-mile-wide drainage basin collecting cold from the deep forest and producing semi-permanent ground fog year-round, cut through by the Pale Water and hosting the Fog Valley''s worst accumulation at its center.',
   'On certain mornings the basin produces a phenomenon the elves call "the Translation" — the mist is lit from below with blue-white light in columns that look like a city. The elves do not explain what is being translated.',
   0, 0, false),

  -- ============================================================
  -- VEILWOOD: RUINS
  -- ============================================================

  ('The Sunken Tower', 'the-sunken-tower', 'Veilwood', 'ruin', NULL,
   'An eight-hundred-year-old stone tower that has sunk halfway into the forest floor for unclear reasons, with the top half accessible and filled with the belongings of its last occupants under centuries of dust, and the lower floors submerged in knee-deep groundwater that never changes level.',
   'The maps in the upper floors show the Veilwood eight centuries ago, significantly smaller; at the current rate of expansion the treeline will reach Mirepost in approximately eighty years.',
   0, 0, false),

  ('Greenstone Fort', 'greenstone-fort', 'Veilwood', 'ruin', NULL,
   'A pre-Crown military fortress consumed by four centuries of tree growth — its thirty-foot-thick foundations and siege-designed walls now structurally supported by the same trees that broke through them. Its history documents the first known cases of Choir-adjacent memory erosion that prompted current Sentinel protocols.',
   'The fort''s deepest cellar holds the last garrison commander''s journal, whose final entries describe a decision about what to do with the evidence — and whether anyone outside should know. The journal''s final page has been torn out and not found.',
   0, 0, false),

  ('The Forgotten Village', 'the-forgotten-village', 'Veilwood', 'village', 60,
   'A village in the Middle Wood where approximately sixty people have lived for at least two hundred years — farming, trading, maintaining their houses — but none of them know what their village is called. The name is present in their minds but connects to nothing; by morning it is just "here" again.',
   'The Pale Choir did not take their name — it took their relationship to their name, the feeling of "this is my home, this is where I am from." The Sentinel Order archive speculates the Choir consumes not memories but the emotional significance that makes information matter; this village is the purest example.',
   0, 0, false),

  ('Ashfall Hall', 'ashfall-hall', 'Veilwood', 'ruin', NULL,
   'A pre-Crown great hall burned and rebuilt and burned again — three distinct construction phases visible in the stonework — now a roofless ruin one mile inside the Outer Wood. Its cellar holds a twelve-generation stone genealogy whose most recent six entries each end with the phrase "Taken by the Wood."',
   'The Veilwood elves know this family and will not speak of what happened; pressing hard with enough elven trust yields one Dreamwalker elder''s admission: "They asked us to teach them the thread. We did. Some things, once learned, cannot be unlearned."',
   0, 0, false),

  ('The Builder''s Ring', 'the-builders-ring', 'Veilwood', 'ruin', NULL,
   'A ring of sixteen low pre-Crown foundations in a circle two hundred feet in diameter in the Middle Wood, each about twenty feet across, showing signs of deliberate demolition by burning. The center is bare earth in a ten-foot circle where nothing grows, slightly cooler and finer-textured than surrounding soil.',
   'The Memory-Keepers'' oldest archive has a single entry — added later, in a different hand — translating as "the circle of the speakers," with no further explanation. Players speaking aloud in the bare center circle find their voice takes a moment longer to stop than it should.',
   0, 0, false),

  -- ============================================================
  -- SAPPHIRE COAST: COASTAL TOWNS AND FISHING VILLAGES
  -- ============================================================

  ('Saltmoor', 'saltmoor', 'Sapphire Coast', 'town', 3100,
   'The salt capital of the Sapphire Coast for three centuries, built around tidal salt flats that produce the finest sea salt on the continent. The Salt Guild holds collective ownership of the flats with every town family as a member, and Duchy taxes are always paid on time — in salt.',
   'A Darian trade attaché has been trying for two years to secure preferential pricing on Saltmoor salt for the Imperial legionary supply system; the Salt Guild has declined three times at Selene''s instruction, and someone higher than a trade attaché in Caldrath is now involved.',
   0, 0, true),

  ('Pearlwater', 'pearlwater', 'Sapphire Coast', 'town', 1400,
   'A prosperous insular town inside a protected cove where warm and cold currents meet to create conditions for unusual oysters and occasional pearls, with pearl diving passed exclusively through family guild lines. The town hall floor is made of discarded oyster shells mortared and polished to a mirror shine.',
   'Three pearl divers have vanished in the last eight months — not lost at sea but simply never surfacing from calm dives. The Guild has told no one outside the town because revealing the danger makes the beds public knowledge.',
   0, 0, true),

  ('Glasswind', 'glasswind', 'Sapphire Coast', 'town', 2200,
   'A prosperous artisan town producing the finest window glass and blown glass vessels on the coast using a furnace technique allegedly developed by a scholar who washed ashore two centuries ago with only a notebook of designs. The guildhall''s harbor-facing walls are glass-paneled and glow amber at sunset.',
   'The "scholar who washed ashore" was not a scholar; his notebook still exists in the master glassblower''s family, and its designs extend well beyond glass manufacturing into what a trained arcanist would recognize as enchantment schematics.',
   0, 0, true),

  ('Breakwater', 'breakwater', 'Sapphire Coast', 'town', 5800,
   'The working coast''s largest fishing community south of Dawnharbor, rough and self-reliant, serving as the Tide Gang''s southern anchor. Harbor master Corra Dex has a private understanding with the local Tide Gang cell that keeps the harbor operational and tax collectors moderately satisfied.',
   'One of Corra''s fishing boats, the Hardbottom, makes unusually short trips — out at dusk, back before dawn with little fish and good coin. Corra knows and is not asking.',
   0, 0, true),

  ('Teal Cove', 'teal-cove', 'Sapphire Coast', 'hamlet', 680,
   'A small fishing village at the bottom of a cove that was productive a generation ago and isn''t anymore — the deep-water shoals shifted south, half the families left, and the ones who stayed are older, harder, and considerably less welcoming to visitors. The harbormaster insists there is nothing interesting here.',
   'Teal Cove was a Tide Gang operational base twenty years ago; the "back way" that remaining villagers won''t explain is a tunnel to a sea cave used for moving contraband that has been inactive for fifteen years, which does not mean it is currently empty.',
   0, 0, false),

  ('Cinderport', 'cinderport', 'Sapphire Coast', 'town', 4600,
   'The northernmost significant harbor on the Sapphire Coast, at the boundary where the Duchy''s commercial framework gives way to less organized coastline, handling significant traffic from the Shattered Isles and vessels that change flags on approach. Two harbormasters operate: the official Duchy appointment and the one actual harbor pilots defer to.',
   'A Darian military vessel anchored three weeks ago for "routine inspection," did not find what it was looking for, and left two plainclothes observers behind who have been asking questions about north-coast traffic since.',
   0, 0, true),

  ('Salthook', 'salthook', 'Sapphire Coast', 'hamlet', 890,
   'A tight-knit fishing community four miles south of Tidecrest, sharing its anomalous fish behavior and maintaining a three-generation boundary dispute with Tidecrest that the Duchy cannot adjudicate. The fish disappearance has given both communities something to agree about for the first time in living memory.',
   'A Salthook elder has been telling anyone who will listen that the fish aren''t gone but are below — visible from the clifftop at night, moving in patterns that don''t look like natural shoaling, lit by something faint beneath them. Nobody is listening yet.',
   0, 0, false),

  ('Westerngate', 'westerngate', 'Sapphire Coast', 'town', 2700,
   'A commercial waystation and freight hub exactly between Dawnharbor and the southern coast, the inland road to the Verdant Reach, and the Duchy and looser-attached communities. Merchants from four regions maintain warehouses here; nobody is from Westerngate but everyone passes through it.',
   'A specific warehouse (house mark 14, registered to the Aldren trading company) has been receiving sealed crates from Darian Imperial trade ships logged as "mineral samples" — their actual contents have not been inspected by anyone with authority to understand what they are.',
   0, 0, true),

  ('Porto Verde', 'porto-verde', 'Sapphire Coast', 'town', 3900,
   'A prosperous wine town on coastal hillside vineyards producing the white variety served in Caldrath''s patrician houses and Vaelthorn''s better halls. Three of the five senior vintner families have a member in Dawnharbor''s administrative structure and are strongly pro-Selene.',
   'The eldest vintner, Marca Duve, is an original Black Rose founder who helped Selene design the network''s communication protocols twenty years ago and is the only person outside Dawnharbor who knows the location of Archive Copy 2.',
   0, 0, true),

  ('Greyanchor', 'greyanchor', 'Sapphire Coast', 'hamlet', 1100,
   'A settlement built on a broad natural rock ledge accessible only by boat in permitting weather, descended from fishers who found the ledge and decided the isolation was worth the inconvenience. The Tide Gang has never established a presence here after three attempts were rebuffed.',
   'Greyanchor''s fishing grounds sit directly over the Needles Current; in bad weather things come up in nets, and the community has a practice of unknown origin — old enough that no one knows why — of putting back anything that didn''t swim into the net voluntarily.',
   0, 0, false),

  -- ============================================================
  -- SAPPHIRE COAST: ISLANDS AND OFFSHORE FEATURES
  -- ============================================================

  ('Amberisle', 'amberisle', 'Sapphire Coast', 'town', 800,
   'The largest island in the Coast''s offshore waters, four miles across with a protected eastern harbor and a western lighthouse, hosting lighthouse keepers, fishers, a boatyard, and a temple to Pelanar that is significantly more elaborately maintained than its economic position would suggest.',
   'The western lighthouse keeper Rael has been logging unusual lights moving below the sea surface — not ships — for eleven years, with the frequency increasing. Selene also uses Amberisle''s transient sailor population as cover for Black Rose courier traffic.',
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
   'The largest Sister, called First Grey, has a natural hollow in its rock too regular to be natural — the correct size and shape to be an entrance to something below the waterline.',
   0, 0, false),

  ('Hermit''s Rock', 'hermits-rock', 'Sapphire Coast', 'geographic', NULL,
   'A single isolated sea stack two miles offshore from Teal Cove, home to one man who has lived there for at least fifteen years, fishes from a tiny ledge, collects rainwater, and occasionally shouts at passing ships in an unrecognized language. Three attempts by Duchy officials to remove him ended in retreat.',
   'The Hermit is a former Arcane Vanguard officer who deserted with classified documents twelve years ago; he has been on the rock for exactly as long as the Vanguard''s eastern mapping surveys have been active, and the Vanguard has not publicly acknowledged looking for him.',
   0, 0, false),

  ('The Drowned Arch', 'the-drowned-arch', 'Sapphire Coast', 'ruin', NULL,
   'A large architectural arch of white decorated stone that projects six feet above the waterline at low tide one mile offshore from Porto Verde, made in a style matching nothing on the coast. Divers report foundations extending significantly east and west below the sand.',
   'The arch''s decorative patterns match exactly the pre-Litorin script on the Sanctum of the Unwritten in the Darian Empire — nobody on the Sapphire Coast knows this.',
   0, 0, false),

  -- ============================================================
  -- SAPPHIRE COAST: NOBLE AND MERCHANT HOUSE SEATS
  -- ============================================================

  ('Varneth Hall', 'varneth-hall', 'Sapphire Coast', 'noble_seat', NULL,
   'The seat of House Varneth on the Amber Bluffs six miles north of Dawnharbor, the most expensive address on the coast. Lord Edric Varneth controls the largest private merchant fleet on the coast — forty-three ships — and is one of the handful of people who knows he works for the Black Rose.',
   'The Varneth shipping ledgers contain records of three transactions with counterparties that would reveal the Shadow Cabal''s commercial logistics network; Edric doesn''t know what he recorded, Selene does, and she has been waiting six years for the right moment.',
   0, 0, true),

  ('The Duvenne Exchange', 'the-duvenne-exchange', 'Sapphire Coast', 'noble_seat', NULL,
   'House Duvenne''s town house in Dawnharbor''s commercial quarter and their operational base for controlling the coast''s spice and luxury goods trade. Merchant-Lady Sova Duvenne has been in preliminary discussions with Darian trade attachés about a preferential commercial framework.',
   'Sova received a sealed communique from Caldrath six weeks ago, read it once, burned it, and has been noticeably more cautious in public settings since. Selene is aware of the Darian discussions and has not intervened, which Sova correctly reads as a warning.',
   0, 0, true),

  ('Carreth Keep', 'carreth-keep', 'Sapphire Coast', 'noble_seat', NULL,
   'A small fortified manor on the coastal road north of Breakwater, seat of House Carreth — old coastal nobility predating the Duchy. Lord Bram Carreth allows the Tide Gang''s upper leadership to use the outbuildings for meetings requiring protection from Duchy interference, recording the payments as "tenant income."',
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
   'Patch recently received an unexpected delivery — a crate addressed to her in Tide Gang cipher from a Caldrath sender she has never dealt with. The crate is in the cellar. She hasn''t opened it.',
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
   'A half-mile sea channel between two rocky points seven miles south of Pearlwater, narrow enough that two medium vessels cannot pass simultaneously and impassable in rough weather — avoided by the excise cutter and used by Tide Gang smaller boats as a standard evasion route.',
   'Selene has denied the second excise cutter request not to protect the Tide Gang but to maintain a Gap route that the Black Rose uses for its most sensitive courier traffic, operating under Tide Gang cover.',
   0, 0, false),

  ('The Dark Lantern', 'the-dark-lantern', 'Sapphire Coast', 'working_site', NULL,
   'A legitimate ship chandlery on Breakwater''s north docks with an excellent reputation for quality goods. Owner Kess Hallom''s locked back storeroom serves as a Tide Gang message dead-drop between courier runs; she has never read any of the messages and considers not reading them sufficient moral distance.',
   'One current message waiting for pickup arrived through proper channels but is in a cipher the Tide Gang does not use — it came from outside the Gang''s network. Kess noticed the difference and is waiting to see if whoever placed it comes back.',
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
   'The missing keeper''s logbook was never found; a Black Rose archive entry from eleven years ago notes the logbook was located "in private hands — potentially significant — acquisition under consideration." The entry has been flagged but not acted on.',
   0, 0, false),

  ('The Salted Chapel', 'the-salted-chapel', 'Sapphire Coast', 'ruin', NULL,
   'An abandoned religious structure on the coast road between Westerngate and Breakwater, too large for a shrine and too small for a temple, salt-crusted despite being a quarter mile from the water. Its inscription is in a pre-unification religious language Pelanar''s current clergy do not use.',
   'The pre-unification tradition the chapel represents was not actually about Pelanar but about a second figure the official religious synthesis deliberately submerged into the iconography — one specifically associated with lighthouses going dark. No surviving text records what this figure represents.',
   0, 0, false),

  ('The Pearlwater Beds Old Deep Wreck', 'the-pearlwater-beds-old-deep-wreck', 'Sapphire Coast', 'ruin', NULL,
   'A wreck in eighty feet of water below the visible Needles wreck, too deep for standard pearl diving, with a hull design unlike anything on the coast and somehow preserved timber alongside cargo containers made of a material — neither wood nor metal — that has faint luminescence at depth.',
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
   'A cold counter-current running inshore below the Sapphire Current, generated by upwelling around the Needles sea stacks and creating the most productive fishing grounds on the coast — the conditions behind Pearlwater''s oyster beds and Tidecrest''s historically reliable fish shoals.',
   'The anomalous fish behavior in the Tidecrest region correlates precisely with a shift in the Needles Current''s depth profile that began three years ago; whatever is affecting the current is below the depth that conventional sea surveys reach.',
   0, 0, false),

  ('The Cradle', 'the-cradle', 'Sapphire Coast', 'geographic', NULL,
   'A large protected bay roughly twenty miles across midway along the coast, formed where the coast curves inward between two headlands, deep and well-protected but with no river outlet, no easy fresh water source, and no hinterland access — so never settled, but heavily used for anchorage.',
   'The Duchy maintains nominal claim to the Cradle and has never stationed anyone in it; ships wanting to wait out weather, make repairs, or conduct business they prefer not to conduct in official harbors use it freely.',
   0, 0, false),

  ('Cape Dawnlight', 'cape-dawnlight', 'Sapphire Coast', 'geographic', NULL,
   'The northernmost significant headland before Cinderport, named for the way dawn light strikes its white quartz cliffs first each morning making it visible from ships at sea before the rest of the coast becomes distinct. Ships coming south from the northern sea use it as their primary waypoint.',
   'The Talber lighthouse on the cape is the one whose keeper Vor has been signaling ships at night with unauthorized patterns — one responding ship is from the Free Isles Compact, and one is not.',
   0, 0, false)

ON CONFLICT (slug) DO NOTHING;
