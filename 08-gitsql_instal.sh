#! /bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]
then 
    echo "Get root access and then continue"
    exit 1
fi

dnf list installed mysql

if [ $? -eq 0 ]
then
    echo "MYSQl is already installed , Nothing to do"
else
    echo "MYSQl is not installed , Ready to install"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
        echo "MYSQL installation is SUCCESS"
    else
        echo "MYSQL installation is FAILED"
        exit 1
    fi
fi

dnf list installed git

if [ $? -eq 0 ]
then
    echo "GIT is already installed nothing to do"
else
    echo "GIT is not installed going to install"
    dnf install git -y
    if [ $? -eq 0]
    then
        echo "GiT installation is SUCCESS"
    else
        echo "GIT installation is FAILED"
        exit 1
    fi 
fi
