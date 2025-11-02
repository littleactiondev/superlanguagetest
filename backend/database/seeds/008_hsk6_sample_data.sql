-- HSK 6 Sample Test Data (Advanced Level - 5000+ words)

-- Insert HSK 6 Test
INSERT INTO tests (id, exam_type, level, title, description, duration, total_questions) VALUES
('hsk6-sample-001', 'HSK', 'HSK 6', 'HSK 6 模拟考试 - 第1套', 'HSK 6级标准模拟试题，高级汉语能力测试（5000+词汇）', 140, 15)
ON CONFLICT (id) DO NOTHING;

-- Insert test sections for HSK 6
INSERT INTO test_sections (id, test_id, name, type, duration, question_count, description, display_order) VALUES
('hsk6-001-listening', 'hsk6-sample-001', '听力 (Listening)', 'LISTENING', 35, 5, '听力理解测试，学术讲座和深度访谈', 1),
('hsk6-001-reading', 'hsk6-sample-001', '阅读 (Reading)', 'READING', 50, 7, '阅读理解测试，学术文章和文学作品', 2),
('hsk6-001-writing', 'hsk6-sample-001', '书写 (Writing)', 'WRITING', 45, 3, '阅读缩写和议论文写作', 3)
ON CONFLICT (id) DO NOTHING;

-- Listening Questions (Advanced)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk6-001-l-001', 'hsk6-sample-001', 'hsk6-001-listening', 1, 'MULTIPLE_CHOICE', '第一部分',
'在当今知识经济时代，创新能力已成为国家核心竞争力的关键要素。然而，创新并非一蹴而就，它需要长期的积累和持续的投入。发达国家的经验表明，只有建立健全的创新体系，营造良好的创新氛围，才能激发全社会的创新活力。我国政府高度重视创新驱动发展战略，将科技创新置于国家发展全局的核心位置。
问：这段话的核心观点是什么？',
'["A. 创新需要体系建设和长期投入", "B. 创新可以短期实现", "C. 发达国家不重视创新", "D. 政府不应该干预创新"]'::jsonb,
'A', 1),

('hsk6-001-l-002', 'hsk6-sample-001', 'hsk6-001-listening', 2, 'MULTIPLE_CHOICE', '第一部分',
'中国古代哲学思想博大精深，其中蕴含的辩证思维对现代社会依然具有重要的启迪意义。儒家强调"中庸之道"，主张凡事不走极端；道家崇尚"道法自然"，提倡顺应规律；而法家注重制度建设，强调依法治国。这些思想虽然产生于数千年前，但其核心理念至今仍具现实意义。
问：这段话想说明什么？',
'["A. 古代哲学思想对现代仍有启发", "B. 古代思想已经过时", "C. 只有儒家思想有价值", "D. 现代不需要古代哲学"]'::jsonb,
'A', 1),

('hsk6-001-l-003', 'hsk6-sample-001', 'hsk6-001-listening', 3, 'MULTIPLE_CHOICE', '第一部分',
'语言不仅是交流的工具，更是文化的载体和思维的体现。不同语言背后反映着不同民族的世界观和价值观。语言的多样性是人类文化多样性的重要体现。然而，在全球化浪潮中，许多少数民族语言正面临消亡的危险。保护语言多样性，就是保护人类文化的多样性，这需要全社会的共同努力。
问：作者认为应该怎样看待语言多样性？',
'["A. 语言多样性需要保护", "B. 语言统一更好", "C. 少数民族语言不重要", "D. 全球化不影响语言"]'::jsonb,
'A', 1),

('hsk6-001-l-004', 'hsk6-sample-001', 'hsk6-001-listening', 4, 'MULTIPLE_CHOICE', '第一部分',
'城市化进程的加快给现代社会带来了诸多挑战。交通拥堵、环境污染、资源紧张等"城市病"日益突出。如何在保持经济发展的同时，实现城市的可持续发展，成为各国政府面临的共同课题。一些城市已经开始尝试建设"智慧城市"，利用现代信息技术提高城市管理效率，改善居民生活质量。这为解决"城市病"提供了新的思路。
问：建设智慧城市的目的是什么？',
'["A. 解决城市化带来的问题", "B. 减慢城市化进程", "C. 增加政府收入", "D. 限制人口增长"]'::jsonb,
'A', 1),

('hsk6-001-l-005', 'hsk6-sample-001', 'hsk6-001-listening', 5, 'MULTIPLE_CHOICE', '第一部分',
'人工智能的发展引发了关于技术伦理的深度思考。一方面，人工智能为人类社会带来了巨大便利；另一方面，它也可能带来失业、隐私泄露等风险。因此，在推动人工智能发展的同时，必须建立相应的伦理规范和法律框架，确保技术发展服务于人类福祉，而不是相反。这需要政府、企业、学术界和公众的共同参与。
问：这段话主要讨论什么问题？',
'["A. 人工智能发展需要伦理规范", "B. 应该停止人工智能发展", "C. 人工智能没有风险", "D. 只有政府需要参与"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;

-- Reading Questions (Advanced Literary & Academic)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk6-001-r-001', 'hsk6-sample-001', 'hsk6-001-reading', 1, 'MULTIPLE_CHOICE', '第二部分',
'这一发现___了传统理论的局限性，为相关研究开辟了新的方向。
(This discovery has revealed the limitations of traditional theory and opened up new directions for related research.)',
'["A. 揭示", "B. 显示", "C. 表示", "D. 提示"]'::jsonb,
'A', 1),

