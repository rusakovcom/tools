#!/bin/bash

# configure secure ssh for new vps (root access)
# curl -O https://raw.githubusercontent.com/rusakovcom/tools/main/configure_secure_ssh.sh

# usage example:
# ./configure_secure_ssh.sh <port for ssh> '<public ssh key>'
# ./configure_secure_ssh.sh 22123 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK0wmN/Cr3JXqmLW7u+g9pTh+wyqDHpSQEIQczXkVx9q anton@rusakov.org'

SSH_PORT=$1
SSH_KEY=$2

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
echo "$SSH_KEY" >> /root/.ssh/authorized_keys

sshd -t
if [ $? -eq 0 ]; then
    systemctl restart sshd
else
    cp /etc/ssh/sshd_config.backup.* /etc/ssh/sshd_config
    exit 1
fi
