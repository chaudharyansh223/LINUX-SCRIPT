#Linux System health monitoring Script

##Description
This is a script that monitors System health in linux.

##how it works
*The script uses infinite loop for constantly monitoring system health in every 10s with the help of sleep cmd.
*The script uses top and awk cmd with pipe symbol in between them to extract only cpu details.
*The script uses df -h and awk cmd with pipe symbol to extract only main usbale disk details.
*The script free -h and awk cmd with pipe symbol to extract only ram availble detail. 
*The script uses variable to stores the value which we have extracted 
*Then script uses if condition with logical OR operator to work on multiple condition.
##how to run

###Method 1:-
bash scriptname.sh

###Method 2:-
chmod a+x scriptname.sh
./scriptname.sh

##Output 
*if system will use extra resource then give alert msg if not then nothing will print


