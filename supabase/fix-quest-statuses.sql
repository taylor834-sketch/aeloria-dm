-- Fix quest statuses to realistic campaign starting state
-- Main quests stay 'active' — players know the big picture from session 1
-- Subplots start 'hidden' — they emerge through play
-- Regional + town quests start 'available' — players can discover them in the world

UPDATE quests SET status = 'hidden'    WHERE quest_type = 'subplot'             AND status = 'active';
UPDATE quests SET status = 'available' WHERE quest_type IN ('regional', 'town') AND status = 'active';
