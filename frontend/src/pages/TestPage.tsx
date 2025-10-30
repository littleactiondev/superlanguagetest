import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { examApi, Question, TestDetails, UserAnswer } from '../services/api';
import { Clock, AlertCircle, CheckCircle } from 'lucide-react';

const TestPage: React.FC = () => {
  const { testId } = useParams<{ testId: string }>();
  const navigate = useNavigate();

  const [testDetails, setTestDetails] = useState<TestDetails | null>(null);
  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
  const [answers, setAnswers] = useState<Map<string, string>>(new Map());
  const [timeRemaining, setTimeRemaining] = useState(0);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [startTime] = useState(new Date());
  const [showWarning, setShowWarning] = useState(false);

  useEffect(() => {
    if (testId) {
      loadTest();
    }
  }, [testId]);

  useEffect(() => {
    if (timeRemaining > 0) {
      const timer = setInterval(() => {
        setTimeRemaining((prev) => {
          if (prev <= 1) {
            handleSubmit();
            return 0;
          }
          return prev - 1;
        });
      }, 1000);

      return () => clearInterval(timer);
    }
  }, [timeRemaining]);

  const loadTest = async () => {
    try {
      setLoading(true);
      const [details, questionsData] = await Promise.all([
        examApi.getTestDetails(testId!),
        examApi.getTestQuestions(testId!),
      ]);

      setTestDetails(details);
      setQuestions(questionsData);
      setTimeRemaining(details.duration * 60);
      setError(null);
    } catch (err) {
      setError('Failed to load test. Please try again later.');
      console.error('Error loading test:', err);
    } finally {
      setLoading(false);
    }
  };

  const handleAnswer = (answer: string) => {
    const newAnswers = new Map(answers);
    newAnswers.set(questions[currentQuestionIndex].id, answer);
    setAnswers(newAnswers);
  };

  const goToQuestion = (index: number) => {
    setCurrentQuestionIndex(index);
  };

  const handleSubmit = async () => {
    if (answers.size === 0) {
      alert('Please answer at least one question before submitting.');
      return;
    }

    if (answers.size < questions.length && !showWarning) {
      setShowWarning(true);
      return;
    }

    const userAnswers: UserAnswer[] = questions.map((q) => ({
      questionId: q.id,
      answer: answers.get(q.id) || '',
      timeSpent: 0,
    }));

    try {
      const result = await examApi.submitTest(
        testId!,
        userAnswers,
        startTime,
        new Date()
      );

      navigate(`/result/${testId}`, { state: { result } });
    } catch (err) {
      alert('Failed to submit test. Please try again.');
      console.error('Error submitting test:', err);
    }
  };

  const formatTime = (seconds: number): string => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins}:${secs.toString().padStart(2, '0')}`;
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto"></div>
          <p className="mt-4 text-gray-600">Loading test...</p>
        </div>
      </div>
    );
  }

  if (error || !testDetails) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <p className="text-red-600 mb-4">{error}</p>
          <button
            onClick={() => navigate(-1)}
            className="px-4 py-2 bg-primary-600 text-white rounded hover:bg-primary-700"
          >
            Go Back
          </button>
        </div>
      </div>
    );
  }

  const currentQuestion = questions[currentQuestionIndex];
  const progress = ((currentQuestionIndex + 1) / questions.length) * 100;

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white shadow-md sticky top-0 z-10">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-xl font-bold text-gray-800">
                {testDetails.title}
              </h1>
              <p className="text-sm text-gray-600">
                Question {currentQuestionIndex + 1} of {questions.length}
              </p>
            </div>
            <div className="flex items-center space-x-4">
              <div
                className={`flex items-center px-4 py-2 rounded ${
                  timeRemaining < 300 ? 'bg-red-100 text-red-700' : 'bg-gray-100'
                }`}
              >
                <Clock size={20} className="mr-2" />
                <span className="font-mono font-bold">
                  {formatTime(timeRemaining)}
                </span>
              </div>
            </div>
          </div>
          <div className="mt-3 bg-gray-200 rounded-full h-2">
            <div
              className="bg-primary-600 h-2 rounded-full transition-all"
              style={{ width: `${progress}%` }}
            ></div>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="grid grid-cols-1 lg:grid-cols-4 gap-6">
          {/* Question */}
          <div className="lg:col-span-3">
            <div className="bg-white rounded-lg shadow-md p-8">
              <div className="mb-4">
                <span className="inline-block px-3 py-1 bg-primary-100 text-primary-700 text-sm font-semibold rounded">
                  {currentQuestion.section}
                </span>
              </div>

              <div className="mb-6">
                <h2 className="text-lg font-semibold mb-4 whitespace-pre-wrap">
                  {currentQuestion.content}
                </h2>
              </div>

              {currentQuestion.options && currentQuestion.options.length > 0 && (
                <div className="space-y-3">
                  {currentQuestion.options.map((option, index) => {
                    const optionKey = option.charAt(0);
                    return (
                      <button
                        key={index}
                        onClick={() => handleAnswer(optionKey)}
                        className={`w-full text-left p-4 rounded-lg border-2 transition-all ${
                          answers.get(currentQuestion.id) === optionKey
                            ? 'border-primary-600 bg-primary-50'
                            : 'border-gray-200 hover:border-primary-300 hover:bg-gray-50'
                        }`}
                      >
                        <span className="font-semibold">{option}</span>
                      </button>
                    );
                  })}
                </div>
              )}

              {currentQuestion.type === 'WRITING' && (
                <div>
                  <textarea
                    value={answers.get(currentQuestion.id) || ''}
                    onChange={(e) => handleAnswer(e.target.value)}
                    className="w-full p-4 border-2 border-gray-200 rounded-lg focus:border-primary-600 focus:outline-none"
                    rows={5}
                    placeholder="Type your answer here..."
                  />
                </div>
              )}

              {/* Navigation */}
              <div className="flex justify-between mt-8 pt-6 border-t">
                <button
                  onClick={() => goToQuestion(Math.max(0, currentQuestionIndex - 1))}
                  disabled={currentQuestionIndex === 0}
                  className="px-6 py-2 border-2 border-gray-300 rounded-lg hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  Previous
                </button>
                {currentQuestionIndex < questions.length - 1 ? (
                  <button
                    onClick={() => goToQuestion(currentQuestionIndex + 1)}
                    className="px-6 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700"
                  >
                    Next
                  </button>
                ) : (
                  <button
                    onClick={handleSubmit}
                    className="px-6 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700"
                  >
                    Submit Test
                  </button>
                )}
              </div>
            </div>
          </div>

          {/* Question Navigator */}
          <div className="lg:col-span-1">
            <div className="bg-white rounded-lg shadow-md p-4 sticky top-24">
              <h3 className="font-semibold mb-4">Question Navigator</h3>
              <div className="grid grid-cols-5 gap-2">
                {questions.map((q, index) => (
                  <button
                    key={q.id}
                    onClick={() => goToQuestion(index)}
                    className={`w-10 h-10 rounded flex items-center justify-center text-sm font-semibold transition-all ${
                      index === currentQuestionIndex
                        ? 'bg-primary-600 text-white'
                        : answers.has(q.id)
                        ? 'bg-green-100 text-green-700 border border-green-300'
                        : 'bg-gray-100 hover:bg-gray-200'
                    }`}
                  >
                    {index + 1}
                  </button>
                ))}
              </div>
              <div className="mt-4 pt-4 border-t text-sm">
                <div className="flex items-center justify-between mb-2">
                  <span>Answered:</span>
                  <span className="font-semibold">{answers.size}</span>
                </div>
                <div className="flex items-center justify-between">
                  <span>Remaining:</span>
                  <span className="font-semibold">
                    {questions.length - answers.size}
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Warning Modal */}
      {showWarning && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg p-6 max-w-md mx-4">
            <div className="flex items-center mb-4">
              <AlertCircle className="text-yellow-500 mr-2" size={24} />
              <h3 className="text-lg font-bold">Incomplete Test</h3>
            </div>
            <p className="text-gray-600 mb-6">
              You have answered {answers.size} out of {questions.length}{' '}
              questions. Are you sure you want to submit?
            </p>
            <div className="flex space-x-4">
              <button
                onClick={() => setShowWarning(false)}
                className="flex-1 px-4 py-2 border-2 border-gray-300 rounded-lg hover:bg-gray-50"
              >
                Continue Test
              </button>
              <button
                onClick={() => {
                  setShowWarning(false);
                  handleSubmit();
                }}
                className="flex-1 px-4 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700"
              >
                Submit Anyway
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default TestPage;
