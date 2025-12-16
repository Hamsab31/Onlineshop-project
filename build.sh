#!/bin/bash

echo "Building Docker image..."
docker build -t h4meed/react-app:latest .
echo "Docker image built successfully."