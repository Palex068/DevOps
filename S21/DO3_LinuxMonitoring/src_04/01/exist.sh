#!/bin.bash

if [ -n "$parameter" ]; then
    . ./digits.sh
    . ./quantity.sh
echo "$parameter"
else 
echo "No parameters found"
fi
