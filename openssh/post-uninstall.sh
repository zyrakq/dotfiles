#!/bin/bash

# Generic post-uninstall script for openssh package (fallback)
echo "Cleaning up SSH agent configuration (generic)..."

if command -v systemctl >/dev/null 2>&1 && systemctl --user status >/dev/null 2>&1; then
    # systemd доступен - выполняем очистку
    echo "systemd обнаружен, очищаем ssh-agent service..."
    
    # Пробуем остановить стандартный service
    if systemctl --user is-active --quiet ssh-agent.service; then
        systemctl --user stop ssh-agent.service
        systemctl --user disable ssh-agent.service
        echo "SSH agent service stopped and disabled"
    fi
    
    # Пробуем остановить service с username
    USERNAME=$(whoami)
    if systemctl --user is-active --quiet ssh-agent@$USERNAME.service; then
        systemctl --user stop ssh-agent@$USERNAME.service
        systemctl --user disable ssh-agent@$USERNAME.service
        echo "SSH agent@$USERNAME service stopped and disabled"
    fi
else
    echo "systemd недоступен, очистка не требуется"
fi
