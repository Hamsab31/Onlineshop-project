docker build -t h4meed/dev:latest .
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push h4meed/dev:latest