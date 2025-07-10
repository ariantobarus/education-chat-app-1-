-- Fix User Passwords - Update dengan password yang benar
-- Password: "password123" dengan BCrypt hash yang benar

USE educhat_db;

-- Update semua user dengan password hash yang benar untuk "password123"
UPDATE users SET password = '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.' WHERE username IN (
    'admin', 'superadmin', 'tutor_twk', 'tutor_tiu', 'tutor_tkp', 
    'student001', 'student002', 'student003', 'student004', 'student005'
);

-- Atau buat user baru dengan password yang pasti benar
INSERT INTO users (username, email, password, full_name, role, active) VALUES
('testuser', 'test@educhat.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Test User', 'STUDENT', true)
ON DUPLICATE KEY UPDATE 
password = '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.',
active = true;

-- Verifikasi users
SELECT username, email, role, active, 
       SUBSTRING(password, 1, 20) as password_preview 
FROM users 
ORDER BY role, username;
