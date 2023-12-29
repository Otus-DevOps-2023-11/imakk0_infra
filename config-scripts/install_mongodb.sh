#!/bin/bash
sudo apt update
sudo apt install mongodb -y
echo "------CHECK STATUS------"
sudo systemctl status mongodb
echo "------START MONGODB------"
sudo systemctl start mongodb
sudo systemctl status mongodb
echo "------ENABLE AUTOSTART MONGODB------"
sudo systemctl enable mongodb
