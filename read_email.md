#Linux Ram Monitoring Script

##Description
this is a medium script that monitors used disk memory in linux.
It gives a warning email on gamil id when the usable disk memory reaches to 20%

##how it works
*The script used df -h to get disk memory details
*The script uses awk 'NR==8{print $5}' to extract exactly that value which i want
*And it observes that if available usable disk memory reaches to 20% then it gives us a warning email on gamil id

##how to run

###Method 1:-
bash scriptname.sh

###Method 2:-
chmod a+x scriptname.sh
./scriptname.sh

##Output 
*gives a warning email on gmail id when usable disk memory reaches to 20%

