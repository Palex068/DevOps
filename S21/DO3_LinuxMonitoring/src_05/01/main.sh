#!/bin/bash

if [ $# -eq 1 ]; then
    bash prov_na_digit.sh $1
else 
    echo "Вы ввели $# параметров, введите пожалуйста 1 параметр."
fi