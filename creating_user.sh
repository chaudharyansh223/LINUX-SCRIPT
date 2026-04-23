#!/bin/bash
#to se how bash interpret script line by line
set -x
#ensure script will execute with sudo/root access
uid=$(echo $UID)
if [[ $uid -eq 0 ]]
then
	echo "you can execute this script"
else
	echo "neither you are a root user nor have sudo acess so you can't execute this script"
	exit 1
fi
#user should provide atleast one argument
if [[ $# -eq 0 ]]
then
	echo "provide atleast one argument"
	echo -e "guide: $0 hritik [comment].. \nlike this you should give argument"
	exit 1
fi
#store 1st argument as username
user_name=$1
#store rest argument as comment
comment=$@
echo "$comment"
#creating strong password
password=$(openssl passwd $user_name)
#creating user
useradd $user_name -c "$comment"
#checking user is created or not
if [[ $? -eq 0 ]]
then
	echo "user is created $user_name"
else
        echo "not created"
fi
#set password for user
$password | passwd --stdin $user_name
#check password is created or not
if [[ $? -eq 0 ]]
then
	echo "password is created"
else
	echo "password is not created"
	exit 1
fi
#display created user, password, and hostname
echo "username is--> $user_name"

echo "password is--> $password"

echo $HOSTNAME
