#!/bin/bash

USERID=$(id -u)

SCRIPTNAME=$0
LOGDIR=/home/centos/concept
LOGFILE=$LOGDIR/$SCRIPTNAME.log
## Log=$($0).log

Validate(){

if [ $2 -ne 0 ]
then 
   echo "$1 installation failure..."
else
   echo "$1 installation success..."
fi

}

if [ $USERID -ne 0 ]
then
  echo "ERROR :: Try With ROOT Access"
  exit 1
fi

yum install git -y &>>$LOGFILE

Validate "git" $?

yum install postfix -y &>>$LOGFILE

Validate "postfix" $?