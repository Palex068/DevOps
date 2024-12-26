#!/bin/bash

if [ $# -ne 0 ]; then
    echo "There shouldn't be any parameters."
    exit 1
else 
   . ./info.sh
fi

read -p "Write this information to the file? (Y/N) " answer
case $answer in
y | Y) . ./write_to_file.sh
   echo "Done";;
*) echo "The information wasn't saved.";;
esac
