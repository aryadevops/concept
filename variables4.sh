#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  cat "Error :: The User is not a root user, u can run this command with root user"
    exit 1
fi

yum install git -y

 if [ $? -ne 0 ]
  then
    echo "installation failure..."
  else
    echo "installation sucess..."  

 fi

 yum install postfixxx -y
 
  if [ $? -ne 0 ]
  then
    echo "installation failure..."
  else
    echo "installation sucess..."  

 fi
