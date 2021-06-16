mysql_install_db --user=root

mysqld --user=root --bootstrap < /tmp/mysql-init

service mariadb start

mysql < wordpress.sql

service mariadb stop

mysqld --user=root
