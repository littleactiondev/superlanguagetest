import React, { useEffect, useState } from 'react';
import { examApi, ExamInfo } from '../services/api';
import ExamCard from '../components/ExamCard';
import AdBanner from '../components/AdBanner';
import { Globe } from 'lucide-react';

const HomePage: React.FC = () => {
  const [exams, setExams] = useState<ExamInfo[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    loadExams();
  }, []);

  const loadExams = async () => {
    try {
      setLoading(true);
      const data = await examApi.getAllExams();
      setExams(data);
      setError(null);
    } catch (err) {
      setError('Failed to load exams. Please try again later.');
      console.error('Error loading exams:', err);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto"></div>
          <p className="mt-4 text-gray-600">Loading exams...</p>
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
            onClick={loadExams}
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
      {/* Hero Section */}
      <div className="bg-gradient-to-r from-primary-600 to-primary-800 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center">
            <Globe className="mx-auto mb-4" size={64} />
            <h1 className="text-4xl md:text-5xl font-bold mb-4">
              Practice Language Exams Online
            </h1>
            <p className="text-xl text-primary-100 mb-2">
              TOEIC • TOEFL • IELTS • JLPT • HSK • TOPIK
            </p>
            <p className="text-primary-200 max-w-2xl mx-auto">
              Prepare for your language proficiency tests with our comprehensive practice exams.
              Free practice tests with instant results and detailed analysis.
            </p>
          </div>
        </div>
      </div>

      {/* Ad Banner */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-8">
        <AdBanner size="large" />
      </div>

      {/* Exams Grid */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <h2 className="text-3xl font-bold text-gray-800 mb-8 text-center">
          Choose Your Exam
        </h2>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {exams.map((exam) => (
            <ExamCard key={exam.id} exam={exam} />
          ))}
        </div>

        <div className="mt-8">
          <AdBanner size="medium" />
        </div>
      </div>

      {/* Features Section */}
      <div className="bg-white py-12">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-2xl font-bold text-gray-800 mb-8 text-center">
            Why Practice With Us?
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="text-center">
              <div className="text-4xl mb-4">✅</div>
              <h3 className="text-lg font-semibold mb-2">Instant Results</h3>
              <p className="text-gray-600">
                Get your scores immediately after completing the test
              </p>
            </div>
            <div className="text-center">
              <div className="text-4xl mb-4">📊</div>
              <h3 className="text-lg font-semibold mb-2">Detailed Analysis</h3>
              <p className="text-gray-600">
                Understand your strengths and areas for improvement
              </p>
            </div>
            <div className="text-center">
              <div className="text-4xl mb-4">🆓</div>
              <h3 className="text-lg font-semibold mb-2">Free to Use</h3>
              <p className="text-gray-600">
                All practice tests are completely free with no registration required
              </p>
            </div>
          </div>
        </div>
      </div>

      {/* Footer Ad */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <AdBanner size="large" />
      </div>
    </div>
  );
};

export default HomePage;
