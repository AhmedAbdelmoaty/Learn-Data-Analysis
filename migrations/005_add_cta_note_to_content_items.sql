ALTER TABLE content_items
    ADD COLUMN IF NOT EXISTS cta_note_en TEXT,
    ADD COLUMN IF NOT EXISTS cta_note_ar TEXT;

UPDATE content_items
SET cta_note_en = COALESCE(cta_note_en, 'Want to go deeper? Continue your journey inside our full Training Program.'),
    cta_note_ar = COALESCE(cta_note_ar, 'عايز تكمل رحلتك؟ انضم إلى برنامجنا التدريبي الكامل.');
