-- =============================================================
-- AELORIA SEED DATA — Age of Cracked Crowns
-- World: 7 regions, 76 locations, 22 NPCs, 4-tier quest structure
-- Run after schema.sql
-- =============================================================


-- ─────────────────────────────────────────────────────────────
-- LOCATIONS
-- Map coords: x 0–1000 (west→east), y 0–700 (north→south)
-- Regions: Dreadspire Peaks NW, Veilwood N, Shattered Isles NE,
--          Ashen Marches W, Aranthor center, Darian Empire E,
--          Sapphire Coast S
-- ─────────────────────────────────────────────────────────────
insert into locations (name, slug, region, location_type, population, description, map_x, map_y, is_major) values

  -- ══════════════════════════════════════════
  -- ARANTHOR — The Cracked Kingdom
  -- ══════════════════════════════════════════

  ('Vaelthorn',
   'vaelthorn', 'Aranthor', 'city', 45000,
   'Capital of Aeloria and seat of an empty throne. Castle Vaelthorn rises above three-hundred-year-old walls that have never been breached — the city has simply been occupied from within, twice. Three factions claim it. None control it cleanly. Beneath the castle''s third crypt level, the Mother of the Last Door has been climbing toward a Crown Shard for twelve years. The city smells of old power and newer fear. Its four districts — the Crown Quarter, the Merchant Ring, the Low City, and the Temple Row — each have their own politics and their own relationship with the crisis above them.',
   450, 380, true),

  ('Lighthaven',
   'lighthaven', 'Aranthor', 'town', 2200,
   'A coastal fishing town twelve miles south of Thornwick, facing the Sapphire Sea. For three hundred years the fishers of Lighthaven heard the Thornwick Bell on the morning tide. Nine days ago it stopped. Old Harbormaster Vell says the last time the bell went silent for more than a day was the Night of Broken Glass, and that was the worst week of his life. The town is the campaign''s starting point — not because anything dramatic has happened here yet, but because the people here noticed. That is enough.',
   580, 480, false),

  ('Thornwick',
   'thornwick', 'Aranthor', 'village', 400,
   'A farming village in the Thornwick Downs, twelve miles inland from Lighthaven. Its bell tower has rung every dawn and dusk for three hundred years — a warding bell keyed to the local ley-node that suppressed Nhal''Zeruun''s influence in a five-league radius. Nine days ago a Shadow Cabal cell silenced it. The bell-ringer Aldric Bane is being held in his own cellar. The villagers know something is wrong but cannot name what. The Cabal cell of six agents is waiting for confirmation the silence took hold before moving on.',
   550, 450, false),

  ('Dunmore',
   'dunmore', 'Aranthor', 'town', 3800,
   'The crossroads of Aranthor — where the King''s Highway, the Eastern Road, and the Westway meet. Whoever holds Dunmore holds the logistical spine of the kingdom. Blackwell''s garrison of 2,000 soldiers has occupied it for fourteen months as a "peacekeeping presence." Captain Colvin Wrest runs the occupation with professional efficiency and personal discomfort. The townspeople have adapted the way occupied people do — surface cooperation, subsurface resistance, a Black Rose courier route that Wrest knows exists and hasn''t found. Three taverns, two of which are now primarily for soldiers.',
   490, 430, false),

  ('Millhaven',
   'millhaven', 'Aranthor', 'village', 600,
   'A farming village on the Valemont Plains, thirty miles west of Vaelthorn. For three seasons the crops have grown to a third of their normal height and stopped. Not withered. Not diseased. Stopped, as though the intention to grow has simply been removed from the soil. Elder Mira Solt has been writing to the Council of Lords since the first season. She has received two acknowledgements. She feeds her village from reserves that are nearly gone. The western fields at sunset look like a painting someone didn''t finish.',
   430, 470, false),

  ('Fort Ashveil',
   'fort-ashveil', 'Aranthor', 'fortress', 12000,
   'Duke Garron Blackwell''s military stronghold in southwestern Aranthor, built on land that has been Blackwell family territory for six generations. Twelve thousand soldiers — Blackwell Regulars and contracted Iron Wolves — train, eat, and wait here. The fort itself is a serious military installation, not a castle: designed for force projection, not comfort. Blackwell is here most of the time, making decisions. His generals are here every day. The camp around the fort has grown into something resembling a town. It is pointed at Vaelthorn.',
   350, 500, true),

  ('Greyveil',
   'greyveil', 'Aranthor', 'village', 320,
   'A coastal village fifteen miles north of Lighthaven, showing the earliest Nhal''Zeruun symptoms outside the Ashen Marches. The fishing catches are down forty percent — not from depleted stocks but from the fish simply not being where they should be. Three families left last month. The ones who stayed notice that food doesn''t taste quite right and assume it''s the stress. It isn''t. The village elder, Cas Dorn, is keeping a log of what''s changed. He doesn''t know what he''s documenting. It would be very useful to someone who did.',
   600, 420, false),

  ('The Crown''s Rest',
   'crowns-rest', 'Aranthor', 'waypoint', 40,
   'A waystation inn on the King''s Highway between Lighthaven and Vaelthorn, run by a former Crown Loyalist courier named Pella who retired into a position that lets her pass messages without appearing to. The inn is legitimately good — clean rooms, real food, a stable. It''s also the primary Black Rose relay point for Aranthor''s eastern road. Three coded messages pass through every week. Pella knows everything that moves on the King''s Highway. She charges a fair price and volunteers nothing.',
   520, 445, false),

  ('Valemont Abbey',
   'valemont-abbey', 'Aranthor', 'landmark', 23,
   'An old abbey on the border between Aranthor and the Veilwood''s edge, technically belonging to the Church of Aurelion but functionally serving as a Sentinel Order safe house for the past forty years. The abbot, Brother Edric, is a retired Sentinel Order operative who kept his vows when he left the field. Twelve monks live here. Two of them are Sentinel Order contacts. The abbey''s cellar holds a Seal-Instrument that Elyndra left here seven years ago and hasn''t retrieved. The Veilwood''s treeline is three hundred feet from the eastern wall.',
   390, 310, false),

  ('Brokenwall',
   'brokenwall', 'Aranthor', 'village', 280,
   'A village five miles from Fort Ashveil, steadily hollowed out by Blackwell''s garrison requirements. Grain requisitions, labor conscription, a billeting order that puts soldiers in two of every five homes. The village headman, Yett Carne, has been trying to negotiate with Captain Wrest in Dunmore for six months. He gets polite responses and no relief. A Crown Loyalist organizer has been through twice. Brokenwall is three bad harvests from becoming the kind of village that produces insurgents.',
   320, 520, false),

  ('The Ley Confluence',
   'ley-confluence', 'Aranthor', 'landmark', null,
   'An unnamed area in the Valemont Plains where three ley-lines cross, visible from a distance as a perfect ring of dead crops fifty feet across. The soil inside the ring is fine. The plants simply won''t grow there. Farmers avoid it. Children dare each other to run across it. A character with Arcana DC 13 standing at the ring''s center will feel the ley-network''s current state — the normal flow disrupted, something pulling on the lines from the Ashen Marches direction. It is one of the most honest pictures of the campaign''s situation available to someone who knows how to read it.',
   420, 450, false),

  ('Shadowspire Ruins',
   'shadowspire-ruins', 'Aranthor', 'dungeon', null,
   'A former Valemont cadet branch estate, abandoned sixty years ago after the family line died out, now serving as the Shadow Cabal''s Aranthor regional command. Inquisitor Mara Voss has run Sector West operations from here for four years. The ward-silencing campaign — including the Thornwick Bell — was coordinated from this location. The ruin''s ground floor is maintained as a functional base. The lower levels contain Cabal intelligence files, prisoner cells, and a ley-node connection point. Voss is CR 7 and takes her work seriously.',
   500, 310, false),

  ('Vault of the Founding Kings',
   'vault-founding-kings', 'Aranthor', 'dungeon', null,
   'The sealed vault beneath Castle Vaelthorn''s deepest crypt level, protected by the magical imprint of the original Founding Covenant. A Crown Shard fell here during the Night of Broken Glass and has been sitting for twelve years. The Mother of the Last Door has been using the accumulated death-energy of four centuries of royal burials as a ladder to reach it. The Covenant seal is weakening — the kings in their niches have started to move. Not emerging. Moving. The sound of stone against stone in a sealed room.',
   450, 385, false),

  ('Thornharbor',
   'thornharbor', 'Aranthor', 'town', 900,
   'A small harbor town ten miles north of Lighthaven, specializing in fishing and the kind of trade that doesn''t appear in official manifests. The harbormaster takes a percentage and asks nothing. The Black Rose has used Thornharbor''s unofficial trade routes for years. It is also where Mira Soames'' brother lives — he receives her letters about the Wraith Galleon dreams and has started to believe her, which makes him the first person outside Saltmere who does.',
   595, 450, false),

  -- ══════════════════════════════════════════
  -- ASHEN MARCHES — Where Abundance Died
  -- ══════════════════════════════════════════

  ('Ashval',
   'ashval', 'Ashen Marches', 'city', 3000,
   'The last inhabited city of the Ashen Marches — a ruin that people are too stubborn or too desperate to leave. Everything is grey. Food tastes of nothing. The sky is a consistent pale white that is not cloud cover and not clear sky but something that has forgotten what it was trying to be. The people are, inexplicably, some of the warmest you''ll meet. Having nothing in common with comfort produces a specific kind of openness. Mayor Doria Vehn has been governing this city for nine years with a combination of pragmatism and bloody-mindedness that would be extraordinary anywhere and is necessary here.',
   180, 420, true),

  ('Cinderpost',
   'cinderpost', 'Ashen Marches', 'outpost', 300,
   'The last waystation before the Ashen Spire''s five-mile influence zone — officially a Sentinel Order watch station, functionally the last place travelers stop to consider whether they should continue. The permanent residents have made their accommodation with the Cabal traffic because refusing it is more dangerous than accepting it. Waystation Master Eret Voss is a passive Sentinel Order intelligence feed. The stone marker at the northern edge — a Sentinel Order compass rose — marks where the Shadow Below starts pressing against the surface.',
   280, 400, false),

  ('The Ashen Spire',
   'ashen-spire', 'Ashen Marches', 'dungeon', null,
   'A four-hundred-foot black tower in the exact center of the Ashen Marches, architecturally impossible by any known construction method, predating the Age of Founding. Seraphel Noct has operated from here for twelve years. The Gate of Unbecoming ritual is being prepared on the top floor — a fifteen-foot binding circle of sixty sub-seals, three years in construction. The ritual will be complete at Darkgate, nine months from campaign start. The Cabal''s forty most loyal operatives staff the perimeter. Inside: research archives, the Ashen Marches Crown Shard embedded in the preparation dais, and a warlock who has spent sixty years being brilliantly wrong.',
   140, 470, true),

  ('Bloodmire Depths',
   'bloodmire-depths', 'Ashen Marches', 'dungeon', null,
   'The warrens beneath the Bloodmire Swamp where the Pale Shepherd''s cult has performed feeding rituals for forty years. Three sacrifices per month now, up from one per season when the deal was made. The ritual creates a sustained channel to Nhal''Zeruun''s prison — the Shadow Lord feeds through it and its prison weakens measurably each year. Two hundred non-combatant dependents live in protected settlements near the surface. Their protection disappears when the ritual stops. This is the campaign''s central moral problem in physical form.',
   140, 520, false),

  ('The Bloodmire Swamp',
   'bloodmire-swamp', 'Ashen Marches', 'landmark', null,
   'A vast grey-brown swamp occupying the Ashen Marches'' southwestern quarter, fed by underground springs that emerge already flat-tasting. The water is safe but joyless. The swamp''s interior is navigable by those who know it — the cult does — and disorienting to those who don''t. Void seepage is measurably higher here than anywhere outside the Hollow''s immediate zone. Animals in the swamp are functional but quiet in a way animals shouldn''t be. There are no birds.',
   130, 500, false),

  ('The Hollow''s Eye',
   'hollows-eye', 'Ashen Marches', 'landmark', null,
   'The visible center-point of Nhal''Zeruun''s prison, forty miles into the Ashen Marches from Ashval — a half-mile radius where the air is perfectly, wrongly still. No wind. No sound from outside the circle. Plants in the Eye are not dead. They are simply not doing anything. A character standing at the center and making DC 12 Wisdom will feel Nhal''Zeruun as it was before the Binding — a warmth, an abundance, the ghost of what this land was supposed to feel like. This lasts one round before the absence reasserts.',
   100, 480, false),

  ('Ashveil Ruins',
   'ashveil-ruins', 'Ashen Marches', 'landmark', null,
   'The pre-Shattering city that Ashval used to be — fifty miles further into the Marches, abandoned during the Night of Broken Glass when the Crown shattered and the Void energy surged. The ruins are intact. The buildings are structurally sound. Everything that was left behind — furniture, household goods, a meal on a table that is now dust — suggests a rapid departure. The city''s cathedral contains the most complete surviving account of the First Binding outside the Sentinel Order Archive. Nobody goes here because of the Void seepage. A prepared party can spend six hours safely.',
   80, 460, false),

  -- ══════════════════════════════════════════
  -- VEILWOOD — The Forest That Remembers
  -- ══════════════════════════════════════════

  ('Sylvara',
   'sylvara', 'Veilwood', 'city', 8000,
   'The elven treetop city of the Veilwood — a network of platforms, bridges, and structures built into and between trees that are between four and eight hundred years old. Not romantic. Functional and beautiful in the way that things are when they have been exactly right for a very long time. The Sentinel Order headquarters is here: the Archive, Elyndra''s command offices, six watch-post relay stations, and the Memory-Keeper Velar, who has been alive for eighteen hundred years and remembers the First Binding as recent history. The Pale Choir''s expansion radius has reached twelve miles from the Cathedral. Sylvara is at fifteen miles. That gap is decreasing.',
   320, 180, true),

  ('Mirepost',
   'mirepost', 'Veilwood', 'town', 500,
   'The last human settlement before the Veilwood becomes deep Veilwood. A logging and trade town that has maintained a careful relationship with the forest for two hundred years. For the past eighteen months the eastern treeline section has been wrong — too still, the air differently weighted. Three loggers came back changed; two have since walked into the forest. Pell Corden is still home, early-stage, forgetting the edges of himself while his wife Dara holds the household together and asks every traveler if they know what''s happening. The mayor, Oswin Hale, sends monthly reports to the Council of Lords. The Council has acknowledged three of twelve.',
   380, 250, false),

  ('The Pale Cathedral',
   'pale-cathedral', 'Veilwood', 'dungeon', null,
   'A structure of white stone deep in the Veilwood, assembled from the architectural memories of cathedrals absorbed by the Pale Choir over three centuries. It did not exist two hundred years ago and now it does, completely finished, with no record of construction. The interior is the Choir''s primary material anchor point. The Memory Erosion aura affects visitors after one hour. Frozen adventurers from the past decade are suspended in the nave, their identities suspended between gone and present. The five Choir-nodes must be disrupted in sequence to break the anchor. Do not enter without Memory Anchors.',
   280, 120, false),

  ('The Whispering Glade',
   'whispering-glade', 'Veilwood', 'landmark', null,
   'Where the Veilwood''s edge meets Aranthor''s northern border — a half-mile of mixed terrain, neither fully forest nor fully field, where the Choir''s influence begins. Early-stage Wanderers are reliably found here. The trees look normal. The light looks normal. Characters who spend more than an hour here without Memory Anchors begin losing peripheral details — what they had for breakfast, the name of someone they spoke to yesterday. The restoration is complete when they leave. For now. The glade is three hundred feet wider than it was last year.',
   350, 230, false),

  ('Deepwood Threshold',
   'deepwood-threshold', 'Veilwood', 'landmark', null,
   'The point where the Veilwood becomes the deep Veilwood — marked by a ring of ancient standing stones placed by the Sentinel Order''s founders. Beyond this point, elven guides are not advisory but required. The standing stones still function as a Choir-interference barrier; the ancient inscription on each stone is a pre-Binding ward. They are weakening. The ward that was full-strength three centuries ago is now at perhaps forty percent. The stones'' slow failure is the most visible measurement of how long the Choir has been present.',
   310, 160, false),

  ('Velar''s Observatory',
   'velars-observatory', 'Veilwood', 'landmark', null,
   'Velar''s personal watch platform at the Veilwood''s canopy level — a structure she built herself over the course of a century, refined over another. The Observatory is not in Sylvara. It is four miles west, isolated, connected by a single bridge that she can withdraw. She comes here to think and to watch. From the Observatory''s highest point, the Pale Cathedral''s white stone is visible on a clear day — a white smear in the green, three miles further in. She has been watching that smear grow for three hundred years. It is visibly larger than it was a decade ago.',
   290, 170, false),

  ('Rootfast',
   'rootfast', 'Veilwood', 'village', 180,
   'A halfling settlement at the Veilwood''s southern edge, built partly underground and partly into the root systems of the forest''s edge trees. The halflings of Rootfast have a long-standing arrangement with the Veilwood elves and have been a reliable early-warning system for unusual activity at the forest edge. The village head, Pem Underhill, has been sending ravens to Sylvara for two months about a specific family of Wanderers who have been circling the village perimeter at night, peaceful and purposeless, like a slow tide.',
   360, 280, false),

  ('The Memory Grove',
   'memory-grove', 'Veilwood', 'landmark', null,
   'An ancient site deep in the Veilwood where memories of the First Binding are preserved in the trees — not metaphorically. A character who places their hands on the oldest trees here and makes DC 15 Arcana will receive fragments of the original Founding ceremony: the five kings'' voices, the words of the first Covenant, the specific sensation of the seals closing. The Memory Grove is Velar''s most carefully guarded secret. She will bring players here if she trusts them completely and believes they need to understand what they''re fighting to restore.',
   270, 140, false),

  -- ══════════════════════════════════════════
  -- DREADSPIRE PEAKS — Where the Earth Stands Up
  -- ══════════════════════════════════════════

  ('Frostgale Keep',
   'frostgale-keep', 'Dreadspire Peaks', 'fortress', 1200,
   'Varkhul the Frost-Crowned''s seat of power, carved into and built onto the highest stable peak in the Dreadspire range. Two hundred permanent residents — Frost Giants, Frostbound elite guard, household staff. Three miles south, 4,000 Frost Giants and winter wolves wait for march orders. The war-court meets twice daily. Korra, Varkhul''s daughter, manages logistics with urgency that is slightly out of proportion to the military situation. Below the keep''s lowest level, a sealed shaft descends to the ley-node where Vaul-Khesh''s whisper has been entering the material world for twenty years. Varkhul calls it the Deep Speaking Stone. He believes it is the voice of his purpose.',
   130, 100, true),

  ('Coldrun',
   'coldrun', 'Dreadspire Peaks', 'town', 900,
   'A dwarven settlement carved into the base of the Dreadspire''s southern face — low buildings, covered walkways, architecture that treats wind as the primary enemy. Sits at the base of the only maintained southern pass. Every caravan north, every Frost Giant patrol south, passes through or near Coldrun. Brunhild Thuldrun has been collecting everything that passes through for thirty years. Her file on Varkhul is the most complete behavioral analysis of a Frost Giant leader in existence. She will share it with the right people. She has been waiting for the right people.',
   180, 200, false),

  ('Stoneback Pass',
   'stoneback-pass', 'Dreadspire Peaks', 'landmark', null,
   'The primary southern pass through the Dreadspire range — the route Varkhul''s army would take if the march order came. The pass is maintained by Frost Giant labor and can accommodate their scale. It is defensible from the high ground above it and completely indefensible from below. Brunhild Thuldrun has been noting the patrol frequency increase for six months: from one circuit per week to one per day. The pass itself is three days of difficult travel in good weather. In bad weather, it is closed.',
   160, 150, false),

  ('The Vaul-Khesh Scar',
   'vaul-khesh-scar', 'Dreadspire Peaks', 'landmark', null,
   'A visible ley distortion in the mountain face three miles from Frostgale Keep — a crack in the rock that has been slowly widening for twenty years, emitting a subsonic vibration that humans cannot hear but dwarves describe as "the mountain grinding its teeth." The Frost Giants consider it sacred. Brunhild considers it evidence. Characters with Arcana DC 14 standing at the Scar can identify the frequency as active Shadow Below channeling rather than natural ley-activity. The Vaul-Khesh Disruption Focus, placed at the Scar''s base, broadcasts interference for 72 hours.',
   120, 120, false),

  ('Deepvault',
   'deepvault', 'Dreadspire Peaks', 'dungeon', null,
   'The ruins of Clan Drakor''s ancestral seat, six hundred feet underground in the Iron Gut Valley — abandoned during the Frost Giant expansion two centuries ago. The Founding bloodline of House Drakor originated from this clan. The vault contains the clan''s founding records, including documentation of the bloodline that will eventually lead the players to Brunhild Thuldrun as the Drakor representative. The vault is guarded by its own structural instability and three centuries of whatever has moved in. The records are intact.',
   200, 220, false),

  ('Highwatch',
   'highwatch', 'Dreadspire Peaks', 'outpost', 3,
   'A Sentinel Order observation post at altitude in the Dreadspire range — the highest point from which a human-scale person can operate year-round, barely. Currently staffed by one operative, Davan Thress, who has been alone here for seven months and whose reports to Sylvara have been increasingly precise about the Frost Giant patrol increase and increasingly personal about what solitude at altitude does to a person. His reports are accurate. His mental state is concerning. He would like someone to talk to.',
   155, 130, false),

  ('The Frost Market',
   'frost-market', 'Dreadspire Peaks', 'landmark', null,
   'A seasonal trading post in a sheltered valley two days south of Frostgale Keep, where Frost Giant clans meet three times a year to trade, resolve disputes, and conduct the social business of a civilization that is otherwise geographically dispersed. During market periods, it is the most accessible point for human-scale travelers to encounter Frost Giants in a context where hostility is socially constrained. Coldrun sends three trade delegates every season. Brunhild goes personally when she has intelligence reasons to observe clan interactions.',
   165, 170, false),

  -- ══════════════════════════════════════════
  -- DARIAN EMPIRE — The Machine That Watches
  -- ══════════════════════════════════════════

  ('Caldrath',
   'caldrath', 'Darian Empire', 'city', 120000,
   'The Imperial capital — a city of straight roads, organized districts, and the kind of cleanliness that comes from absolute control of public space. Everything in Caldrath works. The canals are maintained, the roads are smooth, the markets are honest because cheating is illegal and the Blackguard enforces commerce law. Emperor Caelan Darius IV governs from the Imperial Seat at the city''s geometric center. High Chancellor Cale works in the building adjacent. The Intelligence Directorate is in the building adjacent to that, with no public signage. The city is genuinely impressive and quietly terrifying.',
   780, 380, true),

  ('Ironwatch',
   'ironwatch', 'Darian Empire', 'fortress', 18000,
   'The Empire''s primary fortress-city on the Aranthor western border — built for force projection, maintained for deterrence. Colonel Aris Dawn has commanded it for six years and requested transfer six times. She runs a clean post and has been watching the Aranthorian succession crisis with the strategic attention it deserves, which is more attention than Caldrath''s intelligence bureau has given her reports. Two Steelclad legions are stationed here. The border crossing processes two hundred travelers per day. The forty-two Aranthorian refugees in the holding area have been there for three months.',
   640, 340, false),

  ('Stonefall',
   'stonefall', 'Darian Empire', 'town', 9000,
   'A mid-sized Darian Empire garrison town, unremarkable on the surface and the location of the Ironclad Undercroft — the Empire''s primary intelligence holding facility — beneath it. Major Eliss Thorn has commanded Stonefall for eight years under standing orders not to investigate what the Blackguard special logistics staff are doing in their separate barracks. She has followed these orders. Two hundred political prisoners are currently below her. She doesn''t know. When she finds out, she will have a very specific kind of crisis.',
   720, 440, false),

  ('Ironclad Undercroft',
   'ironclad-undercroft', 'Darian Empire', 'dungeon', null,
   'The Blackguard prison beneath Stonefall — five levels, two hundred cells, forty Blackguard soldiers, and decades of Aranthorian political intelligence. Level 1 holds the administrative records including Directive 7: an execution order for eleven prisoners labeled "anomalies." Level 4 holds Tarro Cass, detained six years for knowing that High Chancellor Cale carries House Caldris blood. Level 5 holds thirty years of Black Rose operational files, a Night of Broken Glass evidence crate, and a folio by one "Maris Wyn" that predates the Sentinel Order''s current understanding of the Shadow Lord situation.',
   722, 445, false),

  ('Hearthstone',
   'hearthstone', 'Darian Empire', 'city', 35000,
   'The second-largest city in the Darian Empire and the operational headquarters of General Thane Dor, the Empire''s foremost advocate for Aranthorian annexation. Hearthstone is prosperous, connected, and confident in the way of cities that haven''t faced a genuine existential threat in their lifetime. Thane runs his staff from the garrison district. His intelligence on the Aranthorian succession crisis is detailed and his analysis of the Shadow Lord reports as "Aranthorian superstition" is on record in three memos. He is not stupid. He is wrong about one specific thing and that wrongness shapes everything.',
   730, 310, false),

  ('The Imperial Archive',
   'imperial-archive', 'Darian Empire', 'landmark', null,
   'The Darian Empire''s central records facility in Caldrath — ninety years of imperial history, census data, and intelligence assessments. The relevant section for the campaign: eighteen months ago, the Intelligence Directorate received an anonymous communication flagging the "optimal window" for Aranthorian action. The communication described the succession crisis timeline with suspicious accuracy. The document is filed in the Intelligence Directorate''s restricted section. High Chancellor Cale has a key. So does the Directorate''s senior archivist, who is more reachable.',
   778, 375, false),

  ('Silverrun',
   'silverrun', 'Darian Empire', 'city', 28000,
   'A prosperous river city sixty miles east of Caldrath, home to the Empire''s merchant elite and the terminus of the Darian Canal project. Where Caldrath has power, Silverrun has money, and the relationship between the two is the Empire''s primary internal tension. Several of Silverrun''s merchant families have Aranthorian trade connections that they would prefer not to see disrupted by annexation. High Chancellor Cale grew up here, in a merchant family that was not particularly notable until it was.',
   820, 350, false),

  ('Valdrath''s Gate',
   'valdraths-gate', 'Darian Empire', 'landmark', null,
   'The primary land border crossing between the Darian Empire and Aranthor — a fortified checkpoint staffed by Steelclad regulars and Arcane Vanguard inspectors. All legitimate travel and trade passes through here. The gate has been at heightened alert for three months following the succession crisis escalation. Travelers are processed more slowly and questioned more carefully. The Black Rose has a broker on the Aranthor side who can paper people through for the right fee.',
   660, 370, false),

  ('Thorngate Station',
   'thorngate-station', 'Darian Empire', 'waypoint', 45,
   'The last Imperial waystation before the Aranthor border — a proper station with rooms, a bath, and a functioning post service. Used by diplomatic couriers, intelligence assets, and people who want one last night of Imperial hospitality before entering the chaos of Aranthorian politics. The station master has worked here for twenty years and considers himself a neutral observer of both sides. He is approximately correct. He also notes who passes through and files a weekly report with the Directorate, which he considers his professional obligation.',
   665, 360, false),

  -- ══════════════════════════════════════════
  -- SAPPHIRE COAST — Where Trade Is Power
  -- ══════════════════════════════════════════

  ('Dawnharbor',
   'dawnharbor', 'Sapphire Coast', 'city', 22000,
   'The greatest trade port on the continent — where every faction has a representative, every commodity has a price, and every secret has a broker. Duchess Selene rules Dawnharbor from her estate on the Amber Bluffs and the Black Rose from there and everywhere. Five merchant quarter districts, each with their own politics: the Harbor Gate (imports), the Silk Quarter (luxury goods), the Factor''s Row (finance), the Deep Market (everything else), and the Black Wharf (the things that don''t appear in official manifests). The war for Aranthor''s throne is largely funded by transactions that passed through Dawnharbor''s Harbor Gate.',
   480, 660, true),

  ('Tidecrest',
   'tidecrest', 'Sapphire Coast', 'town', 3500,
   'A working port forty miles north of Dawnharbor, handling Shattered Isles trade, the fishing fleet, and the kind of commerce that Dawnharbor considers too ordinary to bother with. The fishing families of the Saltmarsh district have three generations in every house and an opinion on everything. The Salvage House, run by a dealer named Kira Lend, has on its back shelf a piece of warm metal that emits light in complete darkness. Kira paid forty silver for it from an islands fisher. She''ll sell it for 120. It is a Crown Shard fragment and she has no idea.',
   560, 680, false),

  ('Selene''s Estate',
   'selenes-estate', 'Sapphire Coast', 'landmark', null,
   'Duchess Selene''s primary residence on the Amber Bluffs above Dawnharbor — a working estate that is also a social hub, a diplomatic venue, and the operational center of the Black Rose Network. The house is beautiful and not showy about it. The garden is famous. The library contains things that are not publicly known to exist. Selene holds three dinners per week that are attended by everyone who matters in Sapphire Coast politics and that are, underneath the social surface, the primary intelligence-gathering operation on the continent. Getting invited is a significant access milestone.',
   478, 655, false),

  ('Bleakwater Cove',
   'bleakwater-cove', 'Sapphire Coast', 'landmark', null,
   'A smuggling cove fifteen miles north of Dawnharbor, used by the Black Rose for off-manifest cargo movement and by independent operators who pay a berthing fee to the cove''s unofficial harbormaster — an old sailor named Cob who has been managing this operation for thirty years and whose primary qualification is that he remembers everything and tells nothing. The cove is not secret; the Harbor Gate knows it exists and tolerates it because Selene''s arrangement with the Harbor Gate authority is the kind of arrangement that works for everyone.',
   490, 645, false),

  ('The Amber Road Terminus',
   'amber-road-terminus', 'Sapphire Coast', 'landmark', null,
   'The point where the King''s Highway from Aranthor meets the Sapphire Coast road network — a busy junction with a waystation, a market, and a reputation for being the place where Aranthorian fugitives, Crown Loyalists traveling under false identities, and anyone else who needs to disappear into the Coast''s relative anonymity first arrives. The Black Rose has a permanent watcher here. Selene has made three operational decisions in the last six months based on who came through this junction.',
   500, 640, false),

  ('The Lighthouse of Aethon',
   'lighthouse-aethon', 'Sapphire Coast', 'landmark', null,
   'An ancient lighthouse on a rocky headland north of Tidecrest — built before the Age of Founding, still functioning, tended by a keeper named Seli who has held the post for fourteen years. Seli is a Sentinel Order contact: not an operative, but a reliable relay point for maritime intelligence and a safe house for personnel who need to transit the Coast without appearing in Dawnharbor''s ledgers. The lighthouse''s original construction purpose is debated by scholars. The foundation contains stonework that predates any known civilization in the region.',
   545, 665, false),

  ('The Black Thorn Inn',
   'black-thorn-inn', 'Sapphire Coast', 'waypoint', 12,
   'A roadside inn on the coast road between Dawnharbor and Tidecrest, apparently ordinary and practically a Black Rose safe house. The innkeeper, Voss Carne, is a retired Black Rose operative who runs the inn as genuine cover — good food, clean rooms, fair prices. Safe house protocol: guests who ask for "a room with a view of the water" are Black Rose affiliates. The inn''s cellar connects to a coastal path that emerges at Bleakwater Cove. Three Crown Loyalists are currently in residence.',
   520, 670, false),

  -- ══════════════════════════════════════════
  -- SHATTERED ISLES — Where the Fog Lives
  -- ══════════════════════════════════════════

  ('Saltmere',
   'saltmere', 'Shattered Isles', 'city', 14000,
   'The Free Isles Compact''s primary harbor and the closest thing to a capital the islands have — which is to say, it is where the Compact meets and where Captain Elara Wynn chairs the sessions when they are not deadlocked, which is most of the time. The city is built around a natural harbor that can accommodate forty ships and usually does. The Brackwater district is the operational center: harbormaster, ship chandlers, the Anchor & Line tavern where captains drink and deals are made. Mira Soames lives in the Saltmere''s Cliff Quarter and has been dreaming about a galleon for six years.',
   780, 100, true),

  ('Caldera Isle',
   'caldera-isle', 'Shattered Isles', 'landmark', null,
   'The largest island in the southern Shattered Isles cluster, named for the long-extinct volcanic caldera at its center. The island is navigable — several fishing families live on its northern coast — but its southern cove, Caldera Cove, is avoided. The fog is thickest here: a pocket of unnatural stillness above the water that sailors have been working around for three hundred years. Three hundred feet above the cove, in a sheltered natural harbor, the Wraith Galleon sits perfectly preserved, never having moved since CR 547.',
   820, 80, false),

  ('The Wraith Galleon',
   'wraith-galleon', 'Shattered Isles', 'dungeon', null,
   'A three-masted galleon of 300-year-old construction, perfectly preserved in Caldera Cove by Ulraeth the Unmoored''s time loop. Forty-seven sailors and one captain are aboard — all alive, all experiencing the same thirty seconds on endless loop. The thirty seconds: the moment they first saw the fog, before they entered it. The moment of last decision. Ulraeth caught them there and kept them. The captain''s log has been updating throughout — three hundred years of entries, each getting shorter. The most recent 200 entries are all the same word: "almost."',
   820, 80, false),

  ('The Fog Wall',
   'fog-wall', 'Shattered Isles', 'landmark', null,
   'The visible edge of Ulraeth''s influence zone — a physical boundary in the water, visible as a wall of unnatural fog that has been in the same location for three hundred years. Ships that enter come back with their navigators disoriented, their logs showing time inconsistencies, and an inability to recall clearly what they saw inside. Three ships in the past month have not come back at all. The Fog Wall is the single most visible evidence of Shadow Lord activity anywhere in the world. The Free Isles Compact has been sailing around it for three centuries.',
   790, 85, false),

  ('Stonespire Isle',
   'stonespire-isle', 'Shattered Isles', 'landmark', null,
   'A rocky island used as the Free Isles Compact''s neutral ground for council sessions — no single city''s territory, accessible to all, dramatic enough to feel like the weight of decisions made here matters. The council chamber is a converted cargo warehouse with no pretense of grandeur. The chairs are mismatched. The table is solid. Elara Wynn sits at one end and manages the sessions with the patience of someone who has been managing three incompatible positions for fifteen years.',
   760, 95, false),

  ('The Drowned Archive',
   'drowned-archive', 'Shattered Isles', 'dungeon', null,
   'An underwater ruin ten miles southeast of Saltmere, accessible at the forty-foot depth where it sits on a submerged shelf. Pre-Shattering records from the civilization that occupied the islands before the volcanic event that shattered them. The records are intact inside sealed chambers — the builders anticipated the possibility of flooding. They contain the most complete account of what the Shattered Isles were before they were shattered, including references to a "Binding ceremony" conducted by the island civilization concurrently with the Founding Kings. The same ceremony. Different participants.',
   800, 110, false),

  ('Mira''s Point',
   'miras-point', 'Shattered Isles', 'landmark', null,
   'A headland northeast of Saltmere where Mira Soames has walked every morning for six years — the highest point from which the Fog Wall is visible from the islands'' main settlement. She brings a journal. She describes the fog''s appearance each day. She has six years of daily fog descriptions, which is the most detailed record of the Fog Wall''s behavior that exists. The descriptions change subtly over time in ways that, to someone who understands Ulraeth''s mechanics, are meaningful. Three of the last five entries note that the fog seems "different" — not thicker, but "as if it knows something is coming."',
   795, 92, false)

