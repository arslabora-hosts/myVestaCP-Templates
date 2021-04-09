#!/bin/bash
# Changing public_html permission
user="$1"
domain="$2"
ip="$3"
home_dir="$4"
docroot="$5"

PROXYPORT=""
file=/home/$user/web/$domain/proxyport
if [ -f "$file" ]; then
    PROXYPORT=$(<$file)
fi

if [ -z "$PROXYPORT" ]; then
    PROXYPORT="$ip:8080"
fi

file=/home/$user/conf/web/$domain.nginx.conf
if [ -f "$file" ]; then
    sed -i "s/PROXYPORT/$PROXYPORT/g" $file
fi

file=/home/$user/conf/web/$domain.nginx.ssl.conf
if [ -f "$file" ]; then
    sed -i "s/PROXYPORT/$PROXYPORT/g" $file
fi

exit 0
