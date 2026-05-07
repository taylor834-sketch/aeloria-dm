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
  ('Vela Ironroot', 'vela-ironroot', NULL, 'Licensed Forest Guide', 'Elf',
   'One of three licensed guides operating out of Thorngate''s waystation, with fifty years of Veilwood experience. She is the most reliable choice for parties heading into the Middle Wood.',
   'Calm and methodical, with the deep patience of someone who has seen the forest in every condition. She does not take unnecessary risks.',
   NULL,
   false, true),

  ('Dusk-in-Reed', 'dusk-in-reed', NULL, 'Licensed Forest Guide', 'Half-Elf',
   'The youngest of Thorngate''s three licensed guides — reckless, talented, and said to know the Veilwood better than most full elves despite her age.',
   'Confident to the point of carelessness, always slightly ahead of where caution would place her. Players who hire her will move fast and occasionally terrify.',
   NULL,
   false, true),

  ('Correm Talle', 'correm-talle', NULL, 'Retired Sentinel / Forest Guide', 'Human',
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
  ('Liseth', 'liseth-vine-station', NULL, 'Sentinel Scholar', 'Elf',
   'An elven scholar assigned to the Vine Station research outpost, studying active Choir influence — memory-wisps, dreamvine acceleration, and the healing marks on the Threaded Way. She is two months overdue for rotation.',
   'Methodical and increasingly alarmed — both by what she is observing and by her colleague Corval''s behavior.',
   'She believes Corval is under early-stage Choir influence. Her replacement never arrived. She is effectively trapped at the outpost with a colleague she no longer trusts.',
   false, true),

  ('Corval', 'corval-vine-station', NULL, 'Sentinel Researcher / Memory Wizard', 'Human',
   'A human wizard specializing in memory magic, assigned to the Vine Station to study Choir influence. His fascination with his subject has begun to concern his colleagues.',
   'Intellectually captivated and increasingly disconnected from caution. He tests his memory each morning by writing everything he can recall about his childhood. The list grows shorter.',
   'He believes the shortening list is natural cognitive replacement. Liseth believes he is under early-stage Choir influence. The distinction may no longer be meaningful.',
   false, true),

  ('Grundt', 'grundt-vine-station', NULL, 'Sentinel Ranger', 'Dwarf',
   'A dwarven ranger stationed at the Vine Station primarily to prevent Liseth and Corval from doing anything catastrophically stupid. He has concluded it is time to leave.',
   'Blunt, practical, and done. He is the tiebreaker vote between Liseth''s alarm and Corval''s fascination, and he knows it.',
   NULL,
   false, true),

  -- Outer Network Towers
  ('Sable', 'sable-briarwatch', NULL, 'Sentinel Tower Keeper', 'Elf',
   'The lone Sentinel staffing Briarwatch tower on the Veilwood''s northwest edge. She has not been relieved in five months.',
   'Isolating and fraying at the edges. She has begun talking to the trees.',
   'Five months without relief. She is exhibiting early signs of the isolation-driven dissociation that precedes Choir susceptibility. No one has come to check on her.',
   false, true),

  ('Dorn', 'dorn-wychwatch', NULL, 'Sentinel Tower Keeper', 'Human',
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
  ('Merchant-Lady Sova Duvenne', 'sova-duvenne', NULL, 'Merchant House Head', 'Human',
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
  ('Patch', 'patch-salted-anchor', NULL, 'Tide Gang Cell Leader', 'Human',
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
  ('Kess Hallom', 'kess-hallom', NULL, 'Ship Chandler / Tide Gang Courier Hold', 'Human',
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
  ('Kuldraan the Thin', 'kuldraan-the-thin', NULL, 'Rogue Frost Giant', 'Frost Giant',
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
   NULL),

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
   NULL),

  ('The Cathedral Is Finishing Something', 'quest-cathedral-approaches', 'Veilwood', 'regional', 'available',
   'Elven scouts report that the Pale Cathedral appears larger each time they observe it from the approach zone boundary — not growing, but always revealing more of itself. The Memory-Keepers say it is always finishing something it is building. Players who have accumulated enough Veilwood knowledge may be asked to observe the approach zone and attempt to determine what the Cathedral is constructing.',
   'This is a scouting and intelligence quest, not a Cathedral confrontation. Players enter the approach zone with protection (Wisdom saves DC 16 per half-hour without it) and observe from the boundary. Arcana DC 18 on the visible structure identifies new construction in the Cathedral''s western wing that matches no architectural record. History DC 15 identifies the construction pattern as consistent with a secondary anchor — the Choir is not just inhabiting the Cathedral, it is building a sixth binding point from inside. The sixth point maps to Sylvara. This discovery should feed directly into the campaign''s central conflict.',
   NULL),

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
   NULL),

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
