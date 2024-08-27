#! /bin/bash

USER_ID=$(id -u)

if ($USER_ID -ne 0)
then
    echo "Please take root access to run the packages"
    exit 1
fi

dnf list installed git
if[ $? -eq 0 ]
then
    echo "GIT is already installed ,NOthing to do"
else
    echo "GIT is not installed .Going to install"
    dnf install git -y
    if [ $? -eq 0]
    then 
        echo "GIT installtion is SUCCESS"
    else
        echo "GIT installation is FAILED"
        exit 1
    fi
fi