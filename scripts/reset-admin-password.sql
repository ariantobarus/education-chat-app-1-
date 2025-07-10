-- Reset Admin Password dengan Hash yang Benar
-- Password asli: "password123"

USE educhat_db;

-- Update admin password dengan hash yang benar
UPDATE users 
SET password = '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.' 
WHERE username = 'admin';

-- Pastikan admin user aktif
UPDATE users 
SET active = true 
WHERE username = 'admin';

-- Verifikasi admin user
SELECT 
    username, 
    email, 
    role, 
    active,
    SUBSTRING(password, 1, 30) as password_preview,
    created_at
FROM users 
WHERE username = 'admin';

-- Buat user admin baru jika tidak ada
INSERT INTO users (username, email, password, full_name, role, active) 
VALUES ('admin', 'admin@educhat.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Administrator', 'ADMIN', true)
ON DUPLICATE KEY UPDATE 
    password = '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.',
    active = true;

-- Test query untuk memastikan user ada
SELECT COUNT(*) as admin_count FROM users WHERE username = 'admin' AND active = true;
