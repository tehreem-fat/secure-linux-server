# log_monitor.py - Detect failed SSH login attempts

import re

with open("/var/log/secure", "r") as f:
    for line in f:
        if "Failed password" in line:
            ip = re.findall(r'from (\d+\.\d+\.\d+\.\d+)', line)
            if ip:
                print(f"⚠️ Suspicious login attempt from {ip[0]}")
