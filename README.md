# repeatoffenders
A shell script to ban repeated failed attempts to login.

I noticed that my Raspberry Pi's auth.log was full of repeated break-in attempts, so I wrote this script to parse the auth.log for any IP which has more than a set number of login failures and ban them with iptables. To use it, set it up as a cronjob running as root.
