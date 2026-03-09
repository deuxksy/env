# Environment Settings (env)

개인적으로 사용하는 플랫폼별 환경 설정 및 관리 스크립트 모음입니다.

## 📂 프로젝트 구조

### 💻 OS별 설정

- **[base](./base)**: 모든 환경 공통 설정 (Git, Vim)
- **[eve](./eve)**: macOS 설정
- **[walle](./walle)**: Fedora 설정
- **[girl](./girl)**: Steam Deck 설정

## 🚀 사용법

GNU Stow를 사용하여 설정 파일을 홈 디렉토리에 심볼릭 링크합니다.

```bash
# 1. 저장소 클론
git clone https://github.com/deuxksy/env.git ~/git/env
cd ~/git/env

# 또는 수동으로 Stow 패키지 적용
stow -t ~ base        # 공통 설정
stow -t ~ eve         # macOS 설정
stow -t ~ base eve    # 공통 과 macOS 설정 같이
```

## 📋 Stow 패키지 매핑

| 환경            | 적용 패키지                |
| -------------- | ----------------------- |
| Mac Mini M4    | `base` + `eve`          |
| AOOSTAR WTR R1 | `base` + `walle`        |
| Steam Deck     | `base` + `girl`         |

---

_Last Updated: 2026-01-15_
