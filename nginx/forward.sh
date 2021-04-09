#!/bin/bash
# Changing public_html permission
user="$1"
domain="$2"
ip="$3"
home_dir="$4"
docroot="$5"

FORWARDTO=""
file=/home/forward-all.txt
if [ -f "$file" ]; then
    FORWARDTO=$(<$file)
fi
file=/home/$user/conf/web/forward-all.txt
if [ -f "$file" ]; then
    FORWARDTO=$(<$file)
fi
file=/home/$user/conf/web/forward-$domain.txt
if [ -f "$file" ]; then
    FORWARDTO=$(<$file)
fi
if [ -z "$FORWARDTO" ]; then
    FORWARDTO="$ip:8080"
fi

file=/home/$user/conf/web/$domain.nginx.conf
if [ -f "$file" ]; then
    sed -i "s/FORWARDTO/$FORWARDTO/g" $file
fi

if [ "$FORWARDTO" = "$ip:8080" ]; then
    FORWARDTO="$ip:8443"
fi
file=/home/$user/conf/web/$domain.nginx.ssl.conf
if [ -f "$file" ]; then
    sed -i "s/FORWARDTO/$FORWARDTO/g" $file
fi

exit 0
