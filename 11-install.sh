#!/usr/bin/env bash

# Exit status
# 0 - Success
# 1 - Error, we can write upto 1-127 numbers for exit status.

# to find user-id:: $id -u
# 0 - root user
# 1 & above - non root user

USERID=$(id -u)

# Check if the user has root privileges or not.
if [ "$USERID" -ne 0 ]
then
  echo "You dont have root privileges to run this script. Please run as root user."
  exit 1
else
  echo "You have root privileges to run this script."
fi

## check mysql is installed or not.
#if dnf list installed mysql &>/dev/null
#then
#  echo "mysql is already installed on this system."
#else "
#  echo "mysql is not installed on this system. Installing mysql."
#  dnf install mysql -y
#fi
#

