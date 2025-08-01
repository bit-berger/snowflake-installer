# Snowflake-Installer
A script to install a snowflake proxy

## About
What the script does:
- Build the standalone snowflake proxy from source
- Create a systemd service unit
- Automaticly update the proxy vith systemd timer and a script
- For better privacy, the proxy uses the STUN server from adminforge.de instead of Google and BlackBerry.

## Requirements
- Debian based Linux with root access

## How to use
Become sudo user
```
sudo su
```

Install wget
```
sudo apt install wget -y
```

Get the install script
```
wget https://raw.githubusercontent.com/bit-berger/snowflake-installer/refs/heads/main/scripts/snowflake_install.sh
```

Execute the install script
```
bash install_snowflake.sh
```

Check if the proxy is working
```
sudo systemctl status snowflake.service
```

## Control the proxy
Temporarily start/stop the proxy
```
sudo systemctl start snowflake.service
sudo systemctl stop snowflake.service
```

Enable/Disable the proxy
```
sudo systemctl enable snowflake.service
sudo systemctl disable snowflake.service
```

Manual update
```
sudo bash /opt/snowflake/snowflake_update.sh
```

View the log-file
```
cat /var/snowflake/snowflake.log
```

## Links
- STUN-Server: https://adminforge.de/services/stun-server/
- Snowflake: https://snowflake.torproject.org/
- TOR-Project: https://www.torproject.org/
- TOR-Project on Wikipedia: https://en.wikipedia.org/wiki/Tor_(network)
