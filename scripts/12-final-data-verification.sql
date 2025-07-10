-- Final verification and summary of inserted data

-- Count all records in each table
SELECT 'users' as table_name, COUNT(*) as record_count FROM users
UNION ALL
SELECT 'learning_modules', COUNT(*) FROM learning_modules
UNION ALL
SELECT 'questions', COUNT(*) FROM questions
UNION ALL
SELECT 'question_options', COUNT(*) FROM question_options
UNION ALL
SELECT 'test_sessions', COUNT(*) FROM test_sessions
UNION ALL
SELECT 'test_answers', COUNT(*) FROM test_answers
UNION ALL
SELECT 'user_progress', COUNT(*) FROM user_progress
UNION ALL
SELECT 'chat_messages', COUNT(*) FROM chat_messages
ORDER BY table_name;

-- Summary by user role
SELECT 
    role,
    COUNT(*) as user_count,
    COUNT(CASE WHEN active = true THEN 1 END) as active_users
FROM users 
GROUP BY role
ORDER BY role;

-- Summary by module type
SELECT 
    type,
    COUNT(*) as module_count,
    COUNT(CASE WHEN active = true THEN 1 END) as active_modules
FROM learning_modules 
GROUP BY type
ORDER BY type;

-- Summary by question type
SELECT 
    type,
    COUNT(*) as question_count,
    COUNT(CASE WHEN active = true THEN 1 END) as active_questions
FROM questions 
GROUP BY type
ORDER BY type;

-- Test session summary
SELECT 
    test_type,
    status,
    COUNT(*) as session_count,
    AVG(score) as avg_score
FROM test_sessions 
GROUP BY test_type, status
ORDER BY test_type, status;

-- User progress summary
SELECT 
    COUNT(*) as total_progress_records,
    COUNT(CASE WHEN is_completed = true THEN 1 END) as completed_modules,
    AVG(completion_percentage) as avg_completion_percentage
FROM user_progress;

-- Chat message summary
SELECT 
    type,
    COUNT(*) as message_count,
    COUNT(CASE WHEN is_read = true THEN 1 END) as read_messages
FROM chat_messages 
GROUP BY type
ORDER BY type;

-- Display sample login credentials
SELECT 
    'LOGIN CREDENTIALS' as info,
    'Username: admin, Password: password123' as admin_login
UNION ALL
SELECT 
    'TUTOR LOGIN',
    'Username: tutor_twk, Password: password123'
UNION ALL
SELECT 
    'STUDENT LOGIN',
    'Username: student001, Password: password123';

COMMIT;

-- Display success message
SELECT 'DATABASE SETUP COMPLETED SUCCESSFULLY!' as status,
       'All tables created and populated with sample data' as message,
       'Ready for application testing' as next_step;
