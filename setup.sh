#setup.sh
minikube start --driver=virtualbox
eval $(minikube -p minikube docker-env)

# file 이름을 변경.
MINIKUBE_IP=$(minikube ip)
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/yamls/config_format.yaml > ./srcs/yamls/config.yaml

# metalLB 설치.
echo "metalLB start"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/yamls/config.yaml

echo "nginx start"
docker build -t nginx_service ./srcs/images/nginx/
kubectl apply -f ./srcs/yamls/nginx.yaml
