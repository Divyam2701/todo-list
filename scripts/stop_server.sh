#!/bin/bash
echo "Stopping existing Docker container..."
docker stop todo-app || true
docker rm todo-app || true
