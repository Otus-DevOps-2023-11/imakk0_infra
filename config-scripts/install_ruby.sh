#!/bin/bash
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
echo "------CHECK VERSIONS------"
ruby -v
bundler -v
