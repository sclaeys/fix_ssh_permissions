#!/bin/bash

# Define the user whose SSH settings need to be fixed
USER_HOME="$HOME"
SSH_DIR="$USER_HOME/.ssh"
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"

echo "Fixing SSH permissions for user: $(whoami)"

# Ensure the home directory has secure permissions
chmod 700 "$USER_HOME"
echo "Set home directory permissions to 700"

# Ensure .ssh directory exists and has the correct permissions
if [ ! -d "$SSH_DIR" ]; then
    echo "Creating .ssh directory..."
    mkdir -p "$SSH_DIR"
fi
chmod 700 "$SSH_DIR"
echo "Set .ssh directory permissions to 700"

# Ensure authorized_keys file exists and has the correct permissions
if [ -f "$AUTHORIZED_KEYS" ]; then
    chmod 600 "$AUTHORIZED_KEYS"
    echo "Set authorized_keys file permissions to 600"
else
    echo "No authorized_keys file found. If you are using key-based authentication, ensure this file is created."
fi

# Ensure SSH config file permissions are correct if it exists
SSH_CONFIG="$SSH_DIR/config"
if [ -f "$SSH_CONFIG" ]; then
    chmod 600 "$SSH_CONFIG"
    echo "Set SSH config file permissions to 600"
fi

# Ensure proper ownership (run as root if fixing another user's SSH access)
chown -R "$(whoami)":"$(whoami)" "$SSH_DIR"
echo "Set ownership of .ssh directory and contents to $(whoami)"

echo "SSH permissions have been successfully updated."
