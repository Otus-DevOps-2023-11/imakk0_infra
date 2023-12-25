#!/bin/bash
# ruby
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
ruby -v
bundler -v
# mongodb
sudo apt update
sudo apt install mongodb -y
sudo systemctl status mongodb
sudo systemctl start mongodb
sudo systemctl status mongodb
sudo systemctl enable mongodb
# git
sudo apt install git -y
cd ~/ && git clone -b monolith https://github.com/express42/reddit.git
chmod 655 ~/reddit/*
cd ~/reddit && ls
cd ~/reddit && bundle install
puma -d
ps aux | grep puma
