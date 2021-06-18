kubectl delete -f ../srcs/yamls/phpmyadmin.yaml
eval $(minikube docker-env)
sleep 8
docker ps > /dev/null 2>&1
docker rmi phpmyadmin > /dev/null 2>&1
docker images > /dev/null 2>&1
docker rmi phpmyadmin > /dev/null 2>&1
docker ps > /dev/null 2>&1
docker rmi phpmyadmin > /dev/null 2>&1
docker images > /dev/null 2>&1
docker rmi phpmyadmin > /dev/null 2>&1
echo "[build phpmyadmin...!!!]"
docker build -t phpmyadmin ../srcs/images/phpmyadmin > /dev/null 2>&1
kubectl apply -f ../srcs/yamls/phpmyadmin.yaml
