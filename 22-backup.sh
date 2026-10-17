#!/bin/bash

set -euo pipefail

USERID=$(id -u)
SOURCE_DIR=/home/ec2-user/app-logs/
DEST_DIR=/home/ec2-user/destination_dir
DAYS=14
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