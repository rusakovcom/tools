#!/bin/bash

cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup.$(date +%Y%m%d_%H%M%S)

SSH_PORT='22121'

NEW_CONFIG=$(cat <<EOF  
Port $SSH_PORT
PermitRootLogin prohibit-password
PasswordAuthentication no
PubkeyAuthentication yes
PermitEmptyPasswords no
AllowTcpForwarding no
MaxAuthTries 3
EOF
)

echo "$NEW_CONFIG" > /etc/ssh/sshd_config

systemctl restart sshd
