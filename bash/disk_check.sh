#!/bin/bash

THRESHOLD=80
USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
LOGFILE="/tmp/disk_check.log"

echo "Current Disk Usage: ${USAGE}%"
if [ "$USAGE" -ge "$THRESHOLD" ]; then
  echo "$(date) WARNING: Disk usage ${USAGE}%" | tee -a $LOGFILE
  exit 1
else
  echo "$(date) OK: Disk usage ${USAGE}%" | tee -a $LOGFILE
  exit 0
fi