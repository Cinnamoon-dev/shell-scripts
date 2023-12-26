#!/usr/bin/env bash

check_args() {
    echo $@ | grep --quiet -- "-d"
    if [ $? -gt 0 ]; then
        echo "Choose the library folder"
        return 1
    fi
    
    echo $@ | grep --quiet ".c"
    if [[ $? -gt 0 ]]; then
        echo "Choose the main file"
        return 1
    fi

}

check_args $@

# TODO
# Use find to list all the files to compile in a directory and awk to get the names separately
# find . -name "*.c"
# use pwd to find directory

libs=(
    lib1.c
    lib2.c
)

for i in ${libs[@]}; do
    gcc i -c
done

# TODO
# Generalize the cases for -o
# Maybe using the --print-file-log from gcc and editing the last character from .c to .o

gcc lib1.c -c
gcc lib2.c -c
gcc main.c -c
gcc main.o lib1.o lib2.o -o main

clear
./main

rm main.o lib1.o lib2.o main
