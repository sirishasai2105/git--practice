#!/bin/bash

source_dir=/home/ec2-user/logs

if [ -d $source_dir ]
then
    echo "given source directory exists"
else
    echo "given source directory doesn't exist"
    exit 1
fi

files=$(find $source_dir -name "*.log" -mtime +14)
echo "log files are :$files"

while IFS= read -r line
do
    echo "Iam going to delete the log file:$line"
    rm -rf $line

done <<< $files