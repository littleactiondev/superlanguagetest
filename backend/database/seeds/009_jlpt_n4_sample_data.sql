-- JLPT N4 Sample Test Data (Elementary-Intermediate Level - 1500 words)

-- Insert JLPT N4 Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('jlpt-n4-sample-001', 'JLPT', 'N4', 'JLPT N4 模擬試験 - Practice Test', 'JLPT N4 elementary-intermediate Japanese proficiency test', 125, 15)
ON CONFLICT (id) DO NOTHING;

-- Insert test sections for JLPT N4
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('jlpt-n4-001-vocab', 'jlpt-n4-sample-001', '言語知識（文字・語彙）', 'VOCABULARY', 30, 5, 'Language Knowledge (Vocabulary)', 1),
('jlpt-n4-001-grammar', 'jlpt-n4-sample-001', '言語知識（文法）・読解', 'GRAMMAR', 60, 5, 'Language Knowledge (Grammar) & Reading', 2),
('jlpt-n4-001-listening', 'jlpt-n4-sample-001', '聴解', 'LISTENING', 35, 5, 'Listening Comprehension', 3)
ON CONFLICT (id) DO NOTHING;

-- Vocabulary Questions (Elementary-Intermediate)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n4-001-v-001', 'jlpt-n4-sample-001', 'jlpt-n4-001-vocab', 1, 'MULTIPLE_CHOICE', '文字・語彙',
'きのう　えいがを　___　から、ねむいです。
(I''m sleepy because I watched a movie until late yesterday.)',
'["A. おそくまで　みた", "B. はやく　みた", "C. たくさん　みた", "D. すこし　みた"]'::jsonb,
'A', 1),

('jlpt-n4-001-v-002', 'jlpt-n4-sample-001', 'jlpt-n4-001-vocab', 2, 'MULTIPLE_CHOICE', '文字・語彙',
'あたらしい　パソコンを　___　つもりです。
(I plan to buy a new computer.)',
'["A. かう", "B. うる", "C. かりる", "D. あげる"]'::jsonb,
'A', 1),

('jlpt-n4-001-v-003', 'jlpt-n4-sample-001', 'jlpt-n4-001-vocab', 3, 'MULTIPLE_CHOICE', '文字・語彙',
'この　しごとは　___　から、すぐに　おわります。
(This work is simple, so it will finish quickly.)',
'["A. かんたん", "B. ふくざつ", "C. むずかしい", "D. たいへん"]'::jsonb,
'A', 1),

('jlpt-n4-001-v-004', 'jlpt-n4-sample-001', 'jlpt-n4-001-vocab', 4, 'MULTIPLE_CHOICE', '文字・語彙',
'あめが　___　そうです。
(It looks like it''s going to rain.)',
'["A. ふり", "B. ふって", "C. ふる", "D. ふった"]'::jsonb,
'A', 1),

('jlpt-n4-001-v-005', 'jlpt-n4-sample-001', 'jlpt-n4-001-vocab', 5, 'MULTIPLE_CHOICE', '文字・語彙',
'せんせいに　しつもんを　___　ください。
(Please ask the teacher a question.)',
'["A. して", "B. きいて", "C. いって", "D. はなして"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Grammar & Reading Questions (Elementary-Intermediate)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n4-001-g-001', 'jlpt-n4-sample-001', 'jlpt-n4-001-grammar', 1, 'MULTIPLE_CHOICE', '文法・読解',
'あした　___　、いっしょに　かいものに　いきましょう。
(If you are free tomorrow, let''s go shopping together.)',
'["A. ひまなら", "B. ひまだったら", "C. ひまで", "D. ひまに"]'::jsonb,
'A', 1),

('jlpt-n4-001-g-002', 'jlpt-n4-sample-001', 'jlpt-n4-001-grammar', 2, 'MULTIPLE_CHOICE', '文法・読解',
'にほんごが　___　ように、まいにち　べんきょうします。
(I study every day so that I can speak Japanese.)',
'["A. はなせる", "B. はなす", "C. はなした", "D. はなして"]'::jsonb,
'A', 1),

('jlpt-n4-001-g-003', 'jlpt-n4-sample-001', 'jlpt-n4-001-grammar', 3, 'MULTIPLE_CHOICE', '文法・読解',
'この　ほんは　むずかしくて、___　よめません。
(This book is difficult, so I can''t read it at all.)',
'["A. ぜんぜん", "B. とても", "C. たくさん", "D. すこし"]'::jsonb,
'A', 1),

('jlpt-n4-001-g-004', 'jlpt-n4-sample-001', 'jlpt-n4-001-grammar', 4, 'MULTIPLE_CHOICE', '文法・読解',
'くすりを　のんだ　___、すぐに　ねました。
(After taking medicine, I went to sleep immediately.)',
'["A. あとで", "B. まえに", "C. とき", "D. ながら"]'::jsonb,
'A', 1),

('jlpt-n4-001-g-005', 'jlpt-n4-sample-001', 'jlpt-n4-001-grammar', 5, 'MULTIPLE_CHOICE', '文法・読解',
'せんせいが　___　とおりに　してください。
(Please do as the teacher says.)',
'["A. いう", "B. いった", "C. いって", "D. いい"]'::jsonb,
'B', 1)
ON CONFLICT (id) DO NOTHING;

-- Listening Questions (Elementary-Intermediate)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n4-001-l-001', 'jlpt-n4-sample-001', 'jlpt-n4-001-listening', 1, 'MULTIPLE_CHOICE', '聴解',
'[Audio: すみません、この　ちかくに　ゆうびんきょくは　ありますか。]
What is the person looking for?',
'["A. Post office", "B. Bank", "C. Convenience store", "D. Station"]'::jsonb,
'A', 1),

('jlpt-n4-001-l-002', 'jlpt-n4-sample-001', 'jlpt-n4-001-listening', 2, 'MULTIPLE_CHOICE', '聴解',
'[Audio: らいしゅうの　にちようびに　パーティーを　します。よかったら　きて　ください。]
When is the party?',
'["A. Next Sunday", "B. This Sunday", "C. Next Saturday", "D. This Saturday"]'::jsonb,
'A', 1),

('jlpt-n4-001-l-003', 'jlpt-n4-sample-001', 'jlpt-n4-001-listening', 3, 'MULTIPLE_CHOICE', '聴解',
'[Audio: この　りょうりは　じぶんで　つくったんですか。すごいですね。]
What does the speaker think?',
'["A. Impressive", "B. Not good", "C. Too expensive", "D. Too simple"]'::jsonb,
'A', 1),

('jlpt-n4-001-l-004', 'jlpt-n4-sample-001', 'jlpt-n4-001-listening', 4, 'MULTIPLE_CHOICE', '聴解',
'[Audio: でんしゃが　こんでいたので、すわる　ことが　できませんでした。]
Why couldn''t the person sit?',
'["A. Train was crowded", "B. Forgot seat reservation", "C. Too tired", "D. No seats available"]'::jsonb,
'A', 1),

('jlpt-n4-001-l-005', 'jlpt-n4-sample-001', 'jlpt-n4-001-listening', 5, 'MULTIPLE_CHOICE', '聴解',
'[Audio: あしたの　かいぎは　ごご　３じから　５じまでです。]
How long is the meeting?',
'["A. 2 hours", "B. 1 hour", "C. 3 hours", "D. 5 hours"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;
