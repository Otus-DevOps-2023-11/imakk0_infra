#!/bin/bash

sudo apt install git -y
echo "------GIT CLONE REDDIT REPO------"
cd ~/ && git clone -b monolith https://github.com/express42/reddit.git
chmod 655 ~/reddit/*
echo "------CHECK RERDDIT REPO EXIST------"
cd ~/reddit && ls
echo "------BUNDLE INSTALL------"
cd ~/reddit && bundle install
echo "------START PUMA------"
puma -d
ps aux | grep puma
