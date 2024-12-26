#!/bin/bash

function total_folders {
	echo -e "\033[95mTotal number of folders (including all nested ones)\033[0m = $(find "$dir" -type d 2> /dev/null | wc -l)"
}

function top_folders {
	echo -e "\033[95mTOP 5 folders of maximum size arranged in descending order (path and size):\033[0m"
	IFS=$'\n'
	top_f=($(du -h "$dir" 2>/dev/null | sort -rh | head -5 | awk '{printf "%s, %s\n", $2, $1}'))
	
	for (( i=0; i<${#top_f[@]}; i++ )); do
		index=$((i+1))
		echo -e "\033[95m$index\033[0m - ${top_f[$i]}"
	done
}
