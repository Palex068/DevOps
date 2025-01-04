#!/bin/bash

timedatectl set-timezone Europe/Moscow

HOSTNAME=$(hostname | awk '{print $0}')
TIMEZONE=$(timedatectl | grep Moscow | awk '{print $3 $4 $5}')
USER=$(echo "$USER" | awk '{print $0}')
OS=$(cat /etc/issue | sed -r '/^\s*$/d' | awk '{print  $1,$2,$3}')
DATE=$(date | awk '{print  $3" "$2" "$6" "$4}')
UPTIME=$(uptime | awk '{print $3}')
UPTIME_SEC=$(cat /proc/uptime | awk '{print int($1)}')
IP=$(hostname -I | awk '{print $0}')
MASK=$(ifconfig lo | grep netmask | awk '{print $4}')
GATEWAY=$(ip r | grep default | awk '{print $3}')
RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3fGb\n", $2/1024}')
RAM_USED=$(free -m | awk '/Mem:/{printf "%.3fGb\n", $3/1024}')
RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3fGb\n", $4/1024}')
SPACE_ROOT=$(df /root/ | awk '/\/$/  {printf "%.2fMB\n", $2/1024}')
SPACE_ROOT_USED=$(df /root/ | awk '/\/$/  {printf "%.2fMB\n", $3/1024}')
SPACE_ROOT_FREE=$(df /root/ | awk '/\/$/  {printf "%.2fMB\n", $4/1024}')

export HOSTNAME
export TIMEZONE
export USER
export OS
export DATE
export UPTIME
export UPTIME_SEC
export IP
export MASK
export GATEWAY
export RAM_TOTAL
export RAM_USED
export RAM_FREE
export SPACE_ROOT
export SPACE_ROOT_USED
export SPACE_ROOT_FREE

chmod 777 color_print.sh
./color_print.sh $1 $2 $3 $4 $5