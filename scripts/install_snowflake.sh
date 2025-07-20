#! /bin/bash
# compile/install the snowflake proxy

# update system
apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# required tools for compiling
sudo apt install wget -y
sudo apt install git -y
sudo apt install golang -y

# clone git repo and compile
git clone https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake.git
go build -C snowflake/proxy
sudo mv snowflake/proxy/proxy /opt

# autostart with systemd and seperate user
wget https://raw.githubusercontent.com/bit-berger/snowflake-installer/refs/heads/main/systemd/snowflake.service
mv snowflake.service /etc/systemd/system
sudo useradd snowflake
sudo systemctl enable snowflake.service
sudo systemctl start snowflake.service

# update
wget https://raw.githubusercontent.com/bit-berger/snowflake-installer/refs/heads/main/scripts/update_snowflake.sh
mv update_snowflake.sh /opt
sudo chmod +x /opt/update_snowflake.sh
