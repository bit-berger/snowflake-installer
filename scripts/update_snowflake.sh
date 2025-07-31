#! /bin/bash
#update the proxy by compiling newer versions
#https://github.com/bit-berger/snowflake-installer

#stop systemd service
sudo systemctl stop snowflake.service

#pull git repo and compile
cd /home/root/
git pull https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake.git
go build -C snowflake/proxy

#replace older version
sudo rm /opt/snowflake/proxy
sudo mv snowflake/proxy/proxy /opt/snowflake
sudo chown snowflake:snowflake /opt/snowflake/proxy
sudo chmod 0106 /opt/snowflake/proxy

#start systemd service
sudo systemctl enable snowflake.service
sudo systemctl start snowflake.service
