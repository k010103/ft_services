# 한번 사용하고 안쓸내용들은 여기에.

FROM	alpine:3.13

RUN		apk update && apk upgrade
RUN		apk add \
		nginx \
		openssl

# ssl 설정.
RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout ft_server.key -out ft_server.crt -days 365 -subj "/C=KR/ST=SEOUL/L=SEOUL/O=42Seoul/OU=gun/CN=localhost"
RUN		mv ft_server.crt /etc/nginx/ssl/
RUN		mv ft_server.key /etc/nginx/ssl/

# html을 적용시켜볼려고 하였으나 실패.
COPY	./srcs/index.html /var/www/html/

# nginx 설정. 80 443
RUN		rm /etc/nginx/conf.d/*
COPY	./srcs/nginx.conf ./etc/nginx/http.d

EXPOSE	80 443

# 실행을 위한 설정.
RUN		mkdir -p var/run/nginx
COPY	./srcs/nginx.sh .

RUN		chmod 775 nginx.sh
CMD		["nginx.sh"]

# nginx.sh에 있는것들이 동작되도록 설정.
# 자동으로 nginx가 실행되도록 설정.
# localhost:80 오류해결.
# html 적용법.
# localhost:443 제대로 동작하는건지 확인.
# wordpress등과 연동하는 방법 확인.

