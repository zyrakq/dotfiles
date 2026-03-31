#!/bin/bash
set -euo pipefail

source /etc/os-release
if [[ ! "${ID,,}" =~ ^(debian|ubuntu)$ ]]; then
  echo "Error: Only Debian or Ubuntu supported." >&2
  exit 1
fi

ID_LOWER="${ID,,}"
CODENAME="${UBUNTU_CODENAME:-${VERSION_CODENAME}}"
# Fallback для Trixie: pkgs неполные (containerd.io missing)
if [[ "${ID_LOWER}" == "debian" && "${CODENAME}" == "trixie" ]]; then
  echo "Warning: Trixie fallback to bookworm (full pkgs available)."
  CODENAME="bookworm"
fi
ARCH="$(dpkg --print-architecture)"
GPG_URL="https://download.docker.com/linux/${ID_LOWER}/gpg"

echo "Setting up Docker repo for ${ID} ${CODENAME}..."

PACKAGES="docker.io docker-compose docker-doc podman-docker containerd runc"
if [[ "${ID_LOWER}" == "ubuntu" ]]; then
  PACKAGES+=" docker-compose-v2"
fi
sudo apt update -qq
sudo apt remove --purge -y ${PACKAGES} 2>/dev/null || true


sudo apt install -y ca-certificates curl || true
sudo install -m 0755 -d /etc/apt/keyrings
sudo rm -f /etc/apt/keyrings/docker.asc /etc/apt/sources.list.d/docker*

curl -fsSL "${GPG_URL}" -o /tmp/docker.asc
sudo mv /tmp/docker.asc /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

sudo tee /etc/apt/sources.list.d/docker.sources > /dev/null <<EOF
Types: deb
URIs: https://download.docker.com/linux/${ID_LOWER}
Suites: ${CODENAME}
Components: stable
Architectures: ${ARCH}
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update -qq
echo "✅ Docker repo set up: ${ID_LOWER}-${CODENAME} stable"
apt-cache policy docker-ce | head -3  # Verify