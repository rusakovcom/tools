#!/bin/bash
# check response code for list of sites from sites.yml (file in current directory)

sites_list=$(cat sites.yml)

for site in $sites_list; do
    response_code=$(curl -s -o /dev/null -w "%{http_code}" $site)
    echo "$response_code - response code for $site"
done
