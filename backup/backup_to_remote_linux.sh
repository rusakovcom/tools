#!/bin/bash 
# script for making tar.gz archive-backup of the directory with sending through rsync to remote server. 

### FILL IN THE PARAMETRS

backup_directory='/root/backup/data/'
backup_archive_name=backup_$(date +%Y%m%d_%H%M).tar.gz

ssh_privat_key_path='/root/.ssh/backup' # for connecting to remote server through ssh
remote_user=root
remote_ip=109.207.173.55
remote_backup_directory='/root/backups'

### BACKUP

# create temporary archive
tar -czvf ${backup_directory}${backup_archive_name} ${backup_directory}
# send to remote server with deleting temporary archive
rsync -e "ssh -i ${ssh_privat_key_path}" --remove-source-files ${backup_directory}${backup_archive_name} ${remote_user}@${remote_ip}:${remote_backup_directory}



# example of cron job for current server for every day running this script
# 0 1 * * * bash /root/backup/backup_to_remote_linux.sh

# example of cron job for remote server to delete 1 time a day old backup archives (older than 7 days)
# 0 1 * * * find /root/backups -type f -mtime +7 -delete
