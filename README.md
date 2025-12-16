# Infra Join

This repository contains scripts to bootstrap infrastructure access.

## SSH Setup

The `setup_ssh.sh` script configures SSH access by adding the Ansible deployment key to the current user's `authorized_keys`.

### Usage

You can run the script directly from the web using `wget`:

```bash
wget -O - https://1zeh.github.io/infra-join/setup_ssh.sh | bash
```

### What it does

1. Creates the `~/.ssh` directory if it doesn't exist (permissions 700).
2. Creates `~/.ssh/authorized_keys` if it doesn't exist (permissions 600).
3. Adds the specific Ed25519 public key to `authorized_keys` if not already present.
