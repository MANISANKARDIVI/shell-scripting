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

echo -e "\e[35m This is purple text"
# above color add to full line, wat if u want to color only a part of the line, then use below code

echo -e "This is \e[31m red text \e[0m and this is normal text"
