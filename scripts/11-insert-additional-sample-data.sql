-- Insert additional sample data for better testing

-- More TWK Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('Lambang negara Indonesia adalah...', 'TWK', 'A', 'Garuda Pancasila adalah lambang negara Indonesia yang melambangkan kekuatan dan kemerdekaan bangsa.', 1),
('Lagu kebangsaan Indonesia adalah...', 'TWK', 'B', 'Indonesia Raya yang diciptakan oleh W.R. Supratman adalah lagu kebangsaan Indonesia.', 1),
('Hari kemerdekaan Indonesia diperingati setiap tanggal...', 'TWK', 'C', '17 Agustus adalah hari proklamasi kemerdekaan Indonesia yang diperingati setiap tahun.', 1);

-- Insert options for additional TWK questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- Lambang negara question
((SELECT id FROM questions WHERE question_text = 'Lambang negara Indonesia adalah...'), 'A', 'Garuda Pancasila'),
((SELECT id FROM questions WHERE question_text = 'Lambang negara Indonesia adalah...'), 'B', 'Burung Elang'),
((SELECT id FROM questions WHERE question_text = 'Lambang negara Indonesia adalah...'), 'C', 'Harimau Sumatera'),
((SELECT id FROM questions WHERE question_text = 'Lambang negara Indonesia adalah...'), 'D', 'Komodo'),
((SELECT id FROM questions WHERE question_text = 'Lambang negara Indonesia adalah...'), 'E', 'Banteng'),

-- Lagu kebangsaan question
((SELECT id FROM questions WHERE question_text = 'Lagu kebangsaan Indonesia adalah...'), 'A', 'Tanah Airku'),
((SELECT id FROM questions WHERE question_text = 'Lagu kebangsaan Indonesia adalah...'), 'B', 'Indonesia Raya'),
((SELECT id FROM questions WHERE question_text = 'Lagu kebangsaan Indonesia adalah...'), 'C', 'Rayuan Pulau Kelapa'),
((SELECT id FROM questions WHERE question_text = 'Lagu kebangsaan Indonesia adalah...'), 'D', 'Bagimu Negeri'),
((SELECT id FROM questions WHERE question_text = 'Lagu kebangsaan Indonesia adalah...'), 'E', 'Gugur Bunga'),

-- Hari kemerdekaan question
((SELECT id FROM questions WHERE question_text = 'Hari kemerdekaan Indonesia diperingati setiap tanggal...'), 'A', '1 Juni'),
((SELECT id FROM questions WHERE question_text = 'Hari kemerdekaan Indonesia diperingati setiap tanggal...'), 'B', '20 Mei'),
((SELECT id FROM questions WHERE question_text = 'Hari kemerdekaan Indonesia diperingati setiap tanggal...'), 'C', '17 Agustus'),
((SELECT id FROM questions WHERE question_text = 'Hari kemerdekaan Indonesia diperingati setiap tanggal...'), 'D', '28 Oktober'),
((SELECT id FROM questions WHERE question_text = 'Hari kemerdekaan Indonesia diperingati setiap tanggal...'), 'E', '10 November');

-- More TIU Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('Hasil dari 15% dari 200 adalah...', 'TIU', 'B', '15% dari 200 = 15/100 × 200 = 30', 1),
('Jika x + 5 = 12, maka x = ...', 'TIU', 'C', 'x + 5 = 12, maka x = 12 - 5 = 7', 1),
('Rata-rata dari 8, 12, 16, 20 adalah...', 'TIU', 'D', 'Rata-rata = (8 + 12 + 16 + 20) ÷ 4 = 56 ÷ 4 = 14', 2);

-- Insert options for additional TIU questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- Persentase question
((SELECT id FROM questions WHERE question_text = 'Hasil dari 15% dari 200 adalah...'), 'A', '25'),
((SELECT id FROM questions WHERE question_text = 'Hasil dari 15% dari 200 adalah...'), 'B', '30'),
((SELECT id FROM questions WHERE question_text = 'Hasil dari 15% dari 200 adalah...'), 'C', '35'),
((SELECT id FROM questions WHERE question_text = 'Hasil dari 15% dari 200 adalah...'), 'D', '40'),
((SELECT id FROM questions WHERE question_text = 'Hasil dari 15% dari 200 adalah...'), 'E', '45'),

