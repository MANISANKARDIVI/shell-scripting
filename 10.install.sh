#!/bin/env bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You don't have Root access permissions"
    exit 1
else
    echo "you are running with Root Access"
fi

dnf install mysql -y
