#!/bin/bash

SERVICE="nginx"
LOG_FILE="/home/ec2-user/learning/projects/smp3/monitors.log"


DATE=$(date)
HOSTNAME=$(hostname)


echo "Check at $DATE on $HOSTNAME" >> $LOG_FILE

STATUS=$(systemctl is-active $SERVICE)
