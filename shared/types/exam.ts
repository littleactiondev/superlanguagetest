export enum ExamType {
  TOEIC = 'TOEIC',
  TOEFL = 'TOEFL',
  IELTS = 'IELTS',
  JLPT = 'JLPT',
  HSK = 'HSK',
  TOPIK = 'TOPIK'
}

export interface ExamInfo {
  id: ExamType;
  name: string;
  fullName: string;
  description: string;
  language: string;
  levels: string[];
  isAvailable: boolean;
  icon: string;
}

export enum QuestionType {
  MULTIPLE_CHOICE = 'MULTIPLE_CHOICE',
  LISTENING = 'LISTENING',
  READING = 'READING',
  WRITING = 'WRITING',
  SPEAKING = 'SPEAKING'
}

export interface Question {
  id: string;
  testId: string;
  questionNumber: number;
  type: QuestionType;
  section: string;
  content: string;
  options?: string[];
  correctAnswer: string;
  audioUrl?: string;
  imageUrl?: string;
  points: number;
}

export interface Test {
  id: string;
  examType: ExamType;
  level: string;
  title: string;
  description: string;
  duration: number; // in minutes
  totalQuestions: number;
  sections: TestSection[];
  createdAt: Date;
}

export interface TestSection {
  id: string;
  name: string;
  type: QuestionType;
  duration: number;
  questionCount: number;
  description: string;
}

export interface UserAttempt {
  id: string;
  userId: string;
  testId: string;
  startTime: Date;
  endTime?: Date;
  score?: number;
  maxScore: number;
  answers: UserAnswer[];
  status: 'IN_PROGRESS' | 'COMPLETED' | 'ABANDONED';
}

export interface UserAnswer {
  questionId: string;
  answer: string;
  isCorrect?: boolean;
  timeSpent: number; // in seconds
}

export interface TestResult {
  attemptId: string;
  testId: string;
  examType: ExamType;
  score: number;
  maxScore: number;
  percentage: number;
  correctAnswers: number;
  totalQuestions: number;
  sectionResults: SectionResult[];
  completedAt: Date;
}

export interface SectionResult {
  sectionName: string;
  score: number;
  maxScore: number;
  correctAnswers: number;
  totalQuestions: number;
  percentage: number;
}
