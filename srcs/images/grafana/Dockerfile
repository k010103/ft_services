FROM	alpine:3.12

RUN		sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

RUN apk update && apk upgrade
RUN	apk add grafana --repository=https://mirrors.ustc.edu.cn/alpine/v3.13/community/

COPY ./srcs/datasource.yaml /usr/share/grafana/conf/provisioning/datasources/

# set dashboards
RUN mkdir -p /var/lib/grafana/dashboards
COPY ./dashboards /var/lib/grafana/dashboards/
COPY ./srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/

ADD srcs/entrypoint.sh /
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

