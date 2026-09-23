#!/bin/bash
dir_name=$1
day_old=$2

if [[ $# -ne 2 ]]
then
    echo "please give required 2 inputs to the script"
    exit 1
fi
if [[ ! -d $dir_name ]]
then
    echo "inputed directory path isn't valid"
    exit 2
fi
if [[ $2 -lt 1 ]]
then
    echo "days must be interger value"
fi

if [[ ! -d $dir_name/archive/]]
then
    mkdir $dir_name/archive/
    find $dir_name -maxdepth 1 -type f -mtime +$day_old -name "*.log" -exec gzip {} \; -exec mv {}.gz $dir_name/archive/ \;
fi







