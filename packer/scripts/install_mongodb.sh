#!/bin/bash

sleep 20
apt update
apt install mongodb -y
systemctl start mongodb
systemctl enable mongodb
