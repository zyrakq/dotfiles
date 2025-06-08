#!/bin/bash

# Generic post-install script for openssh package (fallback)
echo "Configuring SSH agent (generic)..."

if command -v systemctl >/dev/null 2>&1 && systemctl --user status >/dev/null 2>&1; then
    # systemd доступен - пытаемся настроить ssh-agent service
    echo "systemd обнаружен, пытаемся настроить ssh-agent service..."
    
    # Пробуем сначала стандартный service
    if systemctl --user list-unit-files | grep -q "ssh-agent.service"; then
        systemctl --user enable ssh-agent.service
        systemctl --user start ssh-agent.service
        echo "SSH agent configured using ssh-agent.service"
    else
        # Пробуем с username
        USERNAME=$(whoami)
        if systemctl --user list-unit-files | grep -q "ssh-agent@"; then
            systemctl --user enable ssh-agent@$USERNAME.service
            systemctl --user start ssh-agent@$USERNAME.service
            echo "SSH agent configured using ssh-agent@$USERNAME.service"
        else
            echo "Не найден подходящий ssh-agent service, пропускаем настройку"
        fi
    fi
else
    echo "systemd недоступен, пропускаем настройку ssh-agent"
fi
