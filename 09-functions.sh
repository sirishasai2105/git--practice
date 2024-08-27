#!/bin/bash
USER_ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

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
        echo -e "$2 installation is $G SUCCEEDED $N"
    else
         echo -e "$2 installation is $R FAILED $N"
         exit 1
    fi
}

CHECK_ROOT

dnf list installed git

if [ $? -eq 0 ]
then
    echo -e " $G GIT is already installed , Nothing to do $N"
else
    echo -e " $R GIT is not installed , Going to install $N"
    dnf install git -y
    VALIDATE $? "GIT"
fi

dnf list installed mysql

if [ $? -eq 0 ]
then
    echo -e "$G MYSQL is already installed , Nothing to do $N"
else
    echo "$R MYSQL is not installed going to install $N"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
fi


