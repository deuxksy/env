#!/bin/bash

# setup.sh
# Environment Setup Script
# Detects OS and symlinks configuration files to $HOME

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Default Dry Run mode is off
DRY_RUN=false

# Parse arguments
for arg in "$@"; do
    case $arg in
        --dry-run)
            DRY_RUN=true
            echo -e "${YELLOW}[DRY RUN] No changes will be applied.${NC}"
            ;;
    esac
done

# Detect OS
OS_NAME=$(uname)
DISTRO=""

if [ "$OS_NAME" == "Darwin" ]; then
    echo -e "${GREEN}Detected OS: macOS${NC}"
    SOURCE_DIR="mac/Users/default"
elif [ "$OS_NAME" == "Linux" ]; then
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
        echo -e "${GREEN}Detected Linux Distro: $DISTRO${NC}"
        
        if [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "pop" ]]; then
             SOURCE_DIR="linux/ubuntu/home"
        elif [[ "$DISTRO" == "steamos" ]]; then
             SOURCE_DIR="linux/steamdeck/home"
        else
             echo -e "${YELLOW}Unknown Linux Distro: $DISTRO. Defaulting to Ubuntu config.${NC}"
             SOURCE_DIR="linux/ubuntu/home"
        fi
    else
        echo -e "${RED}Cannot detect Linux distribution.${NC}"
        exit 1
    fi
else
    echo -e "${RED}Unsupported OS: $OS_NAME${NC}"
    exit 1
fi

# Link Files
REPO_ROOT=$(pwd)
FULL_SOURCE_DIR="$REPO_ROOT/$SOURCE_DIR"

if [ ! -d "$FULL_SOURCE_DIR" ]; then
    echo -e "${RED}Source directory not found: $FULL_SOURCE_DIR${NC}"
    exit 1
fi

echo -e "Linking files from ${YELLOW}$FULL_SOURCE_DIR${NC} to ${YELLOW}$HOME${NC}..."

# Find all files in source dir, relative to source dir
cd "$FULL_SOURCE_DIR"
find . -type f | while read -r file; do
    # Remove leading ./
    rel_path="${file#./}"
    target_path="$HOME/$rel_path"
    source_path="$FULL_SOURCE_DIR/$rel_path"
    target_dir=$(dirname "$target_path")

    # Create target directory if it doesn't exist
    if [ ! -d "$target_dir" ]; then
        if [ "$DRY_RUN" = true ]; then
             echo "[DRY RUN] mkdir -p $target_dir"
        else
             mkdir -p "$target_dir"
        fi
    fi

    # Check if target exists
    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
        # Check if it's already a symlink to the correct file
        if [ -L "$target_path" ] && [ "$(readlink "$target_path")" == "$source_path" ]; then
            echo -e "${GREEN}[OK] $rel_path is already linked.${NC}"
            continue
        fi

        # Backup existing file
        if [ "$DRY_RUN" = true ]; then
            echo "[DRY RUN] mv $target_path $target_path.bak"
        else
            echo -e "${YELLOW}[BACKUP] Moving existing $target_path to $target_path.bak${NC}"
            mv "$target_path" "$target_path.bak"
        fi
    fi

    # Create Symlink
    if [ "$DRY_RUN" = true ]; then
        echo "[DRY RUN] ln -sf $source_path $target_path"
    else
        ln -sf "$source_path" "$target_path"
        echo -e "${GREEN}[LINK] $rel_path -> $source_path${NC}"
    fi
done
