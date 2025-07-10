-- Insert TWK (Tes Wawasan Kebangsaan) Questions

-- Pancasila Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('Sila pertama Pancasila adalah...', 'TWK', 'A', 'Sila pertama Pancasila adalah "Ketuhanan Yang Maha Esa" yang menekankan pengakuan terhadap Tuhan Yang Maha Esa dan kebebasan beragama.', 1),
('Pancasila sebagai dasar negara Indonesia disahkan pada tanggal...', 'TWK', 'C', 'Pancasila disahkan sebagai dasar negara pada tanggal 18 Agustus 1945, sehari setelah proklamasi kemerdekaan Indonesia.', 2),
('Nilai-nilai Pancasila yang tercermin dalam kehidupan sehari-hari adalah...', 'TWK', 'D', 'Semua nilai Pancasila harus tercermin dalam kehidupan sehari-hari sebagai warga negara Indonesia yang baik.', 3);

-- Insert options for Pancasila questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- Question 1 options
((SELECT id FROM questions WHERE question_text = 'Sila pertama Pancasila adalah...'), 'A', 'Ketuhanan Yang Maha Esa'),
((SELECT id FROM questions WHERE question_text = 'Sila pertama Pancasila adalah...'), 'B', 'Kemanusiaan yang Adil dan Beradab'),
((SELECT id FROM questions WHERE question_text = 'Sila pertama Pancasila adalah...'), 'C', 'Persatuan Indonesia'),
((SELECT id FROM questions WHERE question_text = 'Sila pertama Pancasila adalah...'), 'D', 'Kerakyatan yang Dipimpin oleh Hikmat Kebijaksanaan'),
((SELECT id FROM questions WHERE question_text = 'Sila pertama Pancasila adalah...'), 'E', 'Keadilan Sosial bagi Seluruh Rakyat Indonesia'),

-- Question 2 options
((SELECT id FROM questions WHERE question_text = 'Pancasila sebagai dasar negara Indonesia disahkan pada tanggal...'), 'A', '17 Agustus 1945'),
((SELECT id FROM questions WHERE question_text = 'Pancasila sebagai dasar negara Indonesia disahkan pada tanggal...'), 'B', '1 Juni 1945'),
((SELECT id FROM questions WHERE question_text = 'Pancasila sebagai dasar negara Indonesia disahkan pada tanggal...'), 'C', '18 Agustus 1945'),
((SELECT id FROM questions WHERE question_text = 'Pancasila sebagai dasar negara Indonesia disahkan pada tanggal...'), 'D', '22 Juni 1945'),
((SELECT id FROM questions WHERE question_text = 'Pancasila sebagai dasar negara Indonesia disahkan pada tanggal...'), 'E', '29 Mei 1945'),

-- Question 3 options
((SELECT id FROM questions WHERE question_text = 'Nilai-nilai Pancasila yang tercermin dalam kehidupan sehari-hari adalah...'), 'A', 'Hanya sila pertama'),
((SELECT id FROM questions WHERE question_text = 'Nilai-nilai Pancasila yang tercermin dalam kehidupan sehari-hari adalah...'), 'B', 'Sila pertama dan kedua saja'),
((SELECT id FROM questions WHERE question_text = 'Nilai-nilai Pancasila yang tercermin dalam kehidupan sehari-hari adalah...'), 'C', 'Sila ketiga, keempat, dan kelima'),
((SELECT id FROM questions WHERE question_text = 'Nilai-nilai Pancasila yang tercermin dalam kehidupan sehari-hari adalah...'), 'D', 'Semua sila Pancasila'),
((SELECT id FROM questions WHERE question_text = 'Nilai-nilai Pancasila yang tercermin dalam kehidupan sehari-hari adalah...'), 'E', 'Tidak ada yang benar');

-- UUD 1945 Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('UUD 1945 telah mengalami amandemen sebanyak...', 'TWK', 'D', 'UUD 1945 telah mengalami 4 kali amandemen, yaitu pada tahun 1999, 2000, 2001, dan 2002.', 2),
('Lembaga negara yang berwenang mengubah UUD 1945 adalah...', 'TWK', 'B', 'MPR (Majelis Permusyawaratan Rakyat) adalah lembaga yang berwenang mengubah dan menetapkan UUD 1945.', 3),
('Pasal dalam UUD 1945 yang mengatur tentang HAM adalah...', 'TWK', 'C', 'Pasal 28A sampai 28J UUD 1945 mengatur tentang Hak Asasi Manusia yang ditambahkan melalui amandemen kedua.', 4);

-- Insert options for UUD 1945 questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- UUD 1945 Question 1 options
((SELECT id FROM questions WHERE question_text = 'UUD 1945 telah mengalami amandemen sebanyak...'), 'A', '2 kali'),
((SELECT id FROM questions WHERE question_text = 'UUD 1945 telah mengalami amandemen sebanyak...'), 'B', '3 kali'),
((SELECT id FROM questions WHERE question_text = 'UUD 1945 telah mengalami amandemen sebanyak...'), 'C', '5 kali'),
((SELECT id FROM questions WHERE question_text = 'UUD 1945 telah mengalami amandemen sebanyak...'), 'D', '4 kali'),
((SELECT id FROM questions WHERE question_text = 'UUD 1945 telah mengalami amandemen sebanyak...'), 'E', '6 kali'),

