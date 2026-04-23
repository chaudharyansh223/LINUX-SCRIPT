#!/bin/bash
#to se how bash interpret script line by line
set -x
<<comment
df -h gives me disk mmry details
by awk i am extracting exact that value which i want
by tr cmd i am removing the % symbol from that value
comment

disk=$(df -h | awk 'NR==8{print $5}' | tr -d %)
to="praticjaat224@gmail.com"
if [[ $disk -ge 20 ]]
then
	echo "warning! space is low $disk%" | mail -s "warning about disk space" $to
else
	echo "all good"
fi
