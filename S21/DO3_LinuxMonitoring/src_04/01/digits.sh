#!/bin/bash

if [[ "$parameter" =~ [[:digit:]] ]]; then
echo "Seems like your input is a number. Please enter letters."
exit 1
fi