on conflict (slug) do nothing;


-- ─────────────────────────────────────────────────────────────
-- FACTIONS
-- ─────────────────────────────────────────────────────────────
insert into factions (name, slug, alignment, goal, danger_rating, description) values

  ('Crown Loyalists', 'crown-loyalists', 'LG',
   'Restore Elowen to the throne; reforge the Crown; reseal the Five Shadow Lords', 1,
   'The underground resistance supporting Princess Elowen Valemont. Small numbers, strong conviction, and the only faction whose victory also saves the world. Operationally weak, morally correct, and increasingly desperate as the Darkgate countdown advances. Their greatest asset is that several members know things the other factions don''t. Their greatest liability is that they are outnumbered by everyone.'),

  ('Blackwell Pact', 'blackwell-pact', 'LN',
   'Military unification of Aranthor; end the succession crisis by conquest; become the king who held things together', 3,
   'Duke Garron Blackwell''s political and military machine. Pragmatic, disciplined, professionally competent. Blackwell genuinely wants to save Aranthor — he just believes the saving requires him in charge. His army is pointed at the wrong threat at the worst possible time, which is not entirely his fault but is still going to be catastrophic if nobody changes his direction.'),

  ('Shadow Cabal', 'shadow-cabal', 'CE',
   'Open the Gate of Unbecoming; free the Five Shadow Lords; transform the world', 5,
   'High Warlock Seraphel Noct''s organization — 400 active agents, twelve years of preparation, and a countdown ending at Darkgate. They are not demons. They are people who believe they are doing something just. The ward-silencing campaign, the political manipulation, the forty years of Bloodmire ritual feeding — all of it is in service of a sincere belief that the Shadow Lords'' imprisonment is a historical injustice. They are catastrophically wrong. The wrongness does not make them less dangerous.'),

  ('Iron Wolves', 'iron-wolves', 'N',
   'Fulfill contracts with honor; maintain the Wolves'' reputation; get paid; keep 3,000 soldiers alive and proud', 3,
   'Commander Rusk Varran''s mercenary company — the most professional independent military force in Aeloria. Currently under contract to Blackwell through Darkgate. The contract was brokered through a Cabal-adjacent intermediary, which Varran doesn''t know. He would care. He is assembling a private intelligence file on the Shadow Lord situation. The file is almost complete enough to change his mind about the contract.'),

  ('Sentinel Order', 'sentinel-order', 'LG',
   'Maintain the five Shadow Lord seals; sound the alarm before it''s too late; survive long enough to help', 2,
   'Ancient watchers founded by the Veilwood elves after the First Binding. Eighty-seven members, twelve watch-posts, no political authority, and severely insufficient resources. Commander Elyndra has been sending ignored warnings for two years. They have the most complete knowledge of the Shadow Lord situation of any faction, no ability to act on it alone, and a desperate need for people who can.'),

  ('Darian Empire', 'darian-empire', 'LN',
   'Annex Aranthor; extend Imperial reach; exploit the succession crisis before it resolves itself', 4,
   'Emperor Caelan Darius IV''s continental superpower. The most militarily capable faction by large margin. Watching Aranthor''s collapse with predatory patience and moving toward annexation — a move the Shadow Cabal anticipated and factored into its timeline. The Empire is not evil; it is acting in rational self-interest, which is exactly what the Cabal needs it to do.'),

  ('The Black Rose', 'black-rose', 'N',
   'Maintain intelligence dominance; preserve the network; protect what matters without being seen to care about it', 2,
   'Duchess Selene''s continent-spanning intelligence network. Agents in every major court, the most complete archive of current political intelligence in existence, and a leader who has been quietly protecting the Crown Loyalists for two years without payment or acknowledgement. The Black Rose doesn''t take sides publicly. Selene has already chosen a side privately. The players discovering this is one of the campaign''s best reveals.'),

  ('The Pale Wanderers', 'pale-wanderers', 'CN',
   'Find the Veilwood; shed the weight of self; join the song', 3,
   'People in the process of losing themselves to the Pale Choir''s influence who have found the loss peaceful. Early-stage Wanderers can be helped. Mid-stage require urgent intervention. Late-stage are lost unless the Cathedral anchor is destroyed. They are not villains. They are the most tragic consequence of a Shadow Lord''s operation made visible — people who found the Choir''s offer more comfortable than their own lives.'),

  ('Bloodmire Cult', 'bloodmire-cult', 'CE',
   'Feed Nhal''Zeruun; maintain the protection deal; survive', 4,
   'The Pale Shepherd''s cult in the Ashen Marches. Forty years of sacrifice in exchange for Void protection for two hundred dependents. Most members joined because someone they loved needed that protection. They stay because leaving removes it. The Pale Shepherd has been consumed so gradually by Nhal''Zeruun''s influence that he experiences the erosion as clarity. He is not a monster. He is someone who disappeared slowly. The moral weight of stopping this ritual and what it costs the people it protected is the campaign''s most sustained ethical challenge.'),

  ('Free Isles Compact', 'free-isles-compact', 'CN',
   'Maintain the islands'' independence; control Shattered Isles trade; keep the fog from eating more ships', 2,
   'Captain Elara Wynn''s pirate confederacy — good sailors, fiercely independent, deeply divided on what to do about the fog. The Fog-Openists want to understand it and remove it. The Fog-Closers think it''s the only thing keeping the Empire out. The Watchers think both positions miss the point. Three ships lost in the past month has moved "deep division" toward "active crisis." The players who solve the Wraith Galleon will end the debate and earn powerful maritime allies.')

