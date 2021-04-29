#setup.sh
minikube start --driver=virtualbox
export MINIKUBE_HOME=/goinfre/$USER/
eval $(minikube -p minikube docker-env)

MINIKUBE_IP=$(minikube ip)
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/metallb/config_format.yaml > ./srcs/metallb/config.yaml

# metalLB 설치.
echo "metalLB start"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metallb/config.yaml
