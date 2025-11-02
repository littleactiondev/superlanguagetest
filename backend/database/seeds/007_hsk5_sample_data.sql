-- HSK 5 Sample Test Data (Upper Intermediate Level - 2500 words)

-- Insert HSK 5 Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('hsk5-sample-001', 'HSK', 'HSK 5', 'HSK 5 模拟考试 - 第1套', 'HSK 5级标准模拟试题，中高级汉语能力测试（2500词汇）', 125, 15)
ON CONFLICT (id) DO NOTHING;

-- Insert test sections for HSK 5
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('hsk5-001-listening', 'hsk5-sample-001', '听力 (Listening)', 'LISTENING', 30, 5, '听力理解测试，新闻报道和专题讲座', 1),
('hsk5-001-reading', 'hsk5-sample-001', '阅读 (Reading)', 'READING', 45, 7, '阅读理解测试，报刊文章和专业文章', 2),
('hsk5-001-writing', 'hsk5-sample-001', '书写 (Writing)', 'WRITING', 40, 3, '阅读缩写和命题作文', 3)
ON CONFLICT (id) DO NOTHING;

-- Listening Questions (Upper Intermediate)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk5-001-l-001', 'hsk5-sample-001', 'hsk5-001-listening', 1, 'MULTIPLE_CHOICE', '第一部分',
'随着科技的发展，人工智能已经逐渐渗透到我们生活的各个领域。从智能手机到自动驾驶汽车，人工智能正在改变着我们的生活方式。专家预测，未来十年内，人工智能将在医疗、教育等领域发挥更大的作用。
问：根据这段话，下列哪项正确？',
'["A. 人工智能正在改变人们的生活方式", "B. 人工智能只用于手机", "C. 人工智能已经完全取代人类", "D. 专家反对人工智能发展"]'::jsonb,
'A', 1),

('hsk5-001-l-002', 'hsk5-sample-001', 'hsk5-001-listening', 2, 'MULTIPLE_CHOICE', '第一部分',
'中国传统文化强调和谐共处的理念。这种理念不仅体现在人际关系上，也体现在人与自然的关系中。古人提倡"天人合一"，认为人应该尊重自然、顺应自然。这种思想对现代环境保护具有重要的启示意义。
问：这段话主要想表达什么？',
'["A. 传统文化对现代环保有启示", "B. 古人不重视环境", "C. 人际关系最重要", "D. 自然不需要保护"]'::jsonb,
'A', 1),

('hsk5-001-l-003', 'hsk5-sample-001', 'hsk5-001-listening', 3, 'MULTIPLE_CHOICE', '第一部分',
'近年来，随着生活节奏的加快，人们的压力越来越大。心理健康问题日益受到社会的关注。专家建议，要保持良好的心理状态，除了适当的运动和休息，还应该学会调节情绪，培养积极乐观的生活态度。
问：专家认为如何保持良好心理状态？',
'["A. 运动、休息并调节情绪", "B. 只需要运动", "C. 不需要休息", "D. 压力对健康有益"]'::jsonb,
'A', 1),

('hsk5-001-l-004', 'hsk5-sample-001', 'hsk5-001-listening', 4, 'MULTIPLE_CHOICE', '第一部分',
'电子商务的快速发展给传统零售业带来了巨大挑战。许多实体店不得不转型，寻求线上线下相结合的经营模式。然而，实体店也有其独特的优势，比如可以让顾客直接体验商品，这是网络购物无法替代的。
问：关于实体店，可以知道什么？',
'["A. 实体店有网购无法替代的优势", "B. 实体店将完全消失", "C. 实体店比网购更便宜", "D. 实体店不需要转型"]'::jsonb,
'A', 1),

('hsk5-001-l-005', 'hsk5-sample-001', 'hsk5-001-listening', 5, 'MULTIPLE_CHOICE', '第一部分',
'在全球化背景下，跨文化交流变得越来越重要。了解不同文化的价值观和习俗，不仅有助于避免误解，还能促进国际合作。语言作为文化的载体，在跨文化交流中起着关键作用。因此，学习外语不仅是学习一种工具，更是理解另一种文化的窗口。
问：这段话认为学习外语的意义是什么？',
'["A. 理解不同文化的窗口", "B. 只是一种工具", "C. 没有必要", "D. 只为了找工作"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Reading Questions (Advanced Grammar & Comprehension)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk5-001-r-001', 'hsk5-sample-001', 'hsk5-001-reading', 1, 'MULTIPLE_CHOICE', '第二部分',
'这项政策的实施___引起了社会各界的广泛关注和热烈讨论。
(The implementation of this policy has aroused widespread attention and heated discussion.)',
'["A. 无疑", "B. 未必", "C. 难免", "D. 不免"]'::jsonb,
'A', 1),

