#!/bin/bash

# zsh-syntax-highlighting installation script
# Installs via git clone to oh-my-zsh custom plugins directory

set -e

echo "Installing zsh-syntax-highlighting..."

# Check if oh-my-zsh is installed
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}" ]; then
    echo "Error: oh-my-zsh not found. Please install oh-my-zsh first."
    echo "Expected directory: ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
    exit 1
fi

# Define plugin directory
PLUGIN_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Check if already installed
if [ -d "$PLUGIN_DIR" ]; then
    echo "zsh-syntax-highlighting already installed at: $PLUGIN_DIR"
    echo "Updating existing installation..."
    cd "$PLUGIN_DIR"
    git pull origin master
else
    echo "Cloning zsh-syntax-highlighting to: $PLUGIN_DIR"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGIN_DIR"
fi

echo "zsh-syntax-highlighting installation completed"
echo "Don't forget to add 'zsh-syntax-highlighting' to your plugins in ~/.zshrc"