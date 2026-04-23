#Linux Files +4M monitoring Script

##Description
*This script is based on reallife usage that monitors Files +4M in linux.
*If this script finds files +4M in specific locaion then it 1st compress those files one by one, then move them to another dir which is archive/ and it is not mandatory to move them in this directory only you can create your own directory of any name.
*This script becomes very useful if in case you have setup a webserver then you have deployed a webpage on it then that will definately produce logs and our linux server have fixed space in that situation our space can be full so to avoid it this script searches them compresses them and then moves them to archive/ all the files +4M(you can set size based on your requirement).
*You can perform searching based on files which is older than specific day as well.  

##how it works
*The script uses for loop to perform task continously.
*The script uses find cmd with option -type in for loop to search those files only which is +4M.
*Then compress them using gzip cmd and move them to that directory using mv cmd inside for loop.
*exit 1 has also used in script to handle errors(which means where exit 1 has used if error occurs there then end the script immidiately).

##how to run

###Method 1:-
bash scriptname.sh

###Method 2:-
chmod a+x scriptname.sh
./scriptname.sh

##Output 
*You will get those files which is +4M in that directory in compressed version 

##Note
*I have used if-else inside for loop because i want to se that is if-else can be use there even use of if-else is not require.
*So you can do it without if-esle as well.
*This script can be automate using cron scheduler(to run it daily) and At scheduler(to run it once in future)
*If you are automating the script then ensure 777(rwx,rwx,rwx) perm has assigned to script.
