-- Town quests from town-quests.md — local problems that make the world feel inhabited
-- These are 30-90 min session fillers with full setups, complications, NPCs, and resolutions

INSERT INTO quests (title, slug, region, quest_type, status, description, dm_notes, reward_notes) VALUES

-- LIGHTHAVEN
('The Missing Cartographer', 'lighthaven-cartographer', 'Aranthor', 'town', 'available',
 'Ren Voss, Lighthaven''s mapmaker, hasn''t been seen in four days. Her assistant says she went to map the northern ridge and didn''t come back.',
 'She is fine. She found a newly-active ley-line intersection (circular depression, no plants) and has been sitting beside it taking notes. She ran out of water two days ago and is very annoyed. DC 14 Investigation to find the site. Elyndra would want to know — this is a Crown fracture effect on dormant ley lines.',
 'Ren''s annotated regional maps (better than anything the Sentinel Order has for this area). Her gratitude — and a standing contact for future map needs.'),

('The Halfling Quarter Argument', 'lighthaven-halflings', 'Aranthor', 'town', 'available',
 'Lighthaven''s halfling community is in a formal dispute with a merchant guild that wants to build a warehouse over their 60-year-old communal garden. Two of three required council votes are already in the guild''s favor.',
 'The third council member (Maret Beel) is paralyzed — her husband works for the guild, her sister is a halfling. She needs a legal reason to vote no. The garden qualifies as a communal food supply under Lighthaven''s founding charter food security ordinances, requiring full council approval (not two-thirds). The ordinance is in the town library in Old Aelorian, small handwriting. DC 12 History or Investigation to find; DC 10 to translate. Once found, Maret votes no without hesitation.',
 'Elder Pell Goodbarrow''s genuine gratitude (and pie — several varieties, delivered during the investigation). The halfling quarter becomes a reliable safe haven and information source in Lighthaven.'),

-- THORNWICK
('The Bell-Ringer''s House', 'thornwick-house', 'Aranthor', 'town', 'available',
 'Corwin, Thornwick''s bell-ringer, is being pressured by a property agent to sell his family home for "Blackwell''s supply chain expansion." He doesn''t want to sell and doesn''t know his rights.',
 'The property agent is from a Cabal front organization, not Blackwell. They want a relay building on the main courier route between Vaelthorn and Dunmore — this is the third such recent purchase (all on the same route). DC 14 Investigation to find the other purchases and pattern. The agent will overpay in cash rather than continue slow negotiation if players confront him with evidence — his timeline matters more than money. Exposing the front organization collapses the deal and gives Elyndra a new Cabal intelligence lead.',
 'Corwin''s tearful relief and a standing contact who knows Thornwick''s history intimately. Exposing the network gives the Sentinel Order a new Cabal relay map.'),

('Who Remembered First', 'thornwick-pale-memory', 'Aranthor', 'town', 'available',
 'A Thornwick woman named Elys has a vivid, detailed memory she shouldn''t have — the night the bell was silenced, from inside the bell tower, from the perspective of the Cabal agent who placed the ward.',
 'Elys carries a Pale Choir identity fragment from a Cabal agent who briefly passed through the Choir''s range while casing Thornwick. She is not the agent — she has lived here her whole life. The fragment contains: the agent''s face, a Vaelthorn check-in building address, a coded phrase repeated twice. Extracting it: Cleric Identify (DC 12 Wisdom save on Elys — failure loses the memory permanently) or careful patient questioning over several hours (slower but Elys retains follow-up access). The face Elys describes is someone the players may encounter in Vaelthorn later.',
 'The Cabal agent''s identity and Vaelthorn contact location. A code phrase that can be used to approach Cabal operatives in that building without immediate hostility.'),

-- DUNMORE
('The Soldier Who Said No', 'dunmore-andren', 'Aranthor', 'town', 'available',
 'A Blackwell soldier named Andren has been placed under garrison arrest for refusing to participate in the grain requisition from Millhaven''s western farms. His commanding officer, Captain Eld, disagrees with the arrest but can''t publicly say so.',
 'Eld is a closet Crown Loyalist contact who needs a reason to release Andren that doesn''t implicate him. Options: Break Andren out (illegal, fugitive status, Blackwell enmity); give Eld a cover reason (Andren is needed for a legitimate outside mission); find the legal precedent (mercenary contract clause barring civilian harm orders — in the original Dunmore garrison contract, which Blackwell''s lawyers wrote badly). The contract angle is the clean solution. DC 13 Investigation to find the relevant clause.',
 'Andren''s genuine loyalty — he will show up when needed and do his job without sentiment. He says "I owe you" exactly once. Eld becomes a cautious but real Loyalist contact.'),

