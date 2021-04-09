#!/bin/bash

user=$1
domain=$2
ip=$3
home=$4
docroot=$5

mkdir -[ "$home/$user/web/$domain/app"
chown -R $user:$user "$home/$user/web/$domain/app"
runuser -l $user -c "pm2 start $home/$user/web/$domain/app/app.js"
sleep 5
