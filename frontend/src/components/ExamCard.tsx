import React from 'react';
import { Link } from 'react-router-dom';
import { Lock, CheckCircle } from 'lucide-react';
import type { ExamInfo } from '../services/api';

interface ExamCardProps {
  exam: ExamInfo;
}

const ExamCard: React.FC<ExamCardProps> = ({ exam }) => {
  const cardContent = (
    <div
      className={`
        bg-white rounded-lg shadow-md hover:shadow-xl transition-all duration-300 p-6
        ${exam.isAvailable ? 'hover:scale-105 cursor-pointer' : 'opacity-60 cursor-not-allowed'}
      `}
    >
      <div className="flex items-center justify-between mb-4">
        <div className="text-4xl">{exam.icon}</div>
        {exam.isAvailable ? (
          <CheckCircle className="text-green-500" size={24} />
        ) : (
          <Lock className="text-gray-400" size={24} />
        )}
      </div>

      <h3 className="text-xl font-bold text-gray-800 mb-1">{exam.name}</h3>
      <p className="text-sm text-gray-500 mb-2">{exam.fullName}</p>
      <p className="text-gray-600 text-sm mb-3">{exam.description}</p>

      <div className="flex items-center text-xs text-gray-500 mb-3">
        <span className="font-semibold mr-2">Language:</span>
        <span>{exam.language}</span>
      </div>

      {exam.levels && exam.levels.length > 0 && (
        <div className="flex flex-wrap gap-1 mb-3">
          {exam.levels.map((level) => (
            <span
              key={level}
              className="px-2 py-1 bg-primary-100 text-primary-700 text-xs rounded"
            >
              {level}
            </span>
          ))}
        </div>
      )}

      <div className="mt-4">
        {exam.isAvailable ? (
          <span className="text-primary-600 font-semibold text-sm">
            Click to practice →
          </span>
        ) : (
          <span className="text-gray-400 text-sm">Coming soon</span>
        )}
      </div>
    </div>
  );

  if (exam.isAvailable) {
    return <Link to={`/exam/${exam.id}`}>{cardContent}</Link>;
  }

  return cardContent;
};

export default ExamCard;
