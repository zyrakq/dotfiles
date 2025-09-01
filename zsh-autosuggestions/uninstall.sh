#!/bin/bash

# zsh-autosuggestions uninstallation script
# Removes cloned repository from oh-my-zsh custom plugins directory

set -e

echo "Uninstalling zsh-autosuggestions..."

# Define plugin directory
PLUGIN_DIR="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Check if plugin directory exists
if [ -d "$PLUGIN_DIR" ]; then
    echo "Removing zsh-autosuggestions from: $PLUGIN_DIR"
    rm -rf "$PLUGIN_DIR"
    echo "zsh-autosuggestions removed successfully"
else
    echo "zsh-autosuggestions not found at: $PLUGIN_DIR"
    echo "Nothing to uninstall"
fi

echo "zsh-autosuggestions cleanup completed"
echo "Don't forget to remove 'zsh-autosuggestions' from your plugins in ~/.zshrc"