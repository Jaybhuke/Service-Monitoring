#!/bin/bash

PATH=/usr/bin:/bin

TARGET_DIR="/var/log"
LOG_FILE="/home/ec2-user/learning/projects/dc/diskclean.logs"

DAYS=7

echo "Cleanup started at $(date)" >> $LOG_FILE

if [ ! -d "$TARGET_DIR" ]; then
    echo "❌ Directory not found: $TARGET_DIR" >> $LOG_FILE
    exit 1
fi

find $TARGET_DIR -type f -mtime +$DAYS -print -exec rm -f {} \; >> $LOG_FILE

echo "Cleanup completed at $(date)" >> $LOG_FILE
