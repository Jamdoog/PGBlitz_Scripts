#!/bin/bash

declare DIRECTORY="aoped"

if [ ! -d "/mnt/unionfs/$DIRECTORY" ];
then
    mkdir /mnt/unionfs/$DIRECTORY
    echo "Made Directory /mnt/unionfs/$DIRECTORY"
fi

if [ ! -d "/mnt/move/$DIRECTORY" ];
then
    mkdir /mnt/move/$DIRECTORY
fi

wget -O temp.webm $1
mv temp.webm "$2.webm"
mv "$2.webm" /mnt/move/$DIRECTORY
