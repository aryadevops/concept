#!/bin/bash

SCRIPTNAME=$0
DATE=$(date +%F %H:%M:%S)
APP_LOGS_DIR=/home/centos/app-logs
LOGDIR=/home/centos/concept/Shellscript-logs
LOGFILE=$LOGDIR/$SCRIPTNAME-$DATE.log


FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "script strted at time :$DATE"  &>>$LOGFILE

##while read line
##do
  ## echo "Deleting $line"
   ##rm -rf $line &>>$LOGFILE

##done <<< $FILES_TO_DELETE


