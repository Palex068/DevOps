#!/bin/bash

start=$(date +%s)

. ./folders.sh
. ./files.sh

if [[ $# -ne 1 ]]; then
	echo "There should be one parameter."
	exit 1
fi

dir=$1

if [[ ! -d  $dir ]]; then
	echo "Parameter should be a directory."
	exit 1
else 
	if [[ ${dir: -1} = '/' ]]; then
		total_folders $dir
		top_folders $dir
		total_files $dir
		files_extension $dir
		top_files $dir
		top_files_executable $dir
	else
		echo -e "\033[35mThe directory should end with \"/\",\n\t  but don't worry I'll take care of you.\033[0m"
		dir="$dir/"
		total_folders $dir
		top_folders $dir
		total_files $dir
		files_extension $dir
		top_files $dir
		top_files_executable $dir
	fi
fi

echo -e "\033[95mScript execution time (in seconds)\033[0m = $(($(date +%s)-$start))"
