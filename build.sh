#!/bin/bash

IMAGE_NAME="raguraaman/project-3-devops-dev"
TAG="v1"

echo "Building image..."
docker build -t $IMAGE_NAME:$TAG .

echo "Pushing image..."
docker push $IMAGE_NAME:$TAG

echo "Build completed!"
