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

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Nginx is not installed, installing now"
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo "Nginx is already installed"
fi


dnf list installed java 

if [ $? -ne 0 ]
then 
    echo  "Java is not installed, installing now"
    dnf install java -y
    VALIDATE $? "Java"
else
    echo "Java is already installed"
fi

