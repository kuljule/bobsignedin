#!/bin/bash

cd /home/trinitysyslog

#Find every instance of bob.joe. While reading the line, do the following.
grep -i bob.joe /var/log/portalauth.log |
while read line;
do

current_date =$(date +"%b %d")
portal_date = $(cut -c-6 "$line")
echo "$current_date"
echo "$portal_date"
current_time =`date +%k:%M`
portal_time = $(echo "$line" | head -c 12 | tail -c 5)
echo "$current_time"
echo "$portal_time"

#If date and time the same as the portal date and time, then email me.
if ["$portal_date" = "$current_date"] && ["$portal_time" = "$current_time"]
	then mail -s "Bob Signed Into Captive Portal" < /dev/null
	else echo "No"
fi
done
