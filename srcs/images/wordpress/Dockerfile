FROM	alpine:3.12

RUN		sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

RUN		apk update && apk upgrade \
&&		apk add --no-cache nginx \
&&		mkdir -p /run/nginx

# COPY	/srcs/nginx.conf /etc/nginx/nginx.conf
COPY	/srcs/default.conf /etc/nginx/conf.d/default.conf

RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
		php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN		adduser -D -g 'www' www \
&&		mkdir /www \
&&		chown -R www:www /var/lib/nginx \
&&		chown -R www:www /www \
&&		mkdir -p /run/nginx

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xvf latest.tar.gz
RUN		rm -f latest.tar.gz
RUN		mv wordpress /www/
COPY	/srcs/wp-config.php /www/wordpress/
COPY	/srcs/wp_setup.sh /tmp/
RUN		chmod +x /tmp/wp_setup.sh
RUN		rm -rf /var/cache/apk/*

# healthcheck set
COPY ./srcs/healthcheck.sh /
RUN chmod -u+x ./healthcheck.sh

# RUN		chown -R www:www /var/www/wordpress

# RUN chomd

EXPOSE	5050

ENTRYPOINT ["sh", "/tmp/wp_setup.sh"]
