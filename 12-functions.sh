#!/usr/bin/env bash

USERID=$(id -u)

if [ "$USERID" -ne 0 ]
then
    echo "Please run this script as root."
    exit 1
fi


install_package() {

    PACKAGE=$1

    if dnf list installed "$PACKAGE" &>/dev/null
    then
        echo "$PACKAGE is already installed."
    else
        echo "$PACKAGE is not installed. Installing..."

        dnf install "$PACKAGE" -y

        if [ "$?" -ne 0 ]
        then
            echo "$PACKAGE installation failed."
            exit 1
        else
            echo "$PACKAGE installation successful."
        fi
    fi
}


install_package mysql
install_package python3
install_package nginx
install_package git