-- Insert TIU (Tes Intelejensi Umum) Questions

-- Logika Matematika Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('Jika semua A adalah B, dan semua B adalah C, maka...', 'TIU', 'A', 'Berdasarkan silogisme, jika semua A adalah B dan semua B adalah C, maka dapat disimpulkan bahwa semua A adalah C.', 2),
('Negasi dari pernyataan "Semua siswa rajin" adalah...', 'TIU', 'C', 'Negasi dari "Semua siswa rajin" adalah "Ada siswa yang tidak rajin" atau "Beberapa siswa tidak rajin".', 3),
('Jika p → q benar dan p benar, maka...', 'TIU', 'B', 'Berdasarkan modus ponens, jika p → q benar dan p benar, maka q juga benar.', 2);

-- Insert options for Logika questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- Logika Question 1 options
((SELECT id FROM questions WHERE question_text = 'Jika semua A adalah B, dan semua B adalah C, maka...'), 'A', 'Semua A adalah C'),
((SELECT id FROM questions WHERE question_text = 'Jika semua A adalah B, dan semua B adalah C, maka...'), 'B', 'Semua C adalah A'),
((SELECT id FROM questions WHERE question_text = 'Jika semua A adalah B, dan semua B adalah C, maka...'), 'C', 'Beberapa A adalah C'),
((SELECT id FROM questions WHERE question_text = 'Jika semua A adalah B, dan semua B adalah C, maka...'), 'D', 'Tidak ada A yang C'),
((SELECT id FROM questions WHERE question_text = 'Jika semua A adalah B, dan semua B adalah C, maka...'), 'E', 'Tidak dapat disimpulkan'),

-- Logika Question 2 options
((SELECT id FROM questions WHERE question_text = 'Negasi dari pernyataan "Semua siswa rajin" adalah...'), 'A', 'Semua siswa tidak rajin'),
((SELECT id FROM questions WHERE question_text = 'Negasi dari pernyataan "Semua siswa rajin" adalah...'), 'B', 'Tidak ada siswa yang rajin'),
((SELECT id FROM questions WHERE question_text = 'Negasi dari pernyataan "Semua siswa rajin" adalah...'), 'C', 'Ada siswa yang tidak rajin'),
((SELECT id FROM questions WHERE question_text = 'Negasi dari pernyataan "Semua siswa rajin" adalah...'), 'D', 'Sebagian siswa rajin'),
((SELECT id FROM questions WHERE question_text = 'Negasi dari pernyataan "Semua siswa rajin" adalah...'), 'E', 'Beberapa siswa rajin'),

-- Logika Question 3 options
((SELECT id FROM questions WHERE question_text = 'Jika p → q benar dan p benar, maka...'), 'A', 'q salah'),
((SELECT id FROM questions WHERE question_text = 'Jika p → q benar dan p benar, maka...'), 'B', 'q benar'),
((SELECT id FROM questions WHERE question_text = 'Jika p → q benar dan p benar, maka...'), 'C', 'p salah'),
((SELECT id FROM questions WHERE question_text = 'Jika p → q benar dan p benar, maka...'), 'D', 'Tidak dapat ditentukan'),
((SELECT id FROM questions WHERE question_text = 'Jika p → q benar dan p benar, maka...'), 'E', 'p → q salah');

-- Deret dan Barisan Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('Suku ke-5 dari barisan 3, 7, 11, 15, ... adalah...', 'TIU', 'C', 'Barisan aritmatika dengan a = 3 dan b = 4. Suku ke-5 = a + (n-1)b = 3 + (5-1)4 = 3 + 16 = 19.', 2),
('Jumlah 5 suku pertama dari deret 2 + 6 + 18 + 54 + ... adalah...', 'TIU', 'D', 'Deret geometri dengan a = 2 dan r = 3. S₅ = a(rⁿ-1)/(r-1) = 2(3⁵-1)/(3-1) = 2(243-1)/2 = 242.', 3),
('Suku yang hilang dari barisan 1, 1, 2, 3, 5, 8, ... adalah...', 'TIU', 'B', 'Barisan Fibonacci dimana setiap suku adalah jumlah dua suku sebelumnya. Suku berikutnya: 5 + 8 = 13.', 2);

-- Insert options for Deret questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- Deret Question 1 options
((SELECT id FROM questions WHERE question_text = 'Suku ke-5 dari barisan 3, 7, 11, 15, ... adalah...'), 'A', '17'),
((SELECT id FROM questions WHERE question_text = 'Suku ke-5 dari barisan 3, 7, 11, 15, ... adalah...'), 'B', '18'),
((SELECT id FROM questions WHERE question_text = 'Suku ke-5 dari barisan 3, 7, 11, 15, ... adalah...'), 'C', '19'),
((SELECT id FROM questions WHERE question_text = 'Suku ke-5 dari barisan 3, 7, 11, 15, ... adalah...'), 'D', '20'),
((SELECT id FROM questions WHERE question_text = 'Suku ke-5 dari barisan 3, 7, 11, 15, ... adalah...'), 'E', '21'),

