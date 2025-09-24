#!/bin/bash
# user_setup.sh - Create a new secure user

# Create user with home directory and bash shell
sudo useradd -m -s /bin/bash devuser

# Set password for the user
echo "devuser:StrongPassword123" | sudo chpasswd

# Add user to sudo group
sudo usermod -aG sudo devuser

echo "✅ User 'devuser' created with sudo access"
