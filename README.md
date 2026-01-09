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

GNU Stow를 사용하여 설정 파일을 홈 디렉토리에 심볼릭 링크합니다.

```bash
# 1. 저장소 클론
git clone https://github.com/deuxksy/env.git ~/git/env
cd ~/git/env

# 2. setup.sh 실행 (OS 자동 감지)
./setup.sh

# 또는 수동으로 Stow 패키지 적용
stow -t ~ base        # 공통 설정
stow -t ~ mac-mini    # macOS 전용 설정
```

## 📋 Stow 패키지 매핑

| 환경          | 적용 패키지             |
| ------------- | ----------------------- |
| Mac Mini M4   | `base` + `mac-mini`     |
| Surface Pro 6 | `base` + `surface-6`    |
| Chatreey NAS  | `base` + `chatreey-nas` |
| Steam Deck    | `base` + `steam-deck`   |

---

_Last Updated: 2026-01-09_
