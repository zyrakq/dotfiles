#!/bin/bash

# zsh-syntax-highlighting uninstallation script
# Removes cloned repository from oh-my-zsh custom plugins directory

set -e

echo "Uninstalling zsh-syntax-highlighting..."

# Define plugin directory
PLUGIN_DIR="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Check if plugin directory exists
if [ -d "$PLUGIN_DIR" ]; then
    echo "Removing zsh-syntax-highlighting from: $PLUGIN_DIR"
    rm -rf "$PLUGIN_DIR"
    echo "zsh-syntax-highlighting removed successfully"
else
    echo "zsh-syntax-highlighting not found at: $PLUGIN_DIR"
    echo "Nothing to uninstall"
fi

echo "zsh-syntax-highlighting cleanup completed"
echo "Don't forget to remove 'zsh-syntax-highlighting' from your plugins in ~/.zshrc"