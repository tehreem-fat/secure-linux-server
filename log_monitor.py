import re
from collections import defaultdict

LOG_FILE = "/var/log/auth.log"  # Ubuntu (use /var/log/secure for RHEL)

failed_attempts = defaultdict(int)

with open(LOG_FILE, "r") as f:
    for line in f:
        if "Failed password" in line:
            ip_match = re.search(r'from (\d+\.\d+\.\d+\.\d+)', line)
            if ip_match:
                ip = ip_match.group(1)
                failed_attempts[ip] += 1

# Threshold detection
THRESHOLD = 5

for ip, count in failed_attempts.items():
    if count >= THRESHOLD:
        print(f"[ALERT] Possible brute-force attack from {ip} ({count} attempts)")

import os

def block_ip(ip):
    os.system(f"sudo iptables -A INPUT -s {ip} -j DROP")
    print(f"[ACTION] Blocked IP: {ip}")

for ip, count in failed_attempts.items():
    if count >= THRESHOLD:
        print(f"[ALERT] Brute-force attack from {ip}")
        block_ip(ip)
