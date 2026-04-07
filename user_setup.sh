#!/bin/bash

read -p "Enter username: " USERNAME

# Create user
sudo useradd -m -s /bin/bash "$USERNAME"

# Lock password login (force SSH key usage)
sudo passwd -l "$USERNAME"

# Add to sudo group
sudo usermod -aG sudo "$USERNAME"

echo "[+] User $USERNAME created with sudo access (password login disabled)"
