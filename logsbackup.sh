#! /bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}

if [ $# -lt 2 ]
then 
    echo "provide <source-file> <destination-file>"
    exit 1
fi

if [ -z $SOURCE_DIR ]
then 
    echo "source directory exists"
else
    echo "source directory doesn't exist"
    exit 1
fi


if [ -z $DESTINATION_DIR ]
then 
    echo "destination directory exists"
else
    echo "destination directory doesn't exist"
    exit 1
fi

