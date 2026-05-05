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
	dnf install mysql -d
	if [ $? -ne 0 ]
	then
		echo "Error: Mysql is not installed.."
		exit 1
	else
		echo "Mysql is successfully installed..."
		
else 
	echo "Mysql is already installed..."