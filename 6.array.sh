#!/bin/env bash

MOVIES=("Avengers" "Inception" "Interstellar" "The Dark Knight" "The Matrix")
# This is an array of movies. Each movie is an element of the array.

echo "My favorite movies are: ${MOVIES[@]}"
# ${MOVIES[@]} will print all the elements of the array MOVIES

echo "The first movie in the list is: ${MOVIES[0]}"
# ${MOVIES[0]} will print the first element of the array MOVIES

echo "The last movie in the list is: ${MOVIES[4]}"
# ${MOVIES[4]} will print the last element of the array MOVIES

echo "The number of movies in the list is: ${#MOVIES[8]}"
# ${#MOVIES[8]} it will print Zero because there is no element at index 8 in the array

: '
Key Difference
[*] → one string
[@] → multiple separate elements
'
