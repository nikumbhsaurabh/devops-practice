#!/bin/bash

THRESHOLD=5

LOGFILE="/tmp/cpu_monitor.log"
ALERTFILE="/tmp/cpu_alert.log"

IDLE=$(vmstat 1 2 | tail -1 | awk '{print $15}')
USAGE=$((100 - IDLE))
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] CPU USAGE: ${USAGE}%" >> $LOGFILE
echo "CPU usage is ${USAGE}%"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
  echo "[$TIMESTAMP] ALERT: CPU USAGE HIGH (${USAGE}%)" >> $ALERTFILE
  exit 1
else
  exit 0
fi
