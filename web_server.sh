#!/bin/bash
#to se how bash interpret script line by line(debugging)
set -x
count_restart=0
count_fail=0
stat=$(sudo systemctl status httpd | awk 'NR==3{print $2, $3}')
#checking is service active

if [[ "$stat" == "active (running)" ]]
then
	echo "httpd service is running"
fi

#checking is service inactive

if [[ "$stat" == "inactive (dead)" ]]
then
	sudo systemctl restart httpd 
	stat=$(sudo systemctl status httpd | awk 'NR==3{print $2, $3}')
elif [[ "$stat" == "active (rinning)" ]]
then
	let count_restart++
fi

if [[ "$stat" == "inactive (dead)" ]]
then
	echo "service not able to restart"
	tail -30 /var/log/httpd/error_log >> /home/ansh/error.log
	let count_fail++
fi

echo "$count_restart times service has restarted"
echo "$count_fail times service hasn't able to restart"
tail -20 /home/ansh/error.log

if [[ $count_fail -eq 5 ]]
then
	echo "stop this script because service is making some error again again while getting start"
	exit 1
fi
