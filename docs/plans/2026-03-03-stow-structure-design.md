# Stow 구조 설계

**날짜**: 2026-03-03
**상태**: 승인 완료

## 1. 개요

GNU Stow를 활용한 다중 플랫폼 dotfiles 관리 구조 재설계.

## 2. 패키지 구조

```
env/
├── base/              # 공통 설정 (모든 장비)
│   ├── .zshrc
│   ├── .vimrc
│   └── .gitconfig
│
├── mac-mini/          # macOS (Stow 관리)
│   ├── .ssh/config
│   ├── .zshrc
│   ├── .vimrc
│   ├── .path
│   ├── .alias
│   ├── .function.sh
│   ├── .netrc
│   ├── .bashrc
│   └── .profile
│   # 제외: .crush/, .ansible/, Brewfile, .key
│
├── chatreey-nas/      # Fedora NAS
│   └── .alias
│
├── steam-deck/        # Steam Deck
│   └── .alias
│   # 제외: Brewfile
│
├── surface-6/         # Windows (참조용, Stow 제외)
├── old/               # 백업 (Stow 제외)
└── nvim/              # Neovim (교차 플랫폼)
```

## 3. Stow 적용 방법

### Mac Mini M4
```bash
stow -t ~ base
stow -t ~ mac-mini
```

### Chatreey NAS (Fedora)
```bash
stow -t ~ base
stow -t ~ chatreey-nas
```

### Steam Deck
```bash
stow -t ~ base
stow -t ~ steam-deck
```

### Surface Pro 6 (Windows)
- 참조용으로만 사용, Stow 미적용

### Neovim (모든 플랫폼)
```bash
stow -t ~ nvim
```

## 4. 제외 항목 (.stow-local-ignore)

| 패키지 | 제외 항목 | 이유 |
|--------|----------|------|
| mac-mini | .crush, .ansible, Brewfile, .key | 개인 도구, 비밀정보 |
| steam-deck | Brewfile | 원 위치 유지 |
| surface-6 | 전체 | Windows 참조용 |
| old | 전체 | 백업용 |

## 5. 보안

- `.key` 파일은 `.gitignore`에 포함되어 Git 추적 제외
- 민감 정보가 포함된 파일은 수동 관리 권장
