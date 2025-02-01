#!/bin/bash
# configure secure ssh on new server
# curl -O https://raw.githubusercontent.com/rusakovcom/tools/main/configure_secure_ssh.sh

SSH_PORT='22121'

NEW_CONFIG=$(cat <<EOF  
Port $SSH_PORT
PermitRootLogin prohibit-password
PasswordAuthentication no
PubkeyAuthentication yes
X11Forwarding no
AllowTcpForwarding no
MaxAuthTries 3
EOF
)

cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup.$(date +%Y%m%d_%H%M%S)
echo "$NEW_CONFIG" > /etc/ssh/sshd_config

systemctl restart sshd
