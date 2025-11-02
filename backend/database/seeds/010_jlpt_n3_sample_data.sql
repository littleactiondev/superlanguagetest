-- JLPT N3 Sample Test Data (Intermediate Level - 3750 words)

-- Insert JLPT N3 Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('jlpt-n3-sample-001', 'JLPT', 'N3', 'JLPT N3 模擬試験 - Practice Test', 'JLPT N3 intermediate Japanese proficiency test', 140, 15)
ON CONFLICT (id) DO NOTHING;

-- Insert test sections for JLPT N3
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('jlpt-n3-001-vocab', 'jlpt-n3-sample-001', '言語知識（文字・語彙）', 'VOCABULARY', 30, 5, 'Language Knowledge (Vocabulary)', 1),
('jlpt-n3-001-grammar', 'jlpt-n3-sample-001', '言語知識（文法）・読解', 'GRAMMAR', 70, 5, 'Language Knowledge (Grammar) & Reading', 2),
('jlpt-n3-001-listening', 'jlpt-n3-sample-001', '聴解', 'LISTENING', 40, 5, 'Listening Comprehension', 3)
ON CONFLICT (id) DO NOTHING;

-- Vocabulary Questions (Intermediate)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n3-001-v-001', 'jlpt-n3-sample-001', 'jlpt-n3-001-vocab', 1, 'MULTIPLE_CHOICE', '文字・語彙',
'このプロジェクトを成功させるためには、チーム全員の___が必要だ。
(Cooperation of the entire team is necessary to make this project successful.)',
'["A. 協力（きょうりょく）", "B. 競争（きょうそう）", "C. 協定（きょうてい）", "D. 強調（きょうちょう）"]'::jsonb,
'A', 1),

('jlpt-n3-001-v-002', 'jlpt-n3-sample-001', 'jlpt-n3-001-vocab', 2, 'MULTIPLE_CHOICE', '文字・語彙',
'彼は___な性格で、誰とでもすぐに仲良くなれる。
(He has a cheerful personality and can quickly become friends with anyone.)',
'["A. 明るい（あかるい）", "B. 暗い（くらい）", "C. 重い（おもい）", "D. 軽い（かるい）"]'::jsonb,
'A', 1),

('jlpt-n3-001-v-003', 'jlpt-n3-sample-001', 'jlpt-n3-001-vocab', 3, 'MULTIPLE_CHOICE', '文字・語彙',
'この問題について、もう少し___に説明していただけますか。
(Could you explain this issue in more detail?)',
'["A. 詳しく（くわしく）", "B. 簡単（かんたん）", "C. 複雑（ふくざつ）", "D. 適当（てきとう）"]'::jsonb,
'A', 1),

('jlpt-n3-001-v-004', 'jlpt-n3-sample-001', 'jlpt-n3-001-vocab', 4, 'MULTIPLE_CHOICE', '文字・語彙',
'環境問題に___するため、私たちにできることから始めよう。
(Let''s start with what we can do to deal with environmental problems.)',
'["A. 対応（たいおう）", "B. 反対（はんたい）", "C. 賛成（さんせい）", "D. 参加（さんか）"]'::jsonb,
'A', 1),

('jlpt-n3-001-v-005', 'jlpt-n3-sample-001', 'jlpt-n3-001-vocab', 5, 'MULTIPLE_CHOICE', '文字・語彙',
'この薬を飲んだら、___に効果が現れます。
(The effect will appear gradually after taking this medicine.)',
'["A. 徐々（じょじょ）", "B. 突然（とつぜん）", "C. 急（きゅう）", "D. 瞬間（しゅんかん）"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Grammar & Reading Questions (Intermediate)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n3-001-g-001', 'jlpt-n3-sample-001', 'jlpt-n3-001-grammar', 1, 'MULTIPLE_CHOICE', '文法・読解',
'雨が降っている___、試合は予定通り行われた。
(Despite the rain, the game was held as scheduled.)',
'["A. にもかかわらず", "B. おかげで", "C. ために", "D. ので"]'::jsonb,
'A', 1),

