FROM alpine:3.12

RUN		apk update && apk upgrade
RUN		apk add --no-cache \
		nginx \
		openssl \
		openssh

# ssl
RUN		openssl req -newkey rsa:4096 -nodes -x509 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -days 365 -subj "/C=KR/L=Goyang/O=42Seoul/OU=junmkang/CN=nginx" \
&&		chmod 600 /etc/ssl/private/nginx.key /etc/ssl/certs/nginx.crt

# ssh
RUN		adduser -D -g 'www' www \
&&		mkdir /www \
&&		chown -R www:www /var/lib/nginx \
&&		chown -R www:www /www \
&&		mkdir -p /run/nginx
# &&		sed 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config \
# &&		echo 'root:junmkang' | chpasswd \
# &&		ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa \
# &&		ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
# &&		echo "Port 22" >> /etc/ssh/sshd_config \
# &&		mkdir -p /var/run/sshd

COPY	./srcs/index.html /www/index.html
COPY	./srcs/nginx.conf /etc/nginx/nginx.conf
COPY	./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY	./srcs/nginx_setup.sh .

RUN	chmod +x nginx_setup.sh

EXPOSE 80 443

CMD ["./nginx_setup.sh"]
