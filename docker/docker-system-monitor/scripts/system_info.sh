#!/bin/bash

# =====================
# System Information Script
# Author : Saurabh
# =====================

echo "============================="
echo "System Information"
echo "============================="

echo "User : $(whoami)"
echo "Date : $(date)"
echo "Uptime: $(uptime)"
echo "Disk_Usage: $(df -h /)"
echo "Memory Usage: $(free -h)"

echo "============================="
echo "Script Executed Successfully"
echo "============================="
exit 0
