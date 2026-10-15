#!/usr/bin/env bash

set -euo pipefail

# Get user ID
USERID=$(id -u)

# Colors
R="\e[31m"
G="\e[32m"
N="\e[0m"

# Log details
LOGS_FOLDER="/var/logs/shellscript-logs"
SCRIPT_NAME=$(basename "$0" .sh)
LOG_NAME="$LOGS_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR="/home/ec2-user/app-logs"

# Check root access
if [ "$USERID" -ne 0 ]
then
    echo -e "$R User doesn't have root access $N"
    exit 1
else
    echo -e "$G User has root access $N"
fi

# Create log folder
mkdir -p "$LOGS_FOLDER"

echo "Script started at: $(date)" | tee -a "$LOG_NAME"

# Check source directory
if [ ! -d "$SOURCE_DIR" ]
then
    echo "Source directory does not exist: $SOURCE_DIR" | tee -a "$LOG_NAME"
    exit 1
fi

# Find and delete old log files
find "$SOURCE_DIR" -type f -name "*.log" -mtime +14 -print0 |
while IFS= read -r -d '' log_name
do
    echo "Deleting file: $log_name" | tee -a "$LOG_NAME"

    if rm -- "$log_name"
    then
        echo "File deleted successfully: $log_name" | tee -a "$LOG_NAME"
    else
        echo "Failed to delete file: $log_name" | tee -a "$LOG_NAME"
        exit 1
    fi
done

echo "Script completed at: $(date)" | tee -a "$LOG_NAME"