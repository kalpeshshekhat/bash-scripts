#!/bin/bash

#useradd -g sapftp -d /import ftpuser ; echo -e "User@Ftp_15\nUser@Ftp_15"|passwd ftpuser
#useradd -m -d /home/scpuser scpuser ; echo -e "User@Scp_15\nUser@Scp_15"|passwd scpuser
mkdir -p /import/fileshare
setfacl -R -m default:g::rw -m o::rw -m u::rw /import ; chmod -R 777 /import ; setfacl -R -bn /import/fileshare ; chown -R ftpuser:sapftp /import ; chown -R scpuser:users /import/fileshare
#echo "ftpuser" > /etc/vsftpd.userlist