on conflict (slug) do nothing;


-- ─────────────────────────────────────────────────────────────
-- NPCS — Major figures and regional leaders
-- ─────────────────────────────────────────────────────────────
insert into npcs (name, slug, role, race, description, personality, secrets, is_major) values

  -- ── The Three Claimants ──────────────────

  ('Princess Elowen Valemont', 'elowen-valemont',
   'Rightful Heir — Last Valemont', 'Human',
   'Slight, dark-haired, 24. Moves with the quiet control of someone who learned body language as a survival skill. Practical clothes, no royal insignia. Hears Aurelion in her dreams — a specific warmth she''s had since childhood that she''s never told anyone about because she was afraid it would be used to define her.',
   'Precisely principled without naivety. Perceptive about people. Patient but not passive. Surprisingly dry humor for someone with her history. Will call out dishonesty without hostility. Asks questions that are actually statements.',
   'Plans to sacrifice her Aurelion connection in the reforging. Has already decided. Doesn''t want to be talked out of it — she needs witnesses, not permission. Has a half-sister (Torra) in the Shattered Isles she has chosen to leave free of the crown''s weight.',
   true),

  ('Duke Garron Blackwell', 'garron-blackwell',
   'Military Claimant — "The Man Who Held Aranthor"', 'Human',
   'Large, fit-for-52, grey-streaked black hair, military bearing. Dress armor in court, campaign armor always in the field. The hands of someone who has used weapons for thirty years. Trains with his soldiers every morning without exception.',
   'Direct, no unnecessary preface. Respects concision. Asks questions before forming opinions. Has a calculated view of necessary cruelty — will use it, will not enjoy it, will remember it. Commands by being the most prepared person in the room.',
   'In secret contact with the Darian Empire about a recognition deal. Knows it would make him a client-king eventually and hasn''t decided if that''s acceptable. Will update his entire strategic assessment if shown genuine Shadow Lord evidence — he''s a soldier, he follows threat intelligence.',
   true),

  ('Lord Caedric Valemont', 'caedric-valemont',
   'Regent-Claimant — Shadow Puppet', 'Human',
   'Handsome in a managed way. Always dressed one formal step above everyone else. Smile arrives at the precisely right moment. The smoothest sleeve in any room. His secretary Kessa stands too close and suggests too much.',
   'Intelligent, disciplined, genuinely charming. Precise in argument. Gets quieter under pressure, not louder. Makes eye contact, remembers everyone''s details. The performance is excellent and very nearly complete.',
   'Active Shadow Cabal agent for fifteen years. Believes in the mission intellectually. Genuinely liked Elowen as a child and that crack is still there — the one thing Kessa cannot patch. Elowen is the only person who can reach him. The probability is forty percent with her present; near zero without.',
   true),

  -- ── The Villain ──────────────────────────

  ('High Warlock Seraphel Noct', 'seraphel-noct',
   'Shadow Cabal Leader — The Gate''s Architect', 'Human',
   'Appears mid-40s; actually over 100. Silver-streaked black hair, sharp features, eyes with no reflection in bright light. The shadows around her are marginally deeper than physics explains. Carries nothing that isn''t necessary.',
   'Extraordinary patience. Genuine intellectual warmth — will argue her actual position honestly and engage with real counterarguments. Professional respect for competence regardless of which side it''s on. Never raises her voice. Explains atrocities the way a physicist explains entropy.',
   'Genuinely believes she is liberating the imprisoned. Her own margin note — written twelve years ago: "what survives the suppression may not be what was imprisoned" — is the crack she never resolved. Show it to her. The sixty-year reckoning is her final character moment and it is reachable.',
   true),

  -- ── The Allies ───────────────────────────

  ('Commander Elyndra', 'elyndra',
   'Sentinel Order Commander — The Watcher Who Was Not Believed', 'Elf',
   'Age 287, appears mid-40s. Silver-blonde hair in a practical braid. Pale grey eyes that are always positioned toward exits. Sentinel field armor she has worn so long it has shaped itself to her. Has a longsword she''s carried for two centuries.',
   'Efficient. Genuinely warm with the very few she trusts. Capable of dark humor in tense moments. Furious about the situation in a way she has decided not to let be visible because self-indulgence is not useful. Will not ask for personal things. Will mention them once, matter-of-factly.',
   'Carries House Wyn bloodline — one of the five Founding lines — and doesn''t know it. The genealogical record is in the Archive''s founding documents under three centuries of elven naming changes. When she finds out, her identity as a self-made commander will have to reckon with a blood reason she was always drawn to this.',
   true),

  ('Duchess Selene', 'duchess-selene',
   'Black Rose Spymistress — Dawnharbor', 'Human',
   'Dark-complexioned, moderate height, the poise of someone who learned exactly how much space to take up before age fifteen. Always appropriate to context. The Black Rose emblem only when she wants you to know.',
   'Not warm but genuinely interested in how people reason. Never rushes anything. Smiles occasionally and it''s real — triggered by elegant solutions and unexpected honesty. References the Archive only in abstract. Leads with gifts, not asks.',
   'Carries House Thessal bloodline and has known for six years. Has been protecting Crown Loyalists for two years without payment or acknowledgement. Her reason, if confronted: "Because a restored Crown is worth more than any fee." She needed to know she was doing it for the right reasons, not blood obligation.',
   true),

  ('Commander Rusk Varran', 'rusk-varran',
   'Iron Wolves Leader — Mercenary With a Conscience', 'Half-Orc',
   'Half-orc, 44, heavy-jawed, head shaved on sides with dark hair braided back. Scar from left eye to chin. Brigandine armor. Iron Wolves insignia on his bracer. Takes up exactly the space he needs and no more.',
   'Negotiates everything. Zero patience for deception. Dry humor at least-expected moments. Talks about his soldiers by name. Would rather forfeit a contract than violate his conduct code — and has.',
   'Has assembled a private intelligence file on the Shadow Lord situation. Two more verified incidents and the file will be complete enough to change his mind about the Blackwell contract. The players can provide those incidents.',
   true),

  ('Varkhul the Frost-Crowned', 'varkhul',
   'Frost Giant Warlord — Unwitting Instrument of Vaul-Khesh', 'Frost Giant',
   '24 feet tall, skin like old ice, white hair elaborately braided with clan tokens. The ice crown formed spontaneously when he unified the last clan and has never melted. Speaks in declarative sentences and expects to be understood.',
   'Patient strategist who spent thirty years preparing. Rare speaker, heavy words. Increasingly troubled by a clarity of purpose he cannot quite source — thoughts that feel more certain than he has historically trusted.',
   'Vaul-Khesh has been in his ley-node for twenty years. He doesn''t know. His daughter Korra is being manipulated through a separate channel as the planned betrayal instrument. The diplomatic path requires the players to show him which thoughts are his before he can accept that some aren''t.',
   true),

  ('Vorath', 'vorath',
   'Fallen Sentinel Paladin — Warden of the Marches', 'Human',
   'Age 52, gaunt, grey from ash, eyes that have seen fifteen years of being right and ignored. Old Sentinel armor, dented and ash-stained. Moves with the economy of someone who has stopped spending effort on things that don''t matter. Goes too still between movements.',
   'Speaks in present tense, rarely past. Short functional sentences. Doesn''t use words that require emotional investment. Will do the right thing. Has stopped being sure what the right thing is.',
   'Was Elyndra''s protégé. Broke after fifteen years of filing ignored reports — not from weakness but from a specific accumulated weight. The crack is specific people who make him feel something before he can shut it down. Not irredeemable. Requires the right person at the right moment.',
   true),

  ('Emperor Caelan Darius IV', 'caelan-darius-iv',
   'Emperor of the Darian Empire', 'Human',
   'Grey-haired, sharp-featured, the thin of someone who forgets to eat when thinking. Pale green Darius family eyes. Plain iron ring on his right index finger — his great-grandfather''s, not Imperial insignia. The ring comes out when decisions have real cost.',
   'Clipped, precise. Waits for the complete answer before responding. Shows respect through complete attention. Touches the iron ring when making decisions he knows will cost someone something. Has read the Sentinel Order reports carefully enough to know the pattern is real.',
   'Is betting the annexation completes before the Shadow situation becomes his active problem. The bet is wrong by three seasons. He knows it''s a bet. He has made peace with the risk. He has not made peace with having been predictable — the Cabal communication in the Imperial Archive will undo him.',
   true),

  -- ── Regional Leaders ────────────────────

  ('Brunhild Thuldrun', 'brunhild-thuldrun',
   'Coldrun Intelligence Chief — Frost Giant Analyst', 'Dwarf',
   'Age 53, compact, grey-braided, always positioned near the door. Thirty years of Frost Giant behavioral records in her head. Has been waiting for someone to actually use what she knows.',
   'Dry. Precise. Economical with trust and words in equal measure. Respects preparation above all things. Her humor lands about thirty seconds after delivery because she uses the same tone for everything.',
   'Has a son who was adopted into a Frost Giant clan twenty years ago and lives in Varkhul''s encampment. Cannot approach the diplomatic situation with pure calculation. Will never bring this up unless asked directly.',
   true),

  ('Archpriest Vas', 'archpriest-vas',
   'Maerath''s Archpriest — Vaelthorn Temple', 'Human',
   'Age 71, unhurried, the warmth of someone who has sat with dying people for fifty years and knows what matters. Has a progressive lung disease. Has roughly two years. Manages this with the same calm he brings to other people''s deaths.',
   'Unhurried. Genuinely present. Asks "what do you understand about [thing]" and means it completely. Has a gentle humor that is not performed. Will tell you hard truths without cruelty.',
   'Knows the Crown reforging will require real sacrifice from the bloodline representatives — not symbolic, real. Has been preparing himself to be useful in this despite not carrying a Founding bloodline. He will offer himself as a conduit if the ritual needs one. He means it.',
   true),

  ('Mayor Doria Vehn', 'doria-vehn',
   'Mayor of Ashval — Ashen Marches', 'Human',
   'Age 44, ash-grey practical clothing, the energy of someone who has decided not to waste anything including optimism. Has governed Ashval for nine years. Feeds her city from dwindling reserves and trades in favors, information, and the specific currency of being the only functional authority in a region everyone has abandoned.',
   'Direct. Not warm but honest in a way that reads as warm after a while. Treats visitors as potential resources, which is practical rather than cynical. Has buried three hundred people she knew by name. Does not perform grief about this.',
   'Knows more about the Bloodmire Cult''s operations than she admits. Has a standing arrangement: she doesn''t ask what happens in the Swamp; the cult doesn''t bring the Swamp into Ashval. It is an awful arrangement and it has kept her city alive. She will end it if someone gives her an alternative.',
   false),

  ('Captain Elara Wynn', 'elara-wynn',
   'Free Isles Compact Chair — Fog-Openist', 'Human',
   'Age 38, weathered, economical, the bearing of someone who has been the most competent person in difficult rooms for fifteen years. Commands the Compact''s largest fleet. Has been trying to solve the fog problem since she was a ship''s mate watching the Wall and wondering.',
   'Patient with incompetence because she has been managing incompetence all her professional life. Impatient with dishonesty. Genuinely excited by problems that are actually solvable. Has a sense of humor that emerges when things are going badly, which she describes as "useful timing."',
   'Knows that the fog''s removal will trigger immediate Darian Empire attention to the Isles. Has not told the Fog-Openist faction this because she intends to have a plan ready before the fog goes. She does not currently have a plan.',
   false),

  ('Colonel Aris Dawn', 'aris-dawn',
   'Ironwatch Garrison Commander — Darian Empire', 'Human',
   'Age 47, career soldier, six transfer requests denied. Runs a clean post. Has been watching the Aranthorian situation with the strategic attention it deserves and the frustration of someone whose good analysis is going to the wrong people.',
   'Professional, precise, and bored in a way that six years of border customs work has not yet made permanent. Respects competence. Has a very specific kind of anger for people who waste it.',
   'Has flagged seventeen "anomalous" border incidents matching Pale Wanderer behavioral patterns in two years. Has received no response from Caldrath about any of them. She has kept detailed files. Those files are worth something to the right person.',
   false),

  ('High Chancellor Cale', 'high-chancellor-cale',
   'High Chancellor of the Darian Empire — Founding Bloodline', 'Human',
   'Age 62, precise, careful, sixteen years of survival by being indispensably useful. Self-made from a merchant family background that was not notable until it was. Believes in the Empire''s institutions even when they are wrong.',
   'The deliberate phrasing of someone who has managed information his entire career. Asks before he answers. Will not be surprised visibly. Touches his temple when processing something that complicates his understanding.',
   'Carries House Caldris blood and doesn''t know it. His grandmother was an Aranthorian refugee. The Empire''s intelligence apparatus has known for thirty years and used it as potential leverage. He has been a pawn in a game he didn''t know existed. When he finds out, the anger precedes the acceptance.',
   false),

  ('Elder Mira Solt', 'mira-solt',
   'Village Elder — Millhaven', 'Human',
   'Age 67, grey-braided, the precise manner of someone who writes official letters and expects them to be read. Has been governing Millhaven for twenty years. Has watched the crops fail for three seasons while writing letters that receive acknowledgements and no action.',
   'Formal in a way that is not cold. Has the patience of someone who knows that waiting is sometimes the only tool available and uses it without resentment. Will be immediately and completely useful to any player who treats her as the expert she is.',
   'Has a detailed crop failure log going back thirty-two months with measurements, weather correlations, and soil analysis that rules out every natural explanation. She has been waiting for someone to look at it. It is the most useful single document in the Nhal''Zeruun investigation and it is sitting in her study.',
   false),

  ('Korra', 'korra',
   'Frost Giant — Varkhul''s Daughter, Vaul-Khesh''s Target', 'Frost Giant',
   '150 years old — young adult by Frost Giant reckoning. Manages the army''s logistical planning. Widely understood as heir-apparent. Has a precision that is genuinely hers and an urgency that is not.',
   'Sharp and decisive. Loves her father with the specific love of someone who has watched a person she respects become something she needs to manage. Has been accelerating the march timeline for two months. Cannot quite explain why it feels so urgent.',
   'Is being manipulated through a secondary Vaul-Khesh channel — different ley-line from her father, more recent, targeted at her specific anxieties about the march''s viability. Her betrayal contact in Aranthor''s military is already in place. When she understands she was used, her fury will be useful. Her grief will be real.',
   false),

  ('The Pale Shepherd', 'pale-shepherd',
   'Bloodmire Cult Leader — Consumed', 'Human',
   'Former Maerath priest. Has not used his birth name in twenty years. Appears mid-50s; actually 71. Nhal''Zeruun''s influence has eaten most of his emotional range. Explains ritual theology the way a physicist explains entropy: clearly, completely, without inflection.',
   'Flat. Informative. Not cruel — cruelty requires emotional investment. Experiences satisfaction when the ritual works correctly. That is the remaining extent of his emotional life. Still feels grief, location unknown, reason unknown. He doesn''t know what it''s for.',
   'The grief is the last thing Nhal''Zeruun hasn''t consumed. Finding what he''s grieving is the key to reaching him. He was a priest of Maerath before the deal. He told himself it was temporary. He told himself that for twenty-three years. What he grieves is the priest he was before the first deal, and the specific moment he understood what the first sacrifice meant.',
   false)