('The Neutral Merchant', 'dunmore-merchant', 'Aranthor', 'town', 'available',
 'Merchant Gerta Foss trades with all three succession factions simultaneously and someone just tried to kill her — not because of her neutrality, but because of a specific package she delivered six weeks ago.',
 'Gerta delivered correspondence between a Cabal agent and a Blackwell colonel. The package receipt has a Black Rose seal — Selene''s people received it. Someone wants Gerta silenced before she remembers what she knows. Gerta can describe the courier (a woman named Della), the destination (a factor''s office in Vaelthorn), and has the return receipt. The receipt is the thread that ties to the Black Rose Thorns campaign — Selene has correspondence documenting a Blackwell-Cabal coordination meeting and hasn''t revealed it. Players who connect this thread can use it in the Glass Market campaign.',
 'Gerta''s gratitude and a permanent safe trader contact in Dunmore. The Vaelthorn factor''s office address — useful for Black Rose Thorns investigation.'),

-- MILLHAVEN
('The Western Field', 'millhaven-western-field', 'Aranthor', 'town', 'available',
 'Millhaven''s western fields are failing — crops wither without disease or drought, and the line of dead soil moves two inches east every week. Three families have already left. Twelve remain and are watching their land die.',
 'A ley-line is carrying Nhal''Zeruun seepage from the Ashen Marches. A minor ley-node at the field''s edge was disrupted when last year''s storm toppled an old standing stone that functioned as a natural condenser. The stone is in three pieces in a drainage ditch. Restoring it: DC 15 Athletics per section (three sections), then a Druid or Cleric ritual to reseat it as a ley-anchor (DC 12 Nature/Religion). Without the ritual, physical restoration is decorative. Result: seepage slows, line stops moving, dead soil won''t recover immediately but the remaining farmers can plant with confidence. Connects directly to The Hungry Dark quest.',
 'Elder Mira Solt''s access to her personal reference library, including Sentinel Order material she kept when she left their service. The twelve farming families remember who helped them.'),

('The Apology Tour', 'millhaven-grain', 'Aranthor', 'town', 'available',
 'A Blackwell tax collector arrived two weeks ago, collected grain at swordpoint that Millhaven couldn''t spare, and left. The village can''t eat politics. They need food before winter.',
 'The tax collector (independent contractor named Voss, currently in Dunmore) collected 40 bushels over his authorization and pocketed the difference. Blackwell''s quartermaster doesn''t know this. Options: Confront Voss in Dunmore (he gives the overage back to avoid formal accusations — he has other fraud on record); go to the quartermaster directly (she''ll correct the unauthorized overage as a management problem — she hates losing track of grain, not sympathetic to Millhaven but hates paperwork errors more); or tell Mira and she files the official complaint herself through Vaelthorn tax authority contacts. All paths return the grain; the quartermaster path is fastest, the Mira path is most satisfying.',
 'Millhaven''s genuine goodwill — useful when players need shelter, information, or a safe waypoint in western Aranthor. Mira Solt becomes a more active ally.'),

-- VAELTHORN
('The Quiet Rooms', 'vaelthorn-quiet-rooms', 'Aranthor', 'town', 'available',
 'A wing of Castle Vaelthorn sealed for forty years — since the Night of Broken Glass — has started having visitors. Not human ones. Three servants have heard movement from the sealed corridor.',
 'The Mother of the Last Door is reaching through the foundation stones toward the Vaelthorn Shard in the crypts below. The nursery sits directly above her strongest reach point. Inside the wing: intact preservation of the room where Elowen was during the Night of Broken Glass — her twelve-year-old drawings on the wall (maps of imaginary countries), a half-finished letter to her father that stops mid-sentence. If Elowen is known to players and they tell her, she will ask quietly if they left it intact. The wing must be sealed: Cleric ward ritual (DC 12) or report to Elyndra for a Sentinel team. The drawings stay.',
 'Elyndra''s gratitude for identifying an active Shadow Lord reach point. If Elowen learns of it: a moment of genuine connection — she thanks the players in a way that reveals what she''s been carrying.'),

('The Vote That Costs Nothing', 'vaelthorn-fen-marsh', 'Aranthor', 'town', 'available',
 'A minor Council of Lords procedural vote needs eleven of twelve lords. Ten confirmed. One, Lord Fen Marsh, arrived in Vaelthorn three days ago and hasn''t been seen since.',
 'Fen Marsh is in a tavern two streets from the Council hall, completely happy-drunk. He received a letter yesterday: his wife just gave birth to their first child. He has been buying rounds for strangers ever since. He is not incapacitated — he is celebratory. He''ll sober up with good food and twenty minutes if given a real reason. The complication: Caedric''s agents know Fen is missing and have made no move. The procedural vote, if it fails, delays a land survey that delays Lady Veth Horne''s territorial claim confirmation that delays her proxy vote in the succession debate. It''s a four-link chain Caedric''s people are counting on nobody connecting. Players who spot the chain can flag it to the Loyalist network.',
 'Fen Marsh becomes a reliable minor ally — genuinely grateful, votes with integrity, always slightly distracted when the topic of babies comes up. Disrupting Caedric''s four-link chain earns Loyalist reputation.'),

