ALTER TABLE admin_users
ADD COLUMN IF NOT EXISTS role VARCHAR(20) NOT NULL DEFAULT 'super_admin';

UPDATE admin_users
SET role = 'super_admin'
WHERE role IS NULL OR role = '';
