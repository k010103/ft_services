FROM alpine:3.12

RUN apk update && apk upgrade

# install influxdb
RUN apk add influxdb

# influx config
COPY ./srcs/influxdb.conf /etc/

# expose a port
EXPOSE 8086

CMD ["/usr/sbin/influxd"]
