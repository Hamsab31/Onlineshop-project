#!/bin/bash
set -e

docker build -t hamsab31/dev:latest .

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push hamsab31/dev:latest