on conflict (slug) do nothing;


-- ─────────────────────────────────────────────────────────────
-- QUESTS — Four-tier structure
-- plot_tier stored in quest_type field:
--   'main'     = campaign-spanning
--   'subplot'  = multi-arc character-driven
--   'regional' = one region, levels 4-12
--   'town'     = small-scale, session-level
-- ─────────────────────────────────────────────────────────────
insert into quests (title, slug, region, quest_type, status, description, dm_notes) values

  -- ══════════════════════════════════════
  -- MAIN PLOTS — Campaign-spanning
  -- ══════════════════════════════════════

  ('The Cracked Crown', 'cracked-crown', 'All', 'main', 'active',
   'The Crown of Aeloria was shattered twelve years ago by High Warlock Seraphel Noct during the Night of Broken Glass. The five shards must be gathered and the Crown reforged at a ley-confluence before Darkgate — or Seraphel completes the Gate of Unbecoming and the five Shadow Lords cross into the world. Five shards. Five bloodlines. Nine months.',
   'The campaign''s spine. Players won''t understand the full scope until Arc 2. Each shard recovery is a major milestone. The five bloodline representatives each have a personal cost in the reforging — the sacrifices echo the Shadow Lords'' own wounds. The Darkgate countdown is real and the DM should track it visibly.'),

  ('The Gate of Unbecoming', 'gate-of-unbecoming', 'Ashen Marches', 'main', 'active',
   'Seraphel Noct has spent three years building a ritual circle in the Ashen Spire capable of opening a sustained passage from the Shadow Below at Darkgate. The Gate will admit all five Shadow Lords simultaneously. She believes this is liberation of the unjustly imprisoned. She is wrong about what liberation means. The players must reach the Spire before Darkgate and either stop the ritual or stop Seraphel — ideally, help her stop herself.',
   'The campaign''s climactic dungeon. Three resolution paths: persuasion (Seraphel stops the ritual herself after confronting her own margin note), combat victory, or Gate partially opened. Seraphel is reachable. The margin note is the key. Daen Orveth at Cinderpost is the inside man.'),

  ('The Succession Crisis', 'succession-crisis', 'Aranthor', 'main', 'active',
   'Three factions claim Aranthor''s throne: Elowen Valemont (rightful heir), Garron Blackwell (military force), and Caedric Valemont (Shadow puppet). The crisis is not separate from the Shadow Lord situation — it IS the Shadow Lord plan''s primary distraction mechanism. Every faction focused on the throne is a faction not addressing the seals. The players must navigate the political situation while understanding that resolving it is as important as any dungeon.',
   'The political plot and the cosmic plot are the same story at two scales. Every political resolution changes the Shadow Lord situation. Blackwell redirected north. Caedric withdrawn. Empire neutralized. Iron Wolves freed from contract. Each resolution matters. See dm-notes/political-cosmic-weave.md.'),

  -- ══════════════════════════════════════
  -- SUB-PLOTS — Character-driven arcs
  -- ══════════════════════════════════════

  ('The Sacrifice Already Made', 'elowen-sacrifice', 'Aranthor', 'subplot', 'hidden',
   'Elowen Valemont plans to sacrifice her divine connection to Aurelion in the Crown reforging. She has already decided. She does not want to be talked out of it. She needs people to understand why — the god''s voice in her head has shaped every decision she''s made, and she has chosen to give it up so the sealing holds. The players'' job is to witness this with full understanding, not prevent it.',
   'Don''t introduce this too early. It should emerge naturally around level 10+ when the players understand what the reforging costs. The scene where Elowen explains her choice should be one of the campaign''s quietest and most significant. She is at peace with it. Let that land.'),

  ('The Bloodline She Doesn''t Know', 'elyndra-bloodline', 'Veilwood', 'subplot', 'hidden',
   'Commander Elyndra carries House Wyn blood — one of the five Founding bloodlines — and has never known it. Her identity as the Sentinel Order''s self-made commander will have to reckon with a blood reason she was always drawn to this work. The discovery, via the Maris Wyn folio in the Ironclad Undercroft, should shake something in her rather than confirm her.',
   'The reveal should happen before the players need her as a bloodline representative — otherwise it reads as a plot convenience. Plant the Maris Wyn folio early. Let Elyndra''s reaction be private; the players see the aftermath. Her adjustment period is real and worth running.'),

  ('Sixty Years of Wrong', 'seraphel-redemption', 'Ashen Marches', 'subplot', 'hidden',
   'Seraphel Noct wrote her own doubt — "what survives the suppression may not be what was imprisoned" — twelve years ago and never resolved it. The players finding this margin note and returning it to her is the mechanism for a possible redemption. Not a guaranteed one. She has sixty years of belief to undo. The scene on the Spire''s top floor is the campaign''s hardest conversation, not its hardest combat.',
   'The margin note is on Floor 2 of the Ashen Spire. Players who find it and understand what it means have the tool. DC 20 Persuasion, modified by evidence quality. If she seals the Gate herself, the resulting permanent destruction of it is also a significant blow to the Bloodmire ritual simultaneously — she knows the connection.'),

  ('The Man Who Stopped', 'vorath-arc', 'Ashen Marches', 'subplot', 'hidden',
   'Vorath is not broken — he stopped. Fifteen years of filing ignored reports produced a specific weight. He still does the right thing; he has stopped being sure what the right thing is. The arc is about the difference between those two states and what it takes to move from one to the other. Specific people make him feel before he can shut it down. The arc requires the players to be those people, not to fix him.',
   'Don''t resolve Vorath''s arc through a speech. Resolve it through accumulated moments — specific choices the players make that he notices and doesn''t comment on. The moment he comes back is not dramatic. It is quiet. He shows up somewhere he said he wouldn''t be, and he''s ready. That''s all.'),

  ('The Thoughts That Aren''t His', 'varkhul-manipulation', 'Dreadspire Peaks', 'subplot', 'hidden',
   'Varkhul has been receiving Vaul-Khesh''s whisper for twenty years and believes those thoughts are his own. The diplomatic path requires showing him which thoughts are his — the quality of considered vs. the quality of the whisper''s revelation — before he can accept that some aren''t. His daughter Korra is being separately manipulated. Both threads must be addressed.',
   'The whisper feels like clarity. Varkhul''s own thoughts feel considered. This distinction is the key to both the Varkhul conversation and the Korra revelation. Brunhild''s file documents twenty years of behavioral inconsistencies that are the whisper''s fingerprints. The Disruption Focus makes the distinction audible.'),

  -- ══════════════════════════════════════
  -- REGIONAL QUESTS
  -- ══════════════════════════════════════

  ('The Bell at Thornwick', 'bell-at-thornwick', 'Aranthor', 'main', 'active',
   'The Thornwick Bell — a 300-year warding bell keyed to the local ley-node — has been silent for nine days. A Shadow Cabal cell of six agents silenced it as part of a continent-wide ward-suppression campaign. The bell-ringer Aldric Bane is held in his own cellar. The coded letter found on the Cabal cell leader is the campaign''s first breadcrumb. The mystery starts small and ends with the players understanding what they''re inside.',
   'Opening arc, levels 1-5. Four acts: Lighthaven investigation, road to Thornwick, Thornwick investigation and Cabal combat, bell restoration. The coded letter is essential — it connects local Cabal to the larger network and gives players their first concrete evidence of the conspiracy''s scale. Run this at the right pace: let the village breathe before the combat.'),

  ('The Hungry Dark', 'hungry-dark', 'Ashen Marches', 'regional', 'hidden',
   'Nhal''Zeruun stirs in its prison. The Bloodmire Cult feeds it monthly. The Hollow deepens. Crops fail in the western plains. Two hundred cult dependents will lose their protection when the ritual stops — and the ritual must stop. The moral weight of this quest is that doing the right thing has a direct cost to people who are not responsible for the situation.',
   'Levels 8-12. The Pale Shepherd must be reached before he''s killed. His knowledge of Nhal''Zeruun''s prison state is essential for Arc 3. Arrange dependent evacuation before stopping the ritual — Archpriest Vas, Mayor Vehn, or Elyndra can support this with preparation. The hunger vision near the Anchor is the campaign''s most important single moment for understanding what the reforging means.'),

  ('Frost and Blood', 'frost-and-blood', 'Dreadspire Peaks', 'regional', 'hidden',
   'Varkhul the Frost-Crowned has unified seven clans and is preparing to march south. Vaul-Khesh has been whispering to him for twenty years. His daughter Korra is being separately manipulated as the betrayal instrument. The diplomatic path is available and dramatically superior to the combat path — but it requires Brunhild''s intelligence file, the Disruption Focus, and the patience to argue a case to a 24-foot warlord who has built his people''s purpose around a twenty-year certainty.',
   'Levels 6-10. The diplomatic window closes when the march begins. Brunhild''s file and the Disruption Focus are the key tools. The six-step diplomatic sequence (see dungeons/frostgale-keep.md) requires preparation. Korra''s betrayal attempt during the 24-hour window is the proof that seals Varkhul''s acceptance. The combat path stops the march and creates a worse situation.'),

  ('The Forgetting', 'the-forgetting', 'Veilwood', 'regional', 'hidden',
   'The Pale Choir''s influence expands one mile per month from the Cathedral. Villages at the Veilwood''s edge are losing people to a peaceful erosion that looks like choice. Pell Corden in Mirepost is thirty days from being unrecoverable. The Cathedral anchor must be destroyed. One player character has a connection to someone frozen inside. The restoration of that person requires them to reclaim what they surrendered, including the grief they surrendered it to avoid.',
   'Levels 5-9. Memory Anchors required. The personal connection to the frozen adventurer should be established in Session Zero. Velar''s three-hundred-year acknowledgment at the end is the scene''s emotional punctuation. The Choir''s reforging cost (Elyndra gives up a memory) directly echoes what the Cathedral does to people. Players who connect these will understand the final act better.'),

  ('The Imperial Gambit', 'imperial-gambit', 'Darian Empire', 'regional', 'hidden',
   'The Darian Empire moves toward Aranthorian annexation. Emperor Caelan Darius IV is acting in rational self-interest on a timeline the Shadow Cabal anticipated. High Chancellor Cale carries House Caldris blood and doesn''t know it. The Ironclad Undercroft holds the evidence that changes the Emperor''s calculation: proof the Cabal notified the Empire of the "optimal window" — meaning the Empire was played.',
   'Levels 7-11. Getting to Cale requires Caldrath access. Getting to the Emperor requires Cale. The Undercroft evidence is the key move: the Emperor discovering he was predictable is the emotional crack that shifts his position. General Thane Dor''s counter-moves are active. His blind spot (Shadow Lords aren''t real) can be corrected by a specific demonstration.'),

  ('Black Rose Thorns', 'black-rose-thorns', 'Sapphire Coast', 'regional', 'hidden',
   'Duchess Selene requires a service. Selwyn Brass is in the Ironclad Undercroft. Three safe houses are burned. An informant in the Crown Loyalist network must be found. The Black Rose Archive holds Selene''s six-year-old secret: she carries House Thessal blood and has been protecting the Loyalists without telling anyone why. The quest is about building trust with the most capable ally in the campaign.',
   'Levels 4-8. The overlapping Undercroft quest is intentional — players going to Stonefall for Brass are going for other reasons too. Selene''s bloodline reveal should feel like the players figured it out, not like she confessed. The informant is Dalis Carne — not a villain, a desperate person. The resolution matters: Selene is watching how the players handle it.'),

  ('Fog and Freedom', 'fog-and-freedom', 'Shattered Isles', 'regional', 'hidden',
   'Three Free Isles Compact ships lost to the time-fog in a month. The Wraith Galleon sits in Caldera Cove with forty-seven sailors frozen in the same thirty seconds for three hundred years. Breaking the loop disrupts Ulraeth''s anchor, thins the fog over three days, and frees the crew. Captain Veyra Sorn, freed, knows exactly who she is and what she wants to do next. The political fallout of the fog''s removal reshapes Compact politics immediately.',
   'Levels 9-13. The fog thinning as seen from Saltmere harbor is one of the campaign''s great set-piece moments. Captain Sorn''s "We sail. That''s what we do. We just need to know where" is the emotional resolution. The Compact''s charter offer to Sorn''s crew is the political one. The Darian Empire''s attention to the newly-visible Isles is the long-term consequence.'),

  -- ══════════════════════════════════════
  -- TOWN QUESTS — Session-level, personal
  -- ══════════════════════════════════════

  ('The Husband Forgetting', 'mirepost-pell', 'Veilwood', 'town', 'active',
   'Pell Corden in Mirepost is thirty days into Pale Choir exposure. His wife Dara asks every traveler if they can help. He is still recoverable: removal from the zone and four weeks at distance. If the players act this session, Pell comes back. If they wait, he doesn''t.',
   'A ticking clock in human scale. Don''t abstract it. Dara Corden is specific and real and asking for specific help. The players who make actual arrangements — a safe house outside the zone, Sentinel Order contact, a plan for the four weeks — will have changed one person''s life. That matters at the scale the campaign operates.'),

  ('The Empty Nets', 'tidecrest-nets', 'Sapphire Coast', 'town', 'active',
   'Tidecrest''s fishing families have been pulling empty nets from deep-water zones they''ve worked for generations. Not depleted stocks — simply absent. The fish aren''t there. Three months of this. The fishers blame bad weather. Elder Cas Dorn has a log of what''s changed. Someone who understands Nhal''Zeruun''s ley-channel effects will recognize what they''re seeing.',
   'Connects to the Hungry Dark regional quest. The maritime effects of the Bloodmire feeding ritual are reaching the coast through the southern ley-channels. Cas Dorn''s log is useful evidence. The fishers don''t need saving right now — they need explanation. Giving it to them is the hook.'),

  ('The Forty-Two', 'ironwatch-refugees', 'Darian Empire', 'town', 'active',
   'Forty-two Aranthorian refugees are in Ironwatch''s holding area. They fled the Pale Choir''s expansion zone. The Empire has no protocol. Colonel Dawn is feeding them from garrison supplies. They''ve been there for three months. They need either formal resettlement in the Empire or safe passage back to a part of Aranthor that isn''t under Choir influence. Neither option is simple.',
   'A consequences quest — the players see the macro-situation in human terms. Forty-two specific people. Resolving this requires either political pressure on the Empire (Cale, or the Emperor) or practical coordination with the Sentinel Order and a safe destination. It can be solved. It rewards players who engage with it seriously.'),

  ('The Eleven Anomalies', 'stonefall-directive', 'Darian Empire', 'town', 'hidden',
   'Directive 7 in the Ironclad Undercroft is an execution order for eleven prisoners — the "anomalies" who know things the Empire finds inconvenient. The deadline is the end of the month. Tarro Cass is one of them. Players who find this document in the Undercroft''s administrative level have a countdown: free them before the month ends or eleven people die.',
   'Time pressure in the middle of a complex dungeon. Players who are already in the Undercroft for other reasons (Selwyn Brass, intelligence files) must decide whether to take on additional objectives. Tarro Cass is the most important target. The others matter too — they are people, not just resources.'),

  ('What the Courier Knew', 'coldrun-courier', 'Dreadspire Peaks', 'town', 'active',
   'One of Brunhild Thuldrun''s couriers is two weeks overdue from a Peaks run. She doesn''t say she''s worried. She is. He could be captured by a Frost Giant patrol, dead in the pass weather, or simply delayed. The answer matters for her intelligence operation and for the courier''s family in Coldrun.',
   'A character investment quest for Brunhild. Players who investigate demonstrate reliability to her — which unlocks fuller access to her intelligence files. The courier is alive, detained at a Frost Giant patrol''s holding point, not mistreated but not released. He has two weeks of observation notes that are useful for Frostgale Keep approach planning.')

