echo "user" >> etc/vsftpd/vsftpd.userlist

touch /var/log/vsftpd.log

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
