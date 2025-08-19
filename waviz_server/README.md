# Waviz Server

크라우드펀딩 플랫폼을 위한 백엔드 API 서버입니다.

## 주요 기능

- **사용자 인증**: 회원가입, 로그인, 비밀번호 재설정
- **프로젝트 관리**: 프로젝트 생성, 수정, 삭제, 조회
- **카테고리별 분류**: 프로젝트 카테고리 및 타입별 필터링
- **리워드 시스템**: 프로젝트별 리워드 관리
- **홈 화면 API**: 전체 프로젝트 목록 및 요약 정보

## 기술 스택

- **Language**: Dart
- **Framework**: Shelf + Shelf Router
- **Database**: SQLite3
- **Documentation**: Swagger UI
- **Deployment**: Docker

## 설치 및 실행

### Dart SDK로 실행

```bash
# 의존성 설치
dart pub get

# 서버 실행
dart run bin/server.dart
```

### Docker로 실행

```bash
# 이미지 빌드
docker build . -t waviz-server

# 컨테이너 실행
docker run -it -p 8080:8080 waviz-server
```

## API 문서

서버 실행 후 다음 URL에서 API 문서를 확인할 수 있습니다:

- **Swagger UI**: http://localhost:8080/docs
- **API Base URL**: http://localhost:8080/api/v1

## 프로젝트 구조

```
bin/
├── auth/          # 사용자 인증 관련
├── category/      # 카테고리 관리
├── home/          # 홈 화면 API
├── project/       # 프로젝트 관리
├── router/        # API 라우팅
├── common/        # 공통 유틸리티
└── server.dart    # 메인 서버 파일
```

## 환경 설정

- **포트**: 기본 8080 (환경변수 PORT로 변경 가능)
- **데이터베이스**: 프로젝트 루트의 `waviz.db` 파일
- **로그 레벨**: 개발 환경에서는 ALL 레벨로 설정
