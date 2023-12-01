#!/usr/bin/env bash

# Variables CRUD

# ---------------------------------------------------------------------------- #
# CREATE and EDIT

# string
foo="bar"

declare foo
foo="bar"

declare foo="bar"

readonly fizz="buzz" # constant

declare vol
vol='1'
readonly vol # constant

# integer
declare -i buzz
buzz=1
buzz=10

declare -i buzz=1

# array
declare -a arr
arr=("a" 10 "b" "c")

declare j="a"
declare -i k=10
declare l="b"
declare m="c"

declare -a arr1
arr1[0]=$j
arr1[1]=$k
arr1[2]=$l
arr1[3]=$m

# ---------------------------------------------------------------------------- #
# READ

echo "$foo"
echo "$buzz"

echo "arr1: "
echo "[0]: ${arr1[0]}"
echo "[1]: ${arr1[1]}"
echo "[2]: ${arr1[2]}"
echo "[3]: ${arr1[3]}"

declare -p arr1

# ---------------------------------------------------------------------------- #
# DELETE

unset foo
unset buzz
unset arr
unset arr1
unset vol # error, can not delete constant until session finishes

# ---------------------------------------------------------------------------- #
# OPERATIONS

# arithmetic operations
# Store the result and returns it
# $((arithmetic expression))
echo "sum: $(($n1+$n2))"
echo "minus: $(($n1-$n2))"
echo "multiply: $(($n1*$n2))"

# divisão precisa ser inteira, senão retorna 0
echo "division: $(($n2/$n1))"

# commands
# Stores the output and then returns it
# $(command)

declare output=$(cat /etc/shells | grep tmux)
echo "$output"

# value
# Returns the value
# The same as $value, unless its an array or you want something else
# ${value}

val=("pedro" "daniel" "henrique" "guilherme")
echo ${val[0]} # pedro
echo ${val[1]} # daniel
echo ${val[@]} # pedro daniel henrique guilherme

echo ${#val[1]} # 6 (length of "daniel")
echo ${!val[0]} # this translates to $pedro

#Use it for positional params with more than one digit
#$1 == ${1}
#$10 != ${10} It does not work without the brackets
