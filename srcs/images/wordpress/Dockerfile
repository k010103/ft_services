FROM	alpine:3.12

RUN		sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

RUN		apk update && apk upgrade \
&&		apk add --no-cache nginx \
&&		mkdir -p /run/nginx

# COPY	/srcs/nginx.conf /etc/nginx/nginx.conf
COPY	/srcs/default.conf /etc/nginx/conf.d/default.conf

RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
		php7-zlib php7-curl php7-mbstring php7-json php7-session

# RUN		adduser -D -g 'www' www \
# &&		mkdir /www \
# &&		chown -R www:www /var/lib/nginx \
# &&		chown -R www:www /www \
# &&		mkdir -p /run/nginx

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xvf latest.tar.gz
RUN		rm -f latest.tar.gz
RUN		mkdir -p /www/wordpress
RUN		mv wordpress/* /www/wordpress/
RUN		rm -rf wordpress
COPY	/srcs/wp-config.php /www/wordpress

RUN		rm -rf /var/cache/apk/*

# wp-setup
COPY	/srcs/wp_setup.sh ./tmp/
RUN		chmod +x ./tmp/wp_setup.sh

# healthcheck set
COPY ./srcs/healthcheck.sh /
RUN chmod -u+x ./healthcheck.sh

EXPOSE	5050

CMD ["sh", "./tmp/wp_setup.sh"]
