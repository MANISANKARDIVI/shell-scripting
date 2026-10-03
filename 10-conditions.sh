#!/usr/bin/env bash

# Number comparison operators
# -gt = greater than
# -lt = lesser than
# -eq = equal to
# -ne = not equal to
# -ge = greater than or equal to
# -le = lesser than or equal to


# $1 → First argument
NUM1=$1

if [ "$NUM1" -gt 10 ]
then
    echo "Given number $NUM1 is greater than 10"
else
    echo "Given number $NUM1 is 10 or lesser than 10"
fi


# $2 → Second argument
NUM2=$2

if [ "$NUM2" -lt 100 ]
then
    echo "Given number $NUM2 is lesser than 100"
else
    echo "Given number $NUM2 is 100 or greater than 100"
fi


# $3 → Third argument
NUM3=$3

if [ "$NUM3" -eq 10 ]
then
    echo "Given number $NUM3 is equal to 10"
else
    echo "Given number $NUM3 is not equal to 10"
fi


# $4 → Fourth argument
NUM4=$4

if [ "$NUM4" -ne 10 ]
then
    echo "Given number $NUM4 is not equal to 10"
else
    echo "Given number $NUM4 is equal to 10"
fi


# $5 → Fifth argument
NUM5=$5

if [ "$NUM5" -ge 10 ]
then
    echo "Given number $NUM5 is greater than or equal to 10"
else
    echo "Given number $NUM5 is lesser than 10"
fi


# $6 → Sixth argument
NUM6=$6

if [ "$NUM6" -le 100 ]
then
    echo "Given number $NUM6 is lesser than or equal to 100"
else
    echo "Given number $NUM6 is greater than 100"
fi