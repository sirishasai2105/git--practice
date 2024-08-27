#!/bin/bash

LOG_FOLDER=/var/log/shell-script
SCRIPT_NAME=$(echo "$0" | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=LOG_FOLDER/SCRIPT_NAME/TIMESTAMP






USER_ID=$(id -u)

CHECK_ROOT()
{
    if [ $USER_ID -ne 0 ]
    then 
        echo "Get Root Access First and then continue installing" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE()
{
    if [ $1 -eq 0]
    then 
        echo "$2 Installation is SUCCESS" | tee -a $LOG_FILE
    else
        echo "$2 Installion is FAILED" | tee -a $LOG_FILE
        exit 1
    fi
}

CHECK_ROOT

for package in $@
do 
    dnf list installed $package
    if [ $? -eq 0 ]
    then 
        echo "$package Installation is completed , Nothing to do" | tee -a $LOG_FILE
    else
        echo "$package Installation is not done,Trying to install it now" | tee -a $LOG_FILE
        dnf install $package -y
        VALIDATE $? "$package"
    fi
done