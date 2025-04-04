#!/bin/bash
cd /home/ubuntu/to-do-list

echo "Starting the Vite app using PM2..."
pm2 serve dist 3000 --spa --name "to-do-list"

echo "Application is running at http://<your-ec2-ip>:3000"
