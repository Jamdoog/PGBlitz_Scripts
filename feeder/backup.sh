#!/bin/bash

# This will be the directory within `/mnt/unionfs/` you want
declare DIRECTORY="backup"
declare DELBACKUPSLOCAL="n"
# DELBACKUPS can be set to either y/n. It will delete all backups in respective directories

# If the backup directory doesn't exist
if [ -d "/mnt/unionfs/$DIRECTORY" ];
then
    echo "Directory exists at: /mnt/unionfs/$DIRECTORY"
elif [ ! -d "/mnt/unionfs/$DIRECTORY" ];
then
    mkdir /mnt/unionfs/$DIRECTORY
    echo "Made Directory: /mnt/unionfs/$DIRECTORY"
fi

# If the move directory doesn't exist
if [ -d "/mnt/move/$DIRECTORY" ];
then
    echo "Move directory exists at: /mnt/move/$DIRECTORY"
elif [ ! -d "/mnt/move/$DIRECTORY" ];
then
    mkdir /mnt/move/$DIRECTORY
    echo "Made Directory: /mnt/move/$DIRECTORY"
fi

# Copy the Sonarr backups.
cp /opt/appdata/sonarr/Backups/scheduled/* /mnt/move/$DIRECTORY
cp /opt/appdata/sonarr/Backups/manual/* /mnt/move/$DIRECTORY
echo "Copied Sonarr backups"


# Copy the Sonarr backups
cp /opt/appdata/radarr/Backups/scheduled/* /mnt/move/$DIRECTORY
cp /opt/appdata/radarr/Backups/manual/* /mnt/move/$DIRECTORY
echo "Copied Radarr backups"

if [ DELBACKUPSLOCAL = "y" ];
then
    rm -rf /opt/appdata/sonarr/Backups/scheduled/*
    rm -rf /opt/appdata/sonarr/Backups/manual/*
    rm -rf /opt/appdata/radarr/Backups/scheduled/*
    rm -rf /opt/appdata/radarr/Backups/manual/*
    echo "Deleted Directories"
fi
