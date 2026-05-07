-- Batch 3: Dreadspire Peaks + Ashen Marches + Shattered Isles locations
INSERT INTO locations (name, slug, region, location_type, population, description, dm_notes, map_x, map_y, is_major)
VALUES

  -- ============================================================
  -- DREADSPIRE PEAKS — Mountain Passes
  -- ============================================================

  ('Vaengrath''s Throat', 'vaengraths-throat', 'Dreadspire', 'geographic', NULL,
   'The widest and lowest pass in the Peaks, the only viable trade route through the northern third of the range and the sole pass usable by armies. Controlled by Giant chieftain Gruldrak Half-Ear, who charges silver tolls posted beside the skull of the last merchant who argued.',
   'Gruldrak has started accepting information as partial payment, building a picture of Aranthor''s military movements he has not shared with Varkhul — possible betrayal or leverage play.',
   0, 0, false),

  ('The Ashknife Pass', 'the-ashknife-pass', 'Dreadspire', 'geographic', NULL,
   'A narrow, poorly sheltered pass connecting the Ashen Marches foothills to the Dreadspire interior near Coldrun, passable only seven months a year. The stretch between its second and third switchbacks is called "the kill-zone" by guides because Vaul-Khesh influence causes escorts to murder those in their care.',
   'A Sentinel Order researcher believes the betrayals only trigger between people who have made an explicit oath within the preceding 24 hours — a correlation too specific to be coincidence.',
   0, 0, false),

  ('Ironback Ridge', 'ironback-ridge', 'Dreadspire', 'geographic', NULL,
   'A series of connected ledge-routes used by smugglers and deserters to avoid Vaengrath''s Toll; impassable eight months of the year. Every major smuggling network in the Peaks holds a hand-drawn map of the route.',
   'Someone has been adding false waymarkers that only reveal themselves as wrong after six hours of travel — three smuggling parties have disappeared this season and the markers appear freshly carved.',
   0, 0, false),

  ('Wraithcol Pass', 'wraithcol-pass', 'Dreadspire', 'geographic', NULL,
   'A southern pass open only four months a year, traversing the edge of Vaul-Khesh''s Scar where the influence is so dense the stone has developed an iridescent "betrayal-glass" sheen. Travelers report hearing a second voice pointing out which companions cannot be trusted.',
   'Varkhul has sealed the pass entrance with a thirty-foot stone block after a march of 400 soldiers through it killed all officers and left only 63 survivors. Someone is quietly clearing a route around the block.',
   0, 0, false),

  ('The Deepborn Gate', 'the-deepborn-gate', 'Dreadspire', 'ruin', NULL,
   'A set of forty-foot carved stone doors, hidden behind a false rockfall, that once served as the main trade artery of the House Drakor dwarven kingdom. The doors open onto a vast tunnel network connecting every major Stone-Speaker city beneath the range — the cities are abandoned, but something has moved in.',
   'A dwarven clan has sent scouts to assess whether the tunnels could be reclaimed; their intercepted letter to the Sentinel Order suggests they seek something specific that House Drakor left behind in CR 510.',
   0, 0, false),

  ('Coldtooth Col', 'coldtooth-col', 'Dreadspire', 'geographic', NULL,
   'A narrow saddle between Dreadcrown and its secondary summit, passable roughly six weeks a year by experienced mountaineers carrying minimal gear. It connects the deep Peaks to uninhabited northern ice fields and is used only by those who need to disappear completely — or those hunting them.',
   'A Sentinel courier used this route three years ago and never arrived; their pack with message intact was found in a crevasse, addressed to someone dead for ten years and describing events six months in the future.',
   0, 0, false),

  -- ============================================================
  -- DREADSPIRE PEAKS — Mining Settlements
  -- ============================================================

  ('Ironhame', 'ironhame', 'Dreadspire', 'village', 900,
   'The largest iron operation in the Peaks, built into a natural shelf on the eastern face of the range. It functions as a genuine settlement with a market, healer, and three taverns because consistent skilled labor requires giving miners something to stay for.',
   'A recent deep shaft broke into older Stone-Speaker tunnels with inscriptions; the shift boss sealed the shaft before anyone could read them, and a miner who glimpsed the inscription will talk for a meal and discretion.',
   0, 0, false),

  ('Silverlock', 'silverlock', 'Dreadspire', 'working_site', 340,
   'Varkhul''s personal silver extraction operation, so prized that no local chieftain takes tribute and Giant guards rotate every thirty days to prevent relationships forming with workers. A significant portion of the silver is loaded onto covered sleds heading into the high Peaks on routes absent from any tribute manifest.',
   'A former worker claims the silver sleds don''t go north to Frostgale but turn east toward Wraithcol Pass — and the thing driving one noticed her surveillance well before she expected, and it was not a Frost Giant.',
   0, 0, false),

  ('Coalpit Sorrow', 'coalpit-sorrow', 'Dreadspire', 'working_site', 280,
   'A fuel camp producing coal for Ironhame''s smelters and Frostgale''s hearths, where workers labor in seams so low only humans can work them. The settlement is less a community than a population broken in slightly different ways, with an average worker tenure of four years before breakdown.',
   'A young woman keeps a count of workers'' names written in coal dust on her bunk boards, the only act of memory in a place designed to prevent it — she has run out of room twice and started over without knowing why.',
   0, 0, false),

  ('Gemcut Warren', 'gemcut-warren', 'Dreadspire', 'working_site', 450,
   'A forced labor camp in the functional sense — workers cannot leave, receive food instead of wages, and appear on Giant manifests as inventory. Gemstones go entirely to Frostgale Keep in quantities exceeding any decorative or trade purpose, overseen by the terrifyingly patient Giant Thordrak.',
   'Workers have built a secret gestural sign language over two generations that the Giants don''t recognize as communication; workers across the Peaks identify each other by three specific gestures, and they are building something.',
   0, 0, false),

  ('Copperfall', 'copperfall', 'Dreadspire', 'village', 520,
   'A copper town that predates the Frost Giant occupation by at least a century, giving it a quality others lack: memory. Pre-conquest miners'' marks on the walls, pre-conquest naming conventions in side streets, and a festival calendar that does not match any Giant-approved holiday survive here.',
   'Beneath the oldest shaft, a sealed room bears a House Drakor inscription reading "What we could not take with us, we leave for those who come with better questions."',
   0, 0, false),

  ('Ashgrit', 'ashgrit', 'Dreadspire', 'hamlet', 180,
   'A low-yield settlement producing iron, road gravel, and quarried stone that Giant overseers have stopped visiting regularly, making it semi-independent through sheer economic irrelevance. It still sends a slightly-short tribute cart north twice a year to maintain the fiction it''s worth watching.',
   'A Sentinel Order courier left a sealed document three months ago with the village elder, with instructions to give it to "the ones who come asking the right questions" — the elder is still waiting.',
   0, 0, false),

  ('Deepvein Crossing', 'deepvein-crossing', 'Dreadspire', 'village', 640,
   'A genuine crossroads at the junction of three shelf-routes through the Peaks, giving it unusual trader and information traffic. Residents have developed an elaborate system for making the settlement look smaller and less prosperous than it is during quarterly Giant census visits.',
   'The last census-taker asked about a specific Stone-Speaker title rather than a person; the tavern keeper recognized the words and is getting dangerously close to understanding why Varkhul is asking about House Drakor vocabulary.',
   0, 0, false),

  ('The Tallow Works', 'the-tallow-works', 'Dreadspire', 'working_site', 95,
   'A rendering operation processing animal byproducts from Giant hunting camps and human herders into candles, soap, and rendered fat — the unglamorous infrastructure of Peak survival. Because their product goes everywhere, their gossip does too.',
   'A new worker who has clearly never rendered fat in his life is obviously learning on the fly while listening to everything — he works for either the Sentinel Order or someone considerably more dangerous.',
   0, 0, false),

  ('Greyshaft', 'greyshaft', 'Dreadspire', 'working_site', 310,
   'An obsidian extraction settlement in an eleven-year ownership dispute between Varkhul and Chieftain Vharnek, whose residents have mastered being simultaneously useful to both parties. The obsidian has a secondary property: it disrupts Vaul-Khesh''s ley-channels, giving Greyshaft the lowest rate of Turning incidents in the range.',
   'A geomancer believes the volcanic obsidian can shield people, buildings, and ritual spaces from Vaul-Khesh''s influence and is looking for funding to test the theory — she''s been quietly shopping it.',
   0, 0, false),

  -- ============================================================
  -- DREADSPIRE PEAKS — Frost Giant Holdings
  -- ============================================================

  ('Coldmantle Hall', 'coldmantle-hall', 'Dreadspire', 'noble_seat', NULL,
   'The half-underground fortress-hall of Chieftain Ssolvara the Spear-Broken, controlling the southern Peaks above the Ashen Marches. Built for efficiency rather than grandeur, Ssolvara pays tribute on schedule while quietly building an exit — she has sent messengers to Ashval twice in five years.',
   'Ssolvara knows something about Varkhul''s plans she hasn''t shared, holding the information as leverage while planning her own betrayal; she will share it for the right price.',
   0, 0, true),

  ('Rimecrag Hold', 'rimecrag-hold', 'Dreadspire', 'noble_seat', NULL,
   'The above-cloud-line fortress of Chieftain Vharnek Stonehands, Varkhul''s most straightforwardly loyal subordinate, built at extreme altitude adorned with human weapons stripped from their owners. His genuine loyalty makes him the most useful chieftain for Vaul-Khesh to redirect.',
   'Vharnek received a dream-message telling him Ssolvara is sabotaging his Greyshaft claim — a lie, but he now watches her carefully, positioning two loyal chieftains to destroy each other through Vaul-Khesh''s manipulation.',
   0, 0, true),

  ('Blisterstone Seat', 'blisterstone-seat', 'Dreadspire', 'noble_seat', NULL,
   'The holding of Olgrak the Waiting, who was the dominant warlord of the northern Peaks before Varkhul unified the clans twenty years ago. Closest Giant holding to Frostgale Keep, Olgrak has never privately accepted his defeat and has been waiting — though for what, he is no longer sure.',
   'Olgrak has begun leaving useful gifts for human travelers at crossroads with no explanation — something has changed his calculation about who the useful allies are after fifteen years of silence.',
   0, 0, true),

  ('Hailcrest Redoubt', 'hailcrest-redoubt', 'Dreadspire', 'noble_seat', NULL,
   'The fortress of Chieftain Drevka Icemane in the eastern Peaks above the Aranthor approaches, the de facto staging ground for any Giant incursion into human territory. Drevka has studied the Aranthor succession crisis for twelve years and is waiting for Varkhul to commit forces before she moves east.',
   'Drevka has a human spy in Aranthor exchanging information for family protection — the spy wants out, Drevka has already categorized their family as acceptable losses, and neither the spy nor the family knows this.',
   0, 0, true),

  ('Frostmere Lodge', 'frostmere-lodge', 'Dreadspire', 'noble_seat', NULL,
   'The holding of Bragnor Two-Voice, a formerly reliable chieftain who spent three nights camped near Vaul-Khesh''s Scar and now hears a second voice telling him what every speaker actually means. Closest Giant holding to the Scar, the stone inside has developed betrayal-glass veining.',
   'Bragnor''s second voice has given him a specific task: find a human matching a very precise description and bring them to the Scar alive — the description includes a crescent scar on the left wrist.',
   0, 0, true),

  ('Greycrest Outpost', 'greycrest-outpost', 'Dreadspire', 'noble_seat', NULL,
   'The small, utilitarian western-Peaks holding of Svendra the Young, who inherited command three months ago when her father died of unclear causes. The youngest chieftain in Varkhul''s confederation, she is being watched by everyone for manipulation opportunities and is handling the pressure with unexpected composure.',
   'Svendra knows her father was murdered and has narrowed suspicion to three possible chieftains; she is quietly excellent at this kind of thinking and open to outside help from those who want the same answer.',
   0, 0, true),

  -- ============================================================
  -- DREADSPIRE PEAKS — Human Settlements
  -- ============================================================

  ('Thorngate', 'thorngate', 'Dreadspire', 'town', 620,
   'The only human settlement in the Peaks that maintained formal independence until CR 801, holding a charter from House Valemont; Varkhul revoked it by standing on it. The settlement''s stone gatehouse still bears the Valemont crest, never defaced, an act of quiet defiance no one has reported to Varkhul.',
   'Behind a false wall in the gatehouse are complete pre-occupation land records for the eastern Peaks — who owned what, which mines predate Giant control — that could form a postwar legal framework; the family that hid it is still here and waiting.',
   0, 0, false),

  ('Highwatch', 'highwatch', 'Dreadspire', 'village', 210,
   'A cliff-cut ledge settlement with a defensible position even Frost Giants find difficult to approach, maintained by an eleven-year protection arrangement with rogue Giant Kuldraan the Thin. Highwatch provides Kuldraan with intelligence from their excellent sightlines; Kuldraan keeps Varkhul''s tax collectors away.',
   'Kuldraan has received an alliance approach from Chieftain Olgrak that could make his Highwatch arrangement a liability — Highwatch doesn''t know, and Kuldraan is genuinely uncertain about the right choice.',
   0, 0, false),

  ('Ashford-Below', 'ashford-below', 'Dreadspire', 'village', 380,
   'A compliant-seeming village in a narrow valley at the Peaks'' descent toward the Ashen Marches, lightly watched by Giants due to its marginal location. It secretly maintains the Ashford Archive — a lineage of oral historians who have memorized the pre-conquest history of the Peaks generation by generation.',
   'The archive''s keeper, elderly Maret, has memorized a description of the "Deep Name-Stone," a Stone-Speaker monument inscribed with what sound like every entity bound in the First Binding — vocabulary the Sentinel Order would recognize immediately.',
   0, 0, false),

  ('The Ledge', 'the-ledge', 'Dreadspire', 'village', 450,
   'A natural shelf settlement with views in three directions that has been occupied continuously for over four hundred years, outlasting three chieftain dynasties. Its residents have a cultural philosophy of accommodation and patience — they have been waiting for four centuries and will wait more.',
   'The council keeps a record not of tribute paid but of every concession extracted, building a picture of what Frostgale actually cares about and where the real pressure points are — it has never been asked for, and it is available.',
   0, 0, false),

  ('Refugehome', 'refugehome', 'Dreadspire', 'hamlet', 95,
   'A tent camp outside Coldrun sheltering survivors from Embervale, destroyed by Varkhul three months ago as a demonstration for missing two tribute quotas. Mostly children whose adults died getting them out, with a handful of survivors, and no path back to what they were.',
   'A twelve-year-old survivor saw the raid''s leading Giant searching the ruins for something specific, finding it, and keeping it separate from the tribute — she has told no one because she lacks the vocabulary for what she saw.',
   0, 0, false),

  ('Coldrun', 'coldrun', 'Dreadspire', 'city', 2400,
   'The largest human settlement in the Peaks, built into a cliff face over three natural terraces corresponding roughly to economic strata: market and inn at bottom, residential and craft in the middle, administrative at top. Functions as the de facto capital of human life in the Peaks by scale and density.',
   'Coldrun has a black market, an underground handbill newspaper, and a philosophical society debating whether accommodation is collaboration — the Giants garrison the ridge above but daily life has real texture.',
   0, 0, true),

  ('Stonemarrow', 'stonemarrow', 'Dreadspire', 'village', 290,
   'A settlement built inside an abandoned House Drakor transit station from the Stone-Speaker tunnel network, with six-foot walls of obsidian-composite construction that resist both weather and Vaul-Khesh''s influence. It has no Turning incidents and no explanation for why — residents simply know this patch is safe and do not tell overseers.',
   'A scholar requesting access to take rubbings of Stone-Speaker inscriptions works for an Aranthor university but has recently been seen meeting with someone from the Darian Empire — residents want to know which relationship is real.',
   0, 0, false),

  -- ============================================================
  -- DREADSPIRE PEAKS — Ruins and Battlefields
  -- ============================================================

  ('Drakor''s Last Citadel', 'drakors-last-citadel', 'Dreadspire', 'ruin', NULL,
   'The seat of House Drakor''s final king, carved from living rock, abandoned in CR 510 when the dwarven kingdom destroyed itself through Vaul-Khesh-amplified betrayal. The gates are sealed from the inside and have not been opened in three hundred years; two Giant expeditions turned back after hearing sounds of tools on stone within.',
   'The sounds of rhythmic tool-work on stone are still happening inside the sealed Citadel — whatever is within has been working on something for three hundred and thirty-seven years.',
   0, 0, true),

  ('The Field of Last Standards', 'the-field-of-last-standards', 'Dreadspire', 'ruin', NULL,
   'A high valley battlefield where the last free human army was destroyed in CR 767 when three of six allied commanders turned simultaneously on General Aldrath Harmon in the first documented mass Turning incident. Varkhul''s captured battle flags still hang on the approach road to Frostgale Keep.',
   'Harmon''s great-granddaughter is alive in Coldrun, working as a cartographer, and has spent twenty years mapping ley-nodes against Turning incidents — she believes she''s found a pattern that would have changed the battle''s outcome.',
   0, 0, false),

  ('The Hollow Spire', 'the-hollow-spire', 'Dreadspire', 'geographic', NULL,
   'A hollow volcanic rock needle rising four hundred feet above a high plateau, a natural resonance chamber charged by Vaul-Khesh''s ley-channels for centuries. Travelers at its base see moving images in the stone''s surface — shadow-theatre of betrayal scenes, playing silently; seventeen of forty-two documented visions depicted events not yet occurred when reported.',
   'One of the vision-scenes shows a group of approximately five travelers in nondescript clothing standing at a ritual site, one turning on the others — dated by a Sentinel scholar to "the present period" by clothing style.',
   0, 0, false),

  ('Drakor''s Wall', 'drakors-wall', 'Dreadspire', 'ruin', NULL,
   'Ruins of House Drakor''s defensive line running sixty miles across the central Peaks, varying from tumbled stone to nearly intact twenty-foot walls with guard turrets. The garrison abandoned their posts the night before the Giant crossing in CR 520 with no attack, no threat, and no message — every soldier simply decided to leave simultaneously.',
   'Within an intact section is a garrison commander''s log that ends mid-sentence mid-word on the night before the crossing; the date appears in three documented Hollow Spire visions.',
   0, 0, false),

  ('The Unmarked Graves', 'the-unmarked-graves', 'Dreadspire', 'ruin', NULL,
   'A long earthen mound on the western edge of the Field of Last Standards holding eight hundred human soldiers including General Harmon, intentionally unmarked by Varkhul''s order so it could not become a shrine or rally point. Over eighty years, residents have accumulated small stones into an unmistakable cairn at the eastern end.',
   'Varkhul knows about the cairn and has not ordered its removal — a restraint the Sentinel Order has noted as significant, since Varkhul almost never shows restraint without reason.',
   0, 0, false),

  ('Splitrock Shrine', 'splitrock-shrine', 'Dreadspire', 'religious', NULL,
   'A fifteen-foot-wide natural split in a major rockface, sixty feet deep, with carved stone at its base predating every known civilization''s presence in the Peaks. The influence here is dense enough to be physically tangible; animals refuse to enter, Giants avoid it, and a Sentinel research team all resigned within a year of returning.',
   'The pre-Binding symbols at the base include one that appears in the Sentinel Order''s most restricted archive associated specifically with the First Binding oath-sealing process — if Splitrock was an anchor site, it''s the only one identified above ground, and its state suggests the anchor didn''t hold cleanly.',
   0, 0, false),

  -- ============================================================
  -- DREADSPIRE PEAKS — Geographic Features
  -- ============================================================

  ('Dreadcrown Peak', 'dreadcrown-peak', 'Dreadspire', 'geographic', NULL,
   'The tallest mountain in Aeloria at 18,400 feet, its summit perpetually obscured by cloud cover that does not move with prevailing winds. The Sentinel Order has proposed the summit sits directly above the densest section of Vaul-Khesh''s ley-network.',
   'No recorded expedition has reached the summit in three centuries; the permanent, specific cloud cover behaves as if deliberate rather than meteorological.',
   0, 0, false),

  ('The Greymarch Glacier', 'the-greymarch-glacier', 'Dreadspire', 'geographic', NULL,
   'The largest glacier in the Peaks, seven miles long and three miles wide, retreating for thirty years after a multi-century pause. Its spring melt last year exposed a section of valley floor last seen approximately five hundred years ago, revealing a Stone-Speaker city in near-perfect flash-frozen preservation.',
   'The exposed Stone-Speaker city is structurally intact, sealed under ice before organic decomposition could occur — an undisturbed archaeological site of the first order.',
   0, 0, false),

  ('The Aelwynn Run', 'the-aelwynn-run', 'Dreadspire', 'geographic', NULL,
   'The headwaters of the River Aelwynn — the longest river in Aeloria — beginning at the Greymarch Glacier base and collecting flow from a dozen subsidiary streams before exiting the Peaks near Ironhame. Half of Aranthor''s irrigation depends on the Aelwynn downstream.',
   'Water quality degrades significantly below Ironhame and Copperfall due to mining runoff; the Sapphire Coast has filed formal complaints for forty years.',
   0, 0, false),

  ('Gorgemaw', 'gorgemaw', 'Dreadspire', 'geographic', NULL,
   'A natural canyon two hundred feet wide and three hundred feet deep that every route to Frostgale Keep must cross. The only crossing is a Giant-built stone-slab bridge called "Varkhul''s Courtesy" — local parlance for things that will definitely kill you but probably not today.',
   'No army has made it to Gorgemaw in eighty years; it is the outer gate of Frostgale Keep''s approach and the primary strategic chokepoint for any assault on the fortress.',
   0, 0, false),

  ('The Whiteshell Valley', 'the-whiteshell-valley', 'Dreadspire', 'geographic', NULL,
   'A sheltered high valley with less wind and slightly more sun than surrounding Peaks, used as pasture for eight hundred years and currently home to three semi-nomadic herding families who move animals between Whiteshell and lower pastures seasonally. Giants leave them alone for their logistical utility.',
   'The herding families know every path in the range at ground level — an intelligence asset that any party moving through the Peaks should consider cultivating.',
   0, 0, false),

  ('The Iceblood Pools', 'the-iceblood-pools', 'Dreadspire', 'geographic', NULL,
   'Three connected glacial meltwater pools stained red by iron-oxide runoff from a high-iron substrate glacier. The water is mineral, not blood, but has produced several centuries of folklore, two religious sects, and a Sentinel Order investigation that concluded: iron oxide, not Shadow influence.',
   'The pools are navigable by small craft in summer; their striking red-pink appearance has sustained active religious movements that the Sentinel Order investigation failed to meaningfully dissuade.',
   0, 0, false),

  ('Splitwind Ridge', 'splitwind-ridge', 'Dreadspire', 'geographic', NULL,
   'A northeast-facing ridge that focuses prevailing wind into a perpetual screaming corridor audible for miles. The sustained harmonic note is the ambient background of the eastern Peaks; Sentinel acoustic research suggests the specific frequencies align with Vaul-Khesh''s ley-network resonance.',
   'Mountain-born people don''t notice the sound until they leave and then cannot sleep for the quiet — the mountains may, in some sense, be thinking.',
   0, 0, false),

  ('Coldwater Gorge', 'coldwater-gorge', 'Dreadspire', 'geographic', NULL,
   'A narrow slot canyon barely wide enough for a Giant to squeeze through sideways, connecting the approach valley to Frostgale Keep''s plateau — the inner strategic chokepoint after Gorgemaw. No army has successfully pushed through Coldwater Gorge in recorded history.',
   'Any force that crossed Gorgemaw and fought through the valley would then face Coldwater Gorge in single file; the geological record shows no army has ever made it through.',
   0, 0, false),

  ('The Deadfall', 'the-deadfall', 'Dreadspire', 'geographic', NULL,
   'A vast field of collapsed stone covering roughly four square miles in the central Peaks, deposited sometime between CR 490–520, which scholars note overlaps with the House Drakor collapse. The Deadfall buried what had been the main interior road of the Stone-Speaker tunnel network and continues to shift seasonally.',
   'Stone-Speaker engineers built things to last a geological age and would not have lost a major interior road to natural collapse in the same decade their kingdom fell — something brought the Deadfall down deliberately.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES — Survivor Settlements
  -- ============================================================

  ('Stonehold Farm', 'stonehold-farm', 'Ashen Marches', 'working_site', 140,
   'A fortified farmstead that has produced consistent food yields for six generations in soil that has produced nothing reliable anywhere within ten miles for thirty years. The farmstead has been modified into a small fort, and the plants here look less like healthy plants than like plants being compelled to live.',
   'A Sentinel botanist found trace markers of a pre-Binding Veil-Kin land-consecration in the soil — if the Stoneholds have been unknowingly maintaining a First Binding anchor, what happens if they stop?',
   0, 0, false),

  ('Gritmarket', 'gritmarket', 'Ashen Marches', 'crossing', 230,
   'A trading post at the last road into the Marches before it stops being a road, operating under a strict policy of asking no questions about what you''re selling or why you need it. Serves traders, scouts, cultists, Sentinel couriers, and people who are leaving the Marches and need one more thing.',
   'The longest-running trader, halfling Penwick Ash, has noticed the Bloodmire Cult purchasing large quantities of iron chain — not rope, chain, far more than any ritual restraint would require — over the past six months and doesn''t know who to tell.',
   0, 0, false),

  ('The Wandering Camp', 'the-wandering-camp', 'Ashen Marches', 'hamlet', NULL,
   'The current seasonal position of the Ashwalkers, a nomadic community of 80–200 people who have moved through the Marches for at least two hundred years following routes determined by the void-pulse''s movement patterns. They have a lower rate of void-exposure symptoms than any other population in the Marches.',
   'The Ashwalkers'' two-century route-map is sung rather than written; the lead guide will share specific route segments for trade but becomes visibly distressed if pressed about the section covering the area directly above Nhal''Zeruun''s prison.',
   0, 0, false),

  ('Redwall', 'redwall', 'Ashen Marches', 'hamlet', 165,
   'A settlement built in pre-human ruins of red-tinged iron-rich stone that disrupts Nhal''Zeruun''s void-pulse, making it the safest sleeping location between Gritmarket and Ashval. It hosts an uncomfortable mix of refugees, travelers, and long-term residents who can''t bring themselves to leave the Marches.',
   'Over the past two years, someone has been adding to the old-stone carvings in the same pre-human style, with apparent fluency in the tradition — the additions appeared after the existing residents; some show what appears to be a map.',
   0, 0, false),

  ('Lastlight', 'lastlight', 'Ashen Marches', 'town', 340,
   'The last functioning community directly north of Ashval, grown without planning as the functional outskirts of the city extending into a separate settlement with the highest population density outside Ashval in the Marches. The council has sent quarterly annexation petitions to Ashval for six years without response.',
   'Two months ago a family arrived from an easterly direction that should be uninhabited; they are not talking, they are clearly not leaving, and the woman''s kitchen produces food better than available ingredients should allow — she is being careful not to be noticed being careful.',
   0, 0, false),

  ('The Cisterners', 'the-cisterners', 'Ashen Marches', 'working_site', 55,
   'A specialist community of engineers and maintainers who keep a network of pre-blight underground cisterns functional, providing the only reliable freshwater to Ashval, Lastlight, Cinderpost, and three smaller communities. They move between nodes on a schedule they don''t share outside the community.',
   'One cistern node has started producing water that tastes different — not void-touched, but different — and the head Cisterner has traced the intake to run through a geological layer directly above a section of the pre-Binding ley-network.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES — Cult Sites
  -- ============================================================

  ('The Crimson Altar', 'the-crimson-altar', 'Ashen Marches', 'religious', NULL,
   'The primary Bloodmire Cult sacrificial site — a stone platform of unknown age rising four feet above the Bloodmire waterline, accessible only by a stepping-stone sequence known to initiates. Sacrifices here die slowly; the Cult''s theology holds that gradual death feeds Nhal''Zeruun more completely.',
   'The Altar has been used more frequently in the last six months, shifting to twice-monthly in exact coincidence with the void-pulse frequency increase — either the Cult is responding to the pulse, or the pulse is responding to the Cult.',
   0, 0, false),

  ('The Voidshard Cave', 'the-voidshard-cave', 'Ashen Marches', 'ruin', NULL,
   'A sixty-foot cave lined with pale void-crystals that pulse on the void-pulse frequency, used by the Bloodmire Cult for initiation. Direct exposure produces the "Empty Grace" — removal of want and urgency the Cult calls spiritual clarity; prolonged exposure renders a person void-passive.',
   'Three of the deepest void-crystals have developed shifting inclusions visible inside the crystal; a Sentinel scholar who observed them for ten minutes afterward dreamed of an enormous dark space and an overwhelming feeling of being looked at from below.',
   0, 0, false),

  ('The Reconsecrated Temple of Aelon', 'the-reconsecrated-temple-of-aelon', 'Ashen Marches', 'religious', NULL,
   'A CR 280 harvest temple to the agricultural deity Aelon, claimed by the Bloodmire Cult in CR 780 because it sits on a pre-blight ley-node. The original harvest iconography has been altered throughout: full grain to empty husks, ripe fruit to hollow shells, fed children to children consuming nothing.',
   'Under the altar, the original priests hid their record of the ley-node''s history and the two centuries of Nhal''Zeruun''s spreading influence they observed — primary source documentation predating any Sentinel records by a century, still dry in oil-cloth.',
   0, 0, false),

  ('The Deep Pull Site', 'the-deep-pull-site', 'Ashen Marches', 'religious', NULL,
   'A flat-topped rise in the central Marches and the closest above-ground approach to Nhal''Zeruun''s prison, called the Convergence Point by the Sentinel Order, the Navel of the World by the Bloodmire Cult, and the Place You Do Not Walk Through by the Ashwalkers. The void-pulse here is a physical pressure felt through the soles of the feet.',
   'Soil samples show a magical signature predating the Bloodmire Cult by at least two hundred years — something performed a ritual at the Convergence Point before the Cult existed.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES — Ruined Settlements
  -- ============================================================

  ('Harrowfield', 'harrowfield', 'Ashen Marches', 'ruin', NULL,
   'A farm settlement abandoned in CR 712 after its soil could no longer support crops, structurally intact with clay buildings and low rooflines. Unusually, weeds and vines grow here at full capacity — the stubborn persistence of undirected life where directed growth has failed.',
   'Something in Harrowfield''s soil is different from surrounding Marches — possibly a natural formation or residual effect of farming on a pre-Binding ley-intersection — but every Sentinel researcher who finds it interesting gets reassigned before completing study.',
   0, 0, false),

  ('Saltfen', 'saltfen', 'Ashen Marches', 'ruin', NULL,
   'A settlement partially submerged when the Bloodmire expanded catastrophically in CR 692–695; its lower tier is permanently underwater while upper structures emerge during dry seasons, their exteriors turned reddish-brown by the iron-oxide marsh water. Beautiful in the way things destroyed slowly can be.',
   'Saltfen''s records hall contains seventy years of void-pulse observations in the margins of tax ledgers — predating Sentinel Order formal monitoring by a century — sealed in an oiled-wood cabinet that proved genuinely waterproof.',
   0, 0, false),

  ('Cinders Cross', 'cinders-cross', 'Ashen Marches', 'ruin', NULL,
   'The former central market town of the Marches, destroyed in CR 779 when the Bloodmire Cult purged settlements suspected of running anti-cult information networks. Buildings stand; the population was scattered or killed. The Cult maintains a presence using the ruined market hall as a gathering point.',
   'A former resident in Gritmarket has eighteen months of spyglass observations of Cult activity in the ruins and is looking for someone to take the documentation to Cinderpost — she believes it''s actionable; the Grey Scouts have told her it isn''t yet.',
   0, 0, false),

  ('Whitegrain', 'whitegrain', 'Ashen Marches', 'ruin', NULL,
   'The oldest of three related settlements sharing water rights, abandoned first in the CR 680–700 sequential agricultural failure as the water table dropped. Along with Whitegrain South and Whitegrain Mill, the cluster preserves a snapshot of ordinary Marches domestic life before the blight.',
   'The Whitegrain Mill cistern is still structurally sound and could potentially be reactivated — making the cluster habitable again — but the Cisterners haven''t said so publicly, uncertain whether encouraging deeper settlement into the Marches is survival assistance or harm.',
   0, 0, false),

  ('Whitegrain South', 'whitegrain-south', 'Ashen Marches', 'ruin', NULL,
   'One of three related settlements in the Whitegrain cluster, abandoned in the CR 680–700 sequential agricultural failure. The ruins show the same consistent domestic pottery style and religious iconography as the other two sites — a coherent cultural snapshot frozen at collapse.',
   'The three settlements are close enough that travelers camp among them and treat the cluster as a single location; the ruins cluster provides useful shelter in the Ashflats approach.',
   0, 0, false),

  ('Whitegrain Mill', 'whitegrain-mill', 'Ashen Marches', 'ruin', NULL,
   'The youngest of the Whitegrain settlements, it lasted longest due to superior cistern infrastructure before abandoning in the CR 680–700 failure. Its cistern is still structurally sound and, per the Cisterners, could potentially be reactivated to make the cluster habitable.',
   'The intact Mill cistern is the Cisterners'' known secret: reactivating it would extend habitable range deeper into the Marches, but they''re uncertain whether encouraging this is survival assistance or a different kind of harm.',
   0, 0, false),

  ('Ashen Ford', 'ashen-ford', 'Ashen Marches', 'ruin', NULL,
   'A settlement abandoned in CR 730 when its namesake ford dried up, now the primary crossing point for refugees leaving the Marches into Aranthor because the dry ash-bed requires no boat. No one stays longer than a night. Buildings are structurally sound — residents left because there was no reason to stay.',
   'The main waystation building has a walled-up basement last visible through a mortar crack for years; people who looked described wrapped packages, sealed boxes, and a locked chest inside. The crack sealed itself eight years ago.',
   0, 0, false),

  ('The Tower Town', 'the-tower-town', 'Ashen Marches', 'ruin', NULL,
   'A settlement of approximately five hundred that existed to service a watchtower garrison, drifting away between CR 745–755 as the garrison was drawn down and authority transferred. No single event caused it — the population simply dispersed. The watchtower stands, structurally the best-preserved building in the Marches outside Ashval and Cinderpost.',
   'Someone has recently occupied the watchtower — a fire appeared in the upper window three times in the past month; the first Grey Scout found no one, the second Scout hasn''t returned, and the third was told not to go.',
   0, 0, false),

  ('Fellmere', 'fellmere', 'Ashen Marches', 'ruin', NULL,
   'Abandoned in CR 800 after flooding took the lower district and the Bloodmire Cult began using the partially flooded upper district as an initiation route. Travelers camping in the upper district hear normal domestic conversations in the buildings — including specific names of people who died there in CR 799.',
   'Fellmere''s physician left behind a complete medical log covering CR 765–800 documenting illness patterns and mortality causes across fifteen settlements — the best primary source on early void-sickness progression that exists.',
   0, 0, false),

  ('Hearthwall', 'hearthwall', 'Ashen Marches', 'ruin', NULL,
   'Abandoned in CR 835, the same year as the Crown''s shattering, when its entire population of four hundred walked out in a single day after livestock stopped eating, crops turned grey overnight, and well water tasted of nothing. They did not decide to leave — they noticed there was nothing to decide between.',
   'The void-surge hit Hearthwall approximately six hours before any Sentinel instrument registered the Crown''s shattering; the records-keeper who took everything is in Ashval and wants someone to tell her whether Nhal''Zeruun''s prison cracked before or after Seraphel struck.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES — Geographic Features
  -- ============================================================

  ('The Ashfield', 'the-ashfield', 'Ashen Marches', 'geographic', NULL,
   'The Marches'' dead heart — a fifty-mile-wide flat wasteland of compressed void-particle accumulation over formerly fertile land, under a sky perpetually overcast in a way that feels deliberate. The void-touched wildlife that has adapted here — grey foxes, ash-rooks, pale-eyed rabbits — lives in reasonable numbers.',
   'Walking the Ashfield takes two days at a measured pace with nothing to navigate by; inexperienced travelers who walk in tend to use the experience of not coming out to recalibrate their understanding of the region''s scale.',
   0, 0, false),

  ('The Bloodmire', 'the-bloodmire', 'Ashen Marches', 'geographic', NULL,
   'A twenty-square-mile marsh fed by iron-rich groundwater that stains everything a deep amber-red, primary territory of the Bloodmire Cult. The Cult has built structures on firm ground within the marsh accessible only by specific channels, and void-crystal formations have been found throughout the substrate.',
   'The Bloodmire sits directly above the geological layer containing Nhal''Zeruun''s prison; crystal seepage through the marsh floor is both cause and effect of the Cult''s concentration here.',
   0, 0, false),

  ('The Scar', 'the-scar', 'Ashen Marches', 'geographic', NULL,
   'A physical crack in the ground running east-west for four miles, between one and eight feet wide, opened on the night of CR 835 Month 9 Day 17 simultaneous with the Crown''s shattering. The Scar glows pale during void-pulse peaks and emanates an oddly comfortable warmth during non-peak periods.',
   'The Scar''s four-mile length corresponds exactly to the boundary between two First Binding anchor points documented in Sentinel restricted archives — the prison cracked along a seam that was always the weakest point, which someone who knew the anchor map could have predicted.',
   0, 0, false),

  ('The Ashflats', 'the-ashflats', 'Ashen Marches', 'geographic', NULL,
   'The wide, relatively flat plain east of the Bloodmire where the Marches are blighted but not lethally so — the threshold through which most refugees travel on their way out. Pre-blight roads are still visible as slight depressions in the ash-crust, one or two inches lower than surrounding ground.',
   'The Ashflats are where most Marches encounters happen for outside travelers — the place where the world starts to look wrong without having become fully wrong yet.',
   0, 0, false),

  ('The Drybed Network', 'the-drybed-network', 'Ashen Marches', 'geographic', NULL,
   'Three of the four former rivers of the Marches are now dry channels — the Greywash, the Stillwater, and the Dustcourse — that preserve the exact shape of the rivers that ran there and are used as roads by residents who know them. The fourth, the Ashrun, still flows as a grey-tinted trickle.',
   'The Greywash runs directly over Nhal''Zeruun''s prison; the Cisterners maintain filtration stations at two points along the surviving Ashrun.',
   0, 0, false),

  ('Ashkeel Mesa', 'ashkeel-mesa', 'Ashen Marches', 'geographic', NULL,
   'The highest point in the Marches — sixty feet above the surrounding plain, providing twelve-mile sightlines in clear weather. The Sentinel Order used it as a watch post before Cinderpost was established. Carved into its north face thirty feet up is a pre-Binding inscription partly translated as "The hunger knows this place by its — [untranslatable] — those who stand here are seen."',
   'A scholar believes the untranslatable word is a proper noun — a place-name — and the only similar usage is in Stone-Speaker records from CR 400 referring to "the mouth of what was sealed."',
   0, 0, false),

  ('The Voidcleft', 'the-voidcleft', 'Ashen Marches', 'geographic', NULL,
   'A forty-foot triangular geological crevasse near the Bloodmire''s western edge that pulses constantly — not just during void-pulse events — with a pale blue-grey light at a slow rhythm like breathing. Void-crystals line its walls and the Cult considers it the second-holiest site in the Marches after the Crimson Altar.',
   'The Voidcleft''s pulse rate changed two months ago with a slight acceleration that is mathematically consistent with the void-pulse''s escalating frequency — the Cinderpost night-watch scholar who noticed hasn''t told her commander yet because she doesn''t want to be wrong.',
   0, 0, false),

  ('The Grey Expanse', 'the-grey-expanse', 'Ashen Marches', 'geographic', NULL,
   'The northeast quadrant of the Marches where the blight is actively expanding, moving approximately two miles per year consistently northeast toward Aranthor. Twenty years ago this section had struggling but living farmland; now it has the grey crust and empty air of the Ashfield.',
   'The expansion rate doubled in CR 835 from one mile per year to two, in direct correlation with the Crown''s shattering; Sentinel models suggest forty-five years to the Heartlands'' edge at the current rate, if it doesn''t continue to accelerate.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES — Sentinel Watch Sites
  -- ============================================================

  ('Cinderpost', 'cinderpost', 'Ashen Marches', 'fort', 300,
   'The Sentinel Order''s primary administrative and operational hub for Marches monitoring — the largest fixed installation outside Sylvara dedicated to Shadow Lord observation, occupying a reinforced pre-existing stone fortification north of Ashval. Currently twelve active Grey Scouts, down from twenty-two after Sylvara''s recall three years ago.',
   'Commander Harrowgast has sent forty-seven formal reports about escalating Nhal''Zeruun activity and received forty-seven acknowledgments and zero resources; she has stopped writing in formal Order style and started writing as someone who believes they are making the last record of something.',
   0, 0, true),

  ('Dustwatch', 'dustwatch', 'Ashen Marches', 'fort', 3,
   'A former waystation tower repurposed in CR 837 specifically to monitor the Scar, staffed by three people on rotating ninety-day assignments — observer, communications specialist, and a general-purpose watchman. The ninety-day rotation was set because longer exposure produces measurable void-sickness.',
   'The current observer has been here sixty of her ninety days and believes she can almost predict glow-events — if she''s right, Nhal''Zeruun''s activity has a regularity never documented. Her rotation ends in thirty days and she is considering asking to stay.',
   0, 0, false),

  ('Mirrorhill', 'mirrorhill', 'Ashen Marches', 'fort', 3,
   'A low communications relay station on a slightly elevated hill with unobstructed sightlines to both Dustwatch (fourteen miles) and Cinderpost (eleven miles), linking the two via signal-mirror. Its permanent staff member Aldus has been stationed here seven years — far past normal rotation — and refuses reassignment.',
   'Aldus has been sending personal correspondence via a patrol Scout with a seal no one recognizes; the seal is a pre-Binding symbol he found in the hill''s stone one morning and started using because it seemed right — he didn''t know it was a symbol.',
   0, 0, false),

  ('The Cache Network', 'the-cache-network', 'Ashen Marches', 'working_site', NULL,
   'Nine hidden supply caches distributed across the Marches, each holding three weeks'' rations, a signal tool, medical supplies, and a sealed Sentinel archive document relevant to the cache''s geographic area. Grey Scouts know locations through an oral mnemonic that doubles as a route map.',
   'Three of nine caches have been accessed in the past six months by someone other than a Grey Scout — the access method showed signs of being worked from outside with a pick. Something in the Marches knows the cache locations.',
   0, 0, false),

  -- ============================================================
  -- ASHEN MARCHES — Existing Named Locations
  -- ============================================================

  ('Ashval', 'ashval', 'Ashen Marches', 'city', 3000,
   'A ruined city in the Ashen Marches serving as the primary population center for the blighted region, its council the closest thing the Marches has to governance. Ssolvara the Spear-Broken has sent messengers here twice in five years; the council responded to the second.',
   'Ashval''s council has ignored Lastlight''s annexation petitions for six years despite being the region''s administrative center — the political calculation behind this silence is unclear.',
   0, 0, true),

  -- ============================================================
  -- SHATTERED ISLES — Named Islands
  -- ============================================================

  ('Saltmere Isle', 'saltmere-isle', 'Shattered Isles', 'geographic', 22000,
   'The largest island of the Shattered Isles at roughly 40 miles long and 25 miles wide — the anchor of the Free Isles Compact, most important port, and seat of Compact governance. Mountainous in the north (the Capstone Range) and relatively flat in the south where Saltmere city and its farmland sit.',
   'Capstone miners recently sealed off a newly opened deep chamber with unknown script and two miners who entered on the first day have been acting subtly wrong ever since; Compact offices have not responded to the foreman''s message.',
   0, 0, true),

  ('Caldera Isle', 'caldera-isle', 'Shattered Isles', 'geographic', 0,
   'The volcanic island at the center of the archipelago''s distortion, with a three-mile caldera that has not erupted in four hundred years but generates the Fog of Ulraeth. Every settlement attempt has been abandoned for the same reason: settlers start repeating themselves — not dramatically, but word-for-word identical.',
   'The Short Colony buildings from thirty years ago are intact with personal effects, a settlement log, and thirty-seven days of entries — each word-for-word identical to the one before, in the same hand, with the same ink.',
   0, 0, true),

  ('Greyhull', 'greyhull', 'Shattered Isles', 'geographic', 4000,
   'The Compact''s second-most important island at 20 miles long, dominated by the Free Fleet''s secondary port and the Greyhull Yards — the best shipbuilding operation in the archipelago. Greyhull town of 3,200 runs around the Yards, supported by working farms and a western headland signal-fire relay.',
   'Three ships built at Greyhull in the past year returned with logs describing voyages almost identical but slightly different from what actually happened — different weather, ports, and crew actions, as if documenting a parallel voyage.',
   0, 0, true),

  ('Ironspire Isle', 'ironspire-isle', 'Shattered Isles', 'geographic', 1800,
   'A medium island named for a two-hundred-foot basalt column used as a navigation landmark from twenty miles, with one good harbor at Ironspire Town and extensive sea-cliff nesting grounds for a delicacy-egg bird species. Known for its Compact Chapter and the two-century-maintained Ironspire Lighthouse.',
   'Lighthouse keeper Dorvaine has twenty-two years of shipping pattern records and has noticed ships departing certain routes at certain times arrive late while insisting they left on schedule — she has documentation and will share it.',
   0, 0, false),

  ('Nearmark', 'nearmark', 'Shattered Isles', 'geographic', NULL,
   'The western of the Twin Islands, each roughly five miles across and separated by the quarter-mile Twin Passage, the main navigational route for ships entering from the north. Nearmark Harbor exists primarily to service passing ships and document the highest rate of time-distortion incidents of any inhabited island in the Compact.',
   'The channel between the Twins has paving stones on the seafloor thirty feet down — a road running north-south under the water. Residents call it the Old Way and consider it unremarkable.',
   0, 0, false),

  ('Farmark', 'farmark', 'Shattered Isles', 'geographic', NULL,
   'The eastern of the Twin Islands, with Farmark Harbor serving passing ships along the main northern navigation route. The Twins together have the highest documented rate of time-distortion, with a 1-in-8 chance of arriving up to four hours displaced; residents set clocks by their own reckoning.',
   'Ships entering the Shearwater Straits now consistently arrive slightly earlier rather than randomly — they are arriving before they entered the Straits by the harbor clock. The implications have not been formally addressed.',
   0, 0, false),

  ('Stoneback Isle', 'stoneback-isle', 'Shattered Isles', 'geographic', 300,
   'A medium island of almost entirely vertical cliffs with a notch-harbor for small vessels only, whose three hundred legendarily stubborn residents live here for the extraordinary fishing grounds in the cold-water upwelling to the east. They have resisted four annexation attempts, a trade embargo, and one actual siege.',
   'The Stoneback fishing grounds have been shifting east by a mile per year for four years, disrupted at the source by the deep trench twelve miles east that connects to the abyssal depth where Ulraeth stirs.',
   0, 0, false),

  ('Driftmark', 'driftmark', 'Shattered Isles', 'geographic', 80,
   'A small four-mile fishing island that navigation surveys have found consistently two miles further east than charted in the past three years, currently six miles from Ironspire Isle. The eighty residents are, upon investigation, the same eighty people recorded in the census forty years ago — every adult, physically unchanged.',
   'The oldest resident, who would be 130 by the mainland census, is knitting in her doorway and will offer excellent hospitality while expressing gentle confusion about why you seem alarmed by anything.',
   0, 0, false),

  ('The Blackledge', 'the-blackledge', 'Shattered Isles', 'geographic', 0,
   'A dark basalt uninhabited volcanic island with no landing beach, notable for sea caves extending further into the interior than the island appears to be wide, and the Blackledge current that sweeps ships northeast toward the Fog Line. Ships give it a wide berth.',
   'A Free Fleet survey forty years ago produced a sealed chart of the interior cave system whose notes end: "The cave system connects to something below that is not geological. We recommend permanent exclusion zone."',
   0, 0, false),

  ('Gull''s Perch', 'gulls-perch', 'Shattered Isles', 'geographic', 120,
   'A small island of forty thousand nesting seabirds whose population lives primarily on guano collection — unglamorous and extremely profitable. Three months ago, a ship called the Steady Hand arrived crewless with intact cargo and a log last dated four years ago — the same date the ship was declared lost at sea.',
   'The Steady Hand is in perfect condition with four-year-old cargo preserved as if no time passed; the Compact legal dispute over salvage rights is ongoing and no explanation for where the ship has been has been found.',
   0, 0, false),

  ('Longhold', 'longhold', 'Shattered Isles', 'geographic', 900,
   'The Compact''s easternmost island, a breakwater against eastern storms with two fishing villages (Longhold North and Longhold South) on the protected western coast. Its residents are the most insular in the Compact and have maintained a strict prohibition against going on the water after midnight for as long as anyone can remember.',
   'The midnight prohibition originates in a story of fishing boats that went out at midnight two hundred years ago and returned after hours to find their families aged twenty years — and the fishing crews decided they had missed nothing and resumed their lives.',
   0, 0, false),

  -- ============================================================
  -- SHATTERED ISLES — Island Settlements
  -- ============================================================

  ('Capstone', 'capstone', 'Shattered Isles', 'village', 400,
   'A mining village in the northern Capstone Range mountains of Saltmere Isle. Recently opened a deep shaft and found something they''ve sealed off and won''t describe — a chamber in very old stone with unrecognized script — and two miners who entered that first day have been acting subtly wrong since.',
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
   'The main settlement of Greyhull Isle, running around the famous Greyhull Yards shipbuilding facility. Three ships built at the Yards in the past year have returned with voyage logs describing slightly different voyages from what actually occurred — the yard-master is quietly terrified.',
   'A "Greyhull work" hull mark commands a premium in any port; the yard-master''s quiet terror about the anomalous logs has not yet become public knowledge.',
   0, 0, false),

  ('Ironspire Town', 'ironspire-town', 'Shattered Isles', 'town', 1800,
   'The only settlement on Ironspire Isle, a mixed fishing and pastoral community centered on the island''s good harbor and the profitable sea-cliff egg trade. Home to both the island''s Compact Chapter and the two-century-maintained Ironspire Lighthouse.',
   'Lighthouse keeper Dorvaine''s twenty-two years of shipping records document a pattern of ships arriving late while insisting they departed on schedule — evidence of worsening temporal distortion she will share with genuine inquirers.',
   0, 0, false),

  ('Nearmark Harbor', 'nearmark-harbor', 'Shattered Isles', 'hamlet', NULL,
   'A small harbor town on Nearmark Island existing primarily to service ships transiting the Shearwater Straits and to provide time-recalibration services for vessels experiencing the documented 1-in-8 distortion. Residents set clocks by their own reckoning and correct for ships'' times at arrival.',
   'Ships entering from the north now consistently arrive slightly earlier rather than randomly — ships are arriving before they entered the Straits by the harbor clock, an implication the Compact has not formally addressed.',
   0, 0, false),

  ('Farmark Harbor', 'farmark-harbor', 'Shattered Isles', 'hamlet', NULL,
   'A small harbor town on Farmark Island that, like its twin, exists to service passing ships on the northern approach. The two harbor towns together represent the Compact''s most northerly inhabited waypoints.',
   'The Twins'' consistent time-distortion zone in the Twin Passage is managed as normal business here — the documented inconvenience of doing commerce at the archipelago''s northern gateway.',
   0, 0, false),

  ('Longhold North', 'longhold-north', 'Shattered Isles', 'village', NULL,
   'A fishing village on the harbor-facing western coast of Longhold Isle, one of two settlements on the Compact''s easternmost island. Longhold North shares the island''s midnight water prohibition and its dialect of the common tongue.',
   'The midnight prohibition is absolute and maintained without exception — the fishing community''s intimate relationship with the sea makes the prohibition''s rigidity all the more striking.',
   0, 0, false),

  ('Longhold South', 'longhold-south', 'Shattered Isles', 'village', NULL,
   'A fishing village on the western coast of Longhold Isle, one of two settlements on the Compact''s easternmost island, insular by geography and long winters. Shares the midnight water prohibition maintained for as long as island memory extends.',
   'Long winters and minimal outside contact have produced distinct customs and a dialect that marks residents immediately to other islanders.',
   0, 0, false),

  ('Harrowpoint', 'harrowpoint', 'Shattered Isles', 'village', 400,
   'A fishing and small-craft harbour on Greyhull''s western coast, as far from the Greyhull Yards as possible while still on the island, whose residents identify as fishermen rather than shipbuilders. Hosts one of the more sincere chapels to Selindra (sea goddess) in the Compact.',
   'Father Ossian, eighty years old and forty years at Harrowpoint, opened a sealed document last week after the fog came against the wind for seven mornings running — the threshold his predecessor specified — and has not yet decided what to do with what it says.',
   0, 0, false),

  ('The Cove at Wrecker''s Point', 'the-cove-at-wreckers-point', 'Shattered Isles', 'hamlet', NULL,
   'An unofficial pirate harbor on Stoneback Isle''s northern coast, absent from all Compact charts and acknowledged by no Compact official, accessible only through a narrow channel non-locals cannot navigate without a guide. The Compact has pragmatically decided to leave it alone.',
   'For four months the Cove has been receiving ships from past decades — vessels in perfect condition crewed by sailors who become confused and frightened to learn the current year. Harbormaster Cold-Eyes is managing the arrivals quietly and needs help she will not ask for but will accept.',
   0, 0, false),

  ('Tidewatch Monastery', 'tidewatch-monastery', 'Shattered Isles', 'religious', 35,
   'An Order of the Unmoored Tide monastery on a small island three miles south of Longhold, chosen precisely for its temporal distortions as spiritually instructive. Ninety years of empirical records using water-clocks versus astronomical observation make this the most comprehensive documentation of Ulraeth''s effects in the archipelago.',
   'The records show distortion events spiking every eleven years; the next spike in four months is projected significantly worse than previous — the spike twenty-two years ago lost eleven ships, the eleven-year spike three. Head archivist Brother Keel will share data with anyone who can help.',
   0, 0, true),

  ('Ashfield Town', 'ashfield-town', 'Shattered Isles', 'ruin', NULL,
   'The ruins of the original Caldera Isle settlement, a colony of three hundred established eighty years ago that was abandoned after twelve good years as looping events escalated to crisis. Buildings are intact and the harbor infrastructure deteriorated but repairable; every resettlement attempt fails for the same reason.',
   'A Shadow Cabal research team of seven has been installed four months ago studying Ulraeth''s influence directly — they have protections against looping, but have stopped reporting back on schedule to their Saltmere handlers.',
   0, 0, false),

  ('The Short Colony', 'the-short-colony', 'Shattered Isles', 'ruin', NULL,
   'A failed resettlement of Caldera Isle from thirty years ago, abandoned when looping reached crisis. The buildings are intact after thirty years of weathering. The settlement log''s final section contains thirty-seven days of entries, each word-for-word identical to the one before, in the same handwriting, with the same ink.',
   'The settler who kept the log apparently did not notice the identical repetition — thirty-seven days logged with perfect fidelity, each entry unaware of the ones before.',
   0, 0, false),

  ('Farpoint Beacon', 'farpoint-beacon', 'Shattered Isles', 'fort', 25,
   'The last navigational landmark before the Fog Line — a lighthouse on a small island at the Compact''s northwestern boundary marking the limit of safe northwest transit. The current keeper Ord has been alone for eight months after his assistant left and the Compact twice failed to send a replacement.',
   'Ord''s reports have been getting shorter; his most recent was three words: "Fog Line closer. Inform Brackwater." The Fog Line has advanced nine miles in eight months — unprecedented acceleration.',
   0, 0, false),

  ('Port Sullen', 'port-sullen', 'Shattered Isles', 'hamlet', 180,
   'Technically a Compact waystation on Longhold''s northern tip; practically a port that processes goods without asking about origin or destination, with a harbormaster excellent at not noticing things. Hosts two reliable information brokers who can provide shipping, route, and personnel intelligence for the right fee.',
   'Broker Silt has a manifest from fourteen months ago for a ship carrying anchor-disruption ritual components targeting one of Ulraeth''s binding points — buyer unidentified, ship home port Saltmere, named merchant on the manifest dead for six years.',
   0, 0, false),

  ('The Shore at Low Tide', 'the-shore-at-low-tide', 'Shattered Isles', 'hamlet', 60,
   'A community of sixty living along a section of the Drowned Roads exposed for three hours in every twelve, in structures engineered to survive regular immersion — sealed stone, raised floors, waterproof storage. All social activities occur during low water; children learn to swim before they walk.',
   'The road''s stones are marked with the same notation system as the Wayfarer''s Stone in the Veilwood — the same language, era, and possibly hand. Whoever built one built or closely influenced the other.',
   0, 0, false),

  -- ============================================================
  -- SHATTERED ISLES — Sea Features
  -- ============================================================

  ('The Fog of Ulraeth', 'the-fog-of-ulraeth', 'Shattered Isles', 'geographic', NULL,
   'A real, navigable supernatural fog originating from Caldera Isle''s caldera and extending northwest to the Fog Line — currently 22 miles from Caldera Isle, nine miles closer than eight months ago. Ships inside experience time distortion scaling with depth: four hours shallow, days for moderate penetration, weeks or months near the Caldera.',
   'Tidewatch records include three firsthand accounts from sailors who entered the deep Fog and returned — all describe a moment of absolute clarity about their position in life, past and future, as the most terrifying experience of their lives.',
   0, 0, false),

  ('The Caldera Drift', 'the-caldera-drift', 'Shattered Isles', 'geographic', NULL,
   'A warm-water surface current running south-southwest from Caldera Isle, detectable by temperature differential and orange-brown mineral tint, used by navigators as a positioning reference. Its temperature has risen five degrees in three years, mineral load is increasing, and speed has increased.',
   'The Caldera Drift runs over a section of the Drowned Roads, and thermal expansion of the seabed is slowly lifting buried structures below the road surface into view — structures buried deliberately, in a very old burial layer.',
   0, 0, false),

  ('The Widow''s Passage', 'the-widows-passage', 'Shattered Isles', 'geographic', NULL,
   'The main commercial route between Saltmere Isle and Greyhull, fourteen miles of open water passing close enough to the Fog Line''s historical position that a night fog event can push ships into time-distortion range. "Going through the Widow" is Compact parlance for taking a calculated risk.',
   'The Compact''s signal-fire relay across the Widow''s Passage has three of seven relay platforms unmanned — the crews stationed there have not returned. The other four relay crews are aware and making plans.',
   0, 0, false),

  ('The Shearwater Straits', 'the-shearwater-straits', 'Shattered Isles', 'geographic', NULL,
   'The narrow half-mile-wide water between Nearmark and Farmark — the main northern entry to the Shattered Isles. Well-charted and physically safe but with a documented 1-in-8 chance of arriving up to four hours displaced. The Compact has standardized procedures for this.',
   'In the past three months the distortion has become patterned: ships entering from the north now consistently arrive slightly earlier rather than randomly — arriving before they entered the Straits by the harbor clock.',
   0, 0, false),

  ('The Drowned Roads', 'the-drowned-roads', 'Shattered Isles', 'geographic', NULL,
   'A network of underwater stone roads, six to eight feet wide, connecting major islands of the Shattered Isles to a consistent engineering standard implying a single construction program. Three sections are navigable at low tide; the roads connect to sections that are never exposed — descending further than navigational surveys have charted.',
   'All mapped Drowned Road sections, when overlaid and extended, converge on the deep trench twelve miles east of Stoneback Isle — where Ulraeth is imprisoned. The roads led somewhere. The somewhere is still there.',
   0, 0, false),

  ('Deadbell Reef', 'deadbell-reef', 'Shattered Isles', 'geographic', NULL,
   'The most navigationally dangerous reef complex in the archipelago, six miles southwest of Caldera Isle, named for a ship''s bell hung centuries ago on one of its stacks — still ringing in heavy weather. The complex moves approximately a quarter-mile between each decade''s chart survey.',
   'The bell is old construction matching Drowned Road era style; its inscription in the same script reads three words translating as "When to stop."',
   0, 0, false),

  ('The Mirror Flats', 'the-mirror-flats', 'Shattered Isles', 'geographic', NULL,
   'A five-mile stretch of six-foot-deep white-sand water southeast of Saltmere Isle that produces mirror-like surface effects in calm weather, used for small craft recreation. In the past year it has begun producing reflections that are slightly wrong — showing the sky as it was a few hours ago, or will be.',
   'On a clear day the reflection shows the sky approximately two hours in the future; observers who watch long enough can see incoming weather — and ships on the reflection horizon that will arrive at Saltmere from that direction in two hours.',
   0, 0, false),

  ('The Deep of Ulraeth', 'the-deep-of-ulraeth', 'Shattered Isles', 'geographic', NULL,
   'An abyssal submarine trench descending to unmeasured depth, running north-south for approximately forty miles beneath the eastern Shattered Isles, where Ulraeth the Unmoored is imprisoned. The Compact''s deepest survey lines have not touched bottom. The Drowned Roads terminate here.',
   'The prison anchor is below the seabed at the trench''s deepest point — accessing it requires depth fatal to unprotected swimmers at 200 feet and beyond all known magical breathing methods. The Sentinel Order notes this access problem and has no solution.',
   0, 0, true),

  ('Whistler''s Rock', 'whistlers-rock', 'Shattered Isles', 'geographic', 0,
   'A cluster of three uninhabited sea stacks eight miles southwest of Greyhull, the tallest sixty feet, which produce an audible two-tone whistling that serves as an audio navigation landmark in fog. Six months ago a third tone appeared — described variously as "a voice" or "someone asking something."',
   'A fishing crew anchored here during a fog wait heard a clear statement in an archaic sea trade-pidgin; translated: "Wait here. We are coming back soon."',
   0, 0, false),

  ('The Needle', 'the-needle', 'Shattered Isles', 'geographic', NULL,
   'A natural sea arch fifteen miles south of Saltmere Isle shaped like a threading needle from the east, audible in heavy weather, marking the last landmark before open ocean. It has never moved, never changed, and has been on every chart for three hundred years — genuinely stable in a sea of temporal disturbance.',
   'The Compact''s senior navigator told her apprentice the Needle is stable because something is keeping it stable deliberately, and that she does not want to know what. The apprentice sailed south to investigate six weeks ago and is currently missing.',
   0, 0, false),

  -- ============================================================
  -- SHATTERED ISLES — Ruins and Wrecks
  -- ============================================================

  ('The Tidebound', 'the-tidebound', 'Shattered Isles', 'ruin', NULL,
   'The Compact''s most celebrated wreck — a Free Fleet warship that drove off an Imperial raiding squadron forty years ago but broke her hull on Blackledge''s northern rocks in the dark afterward. The bow section is visible at low tide, forty feet down; Compact sailors make pilgrimage here and speak the captain''s name.',
   'The Tidebound is still moving — the bow section has been in three different positions in the past decade, on a fixed rock, which the current the Stoneback fishermen know does not run where the wreck lies.',
   0, 0, false),

  ('The Long Patience', 'the-long-patience', 'Shattered Isles', 'ruin', NULL,
   'A three-masted merchant lost sixteen years ago in the fog with seventy-two passengers including a Compact trade delegate, sighted eighteen times since — always at dawn, always from a distance, always moving. Two ships that followed it each lost one crew member while pursuing, without explanation.',
   'The most recent sighting included a woman at the stern rail appearing to be in her late fifties — the same age as a passenger''s grandmother who boarded sixteen years ago. The Compact has formally prohibited pursuit.',
   0, 0, false),

  ('Caldera Fort', 'caldera-fort', 'Shattered Isles', 'ruin', NULL,
   'A pre-Compact fortification on Caldera Isle''s southern headland, built approximately three hundred years ago to defend against naval assault. The fort was abandoned two hundred and fifty years ago; its own records describe soldiers "doing it again" and the commanding officer''s repeated failed attempts to determine what day it was.',
   'The captain''s quarters in the still-standing central tower contains a wound, working clock stopped at 4:14 that has shown hands at exactly this position for three hundred years — time at this exact spot stopped and has not started again.',
   0, 0, false),

  ('The Sunken City of Mereth Orn', 'the-sunken-city-of-mereth-orn', 'Shattered Isles', 'ruin', NULL,
   'A pre-Crown city visible at extreme low tide beneath the tidal shallows east of the Twin Islands — streets, foundations, large building remains, and a public square with a raised platform, approximately half a mile across. Unknown to any chart older than sixty years. The name was found carved into a visible stone column.',
   'The central square platform has a carving kept clear of marine growth by the stone''s own properties, showing a map of the Shattered Isles as a single continuous landmass before they were shattered — all roads on the map lead to the Deep of Ulraeth.',
   0, 0, true),

  ('The Lighthouse at Endtower', 'the-lighthouse-at-endtower', 'Shattered Isles', 'ruin', NULL,
   'A pre-Compact lighthouse one hundred and twenty feet tall on a flat rock island between Caldera Isle and the Fog Line, built from stone not native to the archipelago. The oldest standing structure in the Shattered Isles — predating the Compact by at least five hundred years — and its light still works every night with no mechanism, flame, or identifiable magical device.',
   'Tidewatch records show Endtower''s light went dark exactly once — three days two hundred years ago, during the period the Veilwood records call "the previous Choir stirring." A monk who watched the north saw someone leave the tower and walk into the sea, which took them without a wave.',
   0, 0, true),

  ('The Anchor-Platform of the Old Compact', 'the-anchor-platform-of-the-old-compact', 'Shattered Isles', 'ruin', NULL,
   'A four-century-old stone platform on a tidal flat between Greyhull and Ironspire Isle, exposed three hours at low tide, carved with the seals of the original twelve founding island lords. One additional seal — a different carving style, approximately fifty years old — belongs to no current Compact member and no current official recognizes it.',
   'Records of a dispute forty-eight years ago describe an "unknown delegation, no island identified" presenting the same symbol as evidence of original Compact membership; they accepted rejection, walked to the harbor, and left no record of a ship.',
   0, 0, false),

  -- ============================================================
  -- SHATTERED ISLES — Geographic Features
  -- ============================================================

  ('The Saltmere Bay', 'the-saltmere-bay', 'Shattered Isles', 'geographic', NULL,
   'The main harbor bay of Saltmere Isle — eight miles across, deep enough for the largest Compact ships, with three natural anchorage zones and excellent shelter from north and west swells. The geographic reason Saltmere city exists where it does.',
   'The Saltmere tides now run forty minutes behind astronomical prediction, a drift that started exactly when Ulraeth''s fog first appeared in Compact records fifty years ago — the harbor pilot who discovered this correlation has not yet reported it.',
   0, 0, false),

  ('The Capstone Passage', 'the-capstone-passage', 'Shattered Isles', 'geographic', NULL,
   'The Compact''s primary northern sea lane connecting Saltmere''s harbor to the northern islands and outside world, passing within eight miles of the Fog Line at certain points. Features a consistent three-mile compass deviation of 3–5 degrees that Compact navigators correct for as standard practice.',
   'The deviation''s angle points directly at Caldera Isle — a fact Compact navigators who have noticed do not discuss.',
   0, 0, false),

  ('The Teeth', 'the-teeth', 'Shattered Isles', 'geographic', NULL,
   'A reef complex of low rocks and submerged ledges covering a five-mile area at the northern archipelago entrance, navigable through three named channels (Wide, Needle, and Blind) and requiring local pilot guidance for unfamiliar captains. The first hazard encountered by any ship entering from the north.',
   'A fourth channel appeared in the past two years as subsidence shifted reef formations; pilots know it, it hasn''t been charted, it is slightly faster than the Wide Channel, and it runs exactly over the section of Drowned Roads descending toward the Deep of Ulraeth.',
   0, 0, false),

  ('The Blue Shelf', 'the-blue-shelf', 'Shattered Isles', 'geographic', NULL,
   'The western boundary of the Shattered Isles — a broad shallow-water area where depth drops from navigable to impassable over twenty miles, studded with small unnamed rocks and islets. Its distinctive saturated-blue color from cold upwelling has been taking on a grey quality spreading from the archipelago''s center outward for three years.',
   'The grey spreading tracks exactly the Caldera Drift''s chemical composition change from increased geothermal activity; at current rates the Shelf will be fully grey in seven years — a visible geographic symptom of Ulraeth''s increasing activity.',
   0, 0, false)

ON CONFLICT (slug) DO NOTHING;
