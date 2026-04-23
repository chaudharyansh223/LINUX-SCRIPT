#!/bin/bash
#to se how bash interpret script line by line
set -x
<<comment
$ has used to store cmd output in the variable
free -m has used to se ram memory detail
awk has used to extract only 7th column
comment
available=$(free -m | awk '{print $7}')
#inside if condition i have written that if avai.. space is less than 500 then give warning
if [[ $available -lt 500 ]]
then
	echo "warning available ram space is low"
fi

