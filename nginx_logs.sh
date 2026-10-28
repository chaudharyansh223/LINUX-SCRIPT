#!/bin/bash
if [[ $# -ne 2 ]]
then
    echo "give atleast 2 inputs"
    exit 1
fi
log_file=$1
count=$2

if ! [[ -f "$log_file"  || -r "$log_file" || $count -le 0 ]]
then
    echo "either you didn't give a path or that file hasn't have read permission or your count is a negitive number"
    exit 2
fi
echo "COUNT   IP ADDRESS"
echo "------------------"
awk 'NR==1, NR==$count {print $1}' "$log_file" | sort | uniq -c | sort -nr | awk '{printf "%-11s %s\n", $1, $2}'
