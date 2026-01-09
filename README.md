# Environment Settings (env)

개인적으로 사용하는 플랫폼별 환경 설정 및 관리 스크립트 모음입니다.

## 📂 프로젝트 구조

### 💻 OS별 설정

- **[base](./base)**: 모든 환경 공통 설정 (Zsh, Vim, Git)
- **[mac-mini](./mac-mini)**: macOS 전용 `.alias`, `.path` 설정
- **[surface-6](./surface-6)**: Ubuntu (Surface Pro 6) 전용 설정
- **[chatreey-nas](./chatreey-nas)**: Fedora (NAS) 전용 설정
- **[steam-deck](./steam-deck)**: Steam Deck 전용 커스텀 설정
- **[windows](./windows)**: Windows 환경 (Winget 등) 가이드

## 🚀 사용법

각 디렉토리의 파일을 환경에 맞게 복사하거나 심볼릭 링크를 생성하여 사용합니다.

```bash
# 예시: macOS alias 설정 적용
source ~/git/env/mac-mini/.alias
```

---

*Last Updated: 2025-12-31*
