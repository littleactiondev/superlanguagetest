-- JLPT N1 Sample Test Data (Advanced Level - 10000+ words)

-- Insert JLPT N1 Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('jlpt-n1-sample-001', 'JLPT', 'N1', 'JLPT N1 模擬試験 - Practice Test', 'JLPT N1 advanced Japanese proficiency test', 170, 15)
ON CONFLICT (id) DO NOTHING;

-- Insert test sections for JLPT N1
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('jlpt-n1-001-vocab', 'jlpt-n1-sample-001', '言語知識（文字・語彙）', 'VOCABULARY', 30, 5, 'Language Knowledge (Vocabulary)', 1),
('jlpt-n1-001-grammar', 'jlpt-n1-sample-001', '言語知識（文法）・読解', 'GRAMMAR', 70, 5, 'Language Knowledge (Grammar) & Reading', 2),
('jlpt-n1-001-listening', 'jlpt-n1-sample-001', '聴解', 'LISTENING', 60, 5, 'Listening Comprehension', 3)
ON CONFLICT (id) DO NOTHING;

-- Vocabulary Questions (Advanced)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n1-001-v-001', 'jlpt-n1-sample-001', 'jlpt-n1-001-vocab', 1, 'MULTIPLE_CHOICE', '文字・語彙',
'社会の___な変化に対応するため、教育制度の抜本的な改革が求められている。
(Fundamental educational reform is required to respond to drastic social changes.)',
'["A. 抜本的（ばっぽんてき）", "B. 部分的（ぶぶんてき）", "C. 表面的（ひょうめんてき）", "D. 暫定的（ざんていてき）"]'::jsonb,
'A', 1),

('jlpt-n1-001-v-002', 'jlpt-n1-sample-001', 'jlpt-n1-001-vocab', 2, 'MULTIPLE_CHOICE', '文字・語彙',
'彼の研究は学界において___な評価を得ている。
(His research has received high acclaim in the academic world.)',
'["A. 顕著（けんちょ）", "B. 平凡（へいぼん）", "C. 些細（ささい）", "D. 微妙（びみょう）"]'::jsonb,
'A', 1),

('jlpt-n1-001-v-003', 'jlpt-n1-sample-001', 'jlpt-n1-001-vocab', 3, 'MULTIPLE_CHOICE', '文字・語彙',
'この理論は従来の概念を___するものとして注目を集めている。
(This theory is attracting attention as something that overturns conventional concepts.)',
'["A. 覆（くつがえ）す", "B. 踏襲（とうしゅう）する", "C. 継承（けいしょう）する", "D. 維持（いじ）する"]'::jsonb,
'A', 1),

('jlpt-n1-001-v-004', 'jlpt-n1-sample-001', 'jlpt-n1-001-vocab', 4, 'MULTIPLE_CHOICE', '文字・語彙',
'政府は経済の___を防ぐため、緊急の措置を講じた。
(The government took emergency measures to prevent economic deterioration.)',
'["A. 悪化（あっか）", "B. 改善（かいぜん）", "C. 発展（はってん）", "D. 繁栄（はんえい）"]'::jsonb,
'A', 1),

('jlpt-n1-001-v-005', 'jlpt-n1-sample-001', 'jlpt-n1-001-vocab', 5, 'MULTIPLE_CHOICE', '文字・語彙',
'彼女の意見は___であり、議論の余地がない。
(Her opinion is definitive and leaves no room for debate.)',
'["A. 的確（てきかく）", "B. 曖昧（あいまい）", "C. 不明確（ふめいかく）", "D. 抽象的（ちゅうしょうてき）"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Grammar & Reading Questions (Advanced)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n1-001-g-001', 'jlpt-n1-sample-001', 'jlpt-n1-001-grammar', 1, 'MULTIPLE_CHOICE', '文法・読解',
'社会構造の変化___、価値観の多様化が進んでいる。
(Along with changes in social structure, diversification of values is progressing.)',
'["A. に伴い", "B. に反して", "C. に比べて", "D. に加えて"]'::jsonb,
'A', 1),

('jlpt-n1-001-g-002', 'jlpt-n1-sample-001', 'jlpt-n1-001-grammar', 2, 'MULTIPLE_CHOICE', '文法・読解',
'彼の成功は、才能___努力の賜物である。
(His success is the result of not only talent but also effort.)',
'["A. もさることながら", "B. であるからには", "C. であろうとも", "D. であるまでもなく"]'::jsonb,
'A', 1),

('jlpt-n1-001-g-003', 'jlpt-n1-sample-001', 'jlpt-n1-001-grammar', 3, 'MULTIPLE_CHOICE', '文法・読解',
'この問題を解決する___、根本的な原因を究明しなければならない。
(In order to solve this problem, we must investigate the fundamental cause.)',
'["A. べく", "B. まじき", "C. がため", "D. きらい"]'::jsonb,
'A', 1),

('jlpt-n1-001-g-004', 'jlpt-n1-sample-001', 'jlpt-n1-001-grammar', 4, 'MULTIPLE_CHOICE', '文法・読解',
'経験豊富___、彼でもこの難問は解けなかった。
(Experienced as he is, even he couldn''t solve this difficult problem.)',
'["A. なだけあって", "B. であろうとも", "C. なりに", "D. とはいえ"]'::jsonb,
'C', 1),

('jlpt-n1-001-g-005', 'jlpt-n1-sample-001', 'jlpt-n1-001-grammar', 5, 'MULTIPLE_CHOICE', '文法・読解',
'彼は一流の研究者___、人格者としても尊敬されている。
(He is respected not only as a first-class researcher but also as a person of character.)',
'["A. たると同時に", "B. たるにもかかわらず", "C. たるがゆえに", "D. たるべく"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Listening Questions (Advanced)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('jlpt-n1-001-l-001', 'jlpt-n1-sample-001', 'jlpt-n1-001-listening', 1, 'MULTIPLE_CHOICE', '聴解',
'[Audio: グローバル化の進展に伴い、異文化理解の重要性が一層高まっている。]
What is increasingly important with globalization?',
'["A. Cross-cultural understanding", "B. Economic growth", "C. Technology", "D. Language only"]'::jsonb,
'A', 1),

('jlpt-n1-001-l-002', 'jlpt-n1-sample-001', 'jlpt-n1-001-listening', 2, 'MULTIPLE_CHOICE', '聴解',
'[Audio: この研究成果は、従来の学説を覆すものとして学界に大きな衝撃を与えた。]
What impact did the research have?',
'["A. Overturned conventional theory", "B. Supported existing theory", "C. Had no impact", "D. Was ignored"]'::jsonb,
'A', 1),

('jlpt-n1-001-l-003', 'jlpt-n1-sample-001', 'jlpt-n1-001-listening', 3, 'MULTIPLE_CHOICE', '聴解',
'[Audio: 環境保護と経済発展を両立させることは、容易ならざる課題である。]
What kind of challenge is it?',
'["A. Not easy", "B. Very easy", "C. Impossible", "D. Already solved"]'::jsonb,
'A', 1),

('jlpt-n1-001-l-004', 'jlpt-n1-sample-001', 'jlpt-n1-001-listening', 4, 'MULTIPLE_CHOICE', '聴解',
'[Audio: 彼の功績は、後世に語り継がれるべきものである。]
What should happen to his achievements?',
'["A. Be passed down to posterity", "B. Be forgotten", "C. Be questioned", "D. Be ignored"]'::jsonb,
'A', 1),

('jlpt-n1-001-l-005', 'jlpt-n1-sample-001', 'jlpt-n1-001-listening', 5, 'MULTIPLE_CHOICE', '聴解',
'[Audio: 技術革新もさることながら、人材育成こそが企業発展の鍵を握っている。]
What is the key to corporate development?',
'["A. Human resource development", "B. Only technological innovation", "C. Only capital", "D. Only marketing"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;
