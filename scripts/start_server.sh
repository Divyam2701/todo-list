#!/bin/bash
cd /home/ec2-user/to-do-list
pm2 stop all
pm2 start npm --name "to-do-list" -- run dev
pm2 save
pm2 startup
