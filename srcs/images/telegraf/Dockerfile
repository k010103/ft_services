FROM alpine:3.12

RUN		sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories

# install telegraf
RUN apk add telegraf --repository=https://mirrors.ustc.edu.cn/alpine/v3.13/community/

# copy telegraf config
COPY ./srcs/telegraf.conf /etc/telegraf/

CMD ["/usr/bin/telegraf"]
