#!/bin/bash

if [[ $# -ne 3 ]]
then
    echo "please give 3 inputs"
    exit 1
fi
source_dir_name=$1
backup_dir_name=$2
retention_period=$3

if ! [[ -d "$source_dir_name" ]]
then
     echo "you gave file path instead of dir path either in 1st input or in 2nd input"
     exit 2
fi
if [[ "$retention_period" -le 0 ]]
then
     echo "3rd input must be positive"
     exit 3
fi

mkdir -p "$backup_dir_name"
timestamp=$(date "+%Y%m%d_%H%M%S")

archive_file_name="backup_$timestamp.tar.gz"

tar -czf "$backup_dir_name/$archive_file_name" -C "$source_dir_name" .

echo "backup created"

mapfile -t backup_file < <(ls -1tr "$backup_dir_name"/backup_*.tar.gz 2>/dev/null)

backup_file_name=${#backup_file[@]}

if [[ "$backup_file_name" -gt "$retention_period" ]]
then
     file_to_store=$(( "$backup_file_name" - "$retention_period" ))
     for ((i=0; i<file_to_store; i++))

       do
           file_to_delete=${backup_file[$i]}
           rm "$file_to_delete"
           echo "delete old backup file: $(basename "$file_to_delete")"
       done
fi
exit 0
