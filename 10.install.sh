#!/bin/env bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
	echo "Error: You dont have Root permissons..."
	exit 1
else
	echo "You have Root Access..."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
	echo "Mysql is not installed... Now its installing"
	dnf install mysql -y
	if [ $? -eq 0 ]
	then
		echo "Mysql is installed successfully..."
	else
		echo "Failed to install Mysql..."
        exit 1
    fi
		
else 
	echo "Mysql is already installed..."
fi
