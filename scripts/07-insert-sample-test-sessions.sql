-- Insert Sample Test Sessions and Results

-- Insert test sessions for students
INSERT INTO test_sessions (user_id, test_type, start_time, end_time, duration_minutes, score, total_questions, correct_answers, status) VALUES
-- Student001 test sessions
((SELECT id FROM users WHERE username = 'student001'), 'TWK', '2024-01-15 09:00:00', '2024-01-15 10:30:00', 90, 85, 20, 17, 'COMPLETED'),
((SELECT id FROM users WHERE username = 'student001'), 'TIU', '2024-01-16 10:00:00', '2024-01-16 12:00:00', 120, 78, 25, 19, 'COMPLETED'),
((SELECT id FROM users WHERE username = 'student001'), 'TKP', '2024-01-17 14:00:00', '2024-01-17 15:00:00', 60, 92, 15, 14, 'COMPLETED'),

-- Student002 test sessions
((SELECT id FROM users WHERE username = 'student002'), 'TWK', '2024-01-15 13:00:00', '2024-01-15 14:30:00', 90, 72, 20, 14, 'COMPLETED'),
((SELECT id FROM users WHERE username = 'student002'), 'TIU', '2024-01-18 09:00:00', '2024-01-18 11:00:00', 120, 68, 25, 17, 'COMPLETED'),
((SELECT id FROM users WHERE username = 'student002'), 'MIXED', '2024-01-20 10:00:00', '2024-01-20 13:00:00', 180, 75, 30, 22, 'COMPLETED'),

-- Student003 test sessions
((SELECT id FROM users WHERE username = 'student003'), 'TKP', '2024-01-16 15:00:00', '2024-01-16 16:00:00', 60, 88, 15, 13, 'COMPLETED'),
((SELECT id FROM users WHERE username = 'student003'), 'TWK', '2024-01-19 11:00:00', '2024-01-19 12:30:00', 90, 80, 20, 16, 'COMPLETED'),
((SELECT id FROM users WHERE username = 'student003'), 'TIU', '2024-01-21 14:00:00', NULL, NULL, NULL, 25, NULL, 'IN_PROGRESS'),

-- Student004 test sessions
((SELECT id FROM users WHERE username = 'student004'), 'MIXED', '2024-01-17 08:00:00', '2024-01-17 11:00:00', 180, 82, 30, 25, 'COMPLETED'),
((SELECT id FROM users WHERE username = 'student004'), 'TWK', '2024-01-22 09:00:00', '2024-01-22 10:30:00', 90, 90, 20, 18, 'COMPLETED'),

-- Student005 test sessions
((SELECT id FROM users WHERE username = 'student005'), 'TIU', '2024-01-18 13:00:00', '2024-01-18 15:00:00', 120, 65, 25, 16, 'COMPLETED'),
((SELECT id FROM users WHERE username = 'student005'), 'TKP', '2024-01-20 16:00:00', '2024-01-20 17:00:00', 60, 85, 15, 13, 'COMPLETED');

COMMIT;
