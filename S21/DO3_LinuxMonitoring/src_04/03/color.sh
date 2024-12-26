#!/bin/bash

fwhite="\033[97m"
fred="\033[91m"
fgreen="\033[92m"
fblue="\033[94m"
fpurple="\033[95m"
fblack="\033[30m"

bwhite="\033[107m"
bred="\033[101m"
bgreen="\033[102m"
bblue="\033[104m"
bpurple="\033[105m"
bblack="\033[40m"


case $1 in 
1) foreground_head=${fwhite};;
2) foreground_head=${fred};;
3) foreground_head=${fgreen};;
4) foreground_head=${fblue};;
5) foreground_head=${fpurple};;
6) foreground_head=${fblack};;
esac

case $2 in 
1) background_head=${bwhite};;
2) background_head=${bred};;
3) background_head=${bgreen};;
4) background_head=${bblue};;
5) background_head=${bpurple};;
6) background_head=${bblack};;
esac

case $3 in 
1) foreground_value=${fwhite};;
2) foreground_value=${fred};;
3) foreground_value=${fgreen};;
4) foreground_value=${fblue};;
5) foreground_value=${fpurple};;
6) foreground_value=${fblack};;
esac

case $4 in 
1) background_value=${bwhite};;
2) background_value=${bred};;
3) background_value=${bgreen};;
4) background_value=${bblue};;
5) background_value=${bpurple};;
6) background_value=${bblack};;
esac
