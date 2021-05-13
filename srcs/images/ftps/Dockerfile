FROM	alpine:3.12

RUN		apk add --no-cache \
		vsftpd \
		openssl

RUN		openssl req -newkey rsa:4096 -nodes -x509 -days 365 -subj "/C=KR/L=GUN/O=42Seoul/OU=junmkang/CN=nginx" -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/private/vsftpd.pem

COPY	/srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN		mkdir -p /ftps/user \
&&		adduser --home=/ftps/user -D user \
&&		chmod -R 777 /ftps/user \
&&		echo "user:1234" | chpasswd

EXPOSE	20 21 21100-21104

COPY	./srcs/ftps_setup.sh /ftps/user/ftps_setup.sh
COPY	./srcs/test.txt /ftps/user/test.txt
CMD		["sh", "/ftps/user/ftps_setup.sh"]
