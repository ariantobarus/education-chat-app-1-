-- Create Database Schema for Education Chat Application
-- Database: MySQL

-- Disable foreign key checks to allow dropping tables in any order
SET FOREIGN_KEY_CHECKS=0;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS `test_answers`;
DROP TABLE IF EXISTS `test_sessions`;
DROP TABLE IF EXISTS `chat_messages`;
DROP TABLE IF EXISTS `user_progress`;
DROP TABLE IF EXISTS `question_options`;
DROP TABLE IF EXISTS `questions`;
DROP TABLE IF EXISTS `learning_modules`;
DROP TABLE IF EXISTS `users`;

-- Enable foreign key checks
SET FOREIGN_KEY_CHECKS=1;

-- Create Users table
CREATE TABLE `users` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50) UNIQUE NOT NULL,
    `email` VARCHAR(100) UNIQUE NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `full_name` VARCHAR(100) NOT NULL,
    `role` VARCHAR(20) NOT NULL CHECK (`role` IN ('ADMIN', 'TUTOR', 'STUDENT')),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `last_login` TIMESTAMP NULL,
    `active` BOOLEAN DEFAULT TRUE
);

-- Create Learning Modules table
CREATE TABLE `learning_modules` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(200) NOT NULL,
    `description` TEXT,
    `type` VARCHAR(10) NOT NULL CHECK (`type` IN ('TWK', 'TIU', 'TKP')),
    `content` TEXT,
    `video_url` VARCHAR(500),
    `image_url` VARCHAR(500),
    `order_index` INTEGER DEFAULT 0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `active` BOOLEAN DEFAULT TRUE
);

-- Create Questions table
CREATE TABLE `questions` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `question_text` TEXT NOT NULL,
    `type` VARCHAR(10) NOT NULL CHECK (`type` IN ('TWK', 'TIU', 'TKP')),
    `correct_answer` VARCHAR(5) NOT NULL,
    `explanation` TEXT,
    `difficulty_level` INTEGER DEFAULT 1 CHECK (`difficulty_level` BETWEEN 1 AND 5),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `active` BOOLEAN DEFAULT TRUE
);

-- Create Question Options table
CREATE TABLE `question_options` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `question_id` BIGINT NOT NULL,
    `option_key` VARCHAR(5) NOT NULL,
    `option_text` TEXT NOT NULL,
    FOREIGN KEY (`question_id`) REFERENCES `questions`(`id`) ON DELETE CASCADE
);

-- Create Test Sessions table
CREATE TABLE `test_sessions` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `test_type` VARCHAR(10) NOT NULL CHECK (`test_type` IN ('TWK', 'TIU', 'TKP', 'MIXED')),
    `start_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `end_time` TIMESTAMP NULL,
    `duration_minutes` INTEGER,
    `score` INTEGER,
    `total_questions` INTEGER,
    `correct_answers` INTEGER,
    `status` VARCHAR(20) DEFAULT 'IN_PROGRESS' CHECK (`status` IN ('IN_PROGRESS', 'COMPLETED', 'ABANDONED')),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

-- Create Test Answers table
CREATE TABLE `test_answers` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `test_session_id` BIGINT NOT NULL,
    `question_id` BIGINT NOT NULL,
    `user_answer` VARCHAR(5),
    `is_correct` BOOLEAN DEFAULT FALSE,
    `time_spent_seconds` INTEGER DEFAULT 0,
    FOREIGN KEY (`test_session_id`) REFERENCES `test_sessions`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`question_id`) REFERENCES `questions`(`id`) ON DELETE CASCADE
);

-- Create User Progress table
CREATE TABLE `user_progress` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `module_id` BIGINT NOT NULL,
    `completion_percentage` DECIMAL(5,2) DEFAULT 0.00,
    `is_completed` BOOLEAN DEFAULT FALSE,
    `started_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `completed_at` TIMESTAMP NULL,
    `last_accessed` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(`user_id`, `module_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`module_id`) REFERENCES `learning_modules`(`id`) ON DELETE CASCADE
);

-- Create Chat Messages table
CREATE TABLE `chat_messages` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `sender_id` BIGINT,
    `receiver_id` BIGINT,
    `room_id` VARCHAR(100),
    `content` TEXT NOT NULL,
    `type` VARCHAR(20) DEFAULT 'TEXT' CHECK (`type` IN ('TEXT', 'IMAGE', 'FILE', 'SYSTEM')),
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `is_read` BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (`sender_id`) REFERENCES `users`(`id`) ON DELETE SET NULL,
    FOREIGN KEY (`receiver_id`) REFERENCES `users`(`id`) ON DELETE SET NULL
);

-- Create indexes for better performance
CREATE INDEX `idx_users_username` ON `users`(`username`);
CREATE INDEX `idx_learning_modules_type` ON `learning_modules`(`type`);
CREATE INDEX `idx_questions_type` ON `questions`(`type`);
CREATE INDEX `idx_test_sessions_user_id` ON `test_sessions`(`user_id`);
CREATE INDEX `idx_chat_messages_room_id` ON `chat_messages`(`room_id`);

-- Comments (opsional, tapi baik untuk dokumentasi)
ALTER TABLE `users` COMMENT = 'Stores user information including students, tutors, and admins';
ALTER TABLE `learning_modules` COMMENT = 'Contains learning materials for TWK, TIU, and TKP';
ALTER TABLE `questions` COMMENT = 'Question bank for tests and simulations';
ALTER TABLE `test_sessions` COMMENT = 'Records of test attempts by users';
ALTER TABLE `chat_messages` COMMENT = 'Stores chat messages between users';

COMMIT;