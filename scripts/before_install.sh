#!/bin/bash

echo "Starting Docker service..."
sudo systemctl start docker

echo "Stopping and removing old container (if exists)..."
docker stop todo-container || true
docker rm todo-container || true

echo "System ready for new container deployment."
