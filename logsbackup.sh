#! /bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)

if [ $# -lt 2 ]
then 
    echo "provide <source-file> <destination-file>"
    exit 1
fi

if [ -d $SOURCE_DIR ]
then 
    echo "source directory exists"
else
    echo "source directory doesn't exist"
    exit 1
fi


if [ -d $DESTINATION_DIR ]
then 
    echo "destination directory exists"
else
    echo "destination directory doesn't exist"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "$FILES"

ZIP_FILE=$DESTINATION_DIR/app-logs-$TIME_STAMP.zip
find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@
echo "zipped files are : $ZIP_FILE"

if [ -f $ZIP_FILE ]
then 
    echo "successfully zipped the files into the destination folder"
    while IFS= read -r file
    do
        echo "deleting $file in source directory"
        rm -rf $file

    done <<< $FILES
else
    echo "Zipping is failed please4 check it"
fi

echo "Source directory files are :$FILES"