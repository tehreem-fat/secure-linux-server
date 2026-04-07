#!/bin/bash

echo "[+] Applying secure firewall rules..."

# Flush existing rules
iptables -F

# Default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback
iptables -A INPUT -i lo -j ACCEPT

# Allow established connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow SSH (limit brute force)
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW -m limit --limit 3/min -j ACCEPT

# Log dropped packets
iptables -A INPUT -j LOG --log-prefix "DROP: "

echo "[+] Firewall hardened successfully"
