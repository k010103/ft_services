FROM alpine:3.12

RUN		sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

ENV TELEGRAF_VERSION 1.14.0

RUN	wget https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz \
	&& tar -C . -xzf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz \
	&& chmod +x telegraf/telegraf \
	&& cp telegraf/telegraf /usr/bin/ \
	&& rm -rf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz telegraf/	\
	&& mkdir -p /etc/telegraf

ENTRYPOINT ["usr/bin/telegraf"]
