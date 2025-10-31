import { Request, Response } from 'express';
import pool from '../config/database.js';

// Get all exams
export async function getAllExams(_req: Request, res: Response) {
  try {
    const result = await pool.query(`
      SELECT e.*,
        ARRAY_AGG(el.level_name ORDER BY el.display_order) as levels
      FROM exams e
      LEFT JOIN exam_levels el ON e.id = el.exam_id
      GROUP BY e.id
      ORDER BY
        CASE e.id
          WHEN 'TOEIC' THEN 1
          WHEN 'TOEFL' THEN 2
          WHEN 'IELTS' THEN 3
          WHEN 'JLPT' THEN 4
          WHEN 'HSK' THEN 5
          WHEN 'TOPIK' THEN 6
        END
    `);

    const exams = result.rows.map(row => ({
      id: row.id,
      name: row.name,
      fullName: row.full_name,
      description: row.description,
      language: row.language,
      levels: row.levels || [],
      isAvailable: row.is_available,
      icon: row.icon
    }));

    res.json(exams);
  } catch (error) {
    console.error('Error fetching exams:', error);
    res.status(500).json({ error: 'Failed to fetch exams' });
  }
}

// Get tests for a specific exam
export async function getTestsByExam(req: Request, res: Response) {
  try {
    const { examType } = req.params;

    const result = await pool.query(
      `SELECT t.*,
        (SELECT COUNT(*) FROM test_sections WHERE test_id = t.id) as section_count
      FROM tests t
      WHERE t.exam_type = $1
      ORDER BY t.created_at DESC`,
      [examType]
    );

    const tests = result.rows.map(row => ({
      id: row.id,
      examType: row.exam_type,
      level: row.level,
      title: row.title,
      description: row.description,
      duration: row.duration,
      totalQuestions: row.total_questions,
      sectionCount: parseInt(row.section_count),
      createdAt: row.created_at
    }));

    res.json(tests);
  } catch (error) {
    console.error('Error fetching tests:', error);
    res.status(500).json({ error: 'Failed to fetch tests' });
  }
}

// Get test details with sections
export async function getTestDetails(req: Request, res: Response) {
  try {
    const { testId } = req.params;

    // Get test info
    const testResult = await pool.query(
      'SELECT * FROM tests WHERE id = $1',
      [testId]
    );

    if (testResult.rows.length === 0) {
      return res.status(404).json({ error: 'Test not found' });
    }

    // Get sections
    const sectionsResult = await pool.query(
      `SELECT * FROM test_sections
       WHERE test_id = $1
       ORDER BY display_order`,
      [testId]
    );

    const test = {
      id: testResult.rows[0].id,
      examType: testResult.rows[0].exam_type,
      level: testResult.rows[0].level,
      title: testResult.rows[0].title,
      description: testResult.rows[0].description,
      duration: testResult.rows[0].duration,
      totalQuestions: testResult.rows[0].total_questions,
      sections: sectionsResult.rows.map(s => ({
        id: s.id,
        name: s.name,
        type: s.type,
        duration: s.duration,
        questionCount: s.question_count,
        description: s.description
      })),
      createdAt: testResult.rows[0].created_at
    };

    res.json(test);
  } catch (error) {
    console.error('Error fetching test details:', error);
    res.status(500).json({ error: 'Failed to fetch test details' });
  }
}

// Get questions for a test
export async function getTestQuestions(req: Request, res: Response) {
  try {
    const { testId } = req.params;

    const result = await pool.query(
      `SELECT * FROM questions
       WHERE test_id = $1
       ORDER BY question_number`,
      [testId]
    );

    const questions = result.rows.map(row => ({
      id: row.id,
      testId: row.test_id,
      questionNumber: row.question_number,
      type: row.type,
      section: row.section,
      content: row.content,
      options: row.options,
      audioUrl: row.audio_url,
      imageUrl: row.image_url,
      points: row.points,
      // Don't send correct answer to client
    }));

    res.json(questions);
  } catch (error) {
    console.error('Error fetching questions:', error);
    res.status(500).json({ error: 'Failed to fetch questions' });
  }
}

// Submit test answers and get results
export async function submitTest(req: Request, res: Response) {
  try {
    const { testId } = req.params;
    const { answers } = req.body;

    // Get all questions with correct answers
    const questionsResult = await pool.query(
      'SELECT * FROM questions WHERE test_id = $1',
      [testId]
    );

    const questions = questionsResult.rows;
    let totalScore = 0;
    let maxScore = 0;
    let correctCount = 0;

    const sectionResults: { [key: string]: any } = {};

    // Check answers
    const checkedAnswers = answers.map((userAnswer: any) => {
      const question = questions.find(q => q.id === userAnswer.questionId);
      if (!question) return null;

      const isCorrect = userAnswer.answer.trim() === question.correct_answer.trim();
      maxScore += question.points;

      if (isCorrect) {
        totalScore += question.points;
        correctCount++;
      }

      // Track section results
      if (!sectionResults[question.section]) {
        sectionResults[question.section] = {
          sectionName: question.section,
          score: 0,
          maxScore: 0,
          correctAnswers: 0,
          totalQuestions: 0
        };
      }

      sectionResults[question.section].maxScore += question.points;
      sectionResults[question.section].totalQuestions++;
      if (isCorrect) {
        sectionResults[question.section].score += question.points;
        sectionResults[question.section].correctAnswers++;
      }

      return {
        questionId: userAnswer.questionId,
        answer: userAnswer.answer,
        isCorrect,
        correctAnswer: question.correct_answer,
        timeSpent: userAnswer.timeSpent || 0
      };
    }).filter(Boolean);

    // Calculate section percentages
    const sectionResultsArray = Object.values(sectionResults).map((sr: any) => ({
      ...sr,
      percentage: Math.round((sr.score / sr.maxScore) * 100)
    }));

    // Get test info
    const testResult = await pool.query('SELECT * FROM tests WHERE id = $1', [testId]);
    const test = testResult.rows[0];

    const result = {
      testId,
      examType: test.exam_type,
      score: totalScore,
      maxScore,
      percentage: Math.round((totalScore / maxScore) * 100),
      correctAnswers: correctCount,
      totalQuestions: questions.length,
      sectionResults: sectionResultsArray,
      answers: checkedAnswers,
      completedAt: new Date()
    };

    res.json(result);
  } catch (error) {
    console.error('Error submitting test:', error);
    res.status(500).json({ error: 'Failed to submit test' });
  }
}
