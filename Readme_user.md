#Linux User creating Script

##Description
*This is a script that creates a new user with assigning them password as well.

##how it works
*This script uses system defined $UID Env.. variable inside if-else to ensure that the script should be executed with root/sudo access if the normal user tries to execute the script then will end immediately with the help of exit 1
*This script uses $# -eq 0 to ensure that user musts give atleast one argument if not then guide him how to give argument then it will end immediately with the help of exit 1
*This script stores 1st argument as username and rest as comment.
*This script uses useradd cmd to create user and if-else as well to tell user that new user is created or not.
*This script uses openssl passwd cmd to create strong password with encryption algorithm and if-else as well to tell user that password is created or not.
*This script assigns the created password to that created user.
*This script displays created username and password and hostname using system defined env.. $HOSTNAME variable.

##how to run

###Method 1:-
bash scriptname.sh

###Method 2:-
chmod a+x scriptname.sh
./scriptname.sh

##Output 
*The script displays created username and password and hostname.

