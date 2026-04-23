#Linux Ram Monitoring Script

##Description
this is a simple script that monitors available ram space in linux.
It gives a warning message when the avaailable memory goes below 500Mi

##how it works
*The script used free -m to get memory details
*The script uses awk '{print $7}' to extract exactly that column which we need which is available memory space
*And it observes that if available ram goes below 500Mi then it gives us a warning message

##how to run

###Method 1:-
bash scriptname.sh

###Method 2:-
chmod a+x scriptname.sh
./scriptname.sh

##Output 
*Display a warning message when available ram goes below 500Mi

##Example
if we want space 600Mi
but available memory=500Mi
warning available ram space is low
