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






#
##!/usr/bin/env bash
#
#USERID=$(id -u)
#
#if [ "$USERID" -ne 0 ]
#then
#    echo "Please run this script as root."
#    exit 1
#fi
#
#install_package() {
#    if dnf list installed "$1" &>/dev/null
#    then
#        echo "$1 is already installed."
#    else
#        echo "$1 is not installed. Installing..."
#
#        if dnf install "$1" -y
#        then
#            echo "$1 installation successful."
#        else
#            echo "$1 installation failed."
#            exit 1
#        fi
#    fi
#}
#
#for package in mysql python3 nginx git
#do
#    install_package "$package"
#done