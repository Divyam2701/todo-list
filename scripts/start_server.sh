#!/bin/bash

echo "Navigating to project directory..."
cd /home/ubuntu/to-do-list || exit

echo "Stopping existing PM2 process (if any)..."
pm2 delete to-do-list || true

echo "Starting Vite server in production mode..."
pm2 start "npx vite preview" --name "to-do-list"

echo "Saving PM2 process list..."
pm2 save

echo "Setting PM2 to start on reboot..."
pm2 startup systemd -u ubuntu --hp /home/ubuntu | tail -1 | bash
