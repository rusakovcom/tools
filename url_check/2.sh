#!/bin/bash
# ongoing verification of response code with 'bash 2.sh <https://example.com/> <interval in seconds>'

url=$1
interval=$2

while true; do
    response_code=$(curl -s -o /dev/null -w "%{http_code}" $url)
    echo "$response_code - $url - $(date "+%D %T")"
    sleep $interval
done

# download script 
# wget https://raw.githubusercontent.com/rusakovcom/tools/main/url_check/2.sh

# run logs writing to file
# nohup bash /path/to/script/2.sh https://example.com/ 60 >> /path/to/log/availability.log 2>&1
