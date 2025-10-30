-- Create exams table
CREATE TABLE IF NOT EXISTS exams (
  id VARCHAR(50) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  full_name VARCHAR(200) NOT NULL,
  description TEXT,
  language VARCHAR(50) NOT NULL,
  is_available BOOLEAN DEFAULT false,
  icon VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create exam_levels table
CREATE TABLE IF NOT EXISTS exam_levels (
  id SERIAL PRIMARY KEY,
  exam_id VARCHAR(50) REFERENCES exams(id) ON DELETE CASCADE,
  level_name VARCHAR(50) NOT NULL,
  display_order INTEGER
);

-- Create tests table
CREATE TABLE IF NOT EXISTS tests (
  id VARCHAR(100) PRIMARY KEY,
  exam_type VARCHAR(50) REFERENCES exams(id) ON DELETE CASCADE,
  level VARCHAR(50) NOT NULL,
  title VARCHAR(200) NOT NULL,
  description TEXT,
  duration INTEGER NOT NULL, -- in minutes
  total_questions INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create test_sections table
CREATE TABLE IF NOT EXISTS test_sections (
  id VARCHAR(100) PRIMARY KEY,
  test_id VARCHAR(100) REFERENCES tests(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  type VARCHAR(50) NOT NULL,
  duration INTEGER NOT NULL, -- in minutes
  question_count INTEGER NOT NULL,
  description TEXT,
  display_order INTEGER
);

-- Create questions table
CREATE TABLE IF NOT EXISTS questions (
  id VARCHAR(100) PRIMARY KEY,
  test_id VARCHAR(100) REFERENCES tests(id) ON DELETE CASCADE,
  section_id VARCHAR(100) REFERENCES test_sections(id) ON DELETE CASCADE,
  question_number INTEGER NOT NULL,
  type VARCHAR(50) NOT NULL,
  section VARCHAR(100) NOT NULL,
  content TEXT NOT NULL,
  options JSONB, -- array of options for multiple choice
  correct_answer TEXT NOT NULL,
  audio_url VARCHAR(500),
  image_url VARCHAR(500),
  points INTEGER DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create users table
CREATE TABLE IF NOT EXISTS users (
  id VARCHAR(100) PRIMARY KEY,
  email VARCHAR(255) UNIQUE,
  username VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  last_login TIMESTAMP
);

-- Create user_attempts table
CREATE TABLE IF NOT EXISTS user_attempts (
  id VARCHAR(100) PRIMARY KEY,
  user_id VARCHAR(100) REFERENCES users(id) ON DELETE CASCADE,
  test_id VARCHAR(100) REFERENCES tests(id) ON DELETE CASCADE,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP,
  score INTEGER,
  max_score INTEGER NOT NULL,
  status VARCHAR(20) NOT NULL CHECK (status IN ('IN_PROGRESS', 'COMPLETED', 'ABANDONED')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create user_answers table
CREATE TABLE IF NOT EXISTS user_answers (
  id SERIAL PRIMARY KEY,
  attempt_id VARCHAR(100) REFERENCES user_attempts(id) ON DELETE CASCADE,
  question_id VARCHAR(100) REFERENCES questions(id) ON DELETE CASCADE,
  answer TEXT NOT NULL,
  is_correct BOOLEAN,
  time_spent INTEGER, -- in seconds
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_tests_exam_type ON tests(exam_type);
CREATE INDEX IF NOT EXISTS idx_questions_test_id ON questions(test_id);
CREATE INDEX IF NOT EXISTS idx_user_attempts_user_id ON user_attempts(user_id);
CREATE INDEX IF NOT EXISTS idx_user_attempts_test_id ON user_attempts(test_id);
CREATE INDEX IF NOT EXISTS idx_user_answers_attempt_id ON user_answers(attempt_id);

-- Insert exam types
INSERT INTO exams (id, name, full_name, description, language, is_available, icon) VALUES
('TOEIC', 'TOEIC', 'Test of English for International Communication', 'Business English proficiency test', 'English', false, '🇬🇧'),
('TOEFL', 'TOEFL', 'Test of English as a Foreign Language', 'Academic English proficiency test', 'English', false, '🇺🇸'),
('IELTS', 'IELTS', 'International English Language Testing System', 'English language proficiency test', 'English', false, '🇬🇧'),
('JLPT', 'JLPT', 'Japanese Language Proficiency Test', 'Japanese language proficiency test', 'Japanese', false, '🇯🇵'),
('HSK', 'HSK', 'Hanyu Shuiping Kaoshi', 'Chinese language proficiency test', 'Chinese', true, '🇨🇳'),
('TOPIK', 'TOPIK', 'Test of Proficiency in Korean', 'Korean language proficiency test', 'Korean', false, '🇰🇷')
ON CONFLICT (id) DO NOTHING;

-- Insert HSK levels
INSERT INTO exam_levels (exam_id, level_name, display_order) VALUES
('HSK', 'HSK 1', 1),
('HSK', 'HSK 2', 2),
('HSK', 'HSK 3', 3),
('HSK', 'HSK 4', 4),
('HSK', 'HSK 5', 5),
('HSK', 'HSK 6', 6);

-- Insert JLPT levels
INSERT INTO exam_levels (exam_id, level_name, display_order) VALUES
('JLPT', 'N5', 1),
('JLPT', 'N4', 2),
('JLPT', 'N3', 3),
('JLPT', 'N2', 4),
('JLPT', 'N1', 5);
