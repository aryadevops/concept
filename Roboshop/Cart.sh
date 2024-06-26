#!/bin/bash

USERID=$(id -u)
SCRIPT_NAME=$0
DATE=$(date +%F)
LOGDIR=/home/centos/Roboshop
LOGFILE=/$LOGDIR/$SCRIPT_NAME_DATE.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
    then 
    echo -e "$R ERROR:: $N Please try with ROOT USER"
    exit 1
fi    

Validate(){
    if [ $1 -ne 0 ]
     then
         echo -e " $2 ......$G Success $N"
        else
         echo -e " $2 ...... $R Failure $N"
    fi      
}

curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>LOGFILE
Validate $? "Downloading rpm"
yum install nodejs -y &>>LOGFILE
Validate $? "Installing nodejs"
useradd roboshop &>>LOGFILE
Validate $? "Adding user"
mkdir /app &>>LOGFILE
Validate $? "make APP Directory"
curl -L -o /tmp/cart.zip https://roboshop-builds.s3.amazonaws.com/cart.zip &>>LOGFILE
Validate $? "Downloading Cart"
cd /app &>>LOGFILE
Validate $? " redirect app floder"
unzip /tmp/cart.zip &>>LOGFILE
Validate $? "Unzipping"
npm install &>>LOGFILE
Validate $? "installing npm"
systemctl daemon-reload &>>LOGFILE
Validate $? "reloading Cart"
systemctl enable cart &>>LOGFILE
Validate $? "Enableling cart"
systemctl start cart &>>LOGFILE
Validate $? "Starting cart"