#!/bin/bash

echo "Running Docker container..."
docker run -d -p 80:80 h4meed/react-app:latest
echo "Docker container is running on port 80."
