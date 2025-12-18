#!/bin/bash
set -e

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ "$BRANCH" = "dev" ]; then
  IMAGE="h4meed/dev:latest"
elif [ "$BRANCH" = "master" ]; then
  IMAGE="h4meed/onlineshop-prod:latest"
else
  echo "Unsupported branch: $BRANCH"
  exit 1
fi

echo "Building image: $IMAGE"
docker build -t $IMAGE .

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push $IMAGE