-- Aljabar question
((SELECT id FROM questions WHERE question_text = 'Jika x + 5 = 12, maka x = ...'), 'A', '5'),
((SELECT id FROM questions WHERE question_text = 'Jika x + 5 = 12, maka x = ...'), 'B', '6'),
((SELECT id FROM questions WHERE question_text = 'Jika x + 5 = 12, maka x = ...'), 'C', '7'),
((SELECT id FROM questions WHERE question_text = 'Jika x + 5 = 12, maka x = ...'), 'D', '8'),
((SELECT id FROM questions WHERE question_text = 'Jika x + 5 = 12, maka x = ...'), 'E', '9'),

-- Rata-rata question
((SELECT id FROM questions WHERE question_text = 'Rata-rata dari 8, 12, 16, 20 adalah...'), 'A', '12'),
((SELECT id FROM questions WHERE question_text = 'Rata-rata dari 8, 12, 16, 20 adalah...'), 'B', '13'),
((SELECT id FROM questions WHERE question_text = 'Rata-rata dari 8, 12, 16, 20 adalah...'), 'C', '15'),
((SELECT id FROM questions WHERE question_text = 'Rata-rata dari 8, 12, 16, 20 adalah...'), 'D', '14'),
((SELECT id FROM questions WHERE question_text = 'Rata-rata dari 8, 12, 16, 20 adalah...'), 'E', '16');

-- More TKP Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('Ketika rekan kerja Anda melakukan kesalahan yang merugikan tim, Anda akan...', 'TKP', 'A', 'Memberitahu dengan baik-baik dan membantu memperbaiki menunjukkan sikap konstruktif dan kerjasama tim yang baik.', 3),
('Dalam situasi deadline yang ketat, Anda akan...', 'TKP', 'B', 'Fokus pada tugas prioritas dan meminta bantuan jika diperlukan menunjukkan manajemen waktu dan kemampuan bekerja dalam tekanan.', 3),
('Ketika mendapat kritik dari atasan, sikap Anda adalah...', 'TKP', 'A', 'Menerima dengan lapang dada dan berusaha memperbaiki menunjukkan sikap terbuka terhadap feedback dan kemauan untuk berkembang.', 2);

-- Insert options for additional TKP questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- Rekan kerja kesalahan question
((SELECT id FROM questions WHERE question_text LIKE 'Ketika rekan kerja Anda melakukan kesalahan%'), 'A', 'Memberitahu dengan baik-baik dan membantu memperbaiki'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika rekan kerja Anda melakukan kesalahan%'), 'B', 'Langsung melaporkan kepada atasan'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika rekan kerja Anda melakukan kesalahan%'), 'C', 'Diam saja karena bukan urusan Anda'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika rekan kerja Anda melakukan kesalahan%'), 'D', 'Memarahi rekan kerja tersebut'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika rekan kerja Anda melakukan kesalahan%'), 'E', 'Menceritakan kepada rekan kerja lain'),

-- Deadline ketat question
((SELECT id FROM questions WHERE question_text = 'Dalam situasi deadline yang ketat, Anda akan...'), 'A', 'Panik dan stress'),
((SELECT id FROM questions WHERE question_text = 'Dalam situasi deadline yang ketat, Anda akan...'), 'B', 'Fokus pada tugas prioritas dan meminta bantuan jika diperlukan'),
((SELECT id FROM questions WHERE question_text = 'Dalam situasi deadline yang ketat, Anda akan...'), 'C', 'Mengerjakan semua tugas secara bersamaan'),
((SELECT id FROM questions WHERE question_text = 'Dalam situasi deadline yang ketat, Anda akan...'), 'D', 'Menyerahkan tugas kepada orang lain'),
((SELECT id FROM questions WHERE question_text = 'Dalam situasi deadline yang ketat, Anda akan...'), 'E', 'Meminta perpanjangan waktu'),

-- Kritik atasan question
((SELECT id FROM questions WHERE question_text = 'Ketika mendapat kritik dari atasan, sikap Anda adalah...'), 'A', 'Menerima dengan lapang dada dan berusaha memperbaiki'),
((SELECT id FROM questions WHERE question_text = 'Ketika mendapat kritik dari atasan, sikap Anda adalah...'), 'B', 'Membela diri dan memberikan alasan'),
((SELECT id FROM questions WHERE question_text = 'Ketika mendapat kritik dari atasan, sikap Anda adalah...'), 'C', 'Merasa tersinggung dan marah'),
((SELECT id FROM questions WHERE question_text = 'Ketika mendapat kritik dari atasan, sikap Anda adalah...'), 'D', 'Mengabaikan kritik tersebut'),
((SELECT id FROM questions WHERE question_text = 'Ketika mendapat kritik dari atasan, sikap Anda adalah...'), 'E', 'Menyalahkan orang lain');

COMMIT;
