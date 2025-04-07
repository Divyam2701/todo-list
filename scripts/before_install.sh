#!/bin/bash

echo "Starting Docker service..."
sudo systemctl start docker

echo "Stopping and removing old container (if exists)..."
sudo docker stop todo-container || true
sudo docker rm todo-container || true

echo "System ready for new container deployment."
