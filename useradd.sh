#!/bin/bash
# Add user to Oracle Linux 8/9 with wheel and docker groups, with ssh key.
# chmod +x useradd.sh
# bash useradd.sh "my.name" "ssh-ed25519 key"

USER_NAME="$1"
SSH_KEY="$2"

# Check if the user already exists
if id "$USER_NAME" &>/dev/null; then
    echo "User $USER_NAME already exists."
    exit 1
fi

# Create the user with no password (-M do not create home dir, will be created when setting up SSH keys)
useradd -M -G docker,wheel "$USER_NAME"
echo 'password' | passwd --stdin "$USER_NAME"

# Check if the user was successfully created
if [[ $? -ne 0 ]]; then
    echo "Failed to create user."
    exit 2
fi

# Create the user's SSH directory and authorized_keys file
SSH_DIR="/home/$USER_NAME/.ssh"
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"
mkdir /home/"$USER_NAME"
chown "$USER_NAME":"$USER_NAME" /home/"$USER_NAME"
mkdir -p "$SSH_DIR"
echo "$SSH_KEY" > "$AUTHORIZED_KEYS"
chown -R "$USER_NAME":"$USER_NAME" "$SSH_DIR"
chmod 700 "$SSH_DIR"
chmod 600 "$AUTHORIZED_KEYS"

# Output result
if [[ $? -eq 0 ]]; then
    echo "User $USER_NAME successfully created and SSH key added."
else
    echo "Failed to set up SSH key for user $USER_NAME."
    exit 3
fi

