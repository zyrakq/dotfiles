#!/usr/bin/env bash

cd "$WORKSPACE_FOLDER" || { echo "Error: Failed to change to project directory"; exit 1; }

# Check if the directory is empty (including hidden files)
if [ -n "$(ls -A)" ]; then
    exit 0
fi

# Get the current user name
CURRENT_USER=$(id -un)

# Change the owner of the current directory
if ! sudo chown -R "$CURRENT_USER:$CURRENT_USER" .; then
    echo "Error: Failed to change the owner of the directory"
    exit 1
fi

# Clone the repository (replace the URL with the desired one)
if ! git clone "$REPO_URL" .; then
    echo "Error: Failed to clone repository"
    exit 1
fi

echo "Success: Repository successfully cloned to current directory"