FROM	alpine:3.13

RUN		apk update && apk upgrade
RUN		apk add \
		php7-fpm

#		https://wordpress.org/latest.tar.gz 경로를 찾을 수 없다고 계속해서 에러발생.
RUN		wget https://wordpress.org/latest.tar.gz -P /tmp \
		tar -xzf /tmp/latest.tar.gz -C /var/www;

EXPOSE	5050

CMD		wordpress.sh
