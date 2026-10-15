#!/usr/bin/env bash

# set -e — stop when an eligible command fails.
# trap '...' ERR — run an error handler when an eligible command fails.
# BASH_COMMAND — identifies the command being executed or the command associated with the failure in this trap context.
# $LINENO is a special Bash variable that gives the current line number in a shell script.

set -Eeuo pipefail

failure() {
    local exit_code=$?
    local line_number=$1
    local command=$2

    echo "FAILED at line ${line_number}"
    echo "Command: ${command}"
    echo "Exit code: ${exit_code}"
}

trap 'failure "$LINENO" "$BASH_COMMAND"' ERR

echo "Hello world!"

echoooo "how are you"

echo "i am fine"