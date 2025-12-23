#!/bin/bash
echo "started"
pwd

cd /home/ec2-user/Portfolio2 && npm install

cd /home/ec2-user/Portfolio2 && npm install pm2

pwd

cd /home/ec2-user/Portfolio2 && pm2 restart Portfolio2

pwd

echo "finished"
