FROM	alpine:3.12

RUN		sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

RUN	apk add influxdb --no-cache

ENTRYPOINT	["/usr/sbin/influxd"]
