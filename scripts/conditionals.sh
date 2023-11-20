#!/usr/bin/env bash

var1="b"
var2="a"

#---------------------------------------#
# Normal conditional
if [[ "$var1" = "$var2" ]]; then
    echo "same"
else
    echo "different"
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
