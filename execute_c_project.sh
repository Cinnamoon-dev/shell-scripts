#!/usr/bin/env bash

# TODO
# Use find to list all the files to compile in a directory and awk to get the names separately

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