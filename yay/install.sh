#!/bin/bash

# yay AUR helper installation script
# Checks if yay is installed and installs it if missing

set -e

echo "Checking yay installation..."

# Check if yay is already installed
if command -v yay &> /dev/null; then
    echo "yay is already installed: $(yay --version)"
    exit 0
fi

echo "yay not found, starting installation..."

# Check for git and base-devel
if ! command -v git &> /dev/null; then
    echo "Installing git..."
    sudo pacman -S --noconfirm git
fi

if ! pacman -Qi base-devel &> /dev/null; then
    echo "Installing base-devel..."
    sudo pacman -S --noconfirm base-devel
fi

# Create temporary directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo "Cloning yay from AUR..."
git clone https://aur.archlinux.org/yay.git

cd yay

echo "Building and installing yay..."
makepkg -si --noconfirm

# Clean up temporary files
cd /
rm -rf "$TEMP_DIR"

echo "yay successfully installed: $(yay --version)"
