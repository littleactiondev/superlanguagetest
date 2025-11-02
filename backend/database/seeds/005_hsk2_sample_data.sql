-- HSK 2 Sample Test Data (Elementary Level - 300 words)

-- Insert HSK 2 Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('hsk2-sample-001', 'HSK', 'HSK 2', 'HSK 2 模拟考试 - 第1套', 'HSK 2级标准模拟试题，初级汉语能力测试（300词汇）', 55, 13)
ON CONFLICT (id) DO NOTHING;

-- Insert test sections for HSK 2
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('hsk2-001-listening', 'hsk2-sample-001', '听力 (Listening)', 'LISTENING', 25, 5, '听力理解测试，日常对话', 1),
('hsk2-001-reading', 'hsk2-sample-001', '阅读 (Reading)', 'READING', 22, 5, '阅读理解测试，词汇和短句', 2),
('hsk2-001-writing', 'hsk2-sample-001', '书写 (Writing)', 'WRITING', 8, 3, '汉字书写测试', 3)
ON CONFLICT (id) DO NOTHING;

-- Listening Questions (Elementary)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk2-001-l-001', 'hsk2-sample-001', 'hsk2-001-listening', 1, 'MULTIPLE_CHOICE', '第一部分',
'女：你今天去哪儿？
男：我去商店买东西。
问：男的去哪儿？',
'["A. 商店", "B. 学校", "C. 医院", "D. 家"]'::jsonb,
'A', 1),

('hsk2-001-l-002', 'hsk2-sample-001', 'hsk2-001-listening', 2, 'MULTIPLE_CHOICE', '第一部分',
'男：现在几点了？
女：九点半。
问：现在几点？',
'["A. 九点半", "B. 八点半", "C. 十点半", "D. 九点"]'::jsonb,
'A', 1),

('hsk2-001-l-003', 'hsk2-sample-001', 'hsk2-001-listening', 3, 'MULTIPLE_CHOICE', '第一部分',
'女：你喜欢喝茶还是喝咖啡？
男：我喜欢喝茶。
问：男的喜欢喝什么？',
'["A. 茶", "B. 咖啡", "C. 水", "D. 牛奶"]'::jsonb,
'A', 1),

('hsk2-001-l-004', 'hsk2-sample-001', 'hsk2-001-listening', 4, 'MULTIPLE_CHOICE', '第一部分',
'男：你的手机在哪儿？
女：在桌子上。
问：手机在哪儿？',
'["A. 桌子上", "B. 椅子上", "C. 包里", "D. 不知道"]'::jsonb,
'A', 1),

('hsk2-001-l-005', 'hsk2-sample-001', 'hsk2-001-listening', 5, 'MULTIPLE_CHOICE', '第一部分',
'女：明天天气怎么样？
男：明天会下雨。
问：明天天气怎么样？',
'["A. 下雨", "B. 晴天", "C. 下雪", "D. 刮风"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Reading Questions (Elementary Vocabulary)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk2-001-r-001', 'hsk2-sample-001', 'hsk2-001-reading', 1, 'MULTIPLE_CHOICE', '第二部分',
'他每天早上___跑步。
(He goes running every morning.)',
'["A. 去", "B. 在", "C. 有", "D. 是"]'::jsonb,
'A', 1),

('hsk2-001-r-002', 'hsk2-sample-001', 'hsk2-001-reading', 2, 'MULTIPLE_CHOICE', '第二部分',
'这个苹果___那个贵。
(This apple is more expensive than that one.)',
'["A. 比", "B. 和", "C. 跟", "D. 从"]'::jsonb,
'A', 1),

('hsk2-001-r-003', 'hsk2-sample-001', 'hsk2-001-reading', 3, 'MULTIPLE_CHOICE', '第二部分',
'我___坐公共汽车去学校。
(I often take the bus to school.)',
'["A. 常常", "B. 很", "C. 太", "D. 真"]'::jsonb,
'A', 1),

('hsk2-001-r-004', 'hsk2-sample-001', 'hsk2-001-reading', 4, 'MULTIPLE_CHOICE', '第二部分',
'今天___星期三。
(Today is Wednesday.)',
'["A. 是", "B. 有", "C. 在", "D. 了"]'::jsonb,
'A', 1),

('hsk2-001-r-005', 'hsk2-sample-001', 'hsk2-001-reading', 5, 'MULTIPLE_CHOICE', '第二部分',
'她___一个姐姐和一个弟弟。
(She has an older sister and a younger brother.)',
'["A. 有", "B. 是", "C. 在", "D. 很"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Writing Questions
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk2-001-w-001', 'hsk2-sample-001', 'hsk2-001-writing', 1, 'MULTIPLE_CHOICE', '第三部分',
'wǒ měi tiān zuò gōnggòng qìchē (I take the bus every day)
正确的顺序是：',
'["A. 我每天坐公共汽车", "B. 每天我坐公共汽车", "C. 坐公共汽车我每天", "D. 公共汽车每天坐我"]'::jsonb,
'A', 1),

('hsk2-001-w-002', 'hsk2-sample-001', 'hsk2-001-writing', 2, 'MULTIPLE_CHOICE', '第三部分',
'tā bǐ wǒ gāo (He/She is taller than me)
正确的汉字是：',
'["A. 他比我高", "B. 他和我高", "C. 他很我高", "D. 他从我高"]'::jsonb,
'A', 1),

('hsk2-001-w-003', 'hsk2-sample-001', 'hsk2-001-writing', 3, 'MULTIPLE_CHOICE', '第三部分',
'jīn tiān tiān qì hěn hǎo (The weather is very good today)
正确的汉字是：',
'["A. 今天天气很好", "B. 今天气天很好", "C. 天气今天很好", "D. 很好今天天气"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;
