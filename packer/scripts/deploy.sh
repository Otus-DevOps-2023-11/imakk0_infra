#!/bin/bash

sleep 20
apt install git -y
cd /var/tmp/ && git clone -b monolith https://github.com/express42/reddit.git
cd /var/tmp/reddit && bundle install
