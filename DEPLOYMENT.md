# 배포 가이드 (Deployment Guide)

이 가이드는 Language Exam Practice Platform을 Vercel(프론트엔드)과 Railway(백엔드)에 배포하는 방법을 설명합니다.

## 📋 필요한 계정

1. **GitHub 계정** ✅ (이미 있음)
2. **Vercel 계정** - https://vercel.com/signup
3. **Railway 계정** - https://railway.app/

모두 **무료**입니다!

---

## 🚂 Step 1: Railway에 백엔드 배포

### 1-1. Railway 계정 생성
1. https://railway.app/ 접속
2. "Start a New Project" 클릭
3. GitHub로 로그인

### 1-2. 프로젝트 배포
1. "Deploy from GitHub repo" 선택
2. `littleactiondev/superlanguagetest` 저장소 선택
3. "Add variables" 클릭하고 다음 환경변수 추가:
   ```
   PORT=5000
   DB_HOST=${{PGHOST}}
   DB_PORT=${{PGPORT}}
   DB_NAME=${{PGDATABASE}}
   DB_USER=${{PGUSER}}
   DB_PASSWORD=${{PGPASSWORD}}
   ```

### 1-3. PostgreSQL 추가
1. 프로젝트 대시보드에서 "+ New" 클릭
2. "Database" → "PostgreSQL" 선택
3. 자동으로 환경변수가 설정됨

### 1-4. 배포 설정
1. Settings → Root Directory → `backend` 입력
2. Settings → Build Command → `npm install && npm run build`
3. Settings → Start Command → `npm start`
4. Deploy!

### 1-5. 백엔드 URL 복사
배포 완료 후 Settings → Domains에서 URL 복사
예: `https://superlanguagetest-production.up.railway.app`

---

## ▲ Step 2: Vercel에 프론트엔드 배포

### 2-1. Vercel 계정 생성
1. https://vercel.com/signup 접속
2. GitHub로 로그인

### 2-2. 프로젝트 Import
1. "Add New" → "Project" 클릭
2. `littleactiondev/superlanguagetest` 저장소 Import
3. Branch: `claude/language-exam-platform-011CUcU9fmbHmNPYB2EEgfoB` 선택

### 2-3. 빌드 설정
**Framework Preset**: Vite

**Build Settings**:
- Build Command: `cd frontend && npm install && npm run build`
- Output Directory: `frontend/dist`
- Install Command: `npm install --prefix frontend`

**Root Directory**: (비워두기)

### 2-4. 환경 변수 설정
Environment Variables 섹션에서:
```
VITE_API_URL = https://your-railway-backend-url.up.railway.app/api
```
(Railway에서 복사한 백엔드 URL 사용)

### 2-5. Deploy
"Deploy" 버튼 클릭!

---

## ✅ Step 3: 배포 완료 확인

### Vercel 배포 URL
배포 완료 후 다음과 같은 URL이 생성됩니다:
```
https://superlanguagetest.vercel.app
```

이 URL로 접속하면 **전 세계 어디서든** 접속 가능합니다! 🎉

### 테스트 방법
1. Vercel URL 접속
2. HSK 카드 클릭
3. 모의고사 시작
4. 정상 작동 확인!

---

## 🔧 문제 해결

### 백엔드 연결 실패
- Railway 백엔드 URL이 올바른지 확인
- Vercel 환경변수에 `/api` 포함되어 있는지 확인
- Railway 로그 확인 (Deployments → Logs)

### 데이터베이스 오류
- Railway PostgreSQL이 실행 중인지 확인
- 환경변수가 올바르게 설정되었는지 확인

### 빌드 실패
- GitHub에 최신 코드가 푸시되었는지 확인
- Vercel/Railway 빌드 로그 확인

---

## 🎯 추가 설정 (선택사항)

### 커스텀 도메인 설정
1. Vercel 프로젝트 → Settings → Domains
2. 원하는 도메인 추가

### 자동 배포
- GitHub에 push하면 자동으로 재배포됩니다!
- Railway와 Vercel 모두 자동 배포 지원

---

## 💰 비용

- **Vercel**: 무료 (Hobby 플랜)
- **Railway**: $5 무료 크레딧/월 제공
  - 이후 사용량에 따라 과금
  - 이 프로젝트는 월 $5-10 정도 예상

---

## 📚 참고 자료

- [Vercel 문서](https://vercel.com/docs)
- [Railway 문서](https://docs.railway.app/)
- [프로젝트 README](./README.md)

배포 완료! 🚀
