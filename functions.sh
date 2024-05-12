#!/bin/bash

USERID=$(id -u)

Validate() {

if [ $? -ne 0 ]
then
  echo " $1 installation Failed..."
else
   echo "$1 installation Success..."
fi    

}

if [ $USERID -ne 0 ]
then
  echo "ERROR:: Please Try Installing as a ROOT USER"
  exit 1
fi

yum install git -y

Validate "git"

yum install postfixx -y

Validate "Postfix"
