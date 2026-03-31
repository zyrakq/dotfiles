#!/bin/bash
set -euo pipefail

source /etc/os-release 2>/dev/null || true
ID_LOWER="${ID:-$(awk '/^ID=/ {print tolower($3)}' /etc/os-release 2>/dev/null || echo unknown)}"

if [[ ! "${ID_LOWER}" =~ ^(debian|ubuntu|arch)$ ]]; then
  echo "Error: Only Debian, Ubuntu, or Arch supported." >&2
  exit 1
fi

echo "Setting up non-root Docker access for ${ID}..."

sudo systemctl enable --now docker

if ! getent group docker >/dev/null; then
  sudo groupadd docker
fi

USER="${SUDO_USER:-${USER}}"
if [[ -z "${USER}" ]] || [[ "${USER}" == "root" ]]; then
  echo "Error: Run as non-root user with sudo." >&2
  exit 1
fi

if ! groups "${USER}" | grep -q docker; then
  sudo usermod -aG docker "${USER}"
  echo "✅ User ${USER} added to docker group."
else
  echo "ℹ️ User ${USER} already in docker group."
fi

echo "Log out and log back in (or run 'newgrp docker') to apply changes."
echo "Test: docker run hello-world"