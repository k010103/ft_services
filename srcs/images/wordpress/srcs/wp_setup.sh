#!/bin/sh

/usr/sbin/php-fpm7
nginx -g 'daemon off;'
#php -S 0.0.0.0:5050 -t /etc/wordpress/
