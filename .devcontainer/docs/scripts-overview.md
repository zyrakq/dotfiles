# Scripts Overview

This document provides a brief overview of the scripts used in the `.devcontainer` folder.

## 1. `install-packages.sh`

This script installs necessary packages and performs initial setup inside the development container.  
It is shared across all configurations (`arch-kde`, `arch`).

---

## 2. `clone-repo.sh`

This script clones the dotfiles repository into the main workspace folder of the development container if it is empty.  
It uses the `REPO_URL` environment variable to determine which repository to clone.  
It is shared across all configurations (`arch-kde`, `arch`).

---

For more advanced ways to extend development containers, refer to the [VSCode documentation](https://code.visualstudio.com/remote/advancedcontainers/start-processes).
