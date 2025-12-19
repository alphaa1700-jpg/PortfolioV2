#!/bin/bash 
cd /home/ubuntu/Portfolio2
pm2 delete portfolio || truepm2 start index.js --name portfolio
pm2 save
chmod +x scripts/start.sh
