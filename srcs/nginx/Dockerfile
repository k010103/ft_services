FROM	alpine:3.13

RUN		apk update && apk upgrade
RUN		apk add \
		nginx \
		openssl

# 실행을 위한 설정.
RUN		mkdir -p /run/nginx

RUN		mkdir -p /www
COPY	./srcs/index.html /www

# nginx 설정. 80 443
RUN		rm /etc/nginx/conf.d/*
COPY	./srcs/nginx.conf ./etc/nginx/conf.d

# ssl 설정.
RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout ft_server.key -out ft_server.crt -days 365 -subj "/C=KR/ST=SEOUL/L=SEOUL/O=42Seoul/OU=gun/CN=localhost"
RUN		mv ft_server.crt /etc/nginx/ssl/
RUN		mv ft_server.key /etc/nginx/ssl/

EXPOSE	80 443

CMD		./nginx.sh

# 한번 사용하고 안쓸내용들은 여기에.