on conflict (slug) do nothing;


-- ─────────────────────────────────────────────────────────────
-- WIRE UP NPC FOREIGN KEYS (faction_id + location_id)
-- ─────────────────────────────────────────────────────────────
update npcs set faction_id = (select id from factions where slug = 'crown-loyalists')
  where slug = 'elowen-valemont';
update npcs set faction_id = (select id from factions where slug = 'blackwell-pact')
  where slug = 'garron-blackwell';
update npcs set faction_id = (select id from factions where slug = 'shadow-cabal')
  where slug in ('caedric-valemont', 'seraphel-noct');
update npcs set faction_id = (select id from factions where slug = 'sentinel-order')
  where slug in ('elyndra', 'vorath');
update npcs set faction_id = (select id from factions where slug = 'black-rose')
  where slug = 'duchess-selene';
update npcs set faction_id = (select id from factions where slug = 'iron-wolves')
  where slug = 'rusk-varran';
update npcs set faction_id = (select id from factions where slug = 'darian-empire')
  where slug in ('caelan-darius-iv', 'aris-dawn', 'high-chancellor-cale');
update npcs set faction_id = (select id from factions where slug = 'bloodmire-cult')
  where slug = 'pale-shepherd';
update npcs set faction_id = (select id from factions where slug = 'free-isles-compact')
  where slug = 'elara-wynn';