-- DAWNHARBOR
('The Ship That Smiled', 'dawnharbor-ship', 'Sapphire Coast', 'town', 'available',
 'A cargo ship arrived this morning with its full crew, no cargo, no log entries for the last eight days, and every single crew member smiling in a way that isn''t quite right.',
 'The ship sailed through a fog zone near the Shattered Isles and ran a Ulraeth time loop for eight days — a good day, repeated: fair wind, good catch, no incident. The smiling is residual Ulraeth influence, not possession — it fades within a day. While it lasts, the crew answers questions with complete honesty and an air of contentment. Their honest memories are specific: coordinates, weather conditions, the exact moment the loop seemed to reset. This is direct intelligence for the Fog and Freedom / Tides and Fog campaigns. The first mate says, from behind her smile: "I have had worse weeks. I would like to not do it again, but objectively it was a good week."',
 'Precise Shattered Isles fog zone coordinates and loop-reset timing. A reliable ship captain who owes the players for handling the aftermath quietly — no port authority investigation.'),

-- SALTMERE
('The Six-Month Widow', 'saltmere-widow', 'Shattered Isles', 'town', 'available',
 'A woman named Cora was declared a widow eight months ago when her husband Kael vanished in the fog. She accepted it, settled his affairs, started rebuilding. Yesterday, Kael walked off a boat.',
 'Kael was in a Ulraeth time loop. He experienced eight hours. He is fine and confused by the eight months. He wants his wife back. His wife has spent eight months making peace with his death and is not immediately available to un-make it. This is not a mechanical quest — it''s a human one. Both Cora and Kael need to talk to someone who isn''t each other right now. Kael needs to understand eight hours ≠ eight months, and that she is not the same person who said goodbye. Cora needs to understand she is still allowed to be relieved before figuring anything else out. Resolution: three days later, she brings him a meal she made — his favorite, she remembers it exactly. They eat quietly. This is what the Fog and Freedom campaign is about.',
 'No material reward. A direct emotional illustration of what Fog and Freedom means to real people. The players become trusted in Saltmere in a way that faction reputation cannot buy.'),

-- ASHVAL
('The Child on the Road', 'ashval-child', 'Ashen Marches', 'town', 'available',
 'A child of about eight appeared on the road east of Ashval three days ago with no memory of her name. She knows the Ashen Marches perfectly — every trail, every safe spot, the exact route through the grey zone. She navigates without hesitation. She has nightmares every night.',
 'She is from Millhaven — a family that moved west three months ago. She wandered into the grey zone (following an animal) and the void seepage stripped her anxiety about getting lost, which is the only reason she survived it. She remembers everything about the grey zone''s geography. She remembers nothing about her name. Her family is in a Bloodmire Cult outer settlement — not cultists, just refugees who accepted the cult''s protection. Getting her home requires either extracting the whole family (complicated) or negotiating custody with the settlement leader (possible — the cult isn''t keeping refugees, just needs quiet). Her route through the grey zone is genuinely invaluable. Connects directly to The Hungry Dark''s 200 dependents.',
 'The safe route through the Ashen Marches'' worst section — worth more than any map. A direct setup for the Bloodmire Depths approach in The Hungry Dark.'),

('Elder Haleth''s Favor', 'ashval-haleth', 'Ashen Marches', 'town', 'available',
 'Mayor-Elder Haleth summons the players by name, speaks very quietly, and asks them to burn a building on the Marches'' eastern edge.',
 'The building is a Bloodmire Cult surface warehouse. She is right that it contains nothing good. But she also has the cult''s secondary supply route records — found six months ago, sitting on as leverage. She has been slowly negotiating the release of three cult-recruited teenagers from Ashval families. She has two back. The third is the one she can''t get. The building burns when she has the third. Players can help with the third extraction (requires visiting the warehouse, not the Depths — a softer encounter with negotiation, not combat). The extraction works. The building burns the next night. She does not thank the players in words. She gives them the supply route records.',
 'The Bloodmire Cult''s secondary supply route records (significant intelligence for The Hungry Dark). Haleth as a genuine, if taciturn, Ashen Marches contact. She says: "Don''t tell anyone I did this sentimentally. I have a reputation."')

ON CONFLICT (slug) DO NOTHING;
