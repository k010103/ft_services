FROM	alpine:3.12

RUN		sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

RUN		apk update && apk upgrade \
&&		apk add --no-cache nginx \
&&		mkdir -p /run/nginx

#	php base nginx

#	php setupfile
RUN		mkdir -p /run/nginx

# COPY	/srcs/nginx.conf /etc/nginx/nginx.conf
COPY	/srcs/default.conf /etc/nginx/conf.d/default.conf

RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
		php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN		tar -xvf /phpMyAdmin-5.0.4-all-languages.tar.gz
RUN		rm -f /phpMyAdmin-5.0.4-all-languages.tar.gz
RUN		mkdir -p /www/
RUN		mv /phpMyAdmin-5.0.4-all-languages /www/phpmyadmin

RUN		mkdir -p /www/phpmyadmin/tmp/
RUN		chmod 777 /www/phpmyadmin/tmp/
# RUN		adduser -D -g 'www' www \
# &&		mkdir /www \
# &&		chown -R www:www /var/lib/nginx \
# &&		chown -R www:www /www \
# &&		mkdir -p /run/nginx


#	--no-cache
RUN		rm -rf /var/cache/apk/*
#	symbolic
# RUN		chmod -R 755 /var/www/html

# healthcheck set
COPY ./srcs/healthcheck.sh /
RUN chmod -u+x ./healthcheck.sh

# RUN		chown -R www:www /var/www/phpmyadmin


COPY test.html /www

EXPOSE	5000

COPY	/srcs/php_setup.sh ./tmp/php_setup.sh
RUN		chmod +x /tmp/php_setup.sh

CMD ["sh", "./tmp/php_setup.sh"]
# CMD		sh ./tmp/php_setup.sh
