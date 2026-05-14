#!/bin/env bash

R=\e[31m
G=\e[32m
Y=\e[33m
B=\e[34m
W=\e[37m

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: You must be root to run this script"
    exit 1
else 
    echo -e "$Y INFO:: You are root, you can run this script"
fi

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$R ERROR:: $2 failed to install"
        exit 1
    else 
        echo -e "$G INFO:: $2 installed successfully"
    fi
}

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo -e "$Y INFO:: Nginx is not installed, installing now"
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "$G INFO:: Nginx is already installed"
fi


dnf list installed java 

if [ $? -ne 0 ]
then 
    echo -e "$Y INFO:: Java is not installed, installing now"
    dnf install java -y
    VALIDATE $? "Java"
else
    echo -e "$G INFO:: Java is already installed"
fi