('hsk5-001-r-002', 'hsk5-sample-001', 'hsk5-001-reading', 2, 'MULTIPLE_CHOICE', '第二部分',
'经过多年的努力，该公司___在国际市场上占据了一席之地。
(After years of effort, the company has finally secured a place in the international market.)',
'["A. 终于", "B. 居然", "C. 竟然", "D. 果然"]'::jsonb,
'A', 1),

('hsk5-001-r-003', 'hsk5-sample-001', 'hsk5-001-reading', 3, 'MULTIPLE_CHOICE', '第二部分',
'___取得了显著成就，但我们仍需继续努力，不能骄傲自满。
(Although we have achieved remarkable results, we still need to continue our efforts.)',
'["A. 尽管", "B. 因为", "C. 既然", "D. 如果"]'::jsonb,
'A', 1),

('hsk5-001-r-004', 'hsk5-sample-001', 'hsk5-001-reading', 4, 'MULTIPLE_CHOICE', '第二部分',
'这个理论___新颖，___具有很强的实践指导意义。
(This theory is not only novel, but also has strong practical guiding significance.)',
'["A. 不仅...而且...", "B. 虽然...但是...", "C. 因为...所以...", "D. 如果...就..."]'::jsonb,
'A', 1),

('hsk5-001-r-005', 'hsk5-sample-001', 'hsk5-001-reading', 5, 'MULTIPLE_CHOICE', '第二部分',
'在激烈的市场竞争中，企业必须___创新，才能保持竞争力。
(In fierce market competition, enterprises must continue to innovate to maintain competitiveness.)',
'["A. 不断", "B. 不断地", "C. 继续", "D. 一直"]'::jsonb,
'A', 1),

('hsk5-001-r-006', 'hsk5-sample-001', 'hsk5-001-reading', 6, 'MULTIPLE_CHOICE', '第二部分',
'他的演讲___内容丰富，___条理清晰，给听众留下了深刻印象。
(His speech was not only rich in content but also clear in organization.)',
'["A. 既...又...", "B. 不是...就是...", "C. 要么...要么...", "D. 宁可...也不..."]'::jsonb,
'A', 1),

('hsk5-001-r-007', 'hsk5-sample-001', 'hsk5-001-reading', 7, 'MULTIPLE_CHOICE', '第二部分',
'这种现象的出现___偶然，而是多种因素综合作用的结果。
(The emergence of this phenomenon is not accidental, but the result of the combined action of multiple factors.)',
'["A. 并非", "B. 不是", "C. 并不", "D. 未必"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Writing Questions (Advanced Composition)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk5-001-w-001', 'hsk5-sample-001', 'hsk5-001-writing', 1, 'MULTIPLE_CHOICE', '第三部分',
'选择最恰当的表达方式：
关于环境保护，我们___。',
'["A. 应该从自身做起，从小事做起", "B. 应该做起从小事从自身", "C. 从自身应该做起从小事", "D. 从小事从自身做起应该"]'::jsonb,
'A', 1),

('hsk5-001-w-002', 'hsk5-sample-001', 'hsk5-001-writing', 2, 'MULTIPLE_CHOICE', '第三部分',
'选择最符合书面语的表达：
虽然困难重重，但是我们___。',
'["A. 绝不会轻言放弃", "B. 不会放弃的", "C. 不想放弃", "D. 肯定不放弃"]'::jsonb,
'A', 1),

('hsk5-001-w-003', 'hsk5-sample-001', 'hsk5-001-writing', 3, 'MULTIPLE_CHOICE', '第三部分',
'选择最恰当的关联词组合：
___认真准备，___能取得好成绩。',
'["A. 只有...才...", "B. 如果...就...", "C. 虽然...但是...", "D. 不仅...而且..."]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;
