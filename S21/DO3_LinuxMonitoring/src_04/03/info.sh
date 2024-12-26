#!/bin/bash

. ./color.sh

HOSTNAME=$(hostname)
echo -e "${foreground_head}${background_head}HOSTNAME\033[0m = ${foreground_value}${background_value}$HOSTNAME\033[0m"

TIMEZONE=$(timedatectl | awk '/Time zone/{print $3}')
UTC=$(timedatectl | awk '/Time zone/{print substr($5,1,5)}')
echo -e "${foreground_head}${background_head}TIMEZONE\033[0m = ${foreground_value}${background_value}$TIMEZONE\033[0m ${foreground_head}${background_head}UTC ${foreground_value}${background_value}$UTC\033[0m"

echo -e "${foreground_head}${background_head}USER\033[0m = ${foreground_value}${background_value}$(whoami)\033[0m"

OS=$(cat /etc/os-release | awk '/PRETTY_NAME/{print substr($1,14), $2, substr($3,1,3)}')
echo -e "${foreground_head}${background_head}OS\033[0m = ${foreground_value}${background_value}$OS\033[0m"
 
DATE=$(date +"%d %B %Y %T")
echo -e "${foreground_head}${background_head}DATE\033[0m = ${foreground_value}${background_value}$DATE\033[0m" 

UPTIME=$(uptime -p | sed 's/up //' | sed 's/,//')
echo -e "${foreground_head}${background_head}UPTIME\033[0m = ${foreground_value}${background_value}$UPTIME\033[0m" 

UPTIME_SEC=$(cat /proc/uptime | awk -F"." '{print $1}')
echo -e "${foreground_head}${background_head}UPTIME_SEC\033[0m = ${foreground_value}${background_value}$UPTIME_SEC\033[0m" 

IP=$(hostname -I)
echo -e "${foreground_head}${background_head}IP\033[0m = ${foreground_value}${background_value}$IP\033[0m"
 
MASK=$(ifconfig | awk '/netmask/{print $2,$3,$4}') 
echo -e "${foreground_head}${background_head}MASK\033[0m = ${foreground_value}${background_value}$MASK\033[0m\033[K"

GATEWAY=$(ip route | awk '/default/{print $3}')
echo -e "${foreground_head}${background_head}GATEWAY\033[0m = ${foreground_value}${background_value}$GATEWAY\033[0m" 

RAM_TOTAL=$(free --bytes | awk '/Mem/{printf "%.3f", $2 / 1000000000}') 
echo -e "${foreground_head}${background_head}RAM_TOTAL\033[0m = ${foreground_value}${background_value}$RAM_TOTAL\033[0m${foreground_value}${background_value} GB\033[0m"

RAM_USED=$(free --bytes | awk '/Mem/{printf "%.3f", $3 / 1000000000}') 
echo -e "${foreground_head}${background_head}RAM_USED\033[0m = ${foreground_value}${background_value}$RAM_USED\033[0m${foreground_value}${background_value} GB\033[0m"

RAM_FREE=$(free --bytes | awk '/Mem/{printf "%.3f", $4 / 1000000000}')
echo -e "${foreground_head}${background_head}RAM_FREE\033[0m = ${foreground_value}${background_value}$RAM_FREE\033[0m${foreground_value}${background_value} GB\033[0m"

SPACE_ROOT=$(df -k | grep '/$' | awk '{printf "%.2f", $2 / 1000}')
echo -e "${foreground_head}${background_head}SPACE_ROOT\033[0m = ${foreground_value}${background_value}$SPACE_ROOT\033[0m${foreground_value}${background_value} MB\033[0m"
 
SPACE_ROOT_USED=$(df -k | grep '/$' | awk '{printf "%.2f", $3 / 1000}') 
echo -e "${foreground_head}${background_head}SPACE_ROOT_USED\033[0m = ${foreground_value}${background_value}$SPACE_ROOT_USED\033[0m${foreground_value}${background_value} MB\033[0m"

SPACE_ROOT_FREE=$(df -k | grep '/$' | awk '{printf "%.2f", $4 / 1000}') 
echo -e "${foreground_head}${background_head}SPACE_ROOT_FREE\033[0m = ${foreground_value}${background_value}$SPACE_ROOT_FREE\033[0m${foreground_value}${background_value} MB\033[0m"
