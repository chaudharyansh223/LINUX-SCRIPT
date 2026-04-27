#Linux Taking backup of data Script

##Description
this is a script that takes backup of data in linux.

##how it works
*The script uses if confition to ensure that weather user have given the input or not.
*The script takes input from user of that directory from which user have to take backup.
*The script uses if condition to ensure that if directory doesn't exist in which we have to take backup then create it with mkdir cmd.
*The script uses date cmd to add timestamp with backup
*The script uses tar cmd with option -z to take backup as well as compress it.
*The script uses mv cmd to move the backuped and compressed file in backup dir.
*The script uses find cmd to search those file which is older than 7 days and then delete them.
*To limit the disk utilization as much as we can.

##how to run

###Method 1:-
bash scriptname.sh

###Method 2:-
chmod a+x scriptname.sh
./scriptname.sh

##Output 
*It will end the script if user doesn't give any input.
*It will create that dir if desired dir doesn't exist.
*Then stores backup and compressed file in that dir.

