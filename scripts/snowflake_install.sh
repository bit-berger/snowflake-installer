#! /bin/bash
#compile/install the snowflake proxy
#https://github.com/bit-berger/snowflake-installer

#update system
apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

#required tools for install
sudo apt install wget git golang -y

#create directorys
mkdir /opt/snowflake
mkdir /var/snowflake

#create user and log file
sudo useradd snowflake --user-group --no-create-home
touch /var/snowflake/snowflake.log
sudo chown snowflake:snowflake /var/snowflake/snowflake.log
sudo chmod 0606 /var/snowflake/snowflake.log

#clone git repo and compile
git clone https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake.git
go build -C snowflake/proxy

#copy proxy and modify
sudo mv snowflake/proxy/proxy /opt/snowflake/
sudo chown snowflake:snowflake /opt/snowflake/proxy
sudo chmod 0106 /opt/snowflake/proxy

#autostart with systemd
wget https://raw.githubusercontent.com/bit-berger/snowflake-installer/refs/heads/main/systemd/snowflake.service
mv snowflake.service /etc/systemd/system
sudo systemctl enable snowflake.service
sudo systemctl start snowflake.service

#update script
wget https://raw.githubusercontent.com/bit-berger/snowflake-installer/refs/heads/main/scripts/snowflake_update.sh
wget https://raw.githubusercontent.com/bit-berger/snowflake-installer/refs/heads/main/systemd/snowflake_update.service
wget https://raw.githubusercontent.com/bit-berger/snowflake-installer/refs/heads/main/systemd/snowflake_update.timer
mv snowflake_update.sh /opt/snowflake/
sudo chmod +x /opt/snowflake/snowflake_update.sh
mv snowflake_update.service /etc/systemd/system/
mv snowflake_update.timer /etc/systemd/system/
sudo systemctl enable snowflake_update.timer
sudo systemctl start snowflake_update.timer
