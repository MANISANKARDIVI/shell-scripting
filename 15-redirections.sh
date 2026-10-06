#!/usr/bin/env bash

#####################
## redirections.sh ##
#####################

# < = redirect input
# > = redirect output
# >> = append output

# 1 = it store success output.
# 2 =  it store error/fail output.

# &> = it store both success and error output.
# &>> = it append both success and error output.


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-scripting"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "This scipt is executed at: $(date)" &>>$LOG_FILE


if [ "$USERID" -ne 0 ]
then
  echo -e "$R user don't have root access $N" &>>$LOG_FILE
  exit 1
else
  echo -e "$G user have root access $N" &>>$LOG_FILE
fi

package_installer() {
  PACKAGE=$1

  dnf list installed "$PACKAGE" &>>$LOG_FILE
  if [ $? -eq 0 ]
  then
    echo -e "$Y $PACKAGE is already installed $N" &>>$LOG_FILE
  else
    echo -e "$Y $PACKAGE is not installed, installing now $N" &>>$LOG_FILE
    dnf install "$PACKAGE" -y &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
      echo -e "$R Failed to install $PACKAGE $N" &>>$LOG_FILE
      exit 1
    else
      echo -e "$G $PACKAGE installed successfully $N" &>>$LOG_FILE
    fi
  fi
}

package_installer mysql
package_installer nginx
