#!/usr/bin/env bash

# Special Variables in Bash
: <<'COMMENT'
$0 - It displays the name of the script being executed.
$1, $2, $3, ... - These variables represent the positional parameters passed to the script.
$# - It gives the total count of positional parameters passed to the script.
$@ - It represents all the positional parameters as separate quoted strings.
$* - It represents all the positional parameters as a single string.
$? - It holds the exit status of the last executed command.
$$ - It gives the process ID (PID) of the current script.
$! - It holds the process ID of the last background command.
COMMENT

echo "name of the file is: $0"
echo "this is line of arguments: $1, $2, $3, $4"
echo "total number of arguments: $#"
echo "all arguments as separate quoted strings: $@"
echo "all arguments as a single string: $*"
echo "exit status of last command: $?"
echo "process ID of current script: $$"
sleep 5 &
echo "process ID of last background command: $!"

# shell special variables
echo "current user: $USER"
echo "home directory: $HOME"
echo "current working directory: $PWD"
