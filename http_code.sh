#!/bin/bash

if [[ $UID -ne 0 ]]
then
    echo "script must be executed by root user"
    exit 1
fi

if [[ $# -ne 1 ]]
then
     echo "give atleast one input"
     exit 2
fi

url_file=$1
if [[ ! -f "$url_file" ]]
then
    echo "your's input should be a file"
    exit 3
fi
touch http_report.log
while IFS= read -r file
do
   line=$(echo $file)

   timestamp=$(date)
   http_code=$(curl -s -L -o /dev/null -w "%{http_code}" "$line")
   if [[ "$http_code" -eq 200 ]]
   then
       status="UP (status: "$http_code")"
   else
       status="down (status: "$http_code")"
   fi
   echo "date: $timestamp url: $line status_code: $status"
   echo "date: $timestamp url: $line status_code: $status" >> http_report.log
done < ./"$url_file"
exit 0
