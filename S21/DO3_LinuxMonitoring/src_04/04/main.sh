#!/bin/bash

if [ $# -ne 0 ]; then
    echo "There shouldn't be any parameters."
    exit 1
else
    . ./color.sh
    . ./info.sh
fi
