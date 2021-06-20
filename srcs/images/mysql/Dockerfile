FROM 	alpine:3.12

RUN		sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

RUN		apk update && apk upgrade \
&&		apk add mysql mysql-client openrc \
&&		mkdir -p /run/mysqld

RUN		openrc default

COPY	/srcs/my.cnf /etc/mysql/
COPY	/srcs/mysql-init /tmp/
COPY	/srcs/start.sh /tmp/
COPY	./srcs/wordpress.sql .

RUN		chmod +x /tmp/start.sh

ENTRYPOINT	["sh", "/tmp/start.sh"]
