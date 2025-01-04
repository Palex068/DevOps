#!/bin/bash

# Общее число папок, включая вложенные;
TOTAL_NUMBER_OF_FOLDERS=$(sudo find $DIR -type d | wc -l)

# Топ-5 папок с самым большим весом в порядке убывания (путь и размер);
TOP_5_FOLDERS_OF_MAX_SIZE=$(sudo du -Sh $DIR | sort -rh | head -5 | cat -n |\
                            awk '{print $1" - "$3", "$2}')

# Общее число файлов;
TOTAL_NUMBER_OF_FILES=$(sudo find $DIR -type f | wc -l)

# Число конфигурационных файлов (с расширением .conf);
NUMBER_OF_CONF_FILES=$(sudo find $DIR -type f -name "*.conf" | wc -l)

# Число текстовых файлов;
NUMBER_OF_TEXT_FILES=$(sudo find $DIR -type f -name "*.txt" | wc -l)

# Число исполняемых файлов;
NUMBER_OF_EXE_FILES=$(sudo find $DIR -type f -executable -exec du -h {} + |\
                      wc | awk '{ print $1 }')

# Число логов (файлов с расширением .log);
NUMBER_OF_LOG_FILES=$(sudo find $DIR -type f -name "*.log" | wc -l)

# Число архивов;
NUMBER_OF_ARCHIVE_FILES=$(sudo find $DIR -regex '.*\(tar\|zip\|gz\|rar\)' | wc -l )

# Число символических ссылок;
NUMBER_OF_LINK_FILES=$(sudo find $DIR -type l | wc -l)

# Топ-10 файлов с самым большим весом в порядке убывания (путь, размер и тип);
TOP_10_FILES_OF_MAX_SIZE=$(sudo find $DIR -type f -exec du -Sh {} + | sort -rh |\
                           head -10 | cat -n | awk '{print $1" - "$3", "$2}')

# Топ-10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш);
TOP_10_EXE_FILES_OF_MAX_SIZE=$(sudo find $DIR -type f -executable -exec du -h {} + |\
                     sort -hr | head -10 | cat -n | awk '{print $1" - "$3", "$2}')

export TOTAL_NUMBER_OF_FOLDERS
export TOP_5_FOLDERS_OF_MAX_SIZE
export TOTAL_NUMBER_OF_FILES
export NUMBER_OF_CONF_FILES
export NUMBER_OF_TEXT_FILES
export NUMBER_OF_EXE_FILES
export NUMBER_OF_LOG_FILES
export NUMBER_OF_ARCHIVE_FILES
export NUMBER_OF_LINK_FILES
export TOP_10_FILES_OF_MAX_SIZE
export TOP_10_EXE_FILES_OF_MAX_SIZE

chmod 777 print.sh
./print.sh