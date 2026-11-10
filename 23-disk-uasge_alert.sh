#!/usr/bin/env bash

set -euo pipefail

# To check private Ip = $ hostname -i
# To check public Ip = $ curl -s ifconfig.me

#!/bin/bash

TO_ADDRESS="manisankar4893@gmail.com"
THRESHOLD=80
HOST=$(hostname -i)

# 1. Check disk usage
check_disk() {
    df -P -h | awk -v limit="$THRESHOLD" '
    NR > 1 {
        usage = $5
        sub(/%/, "", usage)

        if (usage + 0 >= limit) {
            printf "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n",
            $1, $2, $3, $4, $6
        }
    }'
}

ALERT_ROWS=$(check_disk)

if [ -z "$ALERT_ROWS" ]
then
    echo "Disk usage is normal. No email required."
    exit 0
fi


# 3. Send email
{
    printf 'To: %s\n' "$TO_ADDRESS"
    printf 'Subject: Disk Usage Alert - %s\n' "$HOST"
    printf 'MIME-Version: 1.0\n'
    printf 'Content-Type: text/html; charset=UTF-8\n'
    printf '\n%s\n' "$EMAIL_BODY"
} | msmtp "$TO_ADDRESS"

echo "Disk alert email sent successfully."