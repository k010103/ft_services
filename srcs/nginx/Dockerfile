FROM	alpine:3.13

RUN		apk update && apk upgrade
RUN		apk add nginx

COPY	./nginx.conf ./tmp

EXPOSE	80 443

CMD		sh nginx.sh
