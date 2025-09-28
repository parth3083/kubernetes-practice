$ErrorActionPreference = "Stop"

$NAME = "kubernetes-practice-api"
$USERNAME = "parth3083"
$IMAGE = "$USERNAME/$NAME" + ":latest"

Write-Host "Building docker image..." -ForegroundColor Green
docker build -t $IMAGE .

Write-Host "Pushing image to the docker hub" -ForegroundColor Green
docker push $IMAGE

Write-Host "Applying kubernetes manifests..." -ForegroundColor Green
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

Write-Host "Getting pods..." -ForegroundColor Green
kubectl get pods

Write-Host "Getting services..." -ForegroundColor Green
kubectl get services

Write-Host "Fetching the main service" -ForegroundColor Green
kubectl get services "$NAME-service"