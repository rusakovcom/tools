#!/bin/bash 
# script for backup directory on Linux to remote server with rsync (through ssh), for test and debug you can try to run all three commands manually



# create compressed archive backup (/home/rusakov/backup/data_archives/backup_$(date +%Y%m%d_%H%M).tar.gz) of directory with data (/home/rusakov/backup/data)
tar -czvf /home/rusakov/backup/data_archives/backup_$(date +%Y%m%d_%H%M).tar.gz /home/rusakov/backup/data

# delete old compressed backup (in /home/rusakov/backup/data_archives/) for example, older than 7 days
find /home/rusakov/backup/data_archives -type f -mtime +7 -delete

# rsync transferring of actual compressed backups (/home/rusakov/backup/data_archives/) to remote server through ssh with special key
rsync -avz --delete -e "ssh -i /home/rusakov/.ssh/backup" /home/rusakov/backup/data_archives/ root@<ip_of_remote>:/root/remote_data_archives/



# example of cron job for every day backup to remote server
# 0 1 * * * bash /home/rusakov/backup/backup_to_remote_linux.sh
