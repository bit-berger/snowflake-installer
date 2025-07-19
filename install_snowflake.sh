#! /bin/bash
# compile/install the snowflake proxy

# update system
apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# required tools for compiling
sudo apt install git -y
sudo apt install golang -y

# clone git repo and compile
git clone https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake.git
go build -C snowflake/proxy
sudo mv snowflake/proxy/proxy /opt/

# autostart with systemd and seperate user
wget https://raw.github.com/bit-berger/snowflake-installer/systemd/systemd.service
mv snowflake.service /etc/systemd/system
sudo useradd snowflake
sudo systemctl enable snowflake.service
sudo systemctl start snowflake.service
