import React, { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { examApi, Test } from '../services/api';
import AdBanner from '../components/AdBanner';
import { Clock, FileText, ArrowLeft } from 'lucide-react';

const ExamPage: React.FC = () => {
  const { examType } = useParams<{ examType: string }>();
  const [tests, setTests] = useState<Test[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (examType) {
      loadTests();
    }
  }, [examType]);

  const loadTests = async () => {
    try {
      setLoading(true);
      const data = await examApi.getTestsByExam(examType!);
      setTests(data);
      setError(null);
    } catch (err) {
      setError('Failed to load tests. Please try again later.');
      console.error('Error loading tests:', err);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto"></div>
          <p className="mt-4 text-gray-600">Loading tests...</p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <p className="text-red-600 mb-4">{error}</p>
          <button
            onClick={loadTests}
            className="px-4 py-2 bg-primary-600 text-white rounded hover:bg-primary-700"
          >
            Retry
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <Link
          to="/"
          className="inline-flex items-center text-primary-600 hover:text-primary-700 mb-6"
        >
          <ArrowLeft size={20} className="mr-2" />
          Back to all exams
        </Link>

        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-800 mb-2">
            {examType} Practice Tests
          </h1>
          <p className="text-gray-600">
            Select a test to begin your practice session
          </p>
        </div>

        <AdBanner size="large" className="mb-8" />

        {tests.length === 0 ? (
          <div className="text-center py-12 bg-white rounded-lg shadow">
            <FileText size={48} className="mx-auto text-gray-400 mb-4" />
            <p className="text-gray-600 text-lg">No tests available yet.</p>
            <p className="text-gray-500 mt-2">Please check back later.</p>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {tests.map((test) => (
              <Link
                key={test.id}
                to={`/test/${test.id}`}
                className="bg-white rounded-lg shadow-md hover:shadow-xl transition-all duration-300 p-6 hover:scale-105"
              >
                <div className="flex items-start justify-between mb-3">
                  <div>
                    <span className="inline-block px-3 py-1 bg-primary-100 text-primary-700 text-sm font-semibold rounded mb-2">
                      {test.level}
                    </span>
                    <h3 className="text-xl font-bold text-gray-800">
                      {test.title}
                    </h3>
                  </div>
                </div>

                <p className="text-gray-600 mb-4">{test.description}</p>

                <div className="flex items-center space-x-6 text-sm text-gray-500">
                  <div className="flex items-center">
                    <Clock size={16} className="mr-1" />
                    <span>{test.duration} min</span>
                  </div>
                  <div className="flex items-center">
                    <FileText size={16} className="mr-1" />
                    <span>{test.totalQuestions} questions</span>
                  </div>
                </div>

                <div className="mt-4 pt-4 border-t border-gray-200">
                  <span className="text-primary-600 font-semibold">
                    Start Test →
                  </span>
                </div>
              </Link>
            ))}
          </div>
        )}

        <div className="mt-8">
          <AdBanner size="medium" />
        </div>
      </div>
    </div>
  );
};

export default ExamPage;
