#!/bin/bash
#Check if runing as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

#find root user's name
rootun=whoami
echo "Acquired username of UID 0"

usermod --shell /bin/nologin $rootun
echo "Shell set to nologin"

usermod --password ! $rootun
echo "Password scrambed"

usermod --lock $rootun
echo "User locked"
