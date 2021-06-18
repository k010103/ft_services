#!/bin/sh

nginx -g 'daemon off;'
#php -S 0.0.0.0:5050 -t /etc/wordpress/
/usr/sbin/php-fpm7
