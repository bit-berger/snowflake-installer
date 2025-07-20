#! /bin/bash
#updateing the proxy by compiling newer versions
#https://github.com/bit-berger/snowflake-installer

#update system
apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

sudo systemctl stop snowflake.service

cd /home/root/
git pull https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake.git
go build -C snowflake/proxy
sudo rm /opt/proxy
sudo mv snowflake/proxy/proxy /opt

sudo systemctl enable snowflake.service
sudo systemctl start snowflake.service
