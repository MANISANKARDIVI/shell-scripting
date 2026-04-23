#!/bin/env bash

echo "Enter ATM pin number:"

read PIN
# It will read the input from the user and store it in the variable PIN

echo "your pin number is: $PIN"

########################
########################
########################

#!/bin/env bash

echo "Enter ATM pin number:"

read -s PIN
#  -s option will hide the input from the user
echo "your pin number is: $PIN"
