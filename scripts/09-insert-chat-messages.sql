-- Insert Sample Chat Messages

-- Chat between tutor and students
INSERT INTO chat_messages (sender_id, receiver_id, room_id, content, type, created_at, is_read) VALUES
-- Private messages between tutor_twk and student001
((SELECT id FROM users WHERE username = 'tutor_twk'), (SELECT id FROM users WHERE username = 'student001'), NULL, 'Selamat pagi! Bagaimana persiapan tes TWK Anda?', 'TEXT', '2024-01-15 08:00:00', true),
((SELECT id FROM users WHERE username = 'student001'), (SELECT id FROM users WHERE username = 'tutor_twk'), NULL, 'Pagi Bu! Saya masih kesulitan dengan materi sejarah perjuangan bangsa.', 'TEXT', '2024-01-15 08:05:00', true),
((SELECT id FROM users WHERE username = 'tutor_twk'), (SELECT id FROM users WHERE username = 'student001'), NULL, 'Baik, saya akan berikan tips khusus. Fokus pada peristiwa-peristiwa penting dan tokoh-tokohnya.', 'TEXT', '2024-01-15 08:10:00', true),
((SELECT id FROM users WHERE username = 'student001'), (SELECT id FROM users WHERE username = 'tutor_twk'), NULL, 'Terima kasih Bu! Apakah ada buku referensi yang direkomendasikan?', 'TEXT', '2024-01-15 08:15:00', false),

-- Group chat in TWK room
((SELECT id FROM users WHERE username = 'tutor_twk'), NULL, 'twk-discussion', 'Selamat datang di grup diskusi TWK! Silakan bertanya jika ada materi yang kurang jelas.', 'TEXT', '2024-01-10 09:00:00', true),
((SELECT id FROM users WHERE username = 'student001'), NULL, 'twk-discussion', 'Bu, bisa dijelaskan perbedaan antara Pancasila sebagai dasar negara dan pandangan hidup?', 'TEXT', '2024-01-10 09:15:00', true),
((SELECT id FROM users WHERE username = 'student002'), NULL, 'twk-discussion', 'Saya juga ingin tahu Bu, sering bingung dengan konsep ini.', 'TEXT', '2024-01-10 09:17:00', true),
((SELECT id FROM users WHERE username = 'tutor_twk'), NULL, 'twk-discussion', 'Pancasila sebagai dasar negara adalah fondasi hukum, sedangkan sebagai pandangan hidup adalah pedoman moral bangsa.', 'TEXT', '2024-01-10 09:20:00', true),
((SELECT id FROM users WHERE username = 'student003'), NULL, 'twk-discussion', 'Terima kasih Bu, penjelasannya sangat jelas!', 'TEXT', '2024-01-10 09:25:00', true),

-- TIU discussion group
((SELECT id FROM users WHERE username = 'tutor_tiu'), NULL, 'tiu-discussion', 'Halo semua! Mari kita diskusikan strategi mengerjakan soal TIU dengan efektif.', 'TEXT', '2024-01-12 10:00:00', true),
((SELECT id FROM users WHERE username = 'student004'), NULL, 'tiu-discussion', 'Pak, saya sering kehabisan waktu saat mengerjakan soal deret angka.', 'TEXT', '2024-01-12 10:05:00', true),
((SELECT id FROM users WHERE username = 'tutor_tiu'), NULL, 'tiu-discussion', 'Tips: Identifikasi pola dengan cepat. Lihat selisih atau rasio antar suku terlebih dahulu.', 'TEXT', '2024-01-12 10:08:00', true),
((SELECT id FROM users WHERE username = 'student005'), NULL, 'tiu-discussion', 'Bagaimana dengan soal analogi verbal Pak?', 'TEXT', '2024-01-12 10:12:00', true),
((SELECT id FROM users WHERE username = 'tutor_tiu'), NULL, 'tiu-discussion', 'Untuk analogi, pahami hubungan kata pertama, lalu cari kata yang memiliki hubungan serupa.', 'TEXT', '2024-01-12 10:15:00', true),

-- TKP discussion group
((SELECT id FROM users WHERE username = 'tutor_tkp'), NULL, 'tkp-discussion', 'Selamat bergabung di grup TKP! Ingat, tidak ada jawaban salah, hanya tingkat preferensi.', 'TEXT', '2024-01-14 14:00:00', true),
((SELECT id FROM users WHERE username = 'student002'), NULL, 'tkp-discussion', 'Bu, bagaimana cara memilih jawaban terbaik untuk soal situasional?', 'TEXT', '2024-01-14 14:10:00', true),
((SELECT id FROM users WHERE username = 'tutor_tkp'), NULL, 'tkp-discussion', 'Pilih jawaban yang menunjukkan integritas, orientasi pelayanan, dan profesionalisme tinggi.', 'TEXT', '2024-01-14 14:15:00', true),
((SELECT id FROM users WHERE username = 'student003'), NULL, 'tkp-discussion', 'Apakah boleh memilih jawaban yang "aman" Bu?', 'TEXT', '2024-01-14 14:20:00', true),
((SELECT id FROM users WHERE username = 'tutor_tkp'), NULL, 'tkp-discussion', 'Lebih baik pilih jawaban yang menunjukkan inisiatif dan tanggung jawab, bukan yang aman saja.', 'TEXT', '2024-01-14 14:25:00', true),

-- Student to student discussions
((SELECT id FROM users WHERE username = 'student001'), (SELECT id FROM users WHERE username = 'student002'), NULL, 'Hai! Bagaimana persiapan tesmu?', 'TEXT', '2024-01-16 19:00:00', true),
((SELECT id FROM users WHERE username = 'student002'), (SELECT id FROM users WHERE username = 'student001'), NULL, 'Lumayan, tapi masih nervous. Kamu gimana?', 'TEXT', '2024-01-16 19:05:00', true),
((SELECT id FROM users WHERE username = 'student001'), (SELECT id FROM users WHERE username = 'student002'), NULL, 'Sama! Mau belajar bareng besok?', 'TEXT', '2024-01-16 19:08:00', false),

-- General discussion room
((SELECT id FROM users WHERE username = 'admin'), NULL, 'general', 'Selamat datang di platform EduChat! Semoga bermanfaat untuk persiapan tes Anda.', 'SYSTEM', '2024-01-01 00:00:00', true),
((SELECT id FROM users WHERE username = 'tutor_general'), NULL, 'general', 'Jangan lupa untuk konsisten belajar setiap hari. Kualitas lebih penting dari kuantitas!', 'TEXT', '2024-01-15 16:00:00', true),
((SELECT id FROM users WHERE username = 'student004'), NULL, 'general', 'Terima kasih untuk semua tutor yang sudah membantu!', 'TEXT', '2024-01-20 18:00:00', true),
((SELECT id FROM users WHERE username = 'student005'), NULL, 'general', 'Platform ini sangat membantu persiapan tes saya!', 'TEXT', '2024-01-21 20:00:00', false);

COMMIT;
