FROM alpine:3.12

RUN		sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

RUN apk update
RUN apk add mysql

RUN mkdir -p /run/mysqld

COPY	/srcs/my.cnf /etc/mysql/
COPY	/srcs/mysql-init /tmp/
COPY	/srcs/start.sh /tmp/

ENTRYPOINT	["sh", "/tmp/start.sh"]
