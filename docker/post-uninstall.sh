#!/bin/bash
set -euo pipefail

echo "Cleaning up Docker repo settings..."

sudo rm -f /etc/apt/keyrings/docker.asc
sudo rm -f /etc/apt/sources.list.d/docker.sources /etc/apt/sources.list.d/docker.list

sudo apt update

echo "✅ Docker repo settings removed."