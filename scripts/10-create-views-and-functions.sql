-- Create useful views and functions for the application

-- View for user statistics
CREATE OR REPLACE VIEW user_statistics AS
SELECT 
    u.id,
    u.username,
    u.full_name,
    u.role,
    COUNT(DISTINCT ts.id) as total_tests,
    AVG(ts.score) as average_score,
    COUNT(DISTINCT up.id) as modules_started,
    COUNT(CASE WHEN up.is_completed = true THEN 1 END) as modules_completed,
    u.last_login,
    u.created_at
FROM users u
LEFT JOIN test_sessions ts ON u.id = ts.user_id AND ts.status = 'COMPLETED'
LEFT JOIN user_progress up ON u.id = up.user_id
WHERE u.role = 'STUDENT'
GROUP BY u.id, u.username, u.full_name, u.role, u.last_login, u.created_at;

-- View for test performance by type
CREATE OR REPLACE VIEW test_performance_by_type AS
SELECT 
    test_type,
    COUNT(*) as total_attempts,
    AVG(score) as average_score,
    MIN(score) as min_score,
    MAX(score) as max_score,
    AVG(duration_minutes) as average_duration
FROM test_sessions 
WHERE status = 'COMPLETED'
GROUP BY test_type;

-- View for learning progress summary
CREATE OR REPLACE VIEW learning_progress_summary AS
SELECT 
    lm.type as module_type,
    lm.title as module_title,
    COUNT(up.id) as students_enrolled,
    COUNT(CASE WHEN up.is_completed = true THEN 1 END) as students_completed,
    AVG(up.completion_percentage) as average_progress
FROM learning_modules lm
LEFT JOIN user_progress up ON lm.id = up.module_id
WHERE lm.active = true
GROUP BY lm.id, lm.type, lm.title, lm.order_index
ORDER BY lm.type, lm.order_index;

-- View for chat activity
CREATE OR REPLACE VIEW chat_activity AS
SELECT 
    DATE(created_at) as chat_date,
    COUNT(*) as total_messages,
    COUNT(DISTINCT sender_id) as active_users,
    COUNT(CASE WHEN room_id IS NOT NULL THEN 1 END) as group_messages,
    COUNT(CASE WHEN room_id IS NULL THEN 1 END) as private_messages
FROM chat_messages
GROUP BY DATE(created_at)
ORDER BY chat_date DESC;

-- Function to calculate user's overall progress
CREATE OR REPLACE FUNCTION calculate_user_overall_progress(user_id_param BIGINT)
RETURNS DECIMAL(5,2) AS $$
DECLARE
    overall_progress DECIMAL(5,2);
BEGIN
    SELECT AVG(completion_percentage) INTO overall_progress
    FROM user_progress 
    WHERE user_id = user_id_param;
    
    RETURN COALESCE(overall_progress, 0.00);
END;
$$ LANGUAGE plpgsql;

-- Function to get user's best score by test type
CREATE OR REPLACE FUNCTION get_user_best_score(user_id_param BIGINT, test_type_param VARCHAR(10))
RETURNS INTEGER AS $$
DECLARE
    best_score INTEGER;
BEGIN
    SELECT MAX(score) INTO best_score
    FROM test_sessions 
    WHERE user_id = user_id_param 
    AND test_type = test_type_param 
    AND status = 'COMPLETED';
    
    RETURN COALESCE(best_score, 0);
END;
$$ LANGUAGE plpgsql;

-- Function to get unread message count for user
CREATE OR REPLACE FUNCTION get_unread_message_count(user_id_param BIGINT)
RETURNS INTEGER AS $$
DECLARE
    unread_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO unread_count
    FROM chat_messages 
    WHERE receiver_id = user_id_param 
    AND is_read = false;
    
    RETURN COALESCE(unread_count, 0);
END;
$$ LANGUAGE plpgsql;

-- Create indexes for better performance on views
CREATE INDEX IF NOT EXISTS idx_test_sessions_completed ON test_sessions(status) WHERE status = 'COMPLETED';
CREATE INDEX IF NOT EXISTS idx_user_progress_completed ON user_progress(is_completed) WHERE is_completed = true;
CREATE INDEX IF NOT EXISTS idx_chat_messages_date ON chat_messages(DATE(created_at));
CREATE INDEX IF NOT EXISTS idx_chat_messages_unread ON chat_messages(receiver_id, is_read) WHERE is_read = false;

COMMIT;
