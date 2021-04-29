#!/bin/sh

# 권한설정
# chmod 775 /run.sh
# chown -R www-data:www-data /var/www/
# chmod -R 755 /var/www/

# 시작할때마다 세팅이 필요한 내용들은 여기에
nginx -g 'daemon off;'

