#!/usr/bin/env bash

_usage() {
    exit 1
}

main() {
    # Positional Arguments
    local position=0
    local name=
    local countr=

    # Flags
    local interests=
    local cool="false"

    while [[ "${#}" -gt 0 ]]; do
        # This switch case checks if the current arg is a flag
        case "${1}" in

        -h|--help|help)
            echo "help"
            exit 0
            ;;

        -c|--cool)
            cool="true"
            shift
            ;;
        
        -i|--interests)
            interests="${2:-}"

            # Checks if it is not empty
            [[ -z "${interests}" ]] && printf "%s must have a value\n\n" "${1}" && printf "help\n" && exit 0

            shift 2
            ;;

        *)
            # This switch case treats the positional argument case
            case "${position}" in
            
            0)
                name="${1}"
                
                position=1
                shift
                ;;
            
            1) 
                country="${1}"
                position=2
                shift
                ;;
            
            *)
                printf "unknown arg %s\n" "${!position}"
                exit 1
                ;;

            esac
        esac
    done

    [[ -z "${name}" ]] && printf "Requires NAME\n\n" >&2 && _usage >&2 && exit 1
    [[ -z "${country}" ]] && printf "Requires COUNTRY\n\n" >&2 && _usage >&2 && exit 1
    [[ -z "${interests}" ]] && printf "Requires --interests X[,Y]\n\n" >&2 && _usage >&2 && exit 1

    # The script's logic now that the inputs are defined.
    echo "Name: ${name}"
    echo "Country: ${country}"
    echo "Interests: ${interests}"
    [[ "${cool}" == "true" ]] && echo "Cool?: ${cool}"

     return 0
}

main ${@:-}