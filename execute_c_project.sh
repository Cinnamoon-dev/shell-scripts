#!/usr/bin/env bash
# compile -d ./libs -n a.out main.py

_usage() {
    exit 1
}

main() {
    # Positional Arguments
    local position=0
    local main_file=

    # Flags
    local directory=
    local name=

    while [[ "${#}" -gt 0 ]]; do
        # This switch case checks if the current arg is a flag
        case "${1}" in

        -h|--help|help)
            echo "help"
            exit 0
            ;;

        -d|--directory)
            directory="${2:-}"
            
            if [ -z "${directory}" ]; then
                printf "%s must have a value\n\n" "${1}" 
                exit 0
            fi

            shift 2
            ;;
        
        -n|--name)
            name="${2:-}"

            # Checks if it is not empty
            [[ -z "${name}" ]] && printf "%s must have a value\n\n" "${1}" && printf "help\n" && exit 0

            shift 2
            ;;

        *)
            # This switch case treats the positional argument case
            case "${position}" in
            
            0)
                main_file="${1}"
                
                position=1
                shift
                ;;
            
            *)
                printf "unknown arg %s\n" "${!position}"
                exit 1
                ;;

            esac
        esac
    done

    echo "${main_file}"
    echo "${directory}"
    echo "${name}"


# # TODO
# # Use find to list all the files to compile in a directory and awk to get the names separately
# # find . -name "*.c"
# # use pwd to find directory

# libs=(
#     lib1.c
#     lib2.c
# )

# for i in ${libs[@]}; do
#     gcc i -c
# done

# # TODO
# # Generalize the cases for -o
# # Maybe using the --print-file-log from gcc and editing the last character from .c to .o

# gcc lib1.c -c
# gcc lib2.c -c
# gcc main.c -c
# gcc main.o lib1.o lib2.o -o main

# clear
# ./main

# rm main.o lib1.o lib2.o main

     return 0
}

main ${@:-}