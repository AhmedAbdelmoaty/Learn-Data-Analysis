ALTER TABLE topics
    ADD COLUMN IF NOT EXISTS is_tool BOOLEAN DEFAULT false;

UPDATE topics SET is_tool = true WHERE slug IN ('excel', 'power-bi', 'sql');
UPDATE topics SET is_tool = false WHERE slug = 'statistics';
