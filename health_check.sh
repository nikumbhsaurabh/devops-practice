#!/bin/bash

#=========================================
# System Health Check Script
#=========================================

echo "===================================="
echo " System Health Check" 
echo "===================================="

echo "User:    $(whoami)"
echo "Hostname: $(hostname)"
echo "Date: $(date)"

echo "===================================="
echo "Disk Usage:" 
echo "===================================="

USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
THRESHOLD=80

echo "Current Disk Usage: ${USAGE}%"
if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "STATUS: Disk usage is High"
    exit 1
else
    echo "STATUS: Disk usage is OK"
    exit 0
fi
    