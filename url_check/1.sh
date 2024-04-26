#!/bin/bash

url=$1

response_code=$(curl -s -o /dev/null -w "%{http_code}" $url)

echo "$response_code - response code for $url"
