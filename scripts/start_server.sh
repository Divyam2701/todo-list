#!/bin/bash
echo "Starting the application..."
cd /home/ubuntu/todo-app

echo "Pulling the latest Docker image..."
docker pull divyam2701/todo-app:latest

echo "Running the container..."
docker run -d --name todo-app -p 3000:3000 divyam2701/todo-app:latest
