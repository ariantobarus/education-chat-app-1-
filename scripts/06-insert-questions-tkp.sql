-- Insert TKP (Tes Karakteristik Pribadi) Questions

-- Integritas Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('Ketika Anda menemukan kesalahan dalam laporan yang sudah diserahkan kepada atasan, padahal tidak ada yang mengetahui kesalahan tersebut, maka Anda akan...', 'TKP', 'A', 'Pilihan A menunjukkan integritas tinggi dengan segera melaporkan dan memperbaiki kesalahan meskipun tidak ada yang mengetahui. Ini menunjukkan kejujuran dan tanggung jawab.', 3),
('Seorang rekan kerja meminta Anda untuk tidak melaporkan kesalahannya kepada atasan dengan imbalan tertentu. Sikap Anda adalah...', 'TKP', 'A', 'Menolak dan tetap melaporkan kesalahan menunjukkan integritas dan komitmen terhadap aturan serta kebenaran, tanpa terpengaruh imbalan.', 4),
('Dalam mengerjakan tugas, Anda selalu...', 'TKP', 'A', 'Mengerjakan dengan sebaik-baiknya sesuai standar yang ditetapkan menunjukkan komitmen terhadap kualitas dan profesionalisme.', 2);

-- Insert options for Integritas questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- Integritas Question 1 options
((SELECT id FROM questions WHERE question_text LIKE 'Ketika Anda menemukan kesalahan dalam laporan%'), 'A', 'Segera melaporkan kepada atasan dan memperbaiki kesalahan tersebut'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika Anda menemukan kesalahan dalam laporan%'), 'B', 'Membiarkan saja karena tidak ada yang tahu'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika Anda menemukan kesalahan dalam laporan%'), 'C', 'Memperbaiki diam-diam tanpa memberitahu siapa pun'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika Anda menemukan kesalahan dalam laporan%'), 'D', 'Menunggu sampai ada yang mengetahui baru melaporkan'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika Anda menemukan kesalahan dalam laporan%'), 'E', 'Menyalahkan orang lain atas kesalahan tersebut'),

-- Integritas Question 2 options
((SELECT id FROM questions WHERE question_text LIKE 'Seorang rekan kerja meminta Anda untuk tidak melaporkan%'), 'A', 'Menolak dan tetap melaporkan kesalahan tersebut'),
((SELECT id FROM questions WHERE question_text LIKE 'Seorang rekan kerja meminta Anda untuk tidak melaporkan%'), 'B', 'Menerima imbalan dan tidak melaporkan'),
((SELECT id FROM questions WHERE question_text LIKE 'Seorang rekan kerja meminta Anda untuk tidak melaporkan%'), 'C', 'Meminta imbalan yang lebih besar'),
((SELECT id FROM questions WHERE question_text LIKE 'Seorang rekan kerja meminta Anda untuk tidak melaporkan%'), 'D', 'Melaporkan kepada rekan kerja lain'),
((SELECT id FROM questions WHERE question_text LIKE 'Seorang rekan kerja meminta Anda untuk tidak melaporkan%'), 'E', 'Diam saja dan tidak melakukan apa-apa'),

-- Integritas Question 3 options
((SELECT id FROM questions WHERE question_text = 'Dalam mengerjakan tugas, Anda selalu...'), 'A', 'Mengerjakan dengan sebaik-baiknya sesuai standar yang ditetapkan'),
((SELECT id FROM questions WHERE question_text = 'Dalam mengerjakan tugas, Anda selalu...'), 'B', 'Mengerjakan asal selesai'),
((SELECT id FROM questions WHERE question_text = 'Dalam mengerjakan tugas, Anda selalu...'), 'C', 'Mengerjakan seadanya saja'),
((SELECT id FROM questions WHERE question_text = 'Dalam mengerjakan tugas, Anda selalu...'), 'D', 'Menunda-nunda pekerjaan'),
((SELECT id FROM questions WHERE question_text = 'Dalam mengerjakan tugas, Anda selalu...'), 'E', 'Menyerahkan kepada orang lain');

-- Semangat Berprestasi Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('Ketika target pekerjaan Anda sudah tercapai sebelum deadline, maka Anda akan...', 'TKP', 'A', 'Mencari cara untuk meningkatkan kualitas hasil atau mengerjakan tugas tambahan menunjukkan semangat berprestasi dan tidak mudah puas dengan pencapaian minimal.', 3),
('Dalam menghadapi tugas yang sulit, sikap Anda adalah...', 'TKP', 'A', 'Mempelajari dan mencari solusi dengan berbagai cara menunjukkan semangat berprestasi dan tidak mudah menyerah dalam menghadapi tantangan.', 2),
('Ketika hasil kerja Anda mendapat pujian dari atasan, Anda akan...', 'TKP', 'B', 'Bersyukur dan berusaha mempertahankan serta meningkatkan kualitas kerja menunjukkan sikap yang tepat dalam menerima apresiasi sambil tetap termotivasi untuk berkembang.', 2);

-- Insert options for Semangat Berprestasi questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- Berprestasi Question 1 options
((SELECT id FROM questions WHERE question_text LIKE 'Ketika target pekerjaan Anda sudah tercapai%'), 'A', 'Mencari cara untuk meningkatkan kualitas hasil atau mengerjakan tugas tambahan'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika target pekerjaan Anda sudah tercapai%'), 'B', 'Bersantai karena target sudah tercapai'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika target pekerjaan Anda sudah tercapai%'), 'C', 'Menunggu tugas baru dari atasan'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika target pekerjaan Anda sudah tercapai%'), 'D', 'Membantu rekan kerja yang belum selesai'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika target pekerjaan Anda sudah tercapai%'), 'E', 'Pulang lebih awal'),

