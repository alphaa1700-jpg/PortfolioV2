#!/bin/bash
echo "started"
pwd

cd /home/ubuntu/Portfolio2 && npm install

cd /home/ubuntu/Portfolio2 && npm install pm2

pwd

cd /home/ubuntu/Portfolio2 && pm2 restart Portfolio2

pwd

echo "finished"