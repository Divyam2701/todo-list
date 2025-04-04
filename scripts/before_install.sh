#!/bin/bash
echo "Checking if the server is running..."

if pm2 list | grep -q "to-do-list"; then
    echo "Stopping the existing PM2 process..."
    pm2 stop to-do-list
    pm2 delete to-do-list
fi

echo "Updating system packages..."
sudo apt update -y
