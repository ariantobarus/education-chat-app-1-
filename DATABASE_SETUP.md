# Database Setup Guide

## Aplikasi Chat Edukasi Online - Database Setup

### 📋 Prerequisites

1. **PostgreSQL** (recommended) atau **H2** untuk development
2. **Java 17+**
3. **Maven 3.6+**

### 🗄️ Database Schema

Database ini dirancang untuk mendukung:
- **Multi-role users** (Admin, Tutor, Student)
- **Learning modules** untuk TWK, TIU, TKP
- **Question bank** dengan multiple choice options
- **Test sessions** dengan automatic scoring
- **Real-time chat** messages
- **Progress tracking** untuk setiap user

### 📊 Database Structure

#### Core Tables:
1. **users** - User management dengan role-based access
2. **learning_modules** - Materi pembelajaran terstruktur
3. **questions** - Bank soal untuk tes
4. **question_options** - Pilihan jawaban multiple choice
5. **test_sessions** - Sesi tes dan hasil
6. **test_answers** - Jawaban individual per soal
7. **user_progress** - Progress belajar user
8. **chat_messages** - Pesan chat real-time

### 🚀 Setup Instructions

#### Option 1: PostgreSQL (Production)

1. **Install PostgreSQL**
\`\`\`bash
# Ubuntu/Debian
sudo apt-get install postgresql postgresql-contrib

# macOS
brew install postgresql

# Windows
# Download from https://www.postgresql.org/download/windows/
\`\`\`

2. **Create Database and User**
\`\`\`sql
-- Connect as postgres user
sudo -u postgres psql

-- Create database
CREATE DATABASE educhat_db;

-- Create user
CREATE USER educhat_user WITH PASSWORD 'educhat_password';

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE educhat_db TO educhat_user;

-- Exit
\q
\`\`\`

3. **Run Database Scripts**
\`\`\`bash
# Navigate to project directory
cd education-chat-app

# Run all scripts in order
psql -h localhost -U educhat_user -d educhat_db -f scripts/01-create-database.sql
psql -h localhost -U educhat_user -d educhat_db -f scripts/02-insert-sample-users.sql
psql -h localhost -U educhat_user -d educhat_db -f scripts/03-insert-learning-modules.sql
psql -h localhost -U educhat_user -d educhat_db -f scripts/04-insert-questions-twk.sql
psql -h localhost -U educhat_user -d educhat_db -f scripts/05-insert-questions-tiu.sql
psql -h localhost -U educhat_user -d educhat_db -f scripts/06-insert-questions-tkp.sql
psql -h localhost -U educhat_user -d educhat_db -f scripts/07-insert-sample-test-sessions.sql
psql -h localhost -U educhat_user -d educhat_db -f scripts/08-insert-user-progress.sql
psql -h localhost -U educhat_user -d educhat_db -f scripts/09-insert-chat-messages.sql
psql -h localhost -U educhat_user -d educhat_db -f scripts/10-create-views-and-functions.sql
psql -h localhost -U educhat_user -d educhat_db -f scripts/11-insert-additional-sample-data.sql
psql -h localhost -U educhat_user -d educhat_db -f scripts/12-final-data-verification.sql
\`\`\`

4. **Update Application Configuration**
\`\`\`bash
# Use PostgreSQL profile
java -jar target/chat-education-app-0.0.1-SNAPSHOT.jar --spring.profiles.active=postgres
\`\`\`

#### Option 2: H2 Database (Development)

1. **Default Configuration** - No setup required
2. **Run Application**
\`\`\`bash
mvn spring-boot:run
\`\`\`
3. **Access H2 Console**: http://localhost:8080/h2-console
   - JDBC URL: `jdbc:h2:mem:testdb`
   - Username: `sa`
   - Password: `password`

### 👥 Sample Login Credentials

#### Admin Account:
- **Username**: `admin`
- **Password**: `password123`
- **Role**: ADMIN

#### Tutor Accounts:
- **TWK Tutor**: `tutor_twk` / `password123`
- **TIU Tutor**: `tutor_tiu` / `password123`
- **TKP Tutor**: `tutor_tkp` / `password123`

#### Student Accounts:
- **Student 1**: `student001` / `password123`
- **Student 2**: `student002` / `password123`
- **Student 3**: `student003` / `password123`
- (dan seterusnya sampai student010)

### 📈 Database Statistics

Setelah setup lengkap, database akan berisi:
- **16 Users** (2 Admin, 4 Tutor, 10 Student)
- **15 Learning Modules** (5 TWK, 5 TIU, 5 TKP)
- **18+ Questions** dengan multiple choice options
- **12 Test Sessions** dengan hasil
- **20+ User Progress** records
- **25+ Chat Messages** untuk testing

### 🔍 Useful Queries

#### Check User Statistics:
\`\`\`sql
SELECT * FROM user_statistics;
\`\`\`

#### Check Test Performance:
\`\`\`sql
SELECT * FROM test_performance_by_type;
\`\`\`

#### Check Learning Progress:
\`\`\`sql
SELECT * FROM learning_progress_summary;
\`\`\`

#### Check Chat Activity:
\`\`\`sql
SELECT * FROM chat_activity;
\`\`\`

### 🛠️ Maintenance

#### Backup Database:
\`\`\`bash
pg_dump -h localhost -U educhat_user educhat_db > backup.sql
\`\`\`

#### Restore Database:
\`\`\`bash
psql -h localhost -U educhat_user educhat_db < backup.sql
\`\`\`

#### Reset Database:
\`\`\`bash
# Drop and recreate database
sudo -u postgres psql -c "DROP DATABASE IF EXISTS educhat_db;"
sudo -u postgres psql -c "CREATE DATABASE educhat_db;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE educhat_db TO educhat_user;"

# Re-run all scripts
# (repeat script execution commands from above)
\`\`\`

### 🔧 Troubleshooting

#### Connection Issues:
1. Check PostgreSQL service: `sudo systemctl status postgresql`
2. Verify user permissions: `psql -h localhost -U educhat_user -d educhat_db -c "\dt"`
3. Check firewall settings for port 5432

#### Performance Issues:
1. Monitor connection pool: Check `spring.datasource.hikari.*` settings
2. Analyze slow queries: Enable `spring.jpa.show-sql=true`
3. Check database indexes: Run `EXPLAIN ANALYZE` on slow queries

#### Data Issues:
1. Verify data integrity: Run verification script
2. Check foreign key constraints
3. Validate user roles and permissions

### 📝 Notes

- Password hash menggunakan BCrypt dengan strength 10
- Semua timestamp menggunakan format ISO 8601
- Database mendukung soft delete dengan flag `active`
- Chat messages mendukung berbagai tipe (TEXT, IMAGE, FILE, SYSTEM)
- Progress tracking menggunakan percentage (0.00 - 100.00)

Untuk pertanyaan lebih lanjut, silakan buka issue di repository atau hubungi tim development.
