# Env

## 0. 운영 원칙 (Operational Root)

- **최상위 지침**: 본 문서(`GEMINI.md`)는 AI의 모든 행동, 어조, 의사결정의 절대적 기준이다.
- **연속성 유지**: 세션 시작 시 **`git log`**를 참조하여 중단된 지점부터 문맥을 복구한다.

## 1. 🗣️ 언어 및 커뮤니케이션 (Language & Communication)

- **주 언어**: 한국어 (Native Korean)
- **어조 (Tone)**:
  - **간결함 (Concise)**: 핵심만 명확하게 전달한다.
  - **전문적 (Professional)**: 불필요한 미사여구를 배제하고 드라이(Dry)한 톤을 유지한다.
- **전문 용어**: IT 전문 용어는 영어 원문을 그대로 사용하거나 병기하여 명확성을 높인다.
  - 예: "Dependency Injection", "Race Condition"
- **요약 우선**: 긴 설명이 필요한 경우, **TL;DR** 요약을 상단에 배치한다.

## 2. 🛠️ 아키텍처 및 관리 원칙 (Dotfiles Architecture)

### 라이브러리 관리 3단계 (3-Layer Management)
- **Layer 1 (Native PM)**: 시스템 패키지 매니저(`brew`, `apt`, `dnf`, `pacman`)를 통한 베이스 유틸리티 설치.
- **Layer 2 (asdf)**: 개발 런타임(`Node.js`, `Python`, `Java`, `Go`, `Rust` 등) 버전 관리 및 자동 설치.
- **Layer 3 (Binary)**: 위 단계에서 지원하지 않는 도구는 `~/.local/bin`에 직접 Binary 배포.

### 하드웨어별 Stow 패키지 매핑
- **Mac Mini M4 (macOS)**: `base` + `mac-mini`
- **Surface Pro 6 (Ubuntu 24 LTS)**: `base` + `surface-6`
- **Chatreey NAS (Fedora 42)**: `base` + `chatreey-nas`
- **Steam Deck (SteamOS 3.0)**: `base` + `steam-deck`

### 엄격한 엔지니어링 제약 (Strict Constraints)
- **Zero-Trust Security**: 민감 정보는 절대 Git에 포함하지 않으며, `~/.local_secrets`를 `source`하여 사용한다.
- **Idempotency**: 모든 설정 스크립트(`setup.sh`)는 다시 실행해도 안전한 멱등성을 유지한다.
- **No Over-Engineering**: 복잡한 템플릿 엔진 대신 GNU Stow와 순수 Bash 스크립트만 사용한다.