-- Deret Question 2 options
((SELECT id FROM questions WHERE question_text = 'Jumlah 5 suku pertama dari deret 2 + 6 + 18 + 54 + ... adalah...'), 'A', '240'),
((SELECT id FROM questions WHERE question_text = 'Jumlah 5 suku pertama dari deret 2 + 6 + 18 + 54 + ... adalah...'), 'B', '241'),
((SELECT id FROM questions WHERE question_text = 'Jumlah 5 suku pertama dari deret 2 + 6 + 18 + 54 + ... adalah...'), 'C', '243'),
((SELECT id FROM questions WHERE question_text = 'Jumlah 5 suku pertama dari deret 2 + 6 + 18 + 54 + ... adalah...'), 'D', '242'),
((SELECT id FROM questions WHERE question_text = 'Jumlah 5 suku pertama dari deret 2 + 6 + 18 + 54 + ... adalah...'), 'E', '244'),

-- Deret Question 3 options
((SELECT id FROM questions WHERE question_text = 'Suku yang hilang dari barisan 1, 1, 2, 3, 5, 8, ... adalah...'), 'A', '11'),
((SELECT id FROM questions WHERE question_text = 'Suku yang hilang dari barisan 1, 1, 2, 3, 5, 8, ... adalah...'), 'B', '13'),
((SELECT id FROM questions WHERE question_text = 'Suku yang hilang dari barisan 1, 1, 2, 3, 5, 8, ... adalah...'), 'C', '12'),
((SELECT id FROM questions WHERE question_text = 'Suku yang hilang dari barisan 1, 1, 2, 3, 5, 8, ... adalah...'), 'D', '14'),
((SELECT id FROM questions WHERE question_text = 'Suku yang hilang dari barisan 1, 1, 2, 3, 5, 8, ... adalah...'), 'E', '15');

-- Analisis Verbal Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('Sinonim dari kata "GIGIH" adalah...', 'TIU', 'B', 'Gigih memiliki makna yang sama dengan tekun, yaitu rajin dan tidak mudah menyerah dalam melakukan sesuatu.', 1),
('DOKTER : RUMAH SAKIT = PILOT : ...', 'TIU', 'C', 'Hubungan analogi profesi dengan tempat kerja. Dokter bekerja di rumah sakit, pilot bekerja di pesawat/bandara.', 2),
('Antonim dari kata "OPTIMIS" adalah...', 'TIU', 'A', 'Optimis berarti berpandangan positif, antonimnya adalah pesimis yang berarti berpandangan negatif.', 1);

-- Insert options for Verbal questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- Verbal Question 1 options
((SELECT id FROM questions WHERE question_text = 'Sinonim dari kata "GIGIH" adalah...'), 'A', 'Malas'),
((SELECT id FROM questions WHERE question_text = 'Sinonim dari kata "GIGIH" adalah...'), 'B', 'Tekun'),
((SELECT id FROM questions WHERE question_text = 'Sinonim dari kata "GIGIH" adalah...'), 'C', 'Lemah'),
((SELECT id FROM questions WHERE question_text = 'Sinonim dari kata "GIGIH" adalah...'), 'D', 'Cepat'),
((SELECT id FROM questions WHERE question_text = 'Sinonim dari kata "GIGIH" adalah...'), 'E', 'Lambat'),

-- Verbal Question 2 options
((SELECT id FROM questions WHERE question_text = 'DOKTER : RUMAH SAKIT = PILOT : ...'), 'A', 'Mobil'),
((SELECT id FROM questions WHERE question_text = 'DOKTER : RUMAH SAKIT = PILOT : ...'), 'B', 'Kapal'),
((SELECT id FROM questions WHERE question_text = 'DOKTER : RUMAH SAKIT = PILOT : ...'), 'C', 'Pesawat'),
((SELECT id FROM questions WHERE question_text = 'DOKTER : RUMAH SAKIT = PILOT : ...'), 'D', 'Kereta'),
((SELECT id FROM questions WHERE question_text = 'DOKTER : RUMAH SAKIT = PILOT : ...'), 'E', 'Bus'),

-- Verbal Question 3 options
((SELECT id FROM questions WHERE question_text = 'Antonim dari kata "OPTIMIS" adalah...'), 'A', 'Pesimis'),
((SELECT id FROM questions WHERE question_text = 'Antonim dari kata "OPTIMIS" adalah...'), 'B', 'Realis'),
((SELECT id FROM questions WHERE question_text = 'Antonim dari kata "OPTIMIS" adalah...'), 'C', 'Idealis'),
((SELECT id FROM questions WHERE question_text = 'Antonim dari kata "OPTIMIS" adalah...'), 'D', 'Praktis'),
((SELECT id FROM questions WHERE question_text = 'Antonim dari kata "OPTIMIS" adalah...'), 'E', 'Logis');

COMMIT;
