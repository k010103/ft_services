kubectl delete -f ../yamls/mysql.yaml
eval $(minikube docker-env)
sleep 8
docker ps #> /dev/null 2>&1
docker rmi mysql #> /dev/null 2>&1
docker images #> /dev/null 2>&1
docker rmi mysql #> /dev/null 2>&1
docker ps #> /dev/null 2>&1
docker rmi mysql #> /dev/null 2>&1
docker images #> /dev/null 2>&1
docker rmi mysql #> /dev/null 2>&1
echo "[build mysql...!!!]"
docker build -t mysql ../images/mysql #> /dev/null 2>&1
kubectl apply -f ../yamls/mysql.yaml
