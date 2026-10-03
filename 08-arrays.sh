#!/usr/bin/env bash

ARRAY=("apple" "banana" "cherry" "date" "elderberry")

# Print the entire array
echo "To print entire array: ${ARRAY[@]}"

echo "To print first array: ${ARRAY[0]}"

echo "To print last array: ${ARRAY[4]}"

echo "To print 1st array: ${ARRAY[6]}" # this will print nothing because there is no 6th index in the array



