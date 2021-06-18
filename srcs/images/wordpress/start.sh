/usr/sbin/php-fpm7
#cd www && tar -xvf latest.tar.gz && cd ..
wget -c  https://wordpress.org/latest.tar.gz -O - | tar -xz -C /www
nginx -g 'daemon off;'
