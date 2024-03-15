#!/usr/bin/env bash

echo -e "name=pedro\nage=20\ngender=M" > .env

# Both | (pipe) and <<< (here string) takes the value and send to
# the STDIN of the command, but pipe creates a subshell and <<< don't
# A problem situation is:
# 
# This does not work. 
#
# echo "hello world" | read first second
# echo $second $first
#
# It happens because the read command is in a pipeline
# so it runs in a subshell and when the command completes the subshell exits
# and the variables are lost
#
# This works.
#
# Because this way the variables are maintained in the current shell session
#
# read first second <<< "hello world"
# echo $second $first

cat .env | cut -d = -f 1
cat .env | cut -d = -f 2

# cut and awk can be used to get keys and values
# cut can only slice the strings with one character
# awk can slice strings even with regex so it is more flexible
cut -d = -f 1 <<< $(cat test.txt)
cut -d = -f 2 <<< $(cat test.txt)

cat test.txt | awk -F'=' '{print $1}'
cat test.txt | awk -F'=' '{print $2}'
