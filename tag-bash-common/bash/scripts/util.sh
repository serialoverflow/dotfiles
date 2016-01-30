#!/usr/bin/env bash

have() {
    type "$@" &>/dev/null
}

count() {
    local seconds
    case "$1" in
        *[sS]) seconds=${1/%?/};;
        *[mM]) seconds=$(( ${1/%?/} * 60 ));;
        *[hH]) seconds=$(( ${1/%?/} * 3600 ));;
        *[0-9]) seconds=$1;;
        "") seconds=0;;
        *)  echo "Bad option." && return 1;;
    esac
    local secs=${seconds}

    do_count() {
        local message="$1"
        local operator="$2"
        printf "$1" $((secs))
        sleep 1 &>/dev/null
        secs=$(( $secs $2 1 ))
    }
    if [[ "$seconds" -gt 0 ]];then
        while [[ "$secs" -ge 0 ]];do
            do_count "\rcounting %02d/$seconds" -
        done
    else # count up
        while true;do
            do_count "\rcounting %02d" +
        done
    fi
    echo
}