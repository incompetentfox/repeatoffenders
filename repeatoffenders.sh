#!/bin/bash
LOGIN_ATTEMPTS = 10 # number of times an IP address can fail to login in a log cycle (usually a week) before being banned.

grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' /var/log/auth.log |
awk '{a[$0]++}END{for(i in a){if(a[i] > $LOGIN_ATTEMPTS){print i}}}' |

while read -r ipaddress;
do
if iptables -L INPUT -v -n | grep "$ipaddress"
then
    echo "$ipaddress is already blocked";
else
    echo "$ipaddress is not blocked";
    iptables  -A INPUT -s $ipaddress -j DROP
fi
done
   
