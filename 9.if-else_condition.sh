#!/bin/env bash
# This script demonstrates the use of if-else conditions in bash
NUMBER=$1

if [ "$NUMBER" -gt 5 ]
then
    echo "Number is greater than 5 "
else
    echo "Number is less than 5"
fi

#!/bin/env bash

if [ "$NUMBER" -lt 5 ]
then
    echo "Number is less than 5"
else
    echo "Number is greater than 5"
fi


# -gt => greater than
# -lt => lesser than
# -eq => equals to
# -nq => not equals to