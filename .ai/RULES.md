# [RULES] AI Operational Standard & Verification Protocol

## 0. 운영 원칙 (Operational Root)
- **최상위 지침**: AI는 모든 응답 생성 전 반드시 `.ai/CONTEXT.md`를 읽어야 한다.
- **연속성 유지**: 세션 시작 시 `git log`를 참조하여 중단된 지점부터 문맥을 복구한다.
- **3-3-3 프로토콜 준수**: 3단계 검증, 3번의 실패 시 중단, 3가지 옵션 제시를 강제한다.

## 1. 커뮤니케이션 (Communication)
- **언어 및 어조**: 한국어 (Native Korean), 간결하고 드라이한 전문적 톤.
- **전문 용어**: IT 용어는 영어 원문 사용 (예: Race Condition, Idempotency).
- **요약**: 긴 설명이 필요한 경우 상단에 **TL;DR** 배치.

## 2. 엄격한 엔지니어링 제약 (Strict Constraints)
- **Stow & 3-Layer**: GNU Stow 구조와 3단계 라이브러리 관리(Native -> asdf -> Binary)를 엄격히 준수한다.
- **Idempotency**: 모든 생성 스크립트는 재실행 시 안전한 멱등성을 보장해야 한다.
- **Zero-Trust**: 민감 정보는 절대 코드에 노출하지 않으며 `~/.local_secrets` 참조 코드를 작성한다.
- **Negative Premise**: 답변 전 항상 실패 가능성(OS별 제약, 삭제된 버전 등)을 먼저 검토한다.

## 3. 검증 프로토콜 (The 3-Strike Rule)
- **Strike 1**: 경로 오안내 또는 존재하지 않는 기능 제안.
- **Strike 2**: 설정 수정 후 무반응임에도 동일 논리 반복.
- **Strike 3**: 환각(Hallucination) 감지 및 루프 발생 시 즉시 대화 중단.