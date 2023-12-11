#!/usr/bin/env bash

# -d -> the name of the folder you will create in /usr/local/share/fonts
# -f -> file path of the font you want to add

declare -i d=0
declare -i f=0

for i in $@; do
    if [ $i == '-d' ]; then
        d=1
    fi

    if [ $i == '-f' ]; then
        f=1
    fi
done

if [ $d -eq 0 || $f -eq 0 ]; then
    echo "Choose a directory name with -d and a file with -f"
    exit 1
fi

declare -i count=0
while [ $count -lt $# ]; do
    if [ ${!count} == "-d" ]; then
        declare -i dir=$((count+1))
        sudo mkdir -p /usr/local/share/fonts/${!dir}
    fi

    if [ ${!count} == "-f" ]; then
        declare -i file=$((count+1))
        sudo cp ${!file} /usr/local/share/fonts/${!dir}
        sudo chown -R root: /usr/local/share/fonts/${!dir}
        sudo chmod 644 /usr/local/share/fonts/${!dir}/*
        sudo restorecon -vFr /usr/local/share/fonts/${!dir}
        sudo fc-cache -v
    fi
done