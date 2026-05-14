#!/bin/bash

# Colors 

echo -e "\e[31m this is red color\e[0m"

echo "this is color"

# above 2 lines are having same red color because we have not reset the color after printing red color

# we neeed to close the color after printing red color

echo -e "\e[32m this is green color\e[0m"

echo -e "\e[33m this is yellow color\e[0m"

echo -e "\e[34m this is blue color\e[0m"