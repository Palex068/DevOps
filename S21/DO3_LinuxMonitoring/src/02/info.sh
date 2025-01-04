#!/bin/bash

timedatectl set-timezone Europe/Moscow

# HOSTNAME = сетевое имя
HOSTNAME=$(hostname)
# TIMEZONE = временная зона в виде: America/New_York UTC -5 (временная зона,
# должна браться из системы и быть корректной для текущего местоположения)
TIMEZONE=$(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5}')
# USER = текущий пользователь, который запустил скрипт
USER=$(whoami)
# OS = тип и версия операционной системы
OS=$(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f 2)
# DATE = текущее время в виде: 12 May 2020 12:24:36
DATE=$(date +"%d %b %Y %H:%M:%S")
# UPTIME = время работы системы
UPTIME=$(uptime -p | sed 's/^up //')
# UPTIME_SEC = время работы системы в секундах
UPTIME_SEC=$(awk '{print $1}' /proc/uptime)
# IP = ip-адрес машины в любом из сетевых интерфейсов
IP=$(hostname -I | awk '{print $1}')
# MASK = сетевая маска любого из сетевых интерфейсов в виде: xxx.xxx.xxx.xxx
MASK=$(ifconfig lo | grep netmask | awk '{print "MASK = " $4}')
# GATEWAY = ip шлюза по умолчанию
GATEWAY=$(route -n | grep 'UG[ \t]' | awk '{print $2}')
# RAM_TOTAL = размер оперативной памяти в Гб c точностью три знака после запятой
# в виде: 3.125 GB
RAM_TOTAL=$(free -h | grep Mem: | awk '{printf "%.3f GB\n", $2/1024}')
# RAM_USED = размер используемой памяти в Гб c точностью три знака после запятой
RAM_USED=$(free -h | grep Mem: | awk '{printf "%.3f GB\n", ($2-$7)/1024}')
# RAM_FREE = размер свободной памяти в Гб c точностью три знака после запятой
RAM_FREE=$(free -h | grep Mem: | awk '{printf "%.3f GB\n", $7/1024}')
# SPACE_ROOT = размер рутового раздела в Mб с точностью два знака после запятой
# в виде: 254.25 MB
SPACE_ROOT=$(df -h / | tail -n 1 | awk '{printf "%.2f MB\n", $2*1000}')
# SPACE_ROOT_USED = размер занятого пространства рутового раздела в Mб с точностью
# два знака после запятой
SPACE_ROOT_USED=$(df -h / | tail -n 1 | awk '{printf "%.2f MB\n", $3*1000}')
# SPACE_ROOT_FREE = размер свободного пространства рутового раздела в Mб с 
# точностью два знака после запятой
SPACE_ROOT_FREE=$(df -h / | tail -n 1 | awk '{printf "%.2f MB\n", $4*1000}')

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

chmod 777 print.sh
./print.sh