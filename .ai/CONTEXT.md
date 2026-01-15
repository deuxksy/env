# [CONTEXT] Infrastructure & Stow Architecture

## 0. 프로젝트 배경 및 목적 (Background & Purpose)

- **현황**: 현재 `ln -s` 수동 방식으로 인해 관리가 파편화되어 있음.
- **목표**: **GNU Stow** 체제로 전환하여 폴더 구조만으로 설정을 관리하는 직관적인 시스템 구축.
- **철학**: 15년 차 DevOps 엔지니어로서 "단순함"과 "관리의 투명성"을 최우선으로 함.

## 1. 대상 환경 (Target Infrastructure)

- **Mac Mini M4**: MacOS 26 (Apple Silicon)
- **Surface Pro 6**: Ubuntu 24 LTS (x86_64)
- **Chatreey NAS**: Fedora 43 (RHEL 계열)
- **Steam Deck**: SteamOS 3.0 (Arch 계열)

## 2. 핵심 설계 원칙: 라이브러리 3단계

1. **Layer 1 (Native PM)**: brew, apt, dnf, pacman 등 활용.
2. **Layer 2 (asdf)**: Java, Node.js, Python 등 런타임 버전 관리.
3. **Layer 3 (Binary)**: `~/.local/bin` 직접 배포.

## 3. Target Infrastructure

| 하드웨어/OS          | 계열 (Family)                   | 패키지 매니저 (Layer 1).   | 아키텍처                |
| ----------------- | ------------------------------ | ----------------------- | --------------------- |
| **Mac Mini M4**   | **MacOS 26**                   | **`brew`**              | Apple Silicon (arm64) |
| **Surface Pro 6** | **Debian 계열 (Ubuntu 24 LTS)** | **`apt`**               | x86_64                |
| **Chatreey NAS**  | **RHEL 계열 (Fedora 43)**       | **`dnf`**               | x86_64                |
| **Steam Deck**    | **Arch 계열 (SteamOS 3.0)**     | **`pacman` with `brew on linux`** | x86_64      |

## 4. Stow Package Mapping Table

| Hardware/OS | Stow Package Mapping |
| :--- | :--- |
| **Mac Mini M4** | `base` + `mac-mini` |
| **Surface Pro 6** | `base` + `surface-6` |
| **Chatreey NAS** | `base` + `chatreey-nas` |
| **Steam Deck** | `base` + `steam-deck` |

## 5. Library Management (3-Layer)

- **Layer 1 (Native PM)**: brew, apt, dnf, pacman.
- **Layer 2 (asdf)**: Java, Node.js, Python, Go, Rust 버전 관리.
- **Layer 3 (Binary)**: `~/.local/bin` 직접 배포.

## 6. Migration Plan

- **Goal**: 기존 `ln -s` 수동 방식에서 GNU Stow 체제로 완전 전환.
- 