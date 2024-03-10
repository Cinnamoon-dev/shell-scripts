#!/usr/bin/env bash
# compile -d ./libs -n a.out main.c

_usage() {
    # TODO
    # Write a --help message
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

    declare lib_files=()

    mapfile -t < <(find $directory | grep -F .c)
    read -a lib_files <<< $(echo ${MAPFILE[@]})

    for i in ${lib_files[@]}; do
        gcc $i -c
    done

    gcc -c $main_file
    gcc $(find | grep -F .o) -o $name

    # TODO
    # add a show warnings flag to disable or enable showing compilation messages
    clear
    ./$name
    
    # TODO
    # Create a better way to get the files we have just compiled
    # The way it is now, if the runnable file gcc -o main has a ".o" the runnable file is also deleted and the program
    # does not executes because the executable was not found
    rm $(find | grep -F .o)

    return 0
}

main ${@:-}
