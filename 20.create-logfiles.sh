#!/usr/bin/env bash

# This is sample script ok

set -euo pipefail

LOG_DIR="/home/ec2-user/app-logs"
MONTH="2026-10"

mkdir -p "$LOG_DIR"

i=1

for day in $(shuf -i 1-30)
do
    LOG_FILE="$LOG_DIR/app_log_${i}.log"

    echo "This is a sample log file" > "$LOG_FILE"

    FILE_DATE="$MONTH-$(printf '%02d' "$day") 12:00:00"
    touch -d "$FILE_DATE" "$LOG_FILE"

    echo "Created: $LOG_FILE | Date: $FILE_DATE"

    i=$((i + 1))
done

echo "Created 30 log files with jumbled dates."