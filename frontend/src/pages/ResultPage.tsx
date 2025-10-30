import React from 'react';
import { useLocation, useNavigate, Link } from 'react-router-dom';
import { TestResult } from '../services/api';
import AdBanner from '../components/AdBanner';
import { CheckCircle, XCircle, Home, RotateCcw } from 'lucide-react';

const ResultPage: React.FC = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const result = location.state?.result as TestResult;

  if (!result) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <p className="text-gray-600 mb-4">No result data found.</p>
          <Link
            to="/"
            className="px-4 py-2 bg-primary-600 text-white rounded hover:bg-primary-700"
          >
            Go Home
          </Link>
        </div>
      </div>
    );
  }

  const getScoreColor = (percentage: number) => {
    if (percentage >= 80) return 'text-green-600';
    if (percentage >= 60) return 'text-yellow-600';
    return 'text-red-600';
  };

  const getScoreGrade = (percentage: number) => {
    if (percentage >= 90) return 'Excellent';
    if (percentage >= 80) return 'Very Good';
    if (percentage >= 70) return 'Good';
    if (percentage >= 60) return 'Pass';
    return 'Need Improvement';
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Header */}
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-gray-800 mb-2">Test Results</h1>
          <p className="text-gray-600">{result.examType} Practice Test</p>
        </div>

        <AdBanner size="large" className="mb-8" />

        {/* Score Card */}
        <div className="bg-white rounded-lg shadow-lg p-8 mb-8">
          <div className="text-center mb-8">
            <div className={`text-6xl font-bold mb-2 ${getScoreColor(result.percentage)}`}>
              {result.percentage}%
            </div>
            <div className="text-2xl font-semibold text-gray-700 mb-4">
              {getScoreGrade(result.percentage)}
            </div>
            <div className="text-gray-600">
              {result.score} / {result.maxScore} points
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
            <div className="text-center p-4 bg-green-50 rounded-lg">
              <CheckCircle className="mx-auto mb-2 text-green-600" size={32} />
              <div className="text-2xl font-bold text-green-700">
                {result.correctAnswers}
              </div>
              <div className="text-sm text-gray-600">Correct</div>
            </div>

            <div className="text-center p-4 bg-red-50 rounded-lg">
              <XCircle className="mx-auto mb-2 text-red-600" size={32} />
              <div className="text-2xl font-bold text-red-700">
                {result.totalQuestions - result.correctAnswers}
              </div>
              <div className="text-sm text-gray-600">Incorrect</div>
            </div>

            <div className="text-center p-4 bg-blue-50 rounded-lg">
              <div className="text-2xl font-bold text-blue-700 mb-2">
                {result.totalQuestions}
              </div>
              <div className="text-sm text-gray-600">Total Questions</div>
            </div>
          </div>

          {/* Section Results */}
          <div className="mt-8">
            <h3 className="text-xl font-bold text-gray-800 mb-4">
              Section Performance
            </h3>
            <div className="space-y-4">
              {result.sectionResults.map((section, index) => (
                <div key={index} className="border rounded-lg p-4">
                  <div className="flex items-center justify-between mb-2">
                    <h4 className="font-semibold">{section.sectionName}</h4>
                    <span className={`font-bold ${getScoreColor(section.percentage)}`}>
                      {section.percentage}%
                    </span>
                  </div>
                  <div className="flex items-center justify-between text-sm text-gray-600 mb-2">
                    <span>
                      {section.correctAnswers} / {section.totalQuestions} correct
                    </span>
                    <span>
                      {section.score} / {section.maxScore} points
                    </span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-2">
                    <div
                      className={`h-2 rounded-full ${
                        section.percentage >= 80
                          ? 'bg-green-500'
                          : section.percentage >= 60
                          ? 'bg-yellow-500'
                          : 'bg-red-500'
                      }`}
                      style={{ width: `${section.percentage}%` }}
                    ></div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>

        <AdBanner size="medium" className="mb-8" />

        {/* Detailed Answers */}
        <div className="bg-white rounded-lg shadow-lg p-8 mb-8">
          <h3 className="text-xl font-bold text-gray-800 mb-4">Answer Review</h3>
          <div className="space-y-4">
            {result.answers.map((answer, index) => (
              <div
                key={index}
                className={`border-l-4 p-4 rounded ${
                  answer.isCorrect
                    ? 'border-green-500 bg-green-50'
                    : 'border-red-500 bg-red-50'
                }`}
              >
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold">Question {index + 1}</span>
                  {answer.isCorrect ? (
                    <CheckCircle className="text-green-600" size={20} />
                  ) : (
                    <XCircle className="text-red-600" size={20} />
                  )}
                </div>
                <div className="text-sm">
                  <div className="mb-1">
                    <span className="font-semibold">Your answer: </span>
                    <span className={answer.isCorrect ? 'text-green-700' : 'text-red-700'}>
                      {answer.answer || '(No answer)'}
                    </span>
                  </div>
                  {!answer.isCorrect && (
                    <div>
                      <span className="font-semibold">Correct answer: </span>
                      <span className="text-green-700">{answer.correctAnswer}</span>
                    </div>
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Actions */}
        <div className="flex justify-center space-x-4 mb-8">
          <Link
            to="/"
            className="flex items-center px-6 py-3 bg-primary-600 text-white rounded-lg hover:bg-primary-700"
          >
            <Home size={20} className="mr-2" />
            Back to Home
          </Link>
          <button
            onClick={() => navigate(-2)}
            className="flex items-center px-6 py-3 border-2 border-primary-600 text-primary-600 rounded-lg hover:bg-primary-50"
          >
            <RotateCcw size={20} className="mr-2" />
            Try Another Test
          </button>
        </div>

        <AdBanner size="large" />
      </div>
    </div>
  );
};

export default ResultPage;