('jlpt-n3-001-g-002', 'jlpt-n3-sample-001', 'jlpt-n3-001-grammar', 2, 'MULTIPLE_CHOICE', '文法・読解',
'彼は日本語___、英語も中国語も話せる。
(He can speak not only Japanese, but also English and Chinese.)',
'["A. はもちろん", "B. だけでなく", "C. のほかに", "D. 以上"]'::jsonb,
'A', 1),

('jlpt-n3-001-g-003', 'jlpt-n3-sample-001', 'jlpt-n3-001-grammar', 3, 'MULTIPLE_CHOICE', '文法・読解',
'この仕事は明日までに___。
(This work must be completed by tomorrow.)',
'["A. 終わらせなければならない", "B. 終わるかもしれない", "C. 終わってもいい", "D. 終わらなくてもいい"]'::jsonb,
'A', 1),

('jlpt-n3-001-g-004', 'jlpt-n3-sample-001', 'jlpt-n3-001-grammar', 4, 'MULTIPLE_CHOICE', '文法・読解',
'努力した___、良い結果が得られるとは限らない。
(Even if you make an effort, you won''t necessarily get good results.)',
'["A. からといって", "B. ために", "C. おかげで", "D. ことに"]'::jsonb,
'A', 1),

('jlpt-n3-001-g-005', 'jlpt-n3-sample-001', 'jlpt-n3-001-grammar', 5, 'MULTIPLE_CHOICE', '文法・読解',
'彼女は医者___、作家としても活躍している。
(She is active not only as a doctor but also as a writer.)',
'["A. であると同時に", "B. でありながら", "C. であるにもかかわらず", "D. であるために"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Listening Questions (Intermediate)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n3-001-l-001', 'jlpt-n3-sample-001', 'jlpt-n3-001-listening', 1, 'MULTIPLE_CHOICE', '聴解',
'[Audio: 会議は来週の月曜日から水曜日に変更になりました。]
When is the meeting now?',
'["A. Wednesday", "B. Monday", "C. Friday", "D. Tuesday"]'::jsonb,
'A', 1),

('jlpt-n3-001-l-002', 'jlpt-n3-sample-001', 'jlpt-n3-001-listening', 2, 'MULTIPLE_CHOICE', '聴解',
'[Audio: このレストランは料理がおいしい上に、雰囲気もいいので人気があります。]
Why is this restaurant popular?',
'["A. Good food and atmosphere", "B. Only good food", "C. Only good atmosphere", "D. Cheap price"]'::jsonb,
'A', 1),

('jlpt-n3-001-l-003', 'jlpt-n3-sample-001', 'jlpt-n3-001-listening', 3, 'MULTIPLE_CHOICE', '聴解',
'[Audio: 台風の影響で、明日の電車が運休になる可能性があります。]
What might happen tomorrow?',
'["A. Trains might be cancelled", "B. Trains will definitely run", "C. Weather will be good", "D. No typhoon"]'::jsonb,
'A', 1),

('jlpt-n3-001-l-004', 'jlpt-n3-sample-001', 'jlpt-n3-001-listening', 4, 'MULTIPLE_CHOICE', '聴解',
'[Audio: 忙しくて疲れていたにもかかわらず、彼は最後まで頑張りました。]
What did he do despite being busy?',
'["A. Continued until the end", "B. Gave up halfway", "C. Took a rest", "D. Asked for help"]'::jsonb,
'A', 1),

('jlpt-n3-001-l-005', 'jlpt-n3-sample-001', 'jlpt-n3-001-listening', 5, 'MULTIPLE_CHOICE', '聴解',
'[Audio: この商品は品質が良いだけでなく、デザインも優れています。]
What is good about this product?',
'["A. Both quality and design", "B. Only quality", "C. Only design", "D. Only price"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;
