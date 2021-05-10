FROM	alpine:3.12

RUN		apk add --no-cache \
		vsftpd \
		openssl

RUN		openssl req -newkey rsa:4096 -nodes -x509 -keyout /etc/ssl/private/vsftps.key -out /etc/ssl/certs/vsftps.crt -days 365 -subj "/C=KR/L=Goyang/O=42Seoul/OU=junmkang/CN=nginx"

RUN	mkdir -p /ftps/user \
&&	adduser --home=/ftps/user -D user \
&&	chmod -R 777 /ftps/user \
&&	echo "user:1234" | chpasswd

EXPOSE 20 21 21100-21104

COPY ./srcs/start.sh /ftps/user/start.sh
COPY ./srcs/test.txt /ftps/user/test.txt
CMD ["sh", "/ftps/user/start.sh"]
