#!/bin/bash

# zsh-autosuggestions installation script
# Installs via git clone to oh-my-zsh custom plugins directory

set -e

if [ -z "${HOME:-}" ]; then
    if [ "$(id -u)" = "0" ]; then
        export HOME=/root
    else
        export HOME=$(getent passwd "$(id -un)" | cut -d: -f6)
    fi
fi

echo "HOME fixed: $HOME (USER=$USER, UID=$(id -u))"

echo "Installing zsh-autosuggestions..."

# Check if oh-my-zsh is installed
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}" ]; then
    echo "Error: oh-my-zsh not found. Please install oh-my-zsh first."
    echo "Expected directory: ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
    exit 1
fi

# Define plugin directory
PLUGIN_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Check if already installed
if [ -d "$PLUGIN_DIR" ]; then
    echo "zsh-autosuggestions already installed at: $PLUGIN_DIR"
    echo "Updating existing installation..."
    cd "$PLUGIN_DIR"
    git pull origin master
else
    echo "Cloning zsh-autosuggestions to: $PLUGIN_DIR"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$PLUGIN_DIR"
fi

echo "zsh-autosuggestions installation completed"
echo "Don't forget to add 'zsh-autosuggestions' to your plugins in ~/.zshrc"