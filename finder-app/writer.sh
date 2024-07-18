#!/bin/bash

FILE_PATH=$1
TEXT=$2

if [ $# -ne 2 ]
then
    echo "Error: Must provide 2 arguments: path to file, and string to write"
    exit 1
fi

dir=$(dirname $FILE_PATH)
#echo $dir

#creating directory (okay if already exists)
if ! mkdir -p $dir 
then
    echo "Error: couldn't create directory $dir"
    exit 1
fi

if ! echo $TEXT > $FILE_PATH
then
    echo "Error: couldn't write text to $FILE_PATH"
    exit 1
fi