-- Berprestasi Question 2 options
((SELECT id FROM questions WHERE question_text = 'Dalam menghadapi tugas yang sulit, sikap Anda adalah...'), 'A', 'Mempelajari dan mencari solusi dengan berbagai cara'),
((SELECT id FROM questions WHERE question_text = 'Dalam menghadapi tugas yang sulit, sikap Anda adalah...'), 'B', 'Meminta bantuan atasan segera'),
((SELECT id FROM questions WHERE question_text = 'Dalam menghadapi tugas yang sulit, sikap Anda adalah...'), 'C', 'Menyerahkan tugas kepada rekan kerja'),
((SELECT id FROM questions WHERE question_text = 'Dalam menghadapi tugas yang sulit, sikap Anda adalah...'), 'D', 'Menunda mengerjakan tugas tersebut'),
((SELECT id FROM questions WHERE question_text = 'Dalam menghadapi tugas yang sulit, sikap Anda adalah...'), 'E', 'Mengerjakan seadanya saja'),

-- Berprestasi Question 3 options
((SELECT id FROM questions WHERE question_text LIKE 'Ketika hasil kerja Anda mendapat pujian%'), 'A', 'Merasa bangga dan berpuas diri'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika hasil kerja Anda mendapat pujian%'), 'B', 'Bersyukur dan berusaha mempertahankan serta meningkatkan kualitas kerja'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika hasil kerja Anda mendapat pujian%'), 'C', 'Biasa saja karena itu sudah kewajiban'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika hasil kerja Anda mendapat pujian%'), 'D', 'Menceritakan kepada semua orang'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika hasil kerja Anda mendapat pujian%'), 'E', 'Meminta kenaikan gaji');

-- Orientasi Pelayanan Questions
INSERT INTO questions (question_text, type, correct_answer, explanation, difficulty_level) VALUES
('Ketika seorang masyarakat datang dengan keluhan yang kompleks, Anda akan...', 'TKP', 'A', 'Mendengarkan dengan sabar dan membantu mencari solusi terbaik menunjukkan orientasi pelayanan yang tinggi dengan mengutamakan kepuasan dan kebutuhan masyarakat.', 3),
('Dalam memberikan pelayanan kepada masyarakat, hal yang paling penting adalah...', 'TKP', 'B', 'Kepuasan dan kebutuhan masyarakat yang terlayani dengan baik adalah tujuan utama pelayanan publik, bukan kepentingan pribadi atau kemudahan petugas.', 2),
('Ketika jam kerja sudah berakhir tetapi masih ada masyarakat yang membutuhkan pelayanan mendesak, Anda akan...', 'TKP', 'A', 'Tetap melayani karena ini adalah tanggung jawab sebagai pelayan masyarakat menunjukkan dedikasi dan komitmen terhadap pelayanan publik.', 4);

-- Insert options for Orientasi Pelayanan questions
INSERT INTO question_options (question_id, option_key, option_text) VALUES
-- Pelayanan Question 1 options
((SELECT id FROM questions WHERE question_text LIKE 'Ketika seorang masyarakat datang dengan keluhan%'), 'A', 'Mendengarkan dengan sabar dan membantu mencari solusi terbaik'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika seorang masyarakat datang dengan keluhan%'), 'B', 'Menyuruh datang lagi besok'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika seorang masyarakat datang dengan keluhan%'), 'C', 'Memberikan solusi standar saja'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika seorang masyarakat datang dengan keluhan%'), 'D', 'Menyerahkan kepada rekan kerja lain'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika seorang masyarakat datang dengan keluhan%'), 'E', 'Menjelaskan bahwa itu bukan wewenang Anda'),

-- Pelayanan Question 2 options
((SELECT id FROM questions WHERE question_text LIKE 'Dalam memberikan pelayanan kepada masyarakat%'), 'A', 'Kemudahan bagi petugas'),
((SELECT id FROM questions WHERE question_text LIKE 'Dalam memberikan pelayanan kepada masyarakat%'), 'B', 'Kepuasan dan kebutuhan masyarakat'),
((SELECT id FROM questions WHERE question_text LIKE 'Dalam  'Kepuasan dan kebutuhan masyarakat'),
((SELECT id FROM questions WHERE question_text LIKE 'Dalam memberikan pelayanan kepada masyarakat%'), 'C', 'Kecepatan penyelesaian'),
((SELECT id FROM questions WHERE question_text LIKE 'Dalam memberikan pelayanan kepada masyarakat%'), 'D', 'Keuntungan organisasi'),
((SELECT id FROM questions WHERE question_text LIKE 'Dalam memberikan pelayanan kepada masyarakat%'), 'E', 'Kemudahan prosedur'),

-- Pelayanan Question 3 options
((SELECT id FROM questions WHERE question_text LIKE 'Ketika jam kerja sudah berakhir tetapi masih ada%'), 'A', 'Tetap melayani karena ini adalah tanggung jawab sebagai pelayan masyarakat'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika jam kerja sudah berakhir tetapi masih ada%'), 'B', 'Menyuruh datang besok pagi'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika jam kerja sudah berakhir tetapi masih ada%'), 'C', 'Memberikan nomor antrian untuk besok'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika jam kerja sudah berakhir tetapi masih ada%'), 'D', 'Menjelaskan bahwa jam kerja sudah berakhir'),
((SELECT id FROM questions WHERE question_text LIKE 'Ketika jam kerja sudah berakhir tetapi masih ada%'), 'E', 'Menyerahkan kepada satpam');

COMMIT;
