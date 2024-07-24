#!/bin/bash

DIR_PATH=$1
STRING=$2


if [ $# -ne 2 ]
then
    echo "Error: Must provide 2 arguments"
    exit 1
fi

if [[ ! -d $DIR_PATH ]]
then
    echo "Error: $1 is NOT a directory in the filesystem"
    exit 1
fi


# Counting files
FILE_COUNT=$(find "$DIR_PATH" -type f | wc -l)
#echo "file count = $FILE_COUNT"

# Counting matching lines
MATCH_LINES=0
MATCH_LINES=$(grep -r "$STRING" "$DIR_PATH" | wc -l)
#echo "matching lines = $MATCH_LINES"
echo "The number of files are $FILE_COUNT and the number of matching lines are $MATCH_LINES"

#zabdiel