#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
    echo "Source directory exists: $SOURCE_DIR"
else
    echo "Source directory doesn't exists: $SOURCE_DIR"
    exit 1
fi