#!/bin/bash

echo -e "Total number of folders (including all nested ones) = $TOTAL_NUMBER_OF_FOLDERS"
echo -e "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$TOP_5_FOLDERS_OF_MAX_SIZE"
echo "Total number of files = $TOTAL_NUMBER_OF_FILES"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $NUMBER_OF_CONF_FILES"
echo "Text files = $NUMBER_OF_TEXT_FILES"
echo "Executable files = $NUMBER_OF_EXE_FILES"
echo "Log files (with the extension .log) = $NUMBER_OF_LOG_FILES"
echo "Archive files = $NUMBER_OF_ARCHIVE_FILES"
echo "Symbolic links = $NUMBER_OF_LINK_FILES"
echo "TOP 10 files of maximum size arranged in descending order (path, size):"
echo "$TOP_10_FILES_OF_MAX_SIZE"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size)"
echo "$TOP_10_EXE_FILES_OF_MAX_SIZE"

END=$(date +%s)
DIFF=$(( $END - $START ))

echo "Script execution time (in seconds) = $DIFF"
