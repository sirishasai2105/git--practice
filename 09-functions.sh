#!/bin/bash
USER_ID=$(id -u)

CHECK_ROOT()
{
    if [ $USER_ID -ne 0]
    then
        echo "Get root access and try to install"
        exit 1
    fi
}

VALIDATE()
{
    if [ $1 -eq 0 ]
    then 
        echo "$2 installation is SUCCEEDED"
    else
         echo "$2 installation is FAILED"
         exit 1
    fi
}

CHECK_ROOT

dnf list installed git

if [ $? -eq 0 ]
then
    echo "GIT is already installed , Nothing to do"
else
    echo "GIT is not installed , Going to install"
    dnf install git -y
    VALIDATE $? "GIT"
fi

dnf list installed mysql

if [ $? -eq 0 ]
then
    echo "MYSQL is already installed , Nothing to do"
else
    echo "MYSQL is not installed going to install"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
fi


