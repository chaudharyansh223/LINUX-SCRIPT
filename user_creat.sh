#!/bin/bash
user_account_detail=$1
if [[ $UID -ne 0]]
then
    echo "script must be executed by root user"
    exit 1
fi
if [[ $# -ne 1]] || [[ ! -f "$user_account_detail"]]
then
   echo "should be a file, and give atleast one input"
   exit 2
fi
awk 'NR!=1' "$user_account_detail" | while IFS="," read -r username department;do 
     username=$(echo "$username")
     department=$(echo "$department")

     if ! getent group "$department" > /dev/null 2>&1
     then
          groupadd "$department"
          echo "group "$department" has created"
     fi
     if id "$username" > /dev/null 2>&1
     then
          echo "user "$username" already exist"
     else
         useradd -m -g "$department" "$username"
         echo "user $username" has created, and his primary group is $department"
     fi
done 
exit 0 

