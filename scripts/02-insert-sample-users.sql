-- Insert Sample Users
-- Password: 'password123' (will be encoded by Spring Security)

INSERT INTO users (username, email, password, full_name, role, active) VALUES
-- Admin Users
('admin', 'admin@educhat.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Administrator', 'ADMIN', true),
('superadmin', 'superadmin@educhat.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Super Administrator', 'ADMIN', true),

-- Tutor Users
('tutor_twk', 'tutor.twk@educhat.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Dr. Sari Wulandari', 'TUTOR', true),
('tutor_tiu', 'tutor.tiu@educhat.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Prof. Budi Santoso', 'TUTOR', true),
('tutor_tkp', 'tutor.tkp@educhat.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Dra. Maya Indira', 'TUTOR', true),
('tutor_general', 'tutor.general@educhat.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'M.Pd. Ahmad Rizki', 'TUTOR', true),

-- Student Users
('student001', 'andi.pratama@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Andi Pratama', 'STUDENT', true),
('student002', 'siti.nurhaliza@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Siti Nurhaliza', 'STUDENT', true),
('student003', 'budi.setiawan@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Budi Setiawan', 'STUDENT', true),
('student004', 'dewi.lestari@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Dewi Lestari', 'STUDENT', true),
('student005', 'rudi.hermawan@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Rudi Hermawan', 'STUDENT', true),
('student006', 'lisa.permata@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Lisa Permata', 'STUDENT', true),
('student007', 'agus.wijaya@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Agus Wijaya', 'STUDENT', true),
('student008', 'rina.sari@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Rina Sari', 'STUDENT', true),
('student009', 'doni.prasetyo@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Doni Prasetyo', 'STUDENT', true),
('student010', 'maya.anggraini@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'Maya Anggraini', 'STUDENT', true);

COMMIT;
