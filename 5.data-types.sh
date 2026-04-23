#!/bin/env bash

NUMBER1=10
NUMBER2=20

TIME=$(date)
# $(date) will execute the date command and store the output in the variable TIME

echo "The script executed at: $TIME"

SUM=$((NUMBER1+NUMBER2))
# $((NUMBER1+NUMBER2)) will perform the addition of NUMBER1 and NUMBER2 and store the result in the variable SUM

echo "The sum of two numbers is: $SUM"