-- UUD 1945 Question 2 options
((SELECT id FROM questions WHERE question_text = 'Lembaga negara yang berwenang mengubah UUD 1945 adalah...'), 'A', 'DPR'),
((SELECT id FROM questions WHERE question_text = 'Lembaga negara yang berwenang mengubah UUD 1945 adalah...'), 'B', 'MPR'),
((SELECT id FROM questions WHERE question_text = 'Lembaga negara yang berwenang mengubah UUD 1945 adalah...'), 'C', 'DPD'),
((SELECT id FROM questions WHERE question_text = 'Lembaga negara yang berwenang mengubah UUD 1945 adalah...'), 'D', 'Presiden'),
((SELECT id FROM questions WHERE question_text = 'Lembaga negara yang berwenang mengubah UUD 1945 adalah...'), 'E', 'MA'),

-- UUD 1945 Question 3 options
((SELECT id FROM questions WHERE question_text = 'Pasal dalam UUD 1945 yang mengatur tentang HAM adalah...'), 'A', 'Pasal 27-34'),
((SELECT id FROM questions WHERE question_text = 'Pasal dalam UUD 1945 yang mengatur tentang HAM adalah...'), 'B', 'Pasal 1-7'),
((SELECT id FROM questions WHERE question_text = 'Pasal dalam UUD 1945 yang mengatur tentang HAM adalah...'), 'C', 'Pasal 28A-28J'),
((SELECT id FROM questions WHERE question_text = 'Pasal dalam UUD 1945 yang mengatur tentang HAM adalah...'), 'D', 'Pasal 18-25'),
((SELECT id FROM questions WHERE question_text = 'Pasal dalam UUD 1945 yang mengatur tentang HAM adalah...'), 'E', 'Pasal 8-16');

-- Sejarah Indonesia Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('Proklamasi kemerdekaan Indonesia dibacakan oleh...', 'TWK', 'A', 'Proklamasi kemerdekaan Indonesia dibacakan oleh Ir. Soekarno atas nama bangsa Indonesia pada tanggal 17 Agustus 1945.', 1),
('Organisasi pergerakan nasional pertama di Indonesia adalah...', 'TWK', 'B', 'Budi Utomo yang didirikan pada 20 Mei 1908 adalah organisasi pergerakan nasional pertama di Indonesia.', 2),
('Peristiwa Rengasdengklok terjadi pada tanggal...', 'TWK', 'C', 'Peristiwa Rengasdengklok terjadi pada tanggal 16 Agustus 1945, sehari sebelum proklamasi kemerdekaan.', 3);

-- Insert options for Sejarah questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- Sejarah Question 1 options
((SELECT id FROM questions WHERE question_text = 'Proklamasi kemerdekaan Indonesia dibacakan oleh...'), 'A', 'Ir. Soekarno'),
((SELECT id FROM questions WHERE question_text = 'Proklamasi kemerdekaan Indonesia dibacakan oleh...'), 'B', 'Drs. Mohammad Hatta'),
((SELECT id FROM questions WHERE question_text = 'Proklamasi kemerdekaan Indonesia dibacakan oleh...'), 'C', 'Ahmad Soebardjo'),
((SELECT id FROM questions WHERE question_text = 'Proklamasi kemerdekaan Indonesia dibacakan oleh...'), 'D', 'Soekarni'),
((SELECT id FROM questions WHERE question_text = 'Proklamasi kemerdekaan Indonesia dibacakan oleh...'), 'E', 'Chaerul Saleh'),

-- Sejarah Question 2 options
((SELECT id FROM questions WHERE question_text = 'Organisasi pergerakan nasional pertama di Indonesia adalah...'), 'A', 'Sarekat Islam'),
((SELECT id FROM questions WHERE question_text = 'Organisasi pergerakan nasional pertama di Indonesia adalah...'), 'B', 'Budi Utomo'),
((SELECT id FROM questions WHERE question_text = 'Organisasi pergerakan nasional pertama di Indonesia adalah...'), 'C', 'Indische Partij'),
((SELECT id FROM questions WHERE question_text = 'Organisasi pergerakan nasional pertama di Indonesia adalah...'), 'D', 'PNI'),
((SELECT id FROM questions WHERE question_text = 'Organisasi pergerakan nasional pertama di Indonesia adalah...'), 'E', 'Perhimpunan Indonesia'),

-- Sejarah Question 3 options
((SELECT id FROM questions WHERE question_text = 'Peristiwa Rengasdengklok terjadi pada tanggal...'), 'A', '15 Agustus 1945'),
((SELECT id FROM questions WHERE question_text = 'Peristiwa Rengasdengklok terjadi pada tanggal...'), 'B', '17 Agustus 1945'),
((SELECT id FROM questions WHERE question_text = 'Peristiwa Rengasdengklok terjadi pada tanggal...'), 'C', '16 Agustus 1945'),
((SELECT id FROM questions WHERE question_text = 'Peristiwa Rengasdengklok terjadi pada tanggal...'), 'D', '14 Agustus 1945'),
((SELECT id FROM questions WHERE question_text = 'Peristiwa Rengasdengklok terjadi pada tanggal...'), 'E', '18 Agustus 1945');

COMMIT;
