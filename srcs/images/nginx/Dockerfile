# 한번 사용하고 안쓸내용들은 여기에.

FROM	alpine:3.13

RUN		apk update && apk upgrade
RUN		apk add --no-cache \
		nginx \
		openssl \
		openssh

# ssl 설정. thisisunsafe
RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -x509 -newkey rsa:4096 -nodes -sha256 -keyout nginx.key -out nginx.crt -days 365 -subj "/C=KR/ST=SEOUL/L=SEOUL/O=42Seoul/OU=gun/CN=localhost"
RUN		chmod 600 nginx.crt nginx.key
RUN		mv nginx.key /etc/ssl/private/
RUN		mv nginx.crt etc/ssl/certs/
RUN		sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config
RUN		echo 'root:junmkang' | chpasswd
RUN		ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN		ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
RUN		mkdir -p /var/run/sshd

COPY 	./srcs/index.html /www/index.html
COPY 	./srcs/nginx.conf /etc/nginx/nginx.conf
COPY 	./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY 	./srcs/nginx_setup.sh .

RUN		chmod 775 nginx_setup.sh

EXPOSE	80 443

CMD		/nginx_setup.sh
