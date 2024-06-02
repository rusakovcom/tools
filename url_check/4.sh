#!/bin/bash
# ongoing verification of response code with 'bash 4.sh <https://example.com/> <interval in seconds>' with writing logs to availability.log in the script directory

url=$1
interval=$2

while true; do
    response_code=$(curl -s -o /dev/null -w "%{http_code}" $url)
    echo "$response_code - $url - $(date "+%D %T")" >> availability.log
    sleep $interval
done

# nohup bash /path_to_script/url_check/4.sh https://google.com/ 300 &
