#Linux file process Script

##Description
this is a simple script that count no. of line,words and character in the specific file linux.

##how it works
*The script uses if condition to ensure the existence of specific file.
*The script uses cat cmd open the file with pipe symbol(to convert stdout into stdin).
*Then script uses wc cmd with option -l(to count line),-w(to count words),-m(to count character).
*At the end it uses again if condition to ensure that if file doesn't exit then end the script immediately.

##how to run

###Method 1:-
bash scriptname.sh

###Method 2:-
chmod a+x scriptname.sh
./scriptname.sh

##Output 
*Display no. of counted lines,words and character.