('hsk6-001-r-002', 'hsk6-sample-001', 'hsk6-001-reading', 2, 'MULTIPLE_CHOICE', '第二部分',
'他的学术成就___于其严谨的治学态度和持之以恒的研究精神。
(His academic achievements stem from his rigorous scholarly attitude and persistent research spirit.)',
'["A. 源于", "B. 由于", "C. 因为", "D. 基于"]'::jsonb,
'A', 1),

('hsk6-001-r-003', 'hsk6-sample-001', 'hsk6-001-reading', 3, 'MULTIPLE_CHOICE', '第二部分',
'面对复杂的国际形势，我们必须___清醒的头脑，准确把握时代发展的脉搏。
(Facing the complex international situation, we must maintain a clear mind and accurately grasp the pulse of the times.)',
'["A. 保持", "B. 维持", "C. 继续", "D. 持续"]'::jsonb,
'A', 1),

('hsk6-001-r-004', 'hsk6-sample-001', 'hsk6-001-reading', 4, 'MULTIPLE_CHOICE', '第二部分',
'这部作品___反映了当代社会的深刻矛盾，___具有很强的艺术感染力。
(This work not only reflects the profound contradictions of contemporary society, but also has strong artistic appeal.)',
'["A. 既...又...", "B. 不但...而且...", "C. 虽然...但是...", "D. 因为...所以..."]'::jsonb,
'A', 1),

('hsk6-001-r-005', 'hsk6-sample-001', 'hsk6-001-reading', 5, 'MULTIPLE_CHOICE', '第二部分',
'传统文化的传承___停留在形式上的模仿，更要___其精神实质。
(The inheritance of traditional culture should not only stay at formal imitation, but also grasp its spiritual essence.)',
'["A. 不能...还要...", "B. 不仅...而且...", "C. 虽然...但是...", "D. 既然...就..."]'::jsonb,
'A', 1),

('hsk6-001-r-006', 'hsk6-sample-001', 'hsk6-001-reading', 6, 'MULTIPLE_CHOICE', '第二部分',
'经济全球化是___，任何国家都无法___其外。
(Economic globalization is an irreversible trend, and no country can置身事外.)',
'["A. 大势所趋...置身于", "B. 必然趋势...脱离于", "C. 发展方向...远离于", "D. 时代潮流...逃避于"]'::jsonb,
'A', 1),

('hsk6-001-r-007', 'hsk6-sample-001', 'hsk6-001-reading', 7, 'MULTIPLE_CHOICE', '第二部分',
'科学研究需要___的探索精神，___经得起失败的考验。
(Scientific research requires a persistent spirit of exploration and the ability to withstand the test of failure.)',
'["A. 锲而不舍...同时要", "B. 坚持不懈...并且要", "C. 持之以恒...而且要", "D. 以上都对"]'::jsonb,
'D', 1)
ON CONFLICT (id) DO NOTHING;

-- Writing Questions (Advanced Essay)
INSERT INTO questions (id, test_id, section_id, question_number, type, section, content, options, correct_answer, points) VALUES
('hsk6-001-w-001', 'hsk6-sample-001', 'hsk6-001-writing', 1, 'MULTIPLE_CHOICE', '第三部分',
'选择最符合学术文体的表达：
关于这个问题，学术界___。',
'["A. 存在着不同的观点和看法", "B. 有很多不同的想法", "C. 大家想法不一样", "D. 意见不统一"]'::jsonb,
'A', 1),

('hsk6-001-w-002', 'hsk6-sample-001', 'hsk6-001-writing', 2, 'MULTIPLE_CHOICE', '第三部分',
'选择最恰当的议论文开头：
在讨论传统文化与现代化的关系时，我们___。',
'["A. 应当认识到，二者并非对立而是可以相互融合的", "B. 觉得两个都很重要", "C. 认为传统文化更好", "D. 觉得现代化不需要传统"]'::jsonb,
'A', 1),

('hsk6-001-w-003', 'hsk6-sample-001', 'hsk6-001-writing', 3, 'MULTIPLE_CHOICE', '第三部分',
'选择最符合书面语的结论性表达：
综上所述，___。',
'["A. 可以得出以下结论", "B. 我们知道了", "C. 明白了这个道理", "D. 就是这样"]'::jsonb,
'A', 1)
ON CONFLICT (id) DO NOTHING;
