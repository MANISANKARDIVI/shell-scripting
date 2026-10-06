#!/usr/bin/env bash

USERID=$(id -u)
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NO_COLOR="\e[0m"


if [ "$USERID" -ne 0 ]
then
  echo -e "$RED user don't have root access $NO_COLOR"
  exit 1
else
  echo -e "$GREEN user have root access $NO_COLOR"
fi

package_installer() {
  PACKAGE=$1

  dnf list installed "$PACKAGE" &>/dev/null
  if [ $? -eq 0 ]
  then
    echo -e "$YELLOW $PACKAGE is already installed $NO_COLOR"
  else
    echo -e "$YELLOW $PACKAGE is not installed, installing now $NO_COLOR"
    dnf install "$PACKAGE" -y
    if [ $? -ne 0 ]
    then
      echo -e "$RED Failed to install $PACKAGE $NO_COLOR"
      exit 1
    else
      echo -e "$GREEN $PACKAGE installed successfully $NO_COLOR"
    fi
  fi
}

package_installer mysql
package_installer nginx
