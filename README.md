# PGBlitz_Scripts
Stores any PGBlitz scripts I make. Usually only basic scripts but useful.

## Feeder Scripts:

# feeder/backup.sh

This script will backup all of the backups in the respective backup directories of Sonarr/Radarr using the PGBlitz installation. I've found that Radarr and Sonarr backup, so moving it to your GDrive account can be a great way to ensure that you don't loose anything if you have data loss.
The script needs a little bit of configuring, there are 2 variables which are down to your descretion.

- DIRECTORY 
As the name suggests, this is the directory in which the backups will be placed. My script will check if it exists, and if it does not it will create the directory for you. This is in reference to /mnt/unionfs, so please put in the directory name without this. It will also create a directory in /mnt/move.

- DELBACKUPSLOCAL
Once more, as the name suggests it is a boolean which can be chnaged to configure wether or not you want to delete local backups after they have been copied to your GDrive. Personally, I leave them undeleted because they don't take up alot of space but this is down to you. Change the variable to either `y` for yes or `n` for no.

We can also use this with a cronjob, meaning that we can get it to automatically backup when we desire. Edit appropriately for different timing if you want. In this example, it will take place automatically every 7 days.

crontab -l > mycron && echo "0 0 */7 * * /home/server/backup.sh" >> mycron && crontab mycron && rm mycron

# feeder/anime.sh

This scrpit will download any webm provided and then move it to the directory of your choice. Similar to my backup script, it will use GDrive so the respective directory you can configure needs to be without the /mnt/unionfs. By default, it's setup to aoped (For Anime Op Ed), although this script can be adopted to any webm automation.
This script works by having the first parameter when running it be the link to the webm, and then the second parameter being the name that you want to call it. For example: anime.sh http://path.to/file.webm "JoJo Opening 1" (When naming it you don't need to include the .webm). I don't really expect this script to be used by anyone by myself, but it is here for anyone who would like to use it/adapt it??
