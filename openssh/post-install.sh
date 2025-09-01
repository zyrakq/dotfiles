#!/bin/bash

# Generic post-install script for openssh package (fallback)
echo "Configuring SSH agent (generic)..."

if command -v systemctl >/dev/null 2>&1 && systemctl --user status >/dev/null 2>&1; then
    # systemd available - trying to configure ssh-agent service
    echo "systemd detected, trying to configure ssh-agent service..."
    
    # Try standard service first
    if systemctl --user list-unit-files | grep -q "ssh-agent.service"; then
        systemctl --user enable ssh-agent.service
        systemctl --user start ssh-agent.service
        echo "SSH agent configured using ssh-agent.service"
    else
        # Try with username
        USERNAME=$(whoami)
        if systemctl --user list-unit-files | grep -q "ssh-agent@"; then
            systemctl --user enable ssh-agent@$USERNAME.service
            systemctl --user start ssh-agent@$USERNAME.service
            echo "SSH agent configured using ssh-agent@$USERNAME.service"
        else
            echo "No suitable ssh-agent service found, skipping configuration"
        fi
    fi
else
    echo "systemd not available, skipping ssh-agent configuration"
fi
