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

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
RUN		tar -xvf /phpMyAdmin-4.9.5-all-languages.tar.gz
RUN		rm -f /phpMyAdmin-4.9.5-all-languages.tar.gz
RUN		mv /phpMyAdmin-4.9.5-all-languages /usr/share/phpmyadmin

# RUN		adduser -D -g 'www' www \
# &&		mkdir /www \
# &&		chown -R www:www /var/lib/nginx \
# &&		chown -R www:www /www \
# &&		mkdir -p /run/nginx

#	--no-cache
RUN		rm -rf /var/cache/apk/*
#	symbolic link
RUN		ln -s /usr/share/phpmyadmin /var/www/html

# healthcheck set
COPY ./srcs/healthcheck.sh /
RUN chmod -u+x ./healthcheck.sh

# RUN		chown -R www:www /var/www/phpmyadmin


COPY test.html /var/www/html/
# RUN chmod 777 /var/www/html/test.html

EXPOSE	5000

COPY	/srcs/php_setup.sh ./php_setup.sh
RUN		chmod +x php_setup.sh
CMD		sh ./php_setup.sh
