#!/bin/bash

bg_color[0]=0
bg_color[1]="\033[107m" # white
bg_color[2]="\033[101m" # red
bg_color[3]="\033[102m" # green
bg_color[4]="\033[104m" # blue
bg_color[5]="\033[105m" # purple
bg_color[6]="\033[40m"  # black

text_color[0]=0
text_color[1]="\033[97m" # white
text_color[2]="\033[91m" # red
text_color[3]="\033[92m" # green
text_color[4]="\033[94m" # blue
text_color[5]="\033[95m" # purple
text_color[6]="\033[30m" # black

end="\033[0m"


echo -e "${bg_color[$1]}${text_color[$2]}HOSTNAME        $end = ${bg_color[$3]}${text_color[$4]}$HOSTNAME$end"
echo -e "${bg_color[$1]}${text_color[$2]}TIMEZONE        $end = ${bg_color[$3]}${text_color[$4]}$TIMEZONE$end"
echo -e "${bg_color[$1]}${text_color[$2]}USER            $end = ${bg_color[$3]}${text_color[$4]}$USER$end"
echo -e "${bg_color[$1]}${text_color[$2]}OS              $end = ${bg_color[$3]}${text_color[$4]}$OS$end"
echo -e "${bg_color[$1]}${text_color[$2]}DATE            $end = ${bg_color[$3]}${text_color[$4]}$DATE$end"
echo -e "${bg_color[$1]}${text_color[$2]}UPTIME          $end = ${bg_color[$3]}${text_color[$4]}$UPTIME$end"
echo -e "${bg_color[$1]}${text_color[$2]}UPTIME_SEC      $end = ${bg_color[$3]}${text_color[$4]}$UPTIME_SEC$end"
echo -e "${bg_color[$1]}${text_color[$2]}IP              $end = ${bg_color[$3]}${text_color[$4]}$IP$end"
echo -e "${bg_color[$1]}${text_color[$2]}MASK            $end = ${bg_color[$3]}${text_color[$4]}$MASK$end"
echo -e "${bg_color[$1]}${text_color[$2]}GATEWAY         $end = ${bg_color[$3]}${text_color[$4]}$GATEWAY$end"
echo -e "${bg_color[$1]}${text_color[$2]}RAM_TOTAL       $end = ${bg_color[$3]}${text_color[$4]}$RAM_TOTAL$end"
echo -e "${bg_color[$1]}${text_color[$2]}RAM_USED        $end = ${bg_color[$3]}${text_color[$4]}$RAM_USED$end"
echo -e "${bg_color[$1]}${text_color[$2]}RAM_FREE        $end = ${bg_color[$3]}${text_color[$4]}$RAM_FREE$end"
echo -e "${bg_color[$1]}${text_color[$2]}SPACE_ROOT      $end = ${bg_color[$3]}${text_color[$4]}$SPACE_ROOT$end"
echo -e "${bg_color[$1]}${text_color[$2]}SPACE_ROOT_USED $end = ${bg_color[$3]}${text_color[$4]}$SPACE_ROOT_USED$end"
echo -e "${bg_color[$1]}${text_color[$2]}SPACE_ROOT_FREE $end = ${bg_color[$3]}${text_color[$4]}$SPACE_ROOT_FREE$end"