#!/bin/bash
# Shebang: हा script bash shell मध्ये चालेल

# ==========================
# Disk Monitoring Script
# ==========================
# Purpose: Disk usage तपासणे, log ठेवणे,
#          आणि condition नुसार success/failure सांगणे

LOGFILE="/tmp/disk_monitor.log"
# LOGFILE: output कुठे save होईल ते path
# /tmp → temporary directory (server monitoring साठी common)

WARNING_THRESHOLD=1
CRITICAL_THRESHOLD=2
# दोन levels:
# 70% → warning
# 85% → critical (fail)

# df /        → root partition usage
# tail -1     → actual data line
# awk '{print $5}' → usage % column
# sed 's/%//' → % काढतो
USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

# date → current time (log timestamp साठी)
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Disk usage check started" >> $LOGFILE
# >> → log file ला append करतो (overwrite नाही)

echo "[$TIMESTAMP] Current disk usage: ${USAGE}%" >> $LOGFILE

# First condition: CRITICAL
if [ "$USAGE" -ge "$CRITICAL_THRESHOLD" ]; then
  echo "[$TIMESTAMP] CRITICAL: Disk usage >= ${CRITICAL_THRESHOLD}%" | tee -a $LOGFILE
  # tee -a → output terminal वर + log file मध्ये
  exit 1
  # exit 1 → failure (CI/CD / Cron साठी)

# Second condition: WARNING
elif [ "$USAGE" -ge "$WARNING_THRESHOLD" ]; then
  echo "[$TIMESTAMP] WARNING: Disk usage >= ${WARNING_THRESHOLD}%" | tee -a $LOGFILE
  exit 0
  # exit 0 → success, पण warning logged

# Else: OK
else
  echo "[$TIMESTAMP] OK: Disk usage under control" | tee -a $LOGFILE
  exit 0
fi
# if-elif-else block end
