#!/bin/bash
#to se how bash interpret script line by line 
set -x
base=/home/ansh/
depth=1
run=0
for i in $(find $base -maxdepth $depth -type f -size +4M)
do
	if [[ $run -eq 0 ]]
	then
		gzip $i || exit 1
		mv $i.gz /home/ansh/archive/ || exit 1
	fi
done
       	
