# Language Exam Practice Platform

전세계 공인 어학시험 모의고사를 볼 수 있는 웹 플랫폼입니다.

## 지원 시험

- ✅ **HSK** - 중국어 능력 시험 (현재 이용 가능)
- 🔜 **JLPT** - 일본어 능력 시험 (준비 중)
- 🔜 **TOEIC** - 국제 의사소통 영어 시험 (준비 중)
- 🔜 **TOEFL** - 외국어로서의 영어 시험 (준비 중)
- 🔜 **IELTS** - 국제 영어 시험 (준비 중)
- 🔜 **TOPIK** - 한국어 능력 시험 (준비 중)

## 주요 기능

- 📝 실전과 동일한 모의고사 환경
- ⏱️ 실시간 타이머 기능
- 📊 즉각적인 채점 및 상세 분석
- 📈 섹션별 성적 분석
- 💰 광고 기반 무료 서비스
- 📱 반응형 디자인 (모바일/데스크톱)

## 기술 스택

### Frontend
- React 18
- TypeScript
- Vite
- Tailwind CSS
- React Router
- Axios
- Lucide React (아이콘)

### Backend
- Node.js
- Express
- TypeScript
- PostgreSQL
- pg (PostgreSQL 클라이언트)

## 프로젝트 구조

```
superlanguagetest/
├── frontend/          # React 프론트엔드
│   ├── src/
│   │   ├── components/   # 재사용 가능한 컴포넌트
│   │   ├── pages/        # 페이지 컴포넌트
│   │   ├── services/     # API 서비스
│   │   └── assets/       # 정적 파일
│   └── package.json
├── backend/           # Express 백엔드
│   ├── src/
│   │   ├── routes/       # API 라우트
│   │   ├── controllers/  # 컨트롤러
│   │   ├── models/       # 데이터 모델
│   │   └── config/       # 설정
│   ├── database/
│   │   ├── migrations/   # DB 마이그레이션
│   │   └── seeds/        # 샘플 데이터
│   └── package.json
├── shared/            # 공유 타입 정의
│   └── types/
└── package.json       # 루트 패키지
```

## 설치 및 실행

### 사전 요구사항

- Node.js 18 이상
- PostgreSQL 14 이상
- npm 또는 yarn

### 1. 저장소 클론

```bash
git clone <repository-url>
cd superlanguagetest
```

### 2. 의존성 설치

```bash
# 루트에서 모든 패키지 설치
npm install

# 또는 각각 설치
cd frontend && npm install
cd ../backend && npm install
```

### 3. 데이터베이스 설정

PostgreSQL 데이터베이스를 생성합니다:

```bash
createdb languagetest
```

백엔드 환경 변수 설정:

```bash
cd backend
cp .env.example .env
```

`.env` 파일을 편집하여 데이터베이스 정보를 입력합니다:

```env
PORT=5000
DB_HOST=localhost
DB_PORT=5432
DB_NAME=languagetest
DB_USER=postgres
DB_PASSWORD=your_password
```

### 4. 프론트엔드 환경 변수 설정 (선택사항)

```bash
cd frontend
cp .env.example .env
```

### 5. 애플리케이션 실행

#### 개발 모드 (전체 실행)

```bash
# 루트에서 실행 (프론트엔드 + 백엔드 동시 실행)
npm run dev
```

#### 개별 실행

```bash
# 백엔드만 실행
npm run dev:backend

# 프론트엔드만 실행
npm run dev:frontend
```

### 6. 접속

- **프론트엔드**: http://localhost:3000
- **백엔드 API**: http://localhost:5000/api
- **Health Check**: http://localhost:5000/health

## 데이터베이스 초기화

백엔드를 처음 실행하면 자동으로:
1. 데이터베이스 스키마 생성
2. 시험 타입 데이터 삽입
3. HSK 샘플 문제 삽입

수동으로 초기화하려면:

```bash
cd backend
npm run dev
```

서버가 시작되면서 마이그레이션과 시드가 자동 실행됩니다.

## API 엔드포인트

### 시험 관련

- `GET /api/exams` - 모든 시험 타입 조회
- `GET /api/exams/:examType/tests` - 특정 시험의 테스트 목록
- `GET /api/tests/:testId` - 테스트 상세 정보
- `GET /api/tests/:testId/questions` - 테스트 문제 조회
- `POST /api/tests/:testId/submit` - 답안 제출 및 채점

## HSK 샘플 데이터

현재 다음 HSK 샘플 테스트가 포함되어 있습니다:

- **HSK 3** - 80문제 (듣기 40, 읽기 30, 쓰기 10)
- **HSK 4** - 100문제 (구조만 설정됨)

## 광고 통합

광고는 다음 위치에 배치됩니다:

- 홈페이지 상단/중간/하단
- 시험 선택 페이지
- 결과 페이지

현재는 플레이스홀더로 표시되며, Google AdSense 등으로 교체 가능합니다.

`AdBanner.tsx` 컴포넌트를 수정하여 실제 광고 코드를 통합하세요.

## 향후 계획

- [ ] JLPT 완전 구현
- [ ] TOEIC, TOEFL, IELTS, TOPIK 추가
- [ ] 사용자 계정 시스템
- [ ] 학습 기록 저장
- [ ] 오답 노트 기능
- [ ] 문제 북마크
- [ ] 소셜 공유 기능
- [ ] 모바일 앱 (React Native)
- [ ] 실제 음성 파일 통합 (듣기 문제)
- [ ] 실시간 랭킹 시스템

## 라이선스

MIT License

## 기여

Pull Request는 언제나 환영합니다!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 문의

문의사항이 있으시면 이슈를 생성해주세요.
