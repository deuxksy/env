# SteamDeck
- Run these three commands in your terminal to add Homebrew to your PATH:
```bash
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/deck/.bash_profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```
- Install Homebrew's dependencies if you have sudo access:
```bash
    sudo pacman -S base-devel
```
- We recommend that you install GCC:
```bash
    brew install gcc
```
