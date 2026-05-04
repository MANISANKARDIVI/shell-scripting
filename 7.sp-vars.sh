#!/bin/env bash

# $0 - name of the script
echo "Script name (\$0): $0"

# $# - number of arguments passed to the script
echo "Number of arguments (\$#): $#"

# $* - all arguments as a single string
echo "All arguments as one string with (\$*): $*"

# $@ - all arguments as separate values
echo "All arguments as separate values with (\$@): $@"

# $1-$9 - first nine positional arguments
echo "First arg (\$1): $1"
echo "Second arg (\$2): $2"
echo "Third arg (\$3): $3"

# Use a command to demonstrate $? (exit status of last command)
echo "Running a command that succeeds (\$?): $?"

# $! - PID of the last process run in background
sleep 5 & echo "PID of last background command (\$!): $!"

# $$ - PID of the current shell
echo "Process ID of current shell (\$\$): $$"

# $PWD - current working directory
echo "Current working directory (\$PWD): $PWD"

# $USER - current user
echo "Current user (\$USER): $USER"

# $HOME - home directory of the current user
echo "Home directory of current user (\$HOME): $HOME"

