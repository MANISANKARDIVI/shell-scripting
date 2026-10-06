#!/usr/bin/env bash

# Error handling
set -euo pipefail

# Get user ID
USERID=$(id -u)

# Colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Log folder and file
LOG_FOLDER="/var/log/shell-scripting"
SCRIPT_NAME=$(basename "$0" .sh)
LOG_FILE_NAME="$LOG_FOLDER/$SCRIPT_NAME.log"

# Packages
PACKAGES=("nginx" "git" "tree")


# Check root access
if [ "$USERID" -ne 0 ]
then
    echo -e "$R ERROR: User doesn't have root access $N"
    exit 1
else
    echo -e "$G SUCCESS: User has root access $N"
fi


# Create log folder
mkdir -p "$LOG_FOLDER"

echo "This script is running at $(date)" | tee -a "$LOG_FILE_NAME"


# Install packages
for package in "${PACKAGES[@]}"
do

    # Check whether package is installed
    if dnf list installed "$package" &>/dev/null
    then
        echo -e "$Y $package is already installed $N" | tee -a "$LOG_FILE_NAME"

    else
        echo -e "$Y $package is not installed. Installing now... $N" | tee -a "$LOG_FILE_NAME"

        if dnf install "$package" -y 2>&1 | tee -a "$LOG_FILE_NAME"
        then
            echo -e "$G $package installed successfully $N" | tee -a "$LOG_FILE_NAME"
        else
            echo -e "$R Failed to install $package $N" | tee -a "$LOG_FILE_NAME"
            exit 1
        fi
    fi

done

echo "This script is completed at $(date)" | tee -a "$LOG_FILE_NAME"