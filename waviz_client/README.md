# Waviz Client

크라우드펀딩 플랫폼 **Waviz**의 모바일 앱입니다.

## 주요 기능

- **사용자 인증**: 회원가입, 로그인, 비밀번호 재설정
- **프로젝트 탐색**: 카테고리별 크라우드펀딩 프로젝트 검색 및 필터링
- **프로젝트 상세**: 상세 정보, 리워드, 진행률 확인
- **프로젝트 생성**: 새로운 크라우드펀딩 프로젝트 등록
- **리워드 관리**: 프로젝트별 리워드 설정 및 관리
- **마이페이지**: 내가 만든 프로젝트 및 후원 내역 관리

## 기술 스택

### Framework & Language
- **Flutter 3.8+** - 크로스플랫폼 모바일 개발
- **Dart** - 프로그래밍 언어

### Architecture & State Management
- **Clean Architecture** - 계층형 아키텍처
- **Riverpod** - 상태 관리 및 의존성 주입
- **Freezed** - 불변 데이터 클래스 생성

### Navigation & UI
- **GoRouter** - 선언적 라우팅
- **Pretendard** - 커스텀 폰트
- **Material Design** - UI 디자인 시스템

### Network & Data
- **Dio + Retrofit** - HTTP 클라이언트 및 API 통신
- **SharedPreferences** - 로컬 데이터 저장
- **Cached Network Image** - 이미지 캐싱

### Development Tools
- **Build Runner** - 코드 생성
- **Flutter Lints** - 코드 품질 관리
- **Integration Test** - 통합 테스트

## 프로젝트 구조

```
lib/
├── core/           # 공통 유틸리티, 상수, 에러 처리
├── data/           # 데이터 계층 (API, 로컬 저장소)
├── domain/         # 비즈니스 로직 계층
├── presentation/   # UI 계층 (페이지, 위젯, 프로바이더)
├── main.dart       # 앱 진입점
├── router.dart     # 라우팅 설정
└── theme.dart      # 앱 테마 설정
```

## 시작하기

### 사전 요구사항
- Flutter SDK 3.8.0 이상
- Dart SDK 3.0.0 이상
- Android Studio / VS Code
- Android/iOS 개발 환경

### 설치 및 실행

1. **저장소 클론**
```bash
git clone [repository-url]
cd waviz_client
```

2. **의존성 설치**
```bash
flutter pub get
```

3. **코드 생성**
```bash
dart run build_runner build
```

4. **앱 실행**
```bash
flutter run
```

### 빌드

```bash
# Android APK 빌드
flutter build apk --release

# iOS 빌드 (macOS에서만)
flutter build ios --release
```

## 테스트

```bash
# 단위 테스트
flutter test

# 통합 테스트
flutter test integration_test/
```

## 스크린샷

| | | | |
|:---:|:---:|:---:|:---:|
| <img width="200" alt="Image" src="https://github.com/user-attachments/assets/99f12fe7-9387-443d-a3f2-5c7684642ae0" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/4b9c0866-f98c-4b0f-8acb-1931f6806b3c" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/85627cf1-fb91-4b81-b9b4-10356ac8b5b6" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/7a90b3fe-37c2-4589-a478-f7386aa47b06" /> |
| <img width="200" alt="Image" src="https://github.com/user-attachments/assets/c0312ce3-4221-4714-86b7-3867bff422d7" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/a1a96647-84c2-4342-8a77-fddfcd395c97" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/dc15b356-3075-4374-b1c6-6154ae9674be" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/8b23e9f3-1c21-438f-89bd-f4fa4cd13316" /> |
| <img width="200" alt="Image" src="https://github.com/user-attachments/assets/0677de6d-021d-4b15-9bf3-7daa1908acec" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/3bd0a07f-fecd-42d3-a592-7511ac5cfc35" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/f64e12c3-213e-4e85-8d9b-1958a4e4c8f4" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/3609bba2-9d2c-40fd-92a9-dff9555ec8d8" /> |
| <img width="200" alt="Image" src="https://github.com/user-attachments/assets/03b461dd-5fd7-406c-a038-717b56140226" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/c9b7cc52-720b-405c-be2f-b970faf944f1" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/3d7b5466-dfbe-401b-bcf5-ac53f46258cc" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/6eebc8d4-00fb-43e1-b8bd-a2a88c89cbc9" /> |
| <img width="200" alt="Image" src="https://github.com/user-attachments/assets/c74136dd-4358-410e-b437-690c468875cd" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/ad8dbf27-d530-4f34-83e2-133136df65d6" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/ad41898e-7c7a-496a-aaa4-a357bba2d66b" /> | <img width="200" alt="Image" src="https://github.com/user-attachments/assets/3bab31fa-b814-4fc8-939d-d91e9657bd8b" /> |