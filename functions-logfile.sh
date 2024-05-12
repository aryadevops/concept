#!/bin/bash

USERID=$(id -u)
Log=$($0).log

Validate(){

if [ $? -ne 0 ]
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

yum install gitt -y $>>$log

Validate "git"

yum install postfix -y $>>$log

Validate "postfix"