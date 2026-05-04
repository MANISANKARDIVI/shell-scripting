#!/bin/env bash
# This script demonstrates the use of if conditions in bash

NUMBER=$1

if [ "$NUMBER" -gt 5 ]
then
    echo "Number is greater than 5"
fi

#!/bin/env bash
NUMBER=$1

if [ "$NUMBER" -lt 10 ]
then
    echo "Number is less than 10"
fi

# -gt => greater than
# -lt => lesser than
# -eq => equals to
# -nq => not equals to