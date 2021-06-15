FROM	alpine:3.12

RUN		sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

RUN	apk add grafana=7.3.6-r0 --repository=https://dl-cdn.alpinelinux.org/alpine/latest-stable/community/

COPY	/srcs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/

EXPOSE 3000

ADD srcs/entrypoint.sh /
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

# ENTRYPOINT ["/usr/sbin/grafana-server", "--config=/etc/grafana/grafana.ini", "--homepath=/usr/share/grafana"]
