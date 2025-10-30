import React from 'react';

interface AdBannerProps {
  size?: 'small' | 'medium' | 'large';
  className?: string;
}

const AdBanner: React.FC<AdBannerProps> = ({ size = 'medium', className = '' }) => {
  const sizeClasses = {
    small: 'h-20',
    medium: 'h-32',
    large: 'h-48',
  };

  return (
    <div className={`ad-container ${sizeClasses[size]} ${className}`}>
      <div className="text-center">
        <p className="text-xs text-gray-400">Advertisement</p>
        <p className="text-sm mt-1">Google AdSense Placeholder</p>
      </div>
    </div>
  );
};

export default AdBanner;
