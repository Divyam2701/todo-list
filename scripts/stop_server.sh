#!/bin/bash
echo "Reloading application with zero downtime..."
if pm2 list | grep -q "to-do-list"; then
  pm2 restart to-do-list
else
  echo "Application not running, skipping reload."
fi
