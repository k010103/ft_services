FROM	alpine:3.12

RUN	apk add grafana=7.3.6-r0 --repository=https://dl-cdn.alpinelinux.org/alpine/latest-stable/community/

COPY	/srcs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/

EXPOSE 3000

ENTRYPOINT ["/usr/sbin/grafana-server", "--config=/etc/grafana/grafana.ini", "--homepath=/usr/share/grafana"]