update npcs set location_id = (select id from locations where slug = 'vaelthorn')
  where slug in ('elowen-valemont', 'caedric-valemont', 'archpriest-vas');
update npcs set location_id = (select id from locations where slug = 'fort-ashveil')
  where slug in ('garron-blackwell', 'rusk-varran');
update npcs set location_id = (select id from locations where slug = 'ashen-spire')
  where slug = 'seraphel-noct';
update npcs set location_id = (select id from locations where slug = 'sylvara')
  where slug = 'elyndra';
update npcs set location_id = (select id from locations where slug = 'dawnharbor')
  where slug = 'duchess-selene';
update npcs set location_id = (select id from locations where slug = 'frostgale-keep')
  where slug in ('varkhul', 'korra');
update npcs set location_id = (select id from locations where slug = 'ashval')
  where slug in ('vorath', 'doria-vehn');
update npcs set location_id = (select id from locations where slug = 'caldrath')
  where slug in ('caelan-darius-iv', 'high-chancellor-cale');
update npcs set location_id = (select id from locations where slug = 'ironwatch')
  where slug = 'aris-dawn';
update npcs set location_id = (select id from locations where slug = 'coldrun')
  where slug = 'brunhild-thuldrun';
update npcs set location_id = (select id from locations where slug = 'millhaven')
  where slug = 'mira-solt';
update npcs set location_id = (select id from locations where slug = 'bloodmire-depths')
  where slug = 'pale-shepherd';


-- ─────────────────────────────────────────────────────────────
-- WIRE UP QUEST FOREIGN KEYS (location_id + giver_npc_id)
-- ─────────────────────────────────────────────────────────────
update quests set location_id = (select id from locations where slug = 'thornwick')
  where slug = 'bell-at-thornwick';
update quests set giver_npc_id = (select id from npcs where slug = 'mira-solt')
  where slug = 'millhaven-blight';
update quests set location_id = (select id from locations where slug = 'ashen-spire')
  where slug = 'gate-of-unbecoming';
update quests set location_id = (select id from locations where slug = 'vaelthorn')
  where slug in ('succession-crisis', 'cracked-crown');
update quests set location_id = (select id from locations where slug = 'frostgale-keep')
  where slug = 'frost-and-blood';
update quests set location_id = (select id from locations where slug = 'pale-cathedral')
  where slug = 'the-forgetting';
update quests set location_id = (select id from locations where slug = 'bloodmire-depths')
  where slug = 'hungry-dark';


-- ─────────────────────────────────────────────────────────────
-- NPC ↔ QUEST LINKS
-- ─────────────────────────────────────────────────────────────
insert into npc_quest_links (npc_id, quest_id, role) values
  ((select id from npcs where slug='elowen-valemont'),   (select id from quests where slug='cracked-crown'),       'ally'),
  ((select id from npcs where slug='seraphel-noct'),     (select id from quests where slug='cracked-crown'),       'target'),
  ((select id from npcs where slug='garron-blackwell'),  (select id from quests where slug='cracked-crown'),       'obstacle'),
  ((select id from npcs where slug='caedric-valemont'),  (select id from quests where slug='cracked-crown'),       'obstacle'),
  ((select id from npcs where slug='elyndra'),           (select id from quests where slug='cracked-crown'),       'ally'),
  ((select id from npcs where slug='seraphel-noct'),     (select id from quests where slug='gate-of-unbecoming'), 'target'),
  ((select id from npcs where slug='elyndra'),           (select id from quests where slug='gate-of-unbecoming'), 'ally'),
  ((select id from npcs where slug='elowen-valemont'),   (select id from quests where slug='bell-at-thornwick'),  'mentioned'),
  ((select id from npcs where slug='elowen-valemont'),   (select id from quests where slug='succession-crisis'),  'giver'),
  ((select id from npcs where slug='garron-blackwell'),  (select id from quests where slug='succession-crisis'),  'obstacle'),
  ((select id from npcs where slug='caedric-valemont'),  (select id from quests where slug='succession-crisis'),  'obstacle'),
  ((select id from npcs where slug='mira-solt'),         (select id from quests where slug='hungry-dark'),        'ally'),
  ((select id from npcs where slug='vorath'),            (select id from quests where slug='hungry-dark'),        'ally'),
  ((select id from npcs where slug='pale-shepherd'),     (select id from quests where slug='hungry-dark'),        'target'),
  ((select id from npcs where slug='elyndra'),           (select id from quests where slug='the-forgetting'),     'ally'),
  ((select id from npcs where slug='varkhul'),           (select id from quests where slug='frost-and-blood'),    'target'),
  ((select id from npcs where slug='brunhild-thuldrun'), (select id from quests where slug='frost-and-blood'),    'ally'),
  ((select id from npcs where slug='caelan-darius-iv'),  (select id from quests where slug='imperial-gambit'),    'obstacle'),
  ((select id from npcs where slug='aris-dawn'),         (select id from quests where slug='imperial-gambit'),    'ally'),
  ((select id from npcs where slug='duchess-selene'),    (select id from quests where slug='black-rose-thorns'), 'giver')

