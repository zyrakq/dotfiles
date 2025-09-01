#!/bin/bash

# oh-my-zsh uninstallation script
# Removes oh-my-zsh installation

set -e

echo "Uninstalling oh-my-zsh..."

# Check if oh-my-zsh is installed
if [ ! -d ~/.oh-my-zsh ]; then
    echo "oh-my-zsh is not installed at ~/.oh-my-zsh"
    echo "Nothing to uninstall"
    exit 0
fi

# Run oh-my-zsh uninstaller if available
if [ -f ~/.oh-my-zsh/tools/uninstall.sh ]; then
    echo "Running oh-my-zsh uninstaller..."
    # Run uninstaller with environment variables to make it non-interactive
    ZSH=~/.oh-my-zsh sh ~/.oh-my-zsh/tools/uninstall.sh
else
    echo "oh-my-zsh uninstaller not found, removing directory manually..."
    rm -rf ~/.oh-my-zsh
fi

# Restore original shell configuration if backup exists
if [ -f ~/.zshrc.pre-oh-my-zsh ]; then
    echo "Restoring original .zshrc from backup..."
    mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
fi

echo "oh-my-zsh uninstallation completed"