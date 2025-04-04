#!/bin/bash
echo "Checking if the app is running..."
if pgrep node; then
    echo "Stopping running Node.js application..."
    pm2 stop all
fi

echo "Updating system packages..."
sudo apt-get update -y
