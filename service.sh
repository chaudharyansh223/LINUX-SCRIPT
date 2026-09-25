!#/bin/bash
service_name=$1
count=5
attempt=0

active=$(systemctl status $service_name | awk 'NR==3 {print $2}')
inactive=$(systemctl status $service_name | awk 'NR==3 {print $2}') 

if [[ "$active" == "active" ]]
then
    echo "$service_name is running"
elif [[ "$inactive" == "inactive" ]]
then
    echo "$service_name has stopped"
    echo 
    echo "trying to start it"
    while [[ $attempt != $count ]]
    do
        systemctl start $service_name
        fresh_status=$(systemctl status $service_name | awk 'NR==3 {print $2}')
        if [[ "$fresh_status" == "active" ]]
        then
            echo "service $service_name has successfully started"
            exit 0
        fi
        let attempt+=1
    done
    echo "tried 5 times to start but the service $service_name didn't start"
fi

   