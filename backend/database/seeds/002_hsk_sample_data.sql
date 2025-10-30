-- Insert HSK 3 Sample Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('hsk3-sample-001', 'HSK', 'HSK 3', 'HSK 3 模拟考试 - 第1套', 'HSK 3级标准模拟试题，包含听力、阅读和书写部分', 90, 80);

-- Insert test sections for HSK 3
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('hsk3-001-listening', 'hsk3-sample-001', '听力 (Listening)', 'LISTENING', 35, 40, '听力理解测试，包含对话和短文', 1),
('hsk3-001-reading', 'hsk3-sample-001', '阅读 (Reading)', 'READING', 30, 30, '阅读理解测试，包含词汇、句子和短文', 2),
('hsk3-001-writing', 'hsk3-sample-001', '书写 (Writing)', 'WRITING', 25, 10, '汉字书写测试', 3);

-- Insert sample listening questions (Part 1: 对话理解)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk3-001-l-001', 'hsk3-sample-001', 'hsk3-001-listening', 1, 'MULTIPLE_CHOICE', '第一部分',
'男：你今天怎么这么早就来了？
女：因为今天有很重要的会议。
问：女的为什么来得早？',
'["A. 要开会", "B. 要上课", "C. 要考试", "D. 要吃饭"]'::jsonb,
'A', 1),

('hsk3-001-l-002', 'hsk3-sample-001', 'hsk3-001-listening', 2, 'MULTIPLE_CHOICE', '第一部分',
'女：这件衣服多少钱？
男：原价200元，现在打8折。
问：这件衣服现在多少钱？',
'["A. 200元", "B. 180元", "C. 160元", "D. 150元"]'::jsonb,
'C', 1),

('hsk3-001-l-003', 'hsk3-sample-001', 'hsk3-001-listening', 3, 'MULTIPLE_CHOICE', '第一部分',
'男：你的汉语说得真好！
女：哪里哪里，我才学了一年。
问：女的学了多长时间汉语？',
'["A. 半年", "B. 一年", "C. 两年", "D. 三年"]'::jsonb,
'B', 1),

('hsk3-001-l-004', 'hsk3-sample-001', 'hsk3-001-listening', 4, 'MULTIPLE_CHOICE', '第一部分',
'女：你周末想做什么？
男：我想去爬山，你呢？
问：男的周末想做什么？',
'["A. 游泳", "B. 爬山", "C. 看电影", "D. 购物"]'::jsonb,
'B', 1),

('hsk3-001-l-005', 'hsk3-sample-001', 'hsk3-001-listening', 5, 'MULTIPLE_CHOICE', '第一部分',
'男：你的自行车是新买的吗？
女：不是，是我朋友送的。
问：女的自行车是怎么来的？',
'["A. 买的", "B. 借的", "C. 朋友送的", "D. 租的"]'::jsonb,
'C', 1);

-- Insert sample reading questions (Part 1: 词汇)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk3-001-r-001', 'hsk3-sample-001', 'hsk3-001-reading', 41, 'MULTIPLE_CHOICE', '第一部分',
'他___很努力，所以成绩很好。',
'["A. 学习", "B. 学生", "C. 学校", "D. 教室"]'::jsonb,
'A', 1),

('hsk3-001-r-002', 'hsk3-sample-001', 'hsk3-001-reading', 42, 'MULTIPLE_CHOICE', '第一部分',
'这个问题太___了，我不会回答。',
'["A. 容易", "B. 简单", "C. 复杂", "D. 轻松"]'::jsonb,
'C', 1),

('hsk3-001-r-003', 'hsk3-sample-001', 'hsk3-001-reading', 43, 'MULTIPLE_CHOICE', '第一部分',
'你能___一下这个词的意思吗？',
'["A. 解释", "B. 明白", "C. 知道", "D. 认识"]'::jsonb,
'A', 1),

('hsk3-001-r-004', 'hsk3-sample-001', 'hsk3-001-reading', 44, 'MULTIPLE_CHOICE', '第一部分',
'我___每天早上跑步。',
'["A. 习惯", "B. 爱好", "C. 兴趣", "D. 喜欢"]'::jsonb,
'A', 1),

('hsk3-001-r-005', 'hsk3-sample-001', 'hsk3-001-reading', 45, 'MULTIPLE_CHOICE', '第一部分',
'她的___很好听，像唱歌一样。',
'["A. 声音", "B. 音乐", "C. 歌曲", "D. 耳朵"]'::jsonb,
'A', 1);

-- Insert sample reading questions (Part 2: 句子)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk3-001-r-006', 'hsk3-sample-001', 'hsk3-001-reading', 46, 'MULTIPLE_CHOICE', '第二部分',
'小明学习很认真，___考试总是得第一名。',
'["A. 但是", "B. 所以", "C. 因为", "D. 虽然"]'::jsonb,
'B', 1),

('hsk3-001-r-007', 'hsk3-sample-001', 'hsk3-001-reading', 47, 'MULTIPLE_CHOICE', '第二部分',
'这本书我已经看过了，你___拿去看吧。',
'["A. 就", "B. 才", "C. 都", "D. 也"]'::jsonb,
'A', 1),

('hsk3-001-r-008', 'hsk3-sample-001', 'hsk3-001-reading', 48, 'MULTIPLE_CHOICE', '第二部分',
'___天气不好，我们还是去爬山了。',
'["A. 虽然", "B. 因为", "C. 如果", "D. 但是"]'::jsonb,
'A', 1);

-- Insert sample writing questions
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk3-001-w-001', 'hsk3-sample-001', 'hsk3-001-writing', 71, 'WRITING', '第一部分',
'把下面的词语组成句子：习惯 / 我 / 了 / 已经 / 这里的生活',
'[]'::jsonb,
'我已经习惯这里的生活了', 2),

('hsk3-001-w-002', 'hsk3-sample-001', 'hsk3-001-writing', 72, 'WRITING', '第一部分',
'把下面的词语组成句子：比 / 今天 / 昨天 / 冷 / 多了',
'[]'::jsonb,
'今天比昨天冷多了', 2),

('hsk3-001-w-003', 'hsk3-sample-001', 'hsk3-001-writing', 73, 'WRITING', '第一部分',
'把下面的词语组成句子：一边 / 一边 / 他 / 吃饭 / 看电视',
'[]'::jsonb,
'他一边吃饭一边看电视', 2);

-- Insert HSK 4 Sample Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('hsk4-sample-001', 'HSK', 'HSK 4', 'HSK 4 模拟考试 - 第1套', 'HSK 4级标准模拟试题', 105, 100);

-- Insert test sections for HSK 4
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('hsk4-001-listening', 'hsk4-sample-001', '听力 (Listening)', 'LISTENING', 30, 45, '听力理解测试', 1),
('hsk4-001-reading', 'hsk4-sample-001', '阅读 (Reading)', 'READING', 40, 40, '阅读理解测试', 2),
('hsk4-001-writing', 'hsk4-sample-001', '书写 (Writing)', 'WRITING', 35, 15, '书写测试', 3);
