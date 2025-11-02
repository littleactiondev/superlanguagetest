-- HSK 4 Sample Test Data (Intermediate Level - 1200 words)

-- Insert HSK 4 Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('hsk4-sample-001', 'HSK', 'HSK 4', 'HSK 4 模拟考试 - 第1套', 'HSK 4级标准模拟试题，中级汉语能力测试（1200词汇）', 105, 15)
ON CONFLICT (id) DO NOTHING;

-- Insert test sections for HSK 4
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('hsk4-001-listening', 'hsk4-sample-001', '听力 (Listening)', 'LISTENING', 30, 5, '听力理解测试，日常交流和简短讲话', 1),
('hsk4-001-reading', 'hsk4-sample-001', '阅读 (Reading)', 'READING', 40, 7, '阅读理解测试，文章理解和语法', 2),
('hsk4-001-writing', 'hsk4-sample-001', '书写 (Writing)', 'WRITING', 25, 3, '完成句子和短文写作', 3)
ON CONFLICT (id) DO NOTHING;

-- Listening Questions (Intermediate)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk4-001-l-001', 'hsk4-sample-001', 'hsk4-001-listening', 1, 'MULTIPLE_CHOICE', '第一部分',
'女：听说你最近在学习汉语，怎么样？
男：挺难的，特别是汉字，不过我每天都在练习。
问：关于男的，可以知道什么？',
'["A. 他每天练习汉字", "B. 他觉得汉语很容易", "C. 他不想学汉语了", "D. 他已经学得很好了"]'::jsonb,
'A', 1),

('hsk4-001-l-002', 'hsk4-sample-001', 'hsk4-001-listening', 2, 'MULTIPLE_CHOICE', '第一部分',
'男：你周末有什么打算？
女：我打算去爬山，如果天气好的话。你要不要一起去？
问：女的周末想做什么？',
'["A. 爬山", "B. 看电影", "C. 在家休息", "D. 去图书馆"]'::jsonb,
'A', 1),

('hsk4-001-l-003', 'hsk4-sample-001', 'hsk4-001-listening', 3, 'MULTIPLE_CHOICE', '第一部分',
'女：这个项目必须在下周五之前完成，时间很紧张。
男：没问题，我们加班也要按时完成。
问：他们什么时候必须完成项目？',
'["A. 下周五之前", "B. 这周五之前", "C. 下个月", "D. 没有期限"]'::jsonb,
'A', 1),

('hsk4-001-l-004', 'hsk4-sample-001', 'hsk4-001-listening', 4, 'MULTIPLE_CHOICE', '第一部分',
'男：我把钥匙忘在办公室了，现在进不去家门。
女：那你可以先来我这儿等，我马上下班了。
问：男的遇到了什么问题？',
'["A. 忘记带钥匙", "B. 迷路了", "C. 丢了手机", "D. 生病了"]'::jsonb,
'A', 1),

('hsk4-001-l-005', 'hsk4-sample-001', 'hsk4-001-listening', 5, 'MULTIPLE_CHOICE', '第一部分',
'女：这家餐厅的菜味道不错，就是价格有点贵。
男：是啊，不过环境很好，服务也很周到。
问：关于这家餐厅，下列哪项正确？',
'["A. 菜味道不错但价格贵", "B. 价格便宜但味道不好", "C. 环境不好", "D. 服务态度差"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Reading Questions (Intermediate Grammar & Comprehension)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk4-001-r-001', 'hsk4-sample-001', 'hsk4-001-reading', 1, 'MULTIPLE_CHOICE', '第二部分',
'___天气预报，明天会下大雨，大家出门要带伞。
(According to the weather forecast, it will rain heavily tomorrow.)',
'["A. 根据", "B. 按照", "C. 由于", "D. 关于"]'::jsonb,
'A', 1),

('hsk4-001-r-002', 'hsk4-sample-001', 'hsk4-001-reading', 2, 'MULTIPLE_CHOICE', '第二部分',
'这个问题___复杂，我需要更多时间思考。
(This problem is quite complex, I need more time to think.)',
'["A. 相当", "B. 太", "C. 特别", "D. 非常"]'::jsonb,
'A', 1),

('hsk4-001-r-003', 'hsk4-sample-001', 'hsk4-001-reading', 3, 'MULTIPLE_CHOICE', '第二部分',
'他虽然年纪大了，___身体还很健康。
(Although he is old, his health is still good.)',
'["A. 但是", "B. 因为", "C. 所以", "D. 而且"]'::jsonb,
'A', 1),

('hsk4-001-r-004', 'hsk4-sample-001', 'hsk4-001-reading', 4, 'MULTIPLE_CHOICE', '第二部分',
'为了___环境，我们应该少用塑料袋。
(To protect the environment, we should use fewer plastic bags.)',
'["A. 保护", "B. 保持", "C. 保存", "D. 保证"]'::jsonb,
'A', 1),

('hsk4-001-r-005', 'hsk4-sample-001', 'hsk4-001-reading', 5, 'MULTIPLE_CHOICE', '第二部分',
'这本书的内容很有趣，___吸引了很多读者。
(The content of this book is interesting and has attracted many readers.)',
'["A. 因此", "B. 然后", "C. 但是", "D. 虽然"]'::jsonb,
'A', 1),

('hsk4-001-r-006', 'hsk4-sample-001', 'hsk4-001-reading', 6, 'MULTIPLE_CHOICE', '第二部分',
'学习外语不仅要掌握语法，___要多练习口语。
(Learning a foreign language requires not only mastering grammar but also practicing speaking.)',
'["A. 而且", "B. 但是", "C. 或者", "D. 因为"]'::jsonb,
'A', 1),

('hsk4-001-r-007', 'hsk4-sample-001', 'hsk4-001-reading', 7, 'MULTIPLE_CHOICE', '第二部分',
'他对中国文化___了很深的研究。
(He has conducted deep research on Chinese culture.)',
'["A. 进行", "B. 发生", "C. 产生", "D. 出现"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Writing Questions (Sentence Completion)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk4-001-w-001', 'hsk4-sample-001', 'hsk4-001-writing', 1, 'MULTIPLE_CHOICE', '第三部分',
'选择正确的词语顺序：
学习 / 为了 / 汉语 / 来到 / 我 / 中国',
'["A. 为了学习汉语我来到中国", "B. 我来到中国为了学习汉语", "C. 学习汉语我来到为了中国", "D. 中国来到我为了学习汉语"]'::jsonb,
'A', 1),

('hsk4-001-w-002', 'hsk4-sample-001', 'hsk4-001-writing', 2, 'MULTIPLE_CHOICE', '第三部分',
'选择正确的关联词：
他工作很忙，___每天都坚持锻炼身体。',
'["A. 但是", "B. 因为", "C. 所以", "D. 如果"]'::jsonb,
'A', 1),

('hsk4-001-w-003', 'hsk4-sample-001', 'hsk4-001-writing', 3, 'MULTIPLE_CHOICE', '第三部分',
'选择最恰当的表达：
这个城市的交通___。',
'["A. 越来越方便", "B. 很方便越来越", "C. 越来越很方便", "D. 方便越来越很"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;
