-- Patch: add backup paths, pressure-test notes, and stat block shorthands
-- to quests where they affect live DM app gameplay

-- TQ-FA1: Add Otten backup path (critical single-point-of-failure fix)
UPDATE quests
SET dm_notes = dm_notes || E'\n\nBACKUP PATH (critical): Cell guard Otten (22) has been delivering Crost''s water ration for 6 weeks. Crost asked him to pass a message: "Tell someone with Loyalist sympathy that Elvan Crost is here. The cache at Warden''s Cross is intact." Otten is afraid to guess who to trust. DC 12 Insight on fort guards to notice he''s carrying something heavy. DC 13 Persuasion gets him talking. Use Guard stat block. NPCs: Pyke = Commoner (does not fight); Crost = Commoner, 2 HP, incapacitated; Otten = Guard.'
WHERE slug = 'fort-ashveil-surgeon';

-- TQ-C1: Add teleportation ward note (prevents clever-solution bypass)
UPDATE quests
SET dm_notes = dm_notes || E'\n\nTELEPORTATION: Does not work. The Registered Quarter and Trade Quarter warehouse are within the Blackguard anti-magical-transit perimeter. Standard Imperial security in controlled Caldrath zones. Mira: "We tried that four years ago. Two people arrived in a Blackguard holding room. We don''t do that anymore."'
WHERE slug = 'caldrath-twelve';

-- TQ-MP1: Add Charm Person note (validate clever solution)
UPDATE quests
SET dm_notes = dm_notes || E'\n\nCHARM/HOLD SPELLS: Valid. The Sentinel Order protocol doesn''t require Pell''s cooperation, just physical removal from the influence zone. Let magical solutions work — the emotional path is richer but the mechanical path is not wrong. Pell = Commoner stat block; Wisdom saves at disadvantage within influence zone.'
WHERE slug = 'mirepost-dara';
