#!/bin/bash

LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=20

usage=$(echo $DISK_USAGE | awk '{print $6}' | cut -d % -f1)

if [ $usage -gt $DISK_USAGE_THRESHOLD ]

then
   echo -e " $R Aletr : Disk Usage is $usage $N"
fi   