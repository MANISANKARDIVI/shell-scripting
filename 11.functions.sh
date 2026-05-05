#!/bin/env bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must be root to run this script"
    exit 1
else 
    echo "INFO:: You are root, you can run this script"
fi

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo "$2 failed to install"
        exit 1
    else 
        echo "$2 installed successfully"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed, installing now"
    dnf install mysql-server -y
    VALIDATE $? "MySQL"
else
    echo "MySQL is already installed"
fi


dnf list installed git 

if [ $? -ne 0 ]
then 
    echo  "Git is not installed, installing now"
    dnf install git -y
    VALIDATE $? "Git"
else
    echo "Git is nalready installed"
fi

