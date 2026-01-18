#!/bin/bash

# oh-my-zsh installation script
# Installs oh-my-zsh via official installation script

set -e

if [ -z "${HOME:-}" ]; then
    if [ "$(id -u)" = "0" ]; then
        export HOME=/root
    else
        export HOME=$(getent passwd "$(id -un)" | cut -d: -f6)
    fi
fi

echo "HOME fixed: $HOME (USER=$USER, UID=$(id -u))"

echo "Installing oh-my-zsh..."

# Check if oh-my-zsh is already installed
if [ -d ~/.oh-my-zsh ]; then
    echo "oh-my-zsh is already installed at ~/.oh-my-zsh"
    echo "Skipping installation"
    exit 0
fi

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
    echo "Error: zsh is not installed. Please install zsh first."
    exit 1
fi

# Check if curl is available
if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed. Please install curl first."
    exit 1
fi

echo "Downloading and installing oh-my-zsh..."

# Install oh-my-zsh with unattended installation
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "oh-my-zsh installation completed"
echo "Note: Shell was not changed automatically. Run 'chsh -s \$(which zsh)' to set zsh as default shell"