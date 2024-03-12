#!/usr/bin/env bash

# Arguments
# ./script "foo" "my bar"

# "$@" pass each argument as it was received
# ${0} = "foo"
# ${1} = "my bar"
# Don't forget double quotes
echo "$@"

# "$*" join arguments in a string getting rid of whitespaces, just separating each word with one whitespace
# ${0} = "foo"
# ${1} = "my"
# ${2} = "bar"
# Don't forget double quotes
echo "$*" 

# Choose one argument
# 0 is the name of the script
echo ${1}

# Number of args received
echo $#

# Last command exit code
echo $?

# Script Session PID
echo $$

# -----------------------------------------------------------------------------

# Arrays
array=("one" "two" "three" "four")

# Choose one argument
echo ${array[1]}

# Choose one argument with negative index
# -1 returns the last element of an array
echo ${array[-1]}

# Choose all arguments
# Returns an array with all the arguments
echo ${array[@]}

# Choose all elements dividing by spaces
# array=("foo" "my bar") "foo" "my" "bar" is going to be returned here
# instead of "foo" "my bar" which is the behavior of @
echo ${array[*]}

# Choose a slice of arguments
# It returns the elements at "start" and at "end"
echo ${array[@]:start:end}

# Get all indexes
# Returns an array with the indexes
echo ${!array[@]}

# Get the length of one element of the array
# This example returns the length of "two": 3
echo ${#array[1]}

# Get the length of the array
# They return the same
echo ${#array[@]}
echo ${#array[*]}

# Save the output of a command as an array
array=( $(ls) )

# Append values to an array
array+=( "five" "six" "seven" )
