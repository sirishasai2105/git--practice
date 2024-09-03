#! /bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}

if [ $# lt 2 ]
then 
    echo "provide <source-file> <destination-file>"
    exit 1
fi
