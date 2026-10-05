#!/usr/bin/env bash

# -e = enable
#\e[*m → color code

#\e[0m → Reset
#\e[30m → Black
#\e[31m → Red
#\e[32m → Green
#\e[33m → Yellow
#\e[34m → Blue
#\e[35m → Purple
#\e[36m → Cyan
#\e[37m → White

echo -e "This is \e[31m red text and this is normal text"
# If you add color code you must be sure to reset it back to normal text using \e[0m, otherwise all the text after that will be colored.

echo "This is normal text"

echo -e "This is \e[36m cyan text \e[0m and this is normal text"