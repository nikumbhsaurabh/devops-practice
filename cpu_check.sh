#!/bin/bash
THRESHOLD=75

#CPU idel % kadhto (vmstat)
IDLE=$(vmstat 1 2 | tail -1 | awk '{print $15}')

#Used = 100 - idle
USAGE=$((100 - IDLE))

echo "Current CPU Usage: ${USAGE}%"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "WARNING: CPU USAGE AOVE ${THRESHOLD}%"
    exit 1
else
    echo "OK: CPU USAGE UNDER CONTROL"
    exit 0
fi