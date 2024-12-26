#!/bin/bash

function total_files {
	echo -e "\033[95mTotal number of files\033[0m = $(find "$dir" -type f 2>/dev/null | wc -l)"
}

function files_extension {
	echo -e "\033[95mNumber of:\033[0m"
	echo -e "\033[95mConfiguration files (with the .conf extension)\033[0m = $(find "$dir" -type f -name "*.conf" 2>/dev/null | wc | awk '{printf $1}')"
	echo -e "\033[95mText files\033[0m = $(find "$dir" -type f -name "*.txt" 2>/dev/null | wc | awk '{printf $1}')"
	echo -e "\033[95mExecutable files\033[0m = $(find "$dir" -type f -executable 2>/dev/null | wc | awk '{printf $1}')"
	echo -e "\033[95mLog files (with the extension .log)\033[0m = $(find "$dir" -type f -name "*.log" 2>/dev/null | wc | awk '{printf $1}')"
	echo -e "\033[95mArchive files\033[0m = $(find "$dir" -type f -name "*.zip" 2>/dev/null | wc | awk '{printf $1}')"
	echo -e "\033[95mSymbolic links\033[0m = $(find "$dir" -type l 2>/dev/null | wc | awk '{printf $1}')"
}

function top_files {
	echo -e "\033[95mTOP 10 files of maximum size arranged in descending order (path, size and type):\033[0m"
	IFS=$'\n'
	top_f=($(find "$dir" 2>/dev/null -type f -exec du -h {} + | sort -rh | head -10 | awk '{printf "%s, %s\n", $2, $1}'))
	
	for line in "${top_f[@]}"; do
		param=$(echo "$line" | cut -d ',' -f 1)
		if [[ $(echo "$param" | grep -m 1 -o -E "\.[^/.]+$") ]]; then
			field=$(echo "$param" | rev | cut -d '.' -f 1 | rev)
		else
			field=""
		fi
		type+=("$field")
	done
	
	for (( i=0; i<${#top_f[@]}; i++)); do
		index=$((i+1))
		echo -e "\033[95m$index\033[0m - ${top_f[$i]}, ${type[$i]}"
	done
}

function top_files_executable {
	echo -e "\033[95mTOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):\033[0m"
	IFS=$'\n'
	ntop_f=($(find "$dir" 2>/dev/null -type f -executable -exec du -h {} + | sort -rh | head -10 | awk '{printf "%s, %s\n", $2, $1}'))
	
	for nline in "${ntop_f[@]}"; do
		nparam=$(echo "$nline" | cut -d ',' -f 1)
		hash_param=$(echo "$nparam" | md5sum | cut -d ' ' -f 1)
		hash+=("$hash_param")
	done

	for (( i=0; i<${#ntop_f[@]}; i++)); do
		nindex=$((i+1))
		echo -e "\033[95m$nindex\033[0m - ${ntop_f[$i]}, ${hash[$i]}"
	done
}
