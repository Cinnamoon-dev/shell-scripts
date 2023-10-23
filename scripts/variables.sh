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