#!/bin/bash
echo "Stopping the Vite app..."
pm2 stop to-do-list || true
pm2 delete to-do-list || true
