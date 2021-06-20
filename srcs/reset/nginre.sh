kubectl delete -f ../yamls/nginx.yaml
eval $(minikube docker-env)
sleep 8
docker ps #> /dev/null 2>&1
docker rmi nginx #> /dev/null 2>&1
docker images #> /dev/null 2>&1
docker rmi nginx #> /dev/null 2>&1
docker ps #> /dev/null 2>&1
docker rmi nginx #> /dev/null 2>&1
docker images #> /dev/null 2>&1
docker rmi nginx #> /dev/null 2>&1
echo "[build nginx...!!!]"
docker build -t nginx ../images/nginx #> /dev/null 2>&1
kubectl apply -f ../yamls/nginx.yaml
