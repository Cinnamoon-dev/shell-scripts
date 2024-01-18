#!/usr/bin/env bash

# For 1
for (( i = 0; i < 10; i++ )); do
    echo $i
done

# For 2 seq
# seq returns a list so it is possible to iterate in a list
for i in $(seq 10); do
    echo $i
done

# For 3 array
fruits=(
    'orange'
    'apple'
    'pineapple'
    'lemon'
)

# ${array[@]} -> all array items
for i in ${fruits[@]}; do
    echo $i
done


count=0
while [ $count -lt ${#fruits[@]} ]; do
    echo $count
    count=$((count + 1))
done
