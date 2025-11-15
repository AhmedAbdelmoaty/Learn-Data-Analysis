ALTER TABLE topics
    ADD COLUMN IF NOT EXISTS hero_background_color VARCHAR(20),
    ADD COLUMN IF NOT EXISTS hero_background_opacity INT DEFAULT 85,
    ADD COLUMN IF NOT EXISTS hero_text_color VARCHAR(20);
