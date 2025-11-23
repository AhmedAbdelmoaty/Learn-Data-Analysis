-- Normalize admin roles to the new naming scheme
ALTER TABLE admin_users
ALTER COLUMN role SET DEFAULT 'super_admin';

UPDATE admin_users
SET role = 'super_admin'
WHERE role IN ('admin', '', NULL);

UPDATE admin_users
SET role = 'content_admin'
WHERE role = 'editor';
