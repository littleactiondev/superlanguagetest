import axios from 'axios';

const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:5000/api';

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

export interface ExamInfo {
  id: string;
  name: string;
  fullName: string;
  description: string;
  language: string;
  levels: string[];
  isAvailable: boolean;
  icon: string;
}

export interface Test {
  id: string;
  examType: string;
  level: string;
  title: string;
  description: string;
  duration: number;
  totalQuestions: number;
  sectionCount: number;
  createdAt: string;
}

export interface TestDetails extends Test {
  sections: TestSection[];
}

export interface TestSection {
  id: string;
  name: string;
  type: string;
  duration: number;
  questionCount: number;
  description: string;
}

export interface Question {
  id: string;
  testId: string;
  questionNumber: number;
  type: string;
  section: string;
  content: string;
  options?: string[];
  audioUrl?: string;
  imageUrl?: string;
  points: number;
}

export interface UserAnswer {
  questionId: string;
  answer: string;
  timeSpent?: number;
}

export interface TestResult {
  testId: string;
  examType: string;
  score: number;
  maxScore: number;
  percentage: number;
  correctAnswers: number;
  totalQuestions: number;
  sectionResults: SectionResult[];
  answers: CheckedAnswer[];
  completedAt: string;
}

export interface SectionResult {
  sectionName: string;
  score: number;
  maxScore: number;
  correctAnswers: number;
  totalQuestions: number;
  percentage: number;
}

export interface CheckedAnswer {
  questionId: string;
  answer: string;
  isCorrect: boolean;
  correctAnswer: string;
  timeSpent: number;
}

// API functions
export const examApi = {
  getAllExams: async (): Promise<ExamInfo[]> => {
    const response = await api.get('/exams');
    return response.data;
  },

  getTestsByExam: async (examType: string): Promise<Test[]> => {
    const response = await api.get(`/exams/${examType}/tests`);
    return response.data;
  },

  getTestDetails: async (testId: string): Promise<TestDetails> => {
    const response = await api.get(`/tests/${testId}`);
    return response.data;
  },

  getTestQuestions: async (testId: string): Promise<Question[]> => {
    const response = await api.get(`/tests/${testId}/questions`);
    return response.data;
  },

  submitTest: async (testId: string, answers: UserAnswer[], startTime: Date, endTime: Date): Promise<TestResult> => {
    const response = await api.post(`/tests/${testId}/submit`, {
      answers,
      startTime,
      endTime,
    });
    return response.data;
  },
};

export default api;
