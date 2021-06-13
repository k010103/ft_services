#!/bin/sh

(grafana-server \
    -config /etc/grafana/grafana.ini \
    -homepath /usr/share/grafana)

