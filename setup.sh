# ==============================================================================
# Setup Script for Dotfiles (Stow + 3-Layer Library Management)
# Layers:
# 1. Native PM (brew, apt, dnf, pacman) -> Base utils (stow, git, zsh)
# 2. Stow -> Link dotfiles
# 3. asdf -> Runtime versions
# ==============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"
DISTRO=""
DRY_RUN=false

if [ "$1" == "--dry-run" ]; then
    DRY_RUN=true
    echo ">> [DRY-RUN] Mode Active. No changes will be made."
fi

# Helper to execute or print commands
execute() {
    if [ "$DRY_RUN" = true ]; then
        echo "   [DRY-RUN] Executing: $@"
    else
        "$@"
    fi
}

# Detect Linux Distro
if [ "$OS" == "Linux" ]; then
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    fi
fi

echo ">> Detected Environment: OS=$OS, DISTRO=$DISTRO"

# ------------------------------------------------------------------------------
# Layer 1: Native Package Manager
# ------------------------------------------------------------------------------
install_native_deps() {
    echo ">> [Layer 1] Installing Native Dependencies..."
    
    if [ "$OS" == "Darwin" ]; then
        if ! command -v brew &> /dev/null; then
             echo "Error: Homebrew not found. Please install Homebrew first."
             exit 1
        fi
        # Brew is usually safe to run install on existing packages
        execute brew install stow git zsh curl || true 
        
    elif [ "$OS" == "Linux" ]; then
        if [ "$DISTRO" == "ubuntu" ] || [ "$DISTRO" == "debian" ] || [ "$DISTRO" == "pop" ]; then
            if command -v sudo &> /dev/null; then
                execute sudo apt update
                execute sudo apt install -y stow git zsh curl build-essential
            else
                echo "Warning: sudo not found. Skipping apt install."
            fi
            
        elif [ "$DISTRO" == "fedora" ]; then
            if command -v sudo &> /dev/null; then
                execute sudo dnf install -y stow git zsh curl
            fi
            
        elif [ "$DISTRO" == "steamos" ] || [ "$DISTRO" == "arch" ]; then
             if command -v sudo &> /dev/null; then
                 # SteamOS might be read-only
                 execute sudo pacman -Sy --noconfirm stow git zsh curl || echo "Pacman install failed (Read-only FS?). Ensuring stow exists..."
             fi
        fi
    fi
}

# ------------------------------------------------------------------------------
# Layer 2: GNU Stow
# ------------------------------------------------------------------------------
run_stow() {
    echo ">> [Layer 2] Linking Dotfiles with Stow..."
    
    STOW_OPTS="-v -R -t $HOME -d $SCRIPT_DIR"
    if [ "$DRY_RUN" = true ]; then
        STOW_OPTS="$STOW_OPTS -n"
    fi

    # Base Package (Common)
    if [ -d "$SCRIPT_DIR/base" ]; then
        echo "   -> Linking 'base'..."
        # We execute stow directly because we want to see its verbose output (simulated or real)
        # But wait, execute() suppresses output if not dry run? No, execute runs it. 
        # But if DRY_RUN is true, execute just echos. Stow has its own dry run mode (-n).
        # We should use stow's native dry run for better validation.
        execute stow $STOW_OPTS base
    fi

    # OS Specific Packages
    TARGET_PKG=""
    if [ "$OS" == "Darwin" ]; then
        TARGET_PKG="mac-mini"
    elif [ "$OS" == "Linux" ]; then
        if [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
             TARGET_PKG="surface-6"
        elif [[ "$DISTRO" == "fedora" ]]; then
             TARGET_PKG="chatreey-nas"
        elif [[ "$DISTRO" == "steamos" || "$DISTRO" == "arch" ]]; then
             TARGET_PKG="steam-deck"
        fi
    fi

    if [ -n "$TARGET_PKG" ] && [ -d "$SCRIPT_DIR/$TARGET_PKG" ]; then
        echo "   -> Linking '$TARGET_PKG'..."
        execute stow $STOW_OPTS "$TARGET_PKG"
    else
        echo "   -> No specific package found for $DISTRO. Skipping."
    fi
}

# ------------------------------------------------------------------------------
# Layer 3: asdf Version Manager
# ------------------------------------------------------------------------------
install_asdf() {
    echo ">> [Layer 3] Configuring asdf..."
    
    if [ ! -d "$HOME/.asdf" ]; then
        echo "   -> Cloning asdf..."
        execute git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.18.0
    else
        echo "   -> asdf already installed."
    fi
    
    # Load asdf for this script session
    if [ -f "$HOME/.asdf/asdf.sh" ]; then
        . "$HOME/.asdf/asdf.sh"
    fi
    
    # Add plugins
    echo "   -> Adding plugins..."
    execute asdf plugin add nodejs || true
    execute asdf plugin add python || true
    execute asdf plugin add java || true
    execute asdf plugin add golang || true
    execute asdf plugin add rust || true
}

# ------------------------------------------------------------------------------
# Main Execution
# ------------------------------------------------------------------------------
install_native_deps
run_stow
install_asdf

echo ">> Setup Complete! Please restart your shell."
