import express from 'express';
import {
  getAllExams,
  getTestsByExam,
  getTestDetails,
  getTestQuestions,
  submitTest
} from '../controllers/examController.js';

const router = express.Router();

// Get all exam types
router.get('/exams', getAllExams);

// Get tests for a specific exam type
router.get('/exams/:examType/tests', getTestsByExam);

// Get test details
router.get('/tests/:testId', getTestDetails);

// Get test questions
router.get('/tests/:testId/questions', getTestQuestions);

// Submit test answers
router.post('/tests/:testId/submit', submitTest);

export default router;
