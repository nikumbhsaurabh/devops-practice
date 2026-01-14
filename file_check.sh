#!/bin/bash

FILE="/etc/passwd"

if [ -f "$FILE" ]; then
   echo "SUCCESS: File $FILE exists"
   exit 0
else
   echo "ERROR: $FILE does ot exist"
   exit1
fi

