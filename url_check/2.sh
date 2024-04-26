#!/bin/bash

url=$1
interval=$2

while true; do
    response_code=$(curl -s -o /dev/null -w "%{http_code}" $url)
    echo "$response_code - response code for $url"
    sleep $interval
done
