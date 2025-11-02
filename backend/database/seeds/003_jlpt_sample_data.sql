-- JLPT N5 Sample Test Data

-- Insert JLPT N5 Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('jlpt-n5-sample-001', 'JLPT', 'N5', 'JLPT N5 模擬試験 - Practice Test', 'JLPT N5 basic Japanese proficiency test with vocabulary, grammar, and listening sections', 105, 15)
ON CONFLICT (id) DO NOTHING;

-- Insert test sections for JLPT N5
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('jlpt-n5-001-vocab', 'jlpt-n5-sample-001', '言語知識（文字・語彙）', 'VOCABULARY', 25, 5, 'Language Knowledge (Vocabulary)', 1),
('jlpt-n5-001-grammar', 'jlpt-n5-sample-001', '言語知識（文法）・読解', 'GRAMMAR', 50, 5, 'Language Knowledge (Grammar) & Reading', 2),
('jlpt-n5-001-listening', 'jlpt-n5-sample-001', '聴解', 'LISTENING', 30, 5, 'Listening Comprehension', 3)
ON CONFLICT (id) DO NOTHING;

-- Vocabulary Questions
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n5-001-v-001', 'jlpt-n5-sample-001', 'jlpt-n5-001-vocab', 1, 'MULTIPLE_CHOICE', '文字・語彙',
'これは　＿＿＿　です。
(This is a book)',
'["A. ほん", "B. ぼん", "C. ほう", "D. ぽん"]'::jsonb,
'A', 1),

('jlpt-n5-001-v-002', 'jlpt-n5-sample-001', 'jlpt-n5-001-vocab', 2, 'MULTIPLE_CHOICE', '文字・語彙',
'わたしは　まいにち　＿＿＿　を　たべます。
(I eat ___ every day)',
'["A. ごはん (rice/meal)", "B. さかな (fish)", "C. みず (water)", "D. いえ (house)"]'::jsonb,
'A', 1),

('jlpt-n5-001-v-003', 'jlpt-n5-sample-001', 'jlpt-n5-001-vocab', 3, 'MULTIPLE_CHOICE', '文字・語彙',
'きのう　＿＿＿　に　いきました。
(Yesterday I went to school)',
'["A. がっこう (school)", "B. かいしゃ (company)", "C. びょういん (hospital)", "D. ぎんこう (bank)"]'::jsonb,
'A', 1),

('jlpt-n5-001-v-004', 'jlpt-n5-sample-001', 'jlpt-n5-001-vocab', 4, 'MULTIPLE_CHOICE', '文字・語彙',
'この　かばんは　＿＿＿　です。
(This bag is new)',
'["A. あたらしい (new)", "B. ふるい (old)", "C. おおきい (big)", "D. ちいさい (small)"]'::jsonb,
'A', 1),

('jlpt-n5-001-v-005', 'jlpt-n5-sample-001', 'jlpt-n5-001-vocab', 5, 'MULTIPLE_CHOICE', '文字・語彙',
'＿＿＿　は　どようびです。
(Tomorrow is Saturday)',
'["A. あした (tomorrow)", "B. きのう (yesterday)", "C. きょう (today)", "D. あさって (day after tomorrow)"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Grammar & Reading Questions
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n5-001-g-001', 'jlpt-n5-sample-001', 'jlpt-n5-001-grammar', 1, 'MULTIPLE_CHOICE', '文法・読解',
'わたし　＿＿＿　がくせいです。
(I am a student)',
'["A. は", "B. が", "C. を", "D. に"]'::jsonb,
'A', 1),

('jlpt-n5-001-g-002', 'jlpt-n5-sample-001', 'jlpt-n5-001-grammar', 2, 'MULTIPLE_CHOICE', '文法・読解',
'ここ　＿＿＿　としょかんです。
(This is a library)',
'["A. は", "B. が", "C. を", "D. で"]'::jsonb,
'A', 1),

('jlpt-n5-001-g-003', 'jlpt-n5-sample-001', 'jlpt-n5-001-grammar', 3, 'MULTIPLE_CHOICE', '文法・読解',
'まいにち　７じ　＿＿＿　おきます。
(I wake up at 7 o''clock every day)',
'["A. に", "B. で", "C. を", "D. が"]'::jsonb,
'A', 1),

('jlpt-n5-001-g-004', 'jlpt-n5-sample-001', 'jlpt-n5-001-grammar', 4, 'MULTIPLE_CHOICE', '文法・読解',
'でんしゃ　＿＿＿　がっこうに　いきます。
(I go to school by train)',
'["A. で", "B. に", "C. を", "D. へ"]'::jsonb,
'A', 1),

('jlpt-n5-001-g-005', 'jlpt-n5-sample-001', 'jlpt-n5-001-grammar', 5, 'MULTIPLE_CHOICE', '文法・読解',
'これは　わたし　＿＿＿　かばんです。
(This is my bag)',
'["A. の", "B. に", "C. で", "D. を"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Listening Questions
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n5-001-l-001', 'jlpt-n5-sample-001', 'jlpt-n5-001-listening', 1, 'MULTIPLE_CHOICE', '聴解',
'[Audio: おはようございます]
What time of day is the greeting?',
'["A. Morning", "B. Afternoon", "C. Evening", "D. Night"]'::jsonb,
'A', 1),

('jlpt-n5-001-l-002', 'jlpt-n5-sample-001', 'jlpt-n5-001-listening', 2, 'MULTIPLE_CHOICE', '聴解',
'[Audio: これは　いくらですか。- 500えんです。]
How much does it cost?',
'["A. 500 yen", "B. 50 yen", "C. 5000 yen", "D. 5 yen"]'::jsonb,
'A', 1),

('jlpt-n5-001-l-003', 'jlpt-n5-sample-001', 'jlpt-n5-001-listening', 3, 'MULTIPLE_CHOICE', '聴解',
'[Audio: すみません、トイレは　どこですか。]
What is the person looking for?',
'["A. Toilet/Restroom", "B. Exit", "C. Station", "D. Shop"]'::jsonb,
'A', 1),

('jlpt-n5-001-l-004', 'jlpt-n5-sample-001', 'jlpt-n5-001-listening', 4, 'MULTIPLE_CHOICE', '聴解',
'[Audio: わたしの　なまえは　たなかです。]
What is being introduced?',
'["A. Name (Tanaka)", "B. Job", "C. Age", "D. Address"]'::jsonb,
'A', 1),

('jlpt-n5-001-l-005', 'jlpt-n5-sample-001', 'jlpt-n5-001-listening', 5, 'MULTIPLE_CHOICE', '聴解',
'[Audio: あした　えいがを　みます。]
What will the person do tomorrow?',
'["A. Watch a movie", "B. Read a book", "C. Go to school", "D. Eat dinner"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;
