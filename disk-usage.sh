#! /bin/bash

DISK_USAGE=df - hT | grep xfs
DISK_THRESHOLD=5

while IFS= read -r line
do
    disk_space=$line | awk -F " " '{print $6F}'
    disk_folder=$line | awk -F " " 'print $NF'
    if [ $disk_space -gt $DISK_THRESHOLD ]
    then
        echo "U have occupied $disk_space on folder $disk_folder .Go amd delete some folders"
    fi



done <<< $DISK_USAGE