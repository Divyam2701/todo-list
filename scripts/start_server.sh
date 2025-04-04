#!/bin/bash

echo "Navigating to project directory..."
cd /home/ubuntu/to-do-list || exit

echo "Stopping existing PM2 processes (if any)..."
pm2 delete to-do-list || true  # Prevents error if process doesn't exist

echo "Starting the Vite application..."
pm2 start npm --name "to-do-list" -- run dev

echo "Saving PM2 process list..."
pm2 save

echo "Setting PM2 to start on reboot..."
pm2 startup systemd -u ubuntu --hp /home/ubuntu | tail -1 | bash
