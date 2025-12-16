#!/bin/bash
set -e

# ----------------------------------------------------------------------
# SSH Key Setup Script
# ----------------------------------------------------------------------
# This script adds a specific public SSH key to the authorized_keys file
# of the user running the script.
#
# Usage:
#   wget -O - https://1zeh.github.io/infra-join/setup_ssh.sh | bash
# ----------------------------------------------------------------------

PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGbvQMoYfVIp8/WxrGrzy+mn3AMyWLFJ6UyYjBl3txq/" 
KEY_COMMENT="ansible-deploy-key"

# Create .ssh directory with correct permissions
if [ ! -d "$HOME/.ssh" ]; then
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
    echo "Created $HOME/.ssh directory."
fi

# Create authorized_keys file if it doesn't exist
if [ ! -f "$HOME/.ssh/authorized_keys" ]; then
    touch "$HOME/.ssh/authorized_keys"
    chmod 600 "$HOME/.ssh/authorized_keys"
    echo "Created authorized_keys file."
fi

# Check if key already exists
if grep -q "$PUBLIC_KEY" "$HOME/.ssh/authorized_keys"; then
    echo "Success: Key is already present in authorized_keys."
else
    echo "$PUBLIC_KEY $KEY_COMMENT" >> "$HOME/.ssh/authorized_keys"
    echo "Success: Key added to authorized_keys."
fi
