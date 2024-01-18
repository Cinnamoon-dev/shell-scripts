#!/usr/bin/env bash

var1="b"
var2="a"

declare -i n1=1
declare -i n2=2

#---------------------------------------#
# Normal conditional
if [[ "$var1" = "$var2" ]]; then
    echo "same"
else
    echo "different"
fi

# There are test operators specific for text and numbers
if [[ $n1 -gt $n2 ]]; then
    echo "$n1 > $n2"
else
    echo "$n1 < $n2"
fi

if [[ "$var1" = "$var2" ]]
then
    echo "same"
else
    echo "different"
fi

#---------------------------------------#
if test "$var1" = "$var2"; then
    echo "same"
else
    echo "different"
fi

if test "$var1" = "$var2"
then
    echo "same"
else
    echo "different"
fi

#---------------------------------------#
# Simplified form
[ "$var1" = "$var2" ] && echo "reduced same" || echo "reduced different"

#---------------------------------------#
