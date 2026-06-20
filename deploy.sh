#!/bin/bash

IMAGE_NAME="raguraaman/project-3-devops-build"
TAG="v1"

docker pull $IMAGE_NAME:$TAG

docker stop devops-app || true
docker rm devops-app || true

docker run -d \
  --name devops-app \
  -p 80:80 \
  $IMAGE_NAME:$TAG

echo "Deployment completed."
