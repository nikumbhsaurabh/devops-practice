#!/bin/bash

# Memory Usage Threshold (Percenatge)
THRESHOLD=40

# Memory Usage Percentage kadhato
USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

echo "Current memory usage: ${USAGE}%"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "WARNINNG: Memory usage above: ${THRESHOLD}%"
    exit 1
else
    echo "OK: Memory usafe under control"
    exit 0
fi