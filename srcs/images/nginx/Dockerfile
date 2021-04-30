# 한번 사용하고 안쓸내용들은 여기에.

FROM	alpine:3.13

RUN		apk update && apk upgrade
RUN		apk add --no-cache \
		nginx \
		openssl \
		openssh

# ssl 설정. thisisunsafe
RUN		mkdir -p /etc/nginx/ssl
&&		openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout ft_server.key -out ft_server.crt -days 365 -subj "/C=KR/ST=SEOUL/L=SEOUL/O=42Seoul/OU=gun/CN=localhost" \
&&		mv ft_server.crt /etc/nginx/ssl/ \
&&		mv ft_server.key /etc/nginx/ssl/

# html .
COPY	./index.html /var/www/html/

# default .
RUN		rm /etc/nginx/conf.d/default.conf
COPY	./srcs/default.conf ./etc/nginx/http.d

RUN		rm /etc/nginx/nginx.conf
COPY	./srcs/nginx.conf ./etc/nginx

# start .
RUN		mkdir -p var/run/nginx
COPY	./srcs/nginx_setup.sh .

# ssh . 안전하게 통신을 하기 위해 사용하는 프로토콜
RUN		sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config
&&		echo 'root:junmkang' | chpasswd
&&		ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
&&		ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \

EXPOSE	80 443

RUN		chmod 775 nginx_setup.sh
CMD		/nginx_setup.sh

# nginx.sh에 있는것들이 동작되도록 설정. O
# 자동으로 nginx가 실행되도록 설정. O
# localhost:80 오류해결. ㅁ
# html 적용법. O
# localhost:443 제대로 동작하는건지 확인. O
# wordpress등과 연동하는 방법 확인. X

