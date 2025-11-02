-- JLPT N2 Sample Test Data (Upper Intermediate Level - 6000 words)

-- Insert JLPT N2 Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('jlpt-n2-sample-001', 'JLPT', 'N2', 'JLPT N2 模擬試験 - Practice Test', 'JLPT N2 upper intermediate Japanese proficiency test', 155, 15)
ON CONFLICT (id) DO NOTHING;

-- Insert test sections for JLPT N2
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('jlpt-n2-001-vocab', 'jlpt-n2-sample-001', '言語知識（文字・語彙）', 'VOCABULARY', 30, 5, 'Language Knowledge (Vocabulary)', 1),
('jlpt-n2-001-grammar', 'jlpt-n2-sample-001', '言語知識（文法）・読解', 'GRAMMAR', 70, 5, 'Language Knowledge (Grammar) & Reading', 2),
('jlpt-n2-001-listening', 'jlpt-n2-sample-001', '聴解', 'LISTENING', 50, 5, 'Listening Comprehension', 3)
ON CONFLICT (id) DO NOTHING;

-- Vocabulary Questions (Upper Intermediate)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n2-001-v-001', 'jlpt-n2-sample-001', 'jlpt-n2-001-vocab', 1, 'MULTIPLE_CHOICE', '文字・語彙',
'経済の___により、多くの企業が経営難に陥っている。
(Due to economic stagnation, many companies are facing management difficulties.)',
'["A. 停滞（ていたい）", "B. 発展（はってん）", "C. 向上（こうじょう）", "D. 成長（せいちょう）"]'::jsonb,
'A', 1),

('jlpt-n2-001-v-002', 'jlpt-n2-sample-001', 'jlpt-n2-001-vocab', 2, 'MULTIPLE_CHOICE', '文字・語彙',
'彼の意見は___に基づいており、説得力がある。
(His opinion is based on facts and is convincing.)',
'["A. 事実（じじつ）", "B. 想像（そうぞう）", "C. 仮定（かてい）", "D. 推測（すいそく）"]'::jsonb,
'A', 1),

('jlpt-n2-001-v-003', 'jlpt-n2-sample-001', 'jlpt-n2-001-vocab', 3, 'MULTIPLE_CHOICE', '文字・語彙',
'この問題を解決するには、___な視点からのアプローチが必要だ。
(To solve this problem, we need an approach from multiple perspectives.)',
'["A. 多角的（たかくてき）", "B. 一方的（いっぽうてき）", "C. 部分的（ぶぶんてき）", "D. 限定的（げんていてき）"]'::jsonb,
'A', 1),

('jlpt-n2-001-v-004', 'jlpt-n2-sample-001', 'jlpt-n2-001-vocab', 4, 'MULTIPLE_CHOICE', '文字・語彙',
'新しい技術の___により、生産効率が大幅に向上した。
(Production efficiency has improved significantly due to the introduction of new technology.)',
'["A. 導入（どうにゅう）", "B. 廃止（はいし）", "C. 中止（ちゅうし）", "D. 停止（ていし）"]'::jsonb,
'A', 1),

('jlpt-n2-001-v-005', 'jlpt-n2-sample-001', 'jlpt-n2-001-vocab', 5, 'MULTIPLE_CHOICE', '文字・語彙',
'環境保護と経済発展の___を図ることが重要だ。
(It is important to achieve a balance between environmental protection and economic development.)',
'["A. 両立（りょうりつ）", "B. 対立（たいりつ）", "C. 独立（どくりつ）", "D. 成立（せいりつ）"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Grammar & Reading Questions (Upper Intermediate)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n2-001-g-001', 'jlpt-n2-sample-001', 'jlpt-n2-001-grammar', 1, 'MULTIPLE_CHOICE', '文法・読解',
'近年、地球温暖化が進む___、異常気象が頻発している。
(In recent years, as global warming progresses, abnormal weather occurs frequently.)',
'["A. につれて", "B. に対して", "C. について", "D. に関して"]'::jsonb,
'A', 1),

