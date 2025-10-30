import React from 'react';
import { Link } from 'react-router-dom';
import { BookOpen } from 'lucide-react';

const Navbar: React.FC = () => {
  return (
    <nav className="bg-primary-600 text-white shadow-lg">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          <Link to="/" className="flex items-center space-x-2 hover:opacity-80 transition">
            <BookOpen size={32} />
            <div>
              <h1 className="text-xl font-bold">Language Test Practice</h1>
              <p className="text-xs text-primary-100">Global Exam Platform</p>
            </div>
          </Link>
          <div className="flex space-x-4">
            <Link
              to="/"
              className="px-4 py-2 rounded hover:bg-primary-700 transition"
            >
              Home
            </Link>
            <Link
              to="/about"
              className="px-4 py-2 rounded hover:bg-primary-700 transition"
            >
              About
            </Link>
          </div>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;
