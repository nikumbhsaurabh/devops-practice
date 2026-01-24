#!/bin/bash
# ↑ Shebang
# यामुळे system ला कळतं की हा script bash shell मध्ये चालवायचा आहे

# ==========================
# System Health Check Script
# ==========================
# Script चं नाव आणि purpose
# Production मध्ये script काय करते हे clear असणं mandatory असतं

echo "=============================="
# echo → terminal वर text print करतो

echo " System Health Check"
# Script चालू आहे हे user ला कळण्यासाठी

echo "=============================="

echo "User     : $(whoami)"
# whoami → current logged-in user दाखवतो
# $( ) → command substitution
# म्हणजे command run करून त्याचा output इथे print होतो

echo "Hostname : $(hostname)"
# hostname → machine/server चं नाव
# DevOps मध्ये server identify करण्यासाठी उपयोगी

echo "Date     : $(date)"
# date → current date आणि time
# logs आणि troubleshooting साठी खूप important

echo ""
# रिकामी line → output readable दिसण्यासाठी

echo "Uptime:"
# फक्त label print करतो

uptime
# uptime → system किती वेळ चालू आहे ते दाखवतो
# Server stability check साठी वापरतात

echo ""
echo "Disk usage:"

USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
# ही सगळ्यात important line आहे

# df /        → root (/) partition चा disk usage
# tail -1     → शेवटची line (actual data)
# awk '{print $5}' → 5वा column (%usage)
# sed 's/%//' → % चिन्ह काढतो
# $( )        → सगळा output USAGE variable मध्ये store होतो

THRESHOLD=80
# Threshold म्हणजे limit
# जर disk usage 80% पेक्षा जास्त गेली तर problem मानायचा

echo "Current disk usage: ${USAGE}%"
# ${USAGE} → variable value print करतो

if [ "$USAGE" -ge "$THRESHOLD" ]; then
# if condition
# -ge → greater than or equal
# जर usage >= threshold असेल तर

  echo "STATUS: Disk usage is HIGH"
  # Warning message

  exit 1
  # exit 1 → script FAIL
  # CI/CD pipeline, cron, monitoring tools हे failure मानतात

else
  # जर condition false असेल (usage कमी असेल)

  echo "STATUS: Disk usage is OK"
  # Normal status message

  exit 0
  # exit 0 → script SUCCESS
  # Automation पुढे चालू राहते

fi
# if block end
