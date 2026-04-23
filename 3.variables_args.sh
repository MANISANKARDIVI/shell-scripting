#!/bin/env bash

#variables can be used to store strings, numbers, and other data types
# we are passing values trough arguments / args

PERSON1=$1
PERSON2=$2

echo "hello $PERSON1 this is $PERSON2"
echo "$PERSON1 i love you"
echo "will you marry me $PERSON1"
echo "$PERSON2 i love you too, i want to marry you"


# $ sh <filename.sh> <arg1> <arg2>
# $ sh 3.variables_args.sh "manisankar" "pooja khanna"