-- HSK 1 Sample Test Data (Beginner Level - 150 words)

-- Insert HSK 1 Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('hsk1-sample-001', 'HSK', 'HSK 1', 'HSK 1 模拟考试 - 第1套', 'HSK 1级标准模拟试题，基础汉语能力测试（150词汇）', 40, 13)
ON CONFLICT (id) DO NOTHING;

-- Insert test sections for HSK 1
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('hsk1-001-listening', 'hsk1-sample-001', '听力 (Listening)', 'LISTENING', 15, 5, '听力理解测试，基础对话', 1),
('hsk1-001-reading', 'hsk1-sample-001', '阅读 (Reading)', 'READING', 17, 5, '阅读理解测试，基础词汇和句子', 2),
('hsk1-001-writing', 'hsk1-sample-001', '书写 (Writing)', 'WRITING', 8, 3, '基础汉字书写', 3)
ON CONFLICT (id) DO NOTHING;

-- Listening Questions (Very Basic)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk1-001-l-001', 'hsk1-sample-001', 'hsk1-001-listening', 1, 'MULTIPLE_CHOICE', '第一部分',
'男：你好！
女：你好！
问：女的说什么？',
'["A. 你好", "B. 再见", "C. 谢谢", "D. 对不起"]'::jsonb,
'A', 1),

('hsk1-001-l-002', 'hsk1-sample-001', 'hsk1-001-listening', 2, 'MULTIPLE_CHOICE', '第一部分',
'女：这是什么？
男：这是书。
问：这是什么？',
'["A. 书", "B. 水", "C. 人", "D. 桌子"]'::jsonb,
'A', 1),

('hsk1-001-l-003', 'hsk1-sample-001', 'hsk1-001-listening', 3, 'MULTIPLE_CHOICE', '第一部分',
'男：你叫什么名字？
女：我叫李月。
问：女的叫什么名字？',
'["A. 李月", "B. 王月", "C. 李明", "D. 王明"]'::jsonb,
'A', 1),

('hsk1-001-l-004', 'hsk1-sample-001', 'hsk1-001-listening', 4, 'MULTIPLE_CHOICE', '第一部分',
'女：你是学生吗？
男：是，我是学生。
问：男的是什么？',
'["A. 学生", "B. 老师", "C. 医生", "D. 妈妈"]'::jsonb,
'A', 1),

('hsk1-001-l-005', 'hsk1-sample-001', 'hsk1-001-listening', 5, 'MULTIPLE_CHOICE', '第一部分',
'男：你吃饭了吗？
女：吃了，谢谢。
问：女的吃饭了吗？',
'["A. 吃了", "B. 没吃", "C. 不知道", "D. 不想吃"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Reading Questions (Basic Vocabulary & Sentences)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk1-001-r-001', 'hsk1-sample-001', 'hsk1-001-reading', 1, 'MULTIPLE_CHOICE', '第二部分',
'我是学生。你___？
(I am a student. What about you?)',
'["A. 呢", "B. 吗", "C. 的", "D. 了"]'::jsonb,
'A', 1),

('hsk1-001-r-002', 'hsk1-sample-001', 'hsk1-001-reading', 2, 'MULTIPLE_CHOICE', '第二部分',
'这___我的书。
(This is my book.)',
'["A. 是", "B. 有", "C. 在", "D. 了"]'::jsonb,
'A', 1),

('hsk1-001-r-003', 'hsk1-sample-001', 'hsk1-001-reading', 3, 'MULTIPLE_CHOICE', '第二部分',
'我___中国人。
(I am Chinese.)',
'["A. 是", "B. 有", "C. 在", "D. 很"]'::jsonb,
'A', 1),

('hsk1-001-r-004', 'hsk1-sample-001', 'hsk1-001-reading', 4, 'MULTIPLE_CHOICE', '第二部分',
'他___老师。
(He is a teacher.)',
'["A. 是", "B. 叫", "C. 有", "D. 在"]'::jsonb,
'A', 1),

('hsk1-001-r-005', 'hsk1-sample-001', 'hsk1-001-reading', 5, 'MULTIPLE_CHOICE', '第二部分',
'这是___？
(What is this?)',
'["A. 什么", "B. 哪里", "C. 谁", "D. 怎么"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Writing Questions (Basic Characters)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk1-001-w-001', 'hsk1-sample-001', 'hsk1-001-writing', 1, 'MULTIPLE_CHOICE', '第三部分',
'nǐ hǎo (Hello)
正确的汉字是：',
'["A. 你好", "B. 您好", "C. 再见", "D. 谢谢"]'::jsonb,
'A', 1),

('hsk1-001-w-002', 'hsk1-sample-001', 'hsk1-001-writing', 2, 'MULTIPLE_CHOICE', '第三部分',
'wǒ shì xuéshēng (I am a student)
正确的汉字是：',
'["A. 我是学生", "B. 你是学生", "C. 他是学生", "D. 我是老师"]'::jsonb,
'A', 1),

('hsk1-001-w-003', 'hsk1-sample-001', 'hsk1-001-writing', 3, 'MULTIPLE_CHOICE', '第三部分',
'xiè xie (Thank you)
正确的汉字是：',
'["A. 谢谢", "B. 对不起", "C. 再见", "D. 没关系"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;
