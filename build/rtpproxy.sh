#!/bin/sh
set -e
# if ! id -u rtpproxy &>/dev/null; then
#     # Create rtpproxy user with the desired UID
#     adduser --system --disabled-password --disabled-login --no-create-home rtpproxy
# fi

MY_IP=`ip -4 address show scope global | awk '/inet/ {print $2}' | cut -d'/' -f1 | head -n1`

rtpproxy -f -u root -s udp:$MY_IP:8844 -L 100 -l $MY_IP -A $PUBLIC_IP  -m $START_PORT -M $END_PORT -d DBUG "$@"
