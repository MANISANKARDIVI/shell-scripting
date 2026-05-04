#!/bin/env bash

# $0 - name of the script
echo "Script name (\$0): $0"

# $# - number of arguments passed to the script
echo "Number of arguments (\$#): $#"

# $* - all arguments as a single string
echo "All arguments as one string with (\$*): $*"

# $@ - all arguments as separate values
echo "All arguments as separate values with (\$@):"
for arg in "$@"; do
    echo "  - $arg"
done

# $1-$9 - first nine positional arguments
echo "First arg (\$1): $1"
echo "Second arg (\$2): $2"
echo "Third arg (\$3): $3"

# Use a command to demonstrate $? (exit status of last command)
echo ""
echo "Running a command to demonstrate (\$?):"
true
echo "Exit status of the true command (\$?): $?"
false
echo "Exit status of the false command (\$?): $?"

# $! - PID of the last process run in background
sleep 1 &
background_pid=$!
echo "PID of last background command (\$!): $background_pid"
wait $background_pid

# $$ - PID of the current shell
echo "Process ID of current shell (\$\$): $$"

# $- - current shell options
echo "Current shell options (\$-): $-"
