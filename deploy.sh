set -e

NAME="kubernetes-practice-api"
USERNAME="parth3083"
IMAGE="$USERNAME/$NAME:latest"

echo "Building docker image..."
docker build -t $IMAGE .

echo "Pushing image  to the docker hub"
docker push $IMAGE

echo "Applying kubernetes maifests..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods..."
kubectl get pods

echo "Getting services..."
kubectl get services

echo "Fetching the main service"
kubectl get services $NAME-service 