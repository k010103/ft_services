FROM	alpine:3.12

RUN	apk add influxdb --no-cache

CMD 	influxd run -config /etc/influxdb.conf

ENTRYPOINT	["/usr/sbin/influxd"]