on conflict (npc_id, quest_id) do nothing;


-- ─────────────────────────────────────────────────────────────
-- CAMPAIGN STATE — World clock and awakening progress
-- ─────────────────────────────────────────────────────────────
insert into campaign_state (key, label, value, category, severity) values
  ('nhalzeruun_awakening',    'Nhal''Zeruun — The Hunger stirs beneath the Marches',       '15',      'shadow_lord',  2),
  ('vaulkhesh_awakening',     'Vaul-Khesh — War drums echo from Frostgale Keep',           '10',      'shadow_lord',  1),
  ('pale_choir_awakening',    'The Pale Choir — Forgetting spreads through the Veilwood',  '20',      'shadow_lord',  2),
  ('ulraeth_awakening',       'Ulraeth the Unmoored — Time frays near the Isles',          '5',       'shadow_lord',  1),
  ('mother_last_door',        'Mother of the Last Door — The dead stir under Vaelthorn',   '25',      'shadow_lord',  3),
  ('darkgate_countdown',      'Darkgate — Estimated days until Seraphel''s ritual',        '247',     'world_event',  4),
  ('bell_thornwick_silenced', 'Thornwick Bell — Silenced nine days ago',                   'true',    'world_event',  3),
  ('blackwell_advance',       'Blackwell''s Army — Staged at Fort Ashveil, waiting',       'Holding', 'faction',      2),
  ('darian_patience',         'Darian Empire — Annexation window opens in one season',     'Watching','faction',      3),
  ('crown_shard_vaelthorn',   'Crown Shard #1 — Vault of the Founding Kings (unrecovered)','unrecovered','world_event',2),
  ('crown_shards_recovered',  'Crown Shards Recovered',                                    '0/5',     'world_event',  1)

on conflict (key) do nothing;
