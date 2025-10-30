import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Navbar from './components/Navbar';
import HomePage from './pages/HomePage';
import ExamPage from './pages/ExamPage';
import TestPage from './pages/TestPage';
import ResultPage from './pages/ResultPage';

function App() {
  return (
    <Router>
      <div className="min-h-screen bg-gray-50">
        <Navbar />
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/exam/:examType" element={<ExamPage />} />
          <Route path="/test/:testId" element={<TestPage />} />
          <Route path="/result/:testId" element={<ResultPage />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
