ALTER TABLE admin_users
ADD COLUMN IF NOT EXISTS role VARCHAR(20) NOT NULL DEFAULT 'admin';

UPDATE admin_users
SET role = 'admin'
WHERE role IS NULL;
