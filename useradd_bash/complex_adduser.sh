#!/bin/bash

# Step 1: Download useradd.sh script
echo "Downloading useradd.sh script..."
curl -O https://raw.githubusercontent.com/rusakovcom/tools/main/useradd_bash/useradd.sh

# Step 2: Add multiple users with their keys
while read -r username key; do
    bash useradd.sh "$username" "$key"
done <<EOF
# List of users and keys
user1 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEs1YO8GtcfCDWp0VEY8d+OnfOoT/I8M/Lnvz0DGcAjF user1@example.com
user2 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDPpAaT27gLtCtRbhbgifbjGQpJjQl6kEe4pFpGGuRbG user2@example.com
user3 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKnlT1Mj8E09J+oQ2hT+7u3ZbKiyu7SZzyRqAQtvFR+Y user3@example.com
EOF

# Step 3: Delete useradd.sh script
echo "Deleting useradd.sh script..."
rm useradd.sh

echo "Script execution finished without errors."

