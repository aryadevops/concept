#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then 
    cat " user is not a root User"
fi    