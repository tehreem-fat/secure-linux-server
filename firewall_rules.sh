#!/bin/bash
# firewall_rules.sh - Basic iptables rules for SSH security

# Allow SSH only on port 22
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow trusted IP (replace with your own trusted IP)
sudo iptables -A INPUT -s 10.0.2.15 -j ACCEPT

# Drop all other incoming traffic
sudo iptables -A INPUT -j DROP

echo "✅ Firewall rules applied successfully"
