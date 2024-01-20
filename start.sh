minikube start --extra-config "apiserver.cors-allowed-origins=["http://boot.dev"]"
kubectl apply -f api-configmap.yml
kubectl apply -f api-deployment.yml

kubectl apply -f crawler-configmap.yml
kubectl apply -f crawler-deployment.yml

kubectl apply -f web-deployment.yml
kubectl apply -f web-service.yml
