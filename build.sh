#!/bin/bash
set -e

echo "Jenkins branch: $GIT_BRANCH"

if [[ "$GIT_BRANCH" == *"dev"* ]]; then
  IMAGE="h4meed/dev:latest"
elif [[ "$GIT_BRANCH" == *"master"* ]]; then
  IMAGE="h4meed/onlineshop-prod:latest"
else
  echo "Unsupported branch: $GIT_BRANCH"
  exit 1
fi

echo "Building image: $IMAGE"

docker build -t $IMAGE .

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push $IMAGE