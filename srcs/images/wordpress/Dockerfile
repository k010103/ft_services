FROM	alpine:3.12

RUN		apk update && apk upgrade \
&&		apk add --no-cache nginx \
&&		mkdir -p /run/nginx

COPY	/srcs/nginx.conf /etc/nginx/nginx.conf

RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
		php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xvf latest.tar.gz
RUN		rm -f latest.tar.gz
RUN		mv wordpress /etc/
COPY	/srcs/wp-config.php /etc/wordpress/
COPY	/srcs/run.sh /tmp/
RUN		rm -rf /var/cache/apk/*

EXPOSE	5050

ENTRYPOINT ["sh", "/tmp/run.sh"]
