# 🔐 Enterprise Linux Security Hardening & Threat Detection Toolkit

## 📌 Overview
This project implements an **enterprise-grade Linux security hardening and threat detection system** using Bash and Python. It simulates real-world security operations by combining system hardening, log monitoring, and automated incident response.

The goal is to demonstrate **practical cybersecurity skills** including Linux hardening, intrusion detection, and DevSecOps automation.

---

## 🎯 Key Features

### 🔐 System Hardening
- Secure user creation with disabled password authentication
- SSH hardening (root login disabled, restricted access)
- Firewall configuration using iptables with stateful filtering
- Brute-force protection using connection limits

---

### 🕵️ Threat Detection
- Real-time log monitoring for failed SSH login attempts
- Detection of brute-force attacks using threshold-based analysis
- Regex-based IP extraction from system logs

---

### ⚡ Automated Incident Response
- Automatic blocking of malicious IP addresses
- Integration with firewall rules for active defense
- Alert generation for suspicious activity

---

### 🔄 DevSecOps Integration
- CI/CD pipeline using Jenkins
- Automated script validation (Bash & Python)
- Security checks for misconfigurations
- Deployment simulation with reporting

---

## 🧱 Architecture
User Setup → Firewall Hardening → Log Monitoring → Threat Detection → Auto Response

---

## 🛠️ Technologies Used

- **Linux (Ubuntu/RHEL)**
- **Bash Scripting**
- **Python (Log Analysis & Automation)**
- **iptables (Firewall Security)**
- **Jenkins (CI/CD Pipeline)**

---

## 🚀 Setup & Usage

### 1️⃣ Clone Repository
```bash
git clone https://github.com/tehreem-fat/enterprise-linux-security-hardening-toolkit.git
cd enterprise-linux-security-hardening-toolkit
chmod +x *.sh
sudo ./user_setup.sh
sudo ./firewall_rules.sh
python3 log_monitor.py
