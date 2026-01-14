#!/bin/bash

THRESHOLD=80
USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "Current disk usage: ${USAGE}%"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
  echo "WARNING: Disk usage is above ${THRESHOLD}%"
  exit 1
else
  echo "OK: Disk usage is under ${THRESHOLD}%"
  exit 0
fi
