#!/bin/bash
USER_ID=$(id -u)

CHECK_ROOT()
{
    if [ $1 -ne 0]
    then
        echo "Get root access and try to install"
    fi
}

VALIDATE()
{
    if [ $2 -eq 0 ]
    then 
        echo "$3 installation is SUCCEEDED"
    else
         echo "$3 installation is FAILED"
         exit 1
    fi
}

CHECK_ROOT

dnf list installed git

if [ $? -eq 0 ]
then
    echo "GIT is already installed , Nothing to do"
else
    dnf install git -y
    VALIDATE $? "GIT"
fi

dnf list installed mysql

if [ $? -eq 0 ]
then
    echo "MYSQL is already installed , Nothing to do"
else
    dnf install git -y
    VALIDATE $? "MYSQL"
fi


