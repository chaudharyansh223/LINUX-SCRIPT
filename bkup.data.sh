#!/bin/bash
#to se how bash executes script line by line(dubugging)
set -x
if [[ $# -eq 0 ]]
then 
	echo "please enter atleast one argument"
	exit 1
fi
echo "enter directory path"
dir_path=$1
dir="/home/ansh/backup/"
if [[ ! -d $dir ]]
then
	mkdir -p /home/ansh/backup/
fi
date=$(date +%Y-%m-%d)
tar -czvf backup_$date.tar.gz $dir_path
mv backup_$date.tar.gz /home/ansh/backup/
find /home/ansh/backup/ -mtime +7 -type f -exec rm {} \;
