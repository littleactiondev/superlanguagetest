-- JLPT Tests and Questions Seed Data

-- Insert JLPT N5 Test
INSERT INTO tests (id, exam_id, name, level, duration_minutes, description) VALUES
('JLPT_N5', 'JLPT', 'JLPT N5 Practice Test', 'N5', 105, 'Basic Japanese proficiency test - beginner level')
ON CONFLICT (id) DO NOTHING;

-- Insert Test Sections for JLPT N5
INSERT INTO test_sections (id, test_id, name, description, order_number) VALUES
('JLPT_N5_VOCAB', 'JLPT_N5', '言語知識（文字・語彙）', 'Language Knowledge (Vocabulary)', 1),
('JLPT_N5_GRAMMAR', 'JLPT_N5', '言語知識（文法）・読解', 'Language Knowledge (Grammar) & Reading', 2),
('JLPT_N5_LISTENING', 'JLPT_N5', '聴解', 'Listening', 3)
ON CONFLICT (id) DO NOTHING;

-- Vocabulary Questions (5 questions)
INSERT INTO questions (id, test_id, section_id, question_number, question_type, question_text, options, correct_answer, points) VALUES
('JLPT_N5_V1', 'JLPT_N5', 'JLPT_N5_VOCAB', 1, 'multiple_choice',
'これは　＿＿＿　です。(This is a book)',
'{"A": "ほん", "B": "ぼん", "C": "ほう", "D": "ぽん"}', 'A', 1),

('JLPT_N5_V2', 'JLPT_N5', 'JLPT_N5_VOCAB', 2, 'multiple_choice',
'わたしは　まいにち　＿＿＿　を　たべます。(I eat ___ every day)',
'{"A": "ごはん (rice/meal)", "B": "さかな (fish)", "C": "みず (water)", "D": "いえ (house)"}', 'A', 1),

('JLPT_N5_V3', 'JLPT_N5', 'JLPT_N5_VOCAB', 3, 'multiple_choice',
'きのう　＿＿＿　に　いきました。(Yesterday I went to school)',
'{"A": "がっこう (school)", "B": "かいしゃ (company)", "C": "びょういん (hospital)", "D": "ぎんこう (bank)"}', 'A', 1),

('JLPT_N5_V4', 'JLPT_N5', 'JLPT_N5_VOCAB', 4, 'multiple_choice',
'この　かばんは　＿＿＿　です。(This bag is new)',
'{"A": "あたらしい (new)", "B": "ふるい (old)", "C": "おおきい (big)", "D": "ちいさい (small)"}', 'A', 1),

('JLPT_N5_V5', 'JLPT_N5', 'JLPT_N5_VOCAB', 5, 'multiple_choice',
'＿＿＿　は　どようびです。(Tomorrow is Saturday)',
'{"A": "あした (tomorrow)", "B": "きのう (yesterday)", "C": "きょう (today)", "D": "あさって (day after tomorrow)"}', 'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Grammar & Reading Questions (5 questions)
INSERT INTO questions (id, test_id, section_id, question_number, question_type, question_text, options, correct_answer, points) VALUES
('JLPT_N5_G1', 'JLPT_N5', 'JLPT_N5_GRAMMAR', 1, 'multiple_choice',
'わたし　＿＿＿　がくせいです。(I am a student)',
'{"A": "は", "B": "が", "C": "を", "D": "に"}', 'A', 1),

('JLPT_N5_G2', 'JLPT_N5', 'JLPT_N5_GRAMMAR', 2, 'multiple_choice',
'ここ　＿＿＿　としょかんです。(This is a library)',
'{"A": "は", "B": "が", "C": "を", "D": "で"}', 'A', 1),

('JLPT_N5_G3', 'JLPT_N5', 'JLPT_N5_GRAMMAR', 3, 'multiple_choice',
'まいにち　７じ　＿＿＿　おきます。(I wake up at 7 o''clock every day)',
'{"A": "に", "B": "で", "C": "を", "D": "が"}', 'A', 1),

('JLPT_N5_G4', 'JLPT_N5', 'JLPT_N5_GRAMMAR', 4, 'multiple_choice',
'でんしゃ　＿＿＿　がっこうに　いきます。(I go to school by train)',
'{"A": "で", "B": "に", "C": "を", "D": "へ"}', 'A', 1),

('JLPT_N5_G5', 'JLPT_N5', 'JLPT_N5_GRAMMAR', 5, 'multiple_choice',
'これは　わたし　＿＿＿　かばんです。(This is my bag)',
'{"A": "の", "B": "に", "C": "で", "D": "を"}', 'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Listening Questions (5 questions)
INSERT INTO questions (id, test_id, section_id, question_number, question_type, question_text, options, correct_answer, points) VALUES
('JLPT_N5_L1', 'JLPT_N5', 'JLPT_N5_LISTENING', 1, 'multiple_choice',
'[Audio: おはようございます] What time of day is the greeting?',
'{"A": "Morning", "B": "Afternoon", "C": "Evening", "D": "Night"}', 'A', 1),

('JLPT_N5_L2', 'JLPT_N5', 'JLPT_N5_LISTENING', 2, 'multiple_choice',
'[Audio: これは　いくらですか。- 500えんです。] How much does it cost?',
'{"A": "500 yen", "B": "50 yen", "C": "5000 yen", "D": "5 yen"}', 'A', 1),

('JLPT_N5_L3', 'JLPT_N5', 'JLPT_N5_LISTENING', 3, 'multiple_choice',
'[Audio: すみません、トイレは　どこですか。] What is the person looking for?',
'{"A": "Toilet/Restroom", "B": "Exit", "C": "Station", "D": "Shop"}', 'A', 1),

('JLPT_N5_L4', 'JLPT_N5', 'JLPT_N5_LISTENING', 4, 'multiple_choice',
'[Audio: わたしの　なまえは　たなかです。] What is being introduced?',
'{"A": "Name (Tanaka)", "B": "Job", "C": "Age", "D": "Address"}', 'A', 1),

('JLPT_N5_L5', 'JLPT_N5', 'JLPT_N5_LISTENING', 5, 'multiple_choice',
'[Audio: あした　えいがを　みます。] What will the person do tomorrow?',
'{"A": "Watch a movie", "B": "Read a book", "C": "Go to school", "D": "Eat dinner"}', 'A', 1)
ON CONFLICT (id) DO NOTHING;
