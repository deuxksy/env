# Changelog

모든 프로젝트 변경 사항을 이 파일에 기록합니다.

## [Unreleased]

## [2026-01-06]

### ✨ Features

- **Multi-OS Support**: Mac, Linux, Steam Deck을 위한 `Default User` 디렉토리 구조 및 `os`, `rc` 로더 스크립트 생성
- **Linux Restructuring**:
  - `linux/common`: 공통 설정 (alias, path) 분리
  - `linux/ubuntu`: 기존 Debian 기반 설정 이동 (`apt` alias 포함)
  - `linux/fedora`: 신규 Fedora 기반 설정 추가 (`dnf` alias 포함)
  - `linux/steamdeck`: Steam Deck 설정을 `linux` 하위로 통합 (Arch 기반)
- **Cleanup**: `rc` 및 `os` 파일 제거 (단순화: `alias.sh`, `path.sh` 직접 로드 권장)
- **Steam Deck**:
  - Arch Linux 기반 SteamOS 지원 강화 (`alias.sh`)
  - `steamos-rw`/`steamos-ro` (Filesystem Toggle), `pac`/`flatup` (Package Mgr) 별칭 추가
- **Mac**: `alias.sh` 활성화 및 `lsd`, `nvim` 존재 여부 체크 로직 추가

### 🔒 Security

- **Ansible**: `zzizily.yml` 내 비밀번호 평문 로깅 작업 제거 (Security Fix)

### ♻️ Refactor

- **Bash**: `restart_glances_web.sh` 프로세스 종료 로직을 `pkill`로 개선
- **Legacy**: 사용하지 않는 `java/gradle`, `java/tomcat`, `sublimetext` 디렉토리 제거

### 📝 Documentation

- **README**: 프로젝트 구조 및 사용법 업데이트
- **License**: MIT License (2025) 업데이트
