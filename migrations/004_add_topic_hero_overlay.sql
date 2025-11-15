ALTER TABLE topics
    ADD COLUMN IF NOT EXISTS hero_overlay_color_start VARCHAR(9),
    ADD COLUMN IF NOT EXISTS hero_overlay_color_end VARCHAR(9),
    ADD COLUMN IF NOT EXISTS hero_overlay_opacity_start INT DEFAULT 90,
    ADD COLUMN IF NOT EXISTS hero_overlay_opacity_end INT DEFAULT 90;

UPDATE topics
SET hero_overlay_color_start = COALESCE(hero_overlay_color_start, '#A8324E'),
    hero_overlay_color_end = COALESCE(hero_overlay_color_end, '#6C1E35'),
    hero_overlay_opacity_start = COALESCE(hero_overlay_opacity_start, 90),
    hero_overlay_opacity_end = COALESCE(hero_overlay_opacity_end, 90)
WHERE hero_overlay_color_start IS NULL
   OR hero_overlay_color_end IS NULL
   OR hero_overlay_opacity_start IS NULL
   OR hero_overlay_opacity_end IS NULL;

UPDATE topics
SET hero_overlay_color_start = '#2E7D32',
    hero_overlay_color_end = '#1B5E20',
    hero_overlay_opacity_start = 90,
    hero_overlay_opacity_end = 90
WHERE slug = 'excel';

UPDATE topics
SET hero_overlay_color_start = '#FFC400',
    hero_overlay_color_end = '#CC7800',
    hero_overlay_opacity_start = 92,
    hero_overlay_opacity_end = 90
WHERE slug = 'power-bi';

UPDATE topics
SET hero_overlay_color_start = '#3F51B5',
    hero_overlay_color_end = '#21358C',
    hero_overlay_opacity_start = 90,
    hero_overlay_opacity_end = 90
WHERE slug = 'sql';

UPDATE topics
SET hero_overlay_color_start = '#009688',
    hero_overlay_color_end = '#00695C',
    hero_overlay_opacity_start = 90,
    hero_overlay_opacity_end = 90
WHERE slug = 'statistics';
