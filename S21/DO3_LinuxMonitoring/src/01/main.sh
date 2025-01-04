#!/bin/bash

#echo "Write one parameter: "

if [ $# -gt 1 ]; then
echo "Too many parameters. Please enter only one."
exit 1;
fi

param="$1"

if [[ -n "${param}" ]]; then
    bash is_digit.sh ${param}
echo "${param}"
else 
echo "No parameters found"
fi

###
# Напиши bash-скрипт. Скрипт запускается с одним параметром. Параметр текстовый.
# Скрипт выводит значение параметра.
# Если параметр — число, то должно выводиться сообщение о некорректности ввода.
###