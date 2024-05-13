#!/bin/bash

USERID=$(id -u)
SCRIPTNAME=$0
LOGDIR=/home/centos/concept
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

Validate(){

    if [ $1 -ne 0 ]
    then
      echo -e "$2 installation $R Failure..$N "
    else
      echo -e  "$2 installation $G Success..$G"  
}
  
  for i in $@
  do 
     yum list installed $i

     if [ $? -ne 0 ]
     then
         echo  " $i is not installed..let install it" 
         yum install $i -y
         Validate $?  $i

     else
        echo -e "$Y $i Already Installed..$N" 
     fi 
   done
