-- Insert User Progress Data

-- Student001 progress
INSERT INTO user_progress (user_id, module_id, completion_percentage, is_completed, started_at, completed_at, last_accessed) VALUES
((SELECT id FROM users WHERE username = 'student001'), (SELECT id FROM learning_modules WHERE title = 'Pancasila sebagai Dasar Negara'), 100.00, true, '2024-01-10 08:00:00', '2024-01-12 10:00:00', '2024-01-12 10:00:00'),
((SELECT id FROM users WHERE username = 'student001'), (SELECT id FROM learning_modules WHERE title = 'UUD 1945 dan Amandemennya'), 100.00, true, '2024-01-12 11:00:00', '2024-01-14 15:00:00', '2024-01-14 15:00:00'),
((SELECT id FROM users WHERE username = 'student001'), (SELECT id FROM learning_modules WHERE title = 'Sejarah Perjuangan Bangsa Indonesia'), 75.50, false, '2024-01-14 16:00:00', NULL, '2024-01-21 09:00:00'),
((SELECT id FROM users WHERE username = 'student001'), (SELECT id FROM learning_modules WHERE title = 'Logika Matematika Dasar'), 100.00, true, '2024-01-15 09:00:00', '2024-01-16 08:00:00', '2024-01-16 08:00:00'),
((SELECT id FROM users WHERE username = 'student001'), (SELECT id FROM learning_modules WHERE title = 'Deret dan Barisan Angka'), 60.25, false, '2024-01-16 09:00:00', NULL, '2024-01-20 14:00:00'),

-- Student002 progress
((SELECT id FROM users WHERE username = 'student002'), (SELECT id FROM learning_modules WHERE title = 'Pancasila sebagai Dasar Negara'), 100.00, true, '2024-01-11 09:00:00', '2024-01-13 11:00:00', '2024-01-13 11:00:00'),
((SELECT id FROM users WHERE username = 'student002'), (SELECT id FROM learning_modules WHERE title = 'Bhinneka Tunggal Ika'), 45.75, false, '2024-01-13 12:00:00', NULL, '2024-01-19 16:00:00'),
((SELECT id FROM users WHERE username = 'student002'), (SELECT id FROM learning_modules WHERE title = 'Integritas dan Kejujuran'), 100.00, true, '2024-01-16 10:00:00', '2024-01-17 14:00:00', '2024-01-17 14:00:00'),
((SELECT id FROM users WHERE username = 'student002'), (SELECT id FROM learning_modules WHERE title = 'Semangat Berprestasi'), 80.50, false, '2024-01-17 15:00:00', NULL, '2024-01-21 10:00:00'),

-- Student003 progress
((SELECT id FROM users WHERE username = 'student003'), (SELECT id FROM learning_modules WHERE title = 'NKRI dan Wawasan Nusantara'), 30.25, false, '2024-01-12 14:00:00', NULL, '2024-01-18 13:00:00'),
((SELECT id FROM users WHERE username = 'student003'), (SELECT id FROM learning_modules WHERE title = 'Analisis Verbal'), 100.00, true, '2024-01-15 11:00:00', '2024-01-16 13:00:00', '2024-01-16 13:00:00'),
((SELECT id FROM users WHERE username = 'student003'), (SELECT id FROM learning_modules WHERE title = 'Penalaran Numerik'), 65.75, false, '2024-01-16 14:00:00', NULL, '2024-01-20 11:00:00'),
((SELECT id FROM users WHERE username = 'student003'), (SELECT id FROM learning_modules WHERE title = 'Kreativitas dan Inovasi'), 100.00, true, '2024-01-18 09:00:00', '2024-01-19 16:00:00', '2024-01-19 16:00:00'),

-- Student004 progress
((SELECT id FROM users WHERE username = 'student004'), (SELECT id FROM learning_modules WHERE title = 'UUD 1945 dan Amandemennya'), 100.00, true, '2024-01-13 08:00:00', '2024-01-15 12:00:00', '2024-01-15 12:00:00'),
((SELECT id FROM users WHERE username = 'student004'), (SELECT id FROM learning_modules WHERE title = 'Sejarah Perjuangan Bangsa Indonesia'), 100.00, true, '2024-01-15 13:00:00', '2024-01-16 17:00:00', '2024-01-16 17:00:00'),
((SELECT id FROM users WHERE username = 'student004'), (SELECT id FROM learning_modules WHERE title = 'Penalaran Logis'), 90.25, false, '2024-01-17 10:00:00', NULL, '2024-01-21 15:00:00'),
((SELECT id FROM users WHERE username = 'student004'), (SELECT id FROM learning_modules WHERE title = 'Orientasi Pelayanan'), 55.50, false, '2024-01-19 11:00:00', NULL, '2024-01-22 08:00:00'),

-- Student005 progress
((SELECT id FROM users WHERE username = 'student005'), (SELECT id FROM learning_modules WHERE title = 'Logika Matematika Dasar'), 100.00, true, '2024-01-14 13:00:00', '2024-01-16 09:00:00', '2024-01-16 09:00:00'),
((SELECT id FROM users WHERE username = 'student005'), (SELECT id FROM learning_modules WHERE title = 'Deret dan Barisan Angka'), 100.00, true, '2024-01-16 10:00:00', '2024-01-17 15:00:00', '2024-01-17 15:00:00'),
((SELECT id FROM users WHERE username = 'student005'), (SELECT id FROM learning_modules WHERE title = 'Analisis Verbal'), 70.75, false, '2024-01-17 16:00:00', NULL, '2024-01-20 12:00:00'),
((SELECT id FROM users WHERE username = 'student005'), (SELECT id FROM learning_modules WHERE title = 'Kemampuan Bekerja dalam Tim'), 25.25, false, '2024-01-20 13:00:00', NULL, '2024-01-21 16:00:00');

COMMIT;
