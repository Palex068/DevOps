#!/bin/bash

if [ $# -ne 4 ]; then
    echo "There should be 4 parameters."
    exit 1
else 

    if [[ $@ =~ [[:digit:]] ]]; then
        for i in $@; do
            if [[ $i -lt 1 || $i -gt 6 ]]; then
            echo "There should be numbers from 1 to 6. Please enter your parameters once again."
            exit 1
            fi
        done
        if [[ $1 -eq $2 || $3 -eq $4 ]]; then
            echo "Choose different colors for foreground and background so they don't match."
            else
            . ./color.sh
            . ./info.sh
            fi
    else 
    echo "Seems like your parameters aren't numbers. Please enter numbers."
    exit 1
    fi
fi






