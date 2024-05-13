#!/bin/bash

USERID=$(id -u)
SCRIPTNAME=$0
LOGDIR=/home/centos/concept/log
LOGFILE=$LOGDIR/$SCRIPTNAME.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[34m"


if [ $USERID -ne 0 ]
then
echo -e "$R ERROR $N: Please Proceed with Root User"
exit 1
fi

Validate() {

    if [ $1 -ne 0 ]
    then
      echo -e "$2 installation $R Failure..$N "
    else
      echo -e  "$2 installation $G Success..$G"  
    fi  
    }
  
  for i in $@
  do 
     yum list installed $i &>>LOGFILE

     if [ $? -ne 0 ]
     then
         echo  " $i is not installed..let install it" 
         yum install $i -y &>>LOGFILE
         Validate $?  $i

     else
        echo -e "$Y $i Already Installed..$N" 
     fi 
   done
