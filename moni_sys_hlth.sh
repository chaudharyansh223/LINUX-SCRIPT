#!/bin/bash
# to se how bash interpret script line by line(debugging)
set -x
#to monitor in every 10s
while true
do
	#log
	top -bn1 | awk 'NR==3{print $0}' >> cpu.log
	lsblk | awk 'NR==3{print $0}' >> disk.log
	free -h | awk 'NR==2{print $0}' >> memory.log

	#variable
	cpu_idle=$(top -bn1 | awk 'NR==3{print $8}' | cut -d '.' -f1)
	disk_usage=$(df -h | awk 'NR==2{print $4}' | tr -d G)
	memory_usage=$(free -h | awk 'NR==2{print $7}' | tr -d Mi)

	#condition
	if [[ $cpu_idle -le 20 ]] || [[ $disk_usage -le 5 ]] || [[ $memory_usage -le 200 ]]
	then
		echo "alert either cpu and disk or ram usage is increasing"
	fi
	sleep 10s
done
