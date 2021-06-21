kubectl delete -f ../yamls/influxdb.yaml
eval $(minikube docker-env)
sleep 8
docker ps #> /dev/null 2>&1
docker rmi influxdb #> /dev/null 2>&1
docker images #> /dev/null 2>&1
docker rmi influxdb #> /dev/null 2>&1
docker ps #> /dev/null 2>&1
docker rmi influxdb #> /dev/null 2>&1
docker images #> /dev/null 2>&1
docker rmi influxdb #> /dev/null 2>&1
echo "[build influxdb...!!!]"
docker build -t influxdb ../images/influxdb #> /dev/null 2>&1
kubectl apply -f ../yamls/influxdb.yaml
