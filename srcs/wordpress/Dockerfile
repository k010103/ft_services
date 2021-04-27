FROM	alpine:3.13

RUN		apk update && apk upgrade
RUN		apk add \
		php7-fpm \
		vim \
		wget

#		https://wordpress.org/latest.tar.gz 경로를 찾을 수 없다고 계속해서 에러발생.
RUN		wget https://wordpress.org/latest.tar.gz \
		&& tar -xvf latest.tar.gz \
		&& mv wordpress/* /var/www/ \
		&& rm -rf /var/cache/apk/*

EXPOSE	5050

CMD		wordpress.sh
