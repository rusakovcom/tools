#!/bin/bash
# check 1 url response with 'bash 1.sh <https://example.com/>'

url=$1

response_code=$(curl -s -o /dev/null -w "%{http_code}" $url)

echo "$response_code - $url - $(date "+%D %T")"