('jlpt-n2-001-g-002', 'jlpt-n2-sample-001', 'jlpt-n2-001-grammar', 2, 'MULTIPLE_CHOICE', '文法・読解',
'彼は優秀な学生である___、性格も穏やかで人気がある。
(He is not only an excellent student, but also has a gentle personality and is popular.)',
'["A. ばかりでなく", "B. にもかかわらず", "C. わりには", "D. くせに"]'::jsonb,
'A', 1),

('jlpt-n2-001-g-003', 'jlpt-n2-sample-001', 'jlpt-n2-001-grammar', 3, 'MULTIPLE_CHOICE', '文法・読解',
'この件に___は、慎重に検討する必要がある。
(Regarding this matter, it is necessary to consider it carefully.)',
'["A. 関しては", "B. ついては", "C. よると", "D. 対しては"]'::jsonb,
'A', 1),

('jlpt-n2-001-g-004', 'jlpt-n2-sample-001', 'jlpt-n2-001-grammar', 4, 'MULTIPLE_CHOICE', '文法・読解',
'どんなに困難な状況___、諦めてはいけない。
(No matter how difficult the situation is, you must not give up.)',
'["A. であろうと", "B. でありながら", "C. であるからには", "D. であるほど"]'::jsonb,
'A', 1),

('jlpt-n2-001-g-005', 'jlpt-n2-sample-001', 'jlpt-n2-001-grammar', 5, 'MULTIPLE_CHOICE', '文法・読解',
'努力___、必ずしも成功するとは限らない。
(Even if you make an effort, it doesn''t necessarily mean you will succeed.)',
'["A. したところで", "B. したばかりに", "C. したおかげで", "D. したせいで"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Listening Questions (Upper Intermediate)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n2-001-l-001', 'jlpt-n2-sample-001', 'jlpt-n2-001-listening', 1, 'MULTIPLE_CHOICE', '聴解',
'[Audio: 技術の進歩に伴い、私たちの生活様式も大きく変化してきました。]
What has changed according to technological progress?',
'["A. Our lifestyle", "B. Nothing", "C. Only work", "D. Only communication"]'::jsonb,
'A', 1),

('jlpt-n2-001-l-002', 'jlpt-n2-sample-001', 'jlpt-n2-001-listening', 2, 'MULTIPLE_CHOICE', '聴解',
'[Audio: この問題に関しては、専門家の意見を聞いた上で判断したいと思います。]
How will they make a decision?',
'["A. After hearing expert opinions", "B. Immediately", "C. Without consultation", "D. Based on intuition"]'::jsonb,
'A', 1),

('jlpt-n2-001-l-003', 'jlpt-n2-sample-001', 'jlpt-n2-001-listening', 3, 'MULTIPLE_CHOICE', '聴解',
'[Audio: 彼は医者であるにもかかわらず、健康管理に無頓着だ。]
What is surprising about him?',
'["A. Doctor but careless about health", "B. Healthy doctor", "C. Careful doctor", "D. Not a doctor"]'::jsonb,
'A', 1),

('jlpt-n2-001-l-004', 'jlpt-n2-sample-001', 'jlpt-n2-001-listening', 4, 'MULTIPLE_CHOICE', '聴解',
'[Audio: 経済状況が悪化するにつれて、失業率も上昇している。]
What happens as the economy worsens?',
'["A. Unemployment rate rises", "B. Unemployment decreases", "C. Nothing changes", "D. Economy improves"]'::jsonb,
'A', 1),

('jlpt-n2-001-l-005', 'jlpt-n2-sample-001', 'jlpt-n2-001-listening', 5, 'MULTIPLE_CHOICE', '聴解',
'[Audio: 若いからといって、必ずしも体力があるとは限らない。]
What doesn''t necessarily mean having physical strength?',
'["A. Being young", "B. Being old", "C. Exercising", "D. Eating well"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;
