#!/bin/bash

SERVICE="nginx"
LOG_FILE="/home/ec2-user/learning/projects/smp3/monitors.log"


set -a
source /home/ec2-user/learning/projects/smp3/.env
set +a

DATE=$(date)
HOSTNAME=$(hostname)


echo "Check at $DATE on $HOSTNAME" >> $LOG_FILE

STATUS=$(systemctl is-active $SERVICE)


if [ $STATUS != "active" ]; then
	
	MESSAGE="$SERVICE is down on $HOSTNAME at $DATE. Restarting"

	echo "$MESSAGE" >> $LOG_FILE

	sudo systemctl start $SERVICE

	curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
		--data-urlencode "chat_id=$CHAT_ID" \
		--data-urlencode "text=$MESSAGE"

	echo "$SERVICE restarted" >> $LOG_FILE
else

	echo "$SERVICE is running" >> $LOG_FILE
		
fi


echo "----------------" $LOG_FILE

