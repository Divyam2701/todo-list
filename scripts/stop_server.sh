#!/bin/bash
echo "Stopping existing Docker container..."
sudo docker stop todo-app || true
sudo docker rm todo-app || true
