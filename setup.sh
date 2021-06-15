#!/bin/bash
#setup.sh

# "minikube delete --purge --all" and "docker system prune";
export MINIKUBE_HOME=/goinfre/$USER
brew install minikube kubectl
brew upgrade minikube kubectl
minikube start --driver=virtualbox
minikube dashboard &
eval $(minikube -p minikube docker-env)

# colors
_BLACK='\033[30m'
_RED='\033[31m'
_GREEN='\033[32m'
_YELLOW='\033[33m'
_BLUE='\033[34m'
_PURPLE='\033[35m'
_CYAN='\033[36m'
_WHITE='\033[37m'
_NOCOLOR='\033[0m'

echo -e 	"\n\n $_YELLOW
      ====================================================================================

      ███████╗████████╗     ███████╗███████╗██████╗ ██╗   ██╗██╗ ██████╗███████╗███████╗
      ██╔════╝╚══██╔══╝     ██╔════╝██╔════╝██╔══██╗██║   ██║██║██╔════╝██╔════╝██╔════╝
      █████╗     ██║        ███████╗█████╗  ██████╔╝██║   ██║██║██║     █████╗  ███████╗
      ██╔══╝     ██║        ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║     ██╔══╝  ╚════██║
      ██║        ██║███████╗███████║███████╗██║  ██║ ╚████╔╝ ██║╚██████╗███████╗███████║
      ╚═╝        ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝╚══════╝╚══════╝

      ====================================================================================="

echo -e   "\n\n $_PURPLE

                             FT_SERVICES - Kubernetes cluster

                                     ╭───────╮
                                     │ World │
                                     ╰───┬───╯
                                         │
                           ╭─────────────┷──────────╮
                           │ Load Balancer(MetalLB) │
                           ╰─────────────┬──────────╯
     ┌────────────┬────────────────────┬─┴────────────────────┬───────────┐
     │3000        │5050                │80/443	              │5000       │21
╭────┷────╮ ╭─────┷─────╮ Redirect ╭───┷───╮ Reverse... ╭─────┷──────╮ ╭──┷───╮
│ Grafana │ │ WordPress ┠──────────┤ NginX ├────────────┨ PhpMyAdmin │ │ FTPS │
╰─┯─────┬─╯ ╰───┬────┯──╯          ╰───┬───╯            ╰─────┬─┯────╯ ╰──┬───╯
  │     │       │    └┐                │                      │ └┐   ┌────┘
  │data └─────┐ │     └────────────────┼──────────────────────┼──┴───┼──────┐
  │           │ │                      │                      │      │ data │
  │           │ │                      │                      │     ┌┘      │
┌─┴────────┐  │ │                      │                      │     │ ┌─────┷─┐
│ InfluxDB ┠──┴─┴──────────────────────┴──────────────────────┴─────┴─┤ MySQL │
└──────────┘ Metrics                                                  └───────┘
                                                                                "

# file 내용 변경. addresses format
MINIKUBE_IP=$(minikube ip)
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/yamls/config_format.yaml > ./srcs/yamls/config.yaml
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/images/nginx/srcs/nginx_format.conf > ./srcs/images/nginx/srcs/nginx.conf
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/images/ftps/srcs/vsftpd_format.conf > ./srcs/images/ftps/srcs/vsftpd.conf
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/yamls/phpmyadmin_format.yaml > ./srcs/yamls/phpmyadmin.yaml
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/yamls/grafana_format.yaml > ./srcs/yamls/grafana.yaml

# metalLB 설치.
echo -e $_RED "
      =====================================================
      --------------------metalLB start--------------------
      ====================================================="
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/yamls/config.yaml


echo -e $_YELLOW "
      =====================================================
      ---------------------nginx start---------------------
      ====================================================="
docker build -t nginx_service ./srcs/images/nginx/
kubectl apply -f ./srcs/yamls/nginx.yaml


echo -e $_PURPLE "
      ======================================================
      ----------------------mysql start---------------------
      ======================================================"
docker build -t mysql ./srcs/images/mysql/
kubectl apply -f ./srcs/yamls/mysql.yaml


echo -e $_BLUE "
      ======================================================
      ----------------------ftps start----------------------
      ======================================================"
docker build -t ftps ./srcs/images/ftps/
kubectl apply -f ./srcs/yamls/ftps.yaml


echo -e $_BLUE "
      ======================================================
      -------------------phpmyadmin start-------------------
      ======================================================"
docker build -t phpmyadmin ./srcs/images/phpmyadmin/
kubectl apply -f ./srcs/yamls/phpmyadmin.yaml


echo -e $_GREEN "
      ======================================================
      --------------------wordpress start-------------------
      ======================================================"
docker build -t wordpress ./srcs/images/wordpress/
kubectl apply -f ./srcs/yamls/wordpress.yaml


echo -e $_PURPLE "
=====================================================================
 8888888           .d888 888                   8888888b.  888888b.
   888            d88P   888                   888   Y88b 888   88b
   888            888    888                   888    888 888  .88P
   888   88888b.  888888 888 888  888 888  888 888    888 8888888K.
   888   888  88b 888    888 888  888 'Y8bd8P' 888    888 888   Y88b
   888   888  888 888    888 888  888   X88K   888    888 888    888
   888   888  888 888    888 Y88b 888 .d8 8b. 888  .d88P  888   d88P
 8888888 888  888 888    888   Y88888 888  888 8888888P   8888888P
====================================================================="
docker build -t influxdb ./srcs/images/influxdb/
kubectl apply -f ./srcs/yamls/influxdb.yaml


echo -e $_GREEN "
      ======================================================
      ---------------------telegraf start-------------------
      ======================================================"
docker build -t telegraf ./srcs/images/telegraf/
kubectl apply -f ./srcs/yamls/telegraf.yaml


echo -e $_YELLOW "
      ======================================================
      ---------------------grafana start--------------------
      ======================================================"
docker build -t grafana ./srcs/images/grafana/
kubectl apply -f ./srcs/yamls/grafana.yaml


# nginx가 CrashLoopBackOff가 발생하는것을 확인할 수 있었다. 해결방법은?
# -> minikube로 들어가서 docker images를 통해 nginx images가 생성이 되었는지 확인하고, 생성이 되었다면,
#	 nignx images에 들어가 nginx를 직접 실행을 시켜본다. 그로인해 나오는 error msg를 바탕으로 디버깅.

zsh
