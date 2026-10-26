#!/bin/bash

set -euo pipefail

USERID=$(id -u)
SOURCE_DIR="$1"
DEST_DIR="$2"
DAYS=1${3:-14}
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE="$LOGS_FOLDER/backup.log"
TIMESTAMP=$(date +%F-%H-%M-%S)


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

check_root(){
    if [ "$USERID" -ne 0 ]
    then
        echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
        exit 1 #give other than 0 upto 127
    else
        echo "You are running with root access" | tee -a $LOG_FILE
    fi
}

check_root

mkdir -p "$LOGS_FOLDER"

if [ ! -d "$SOURCE_DIR" ]
then
    echo -e "$R Source Directory $SOURCE_DIR does not exist. Please check $N"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]
then
    echo -e "$R Destination Directory $DEST_DIR does not exist. Please check $N"
    exit 1
fi

FILES=$(find "$SOURCE_DIR" -name "*.log" -mtime +"$DAYS")

if [ ! -z "$FILES" ]
then
    echo "Files to zip are: $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"

    cd "$SOURCE_DIR" && find -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"

    if [ -f "$ZIP_FILE" ]
    then
        echo -e "Successfully created Zip file"

        while IFS= read -r filepath
        do
            echo "Deleting file: $filepath" | tee -a $LOG_FILE
            rm -rf "$filepath"
        done <<< "$FILES"
        echo -e "Log files older than $DAYS from source directory removed ... $G SUCCESS $N"
    else
        echo -e "Zip file creation ... $R FAILURE $N"
        exit 1
    fi
else
    echo -e "No log files found older than 14 days ... $Y SKIPPING $N"
fi



# To write backup script.
# we need both source and destination directory
# we check user have root access
# backup days by default=14
# logs file & folder, to store script logs
#

#!/usr/bin/env bash
set -euo pipefail
# To write backup script.
# we need both source and destination directory
# we check user have root access
# backup days by default=14
# logs file & folder, to store script logs
# identidy file in SOURCE_DIR
# If files available convert into .gzip

USER_ID=$(id -u)

SOURCE_DIR="/root/source"
DESTINATION_DIR="/tmp/destination"
DAYS=14
LOG_DIR="/var/logs/backup"
LOG_FILE="${LOG_DIR}/script.log"
SCRIPT_NAME=$(basename "$0" .sh)

root_check() {
    if [ "$USER_ID" -eq 0 ]
    then
        echo "User have the Root Access"
    else
        echo "User dont have Root Access"
        exit 1
    fi
}

root_check

mkdir -p "$LOG_DIR"

if [ -d "$SOURCE_DIR" ] && [ -d "$DESTINATION_DIR" ]
then
    echo "Both Directory are avaiable"
elif [ -d "$SOURCE_DIR" ]
then
    echo "only SOURCE_DIR avaiable, DESTINATION_DIR is missing!!"
    exit 1
elif [ -d "$DESTINATION_DIR" ]
then
    echo "only DESTINATION_DIR avaiable, SOURCE_DIR is missing!!"
    exit 1
else
    echo "Both Directory are missing!!"
    exit 1
fi

# Step 1: Find old log files

cd "$SOURCE_DIR" || exit 1
FILES=$(find . -type f -name "*.log" -mtime +"$DAYS")

# Step 2: Check if files exist

if [ -z "$FILES" ]
then
    echo "No old log files found"
    exit 0
fi

# Step 3: Create the .tar.gz backup

TIMESTAMP=$(date +%F-%H-%M-%S)
BACKUP_FILE="$DESTINATION_DIR/backup-$TIMESTAMP.tar.gz"  || exit 1

find . -type f -name "*.log" -mtime +"$DAYS" -print0 | tar --null -czf "$BACKUP_FILE" --files-from=-

# Step 4: Delete original files after backup

if [ -f "$BACKUP_FILE" ]
then
    while IFS= read -r FILE
    do
        rm -f "$FILE"
    done <<< "$FILES"

    echo "Backup completed"
else
    echo "Backup failed"
    exit 1
fi

# <<< "$FILES" feeds those filenames into the loop.
# read -r FILE reads one line at a time.
