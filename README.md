# Snowflake-Installer
A script to install a snowflake proxy

## About
What the script does:
- Build the standalone snowflake proxy from source
- Create a systemd service unit
- Automaticly update the proxy via systemd and a script (currently not working)

## Requirements
- Debian based Linux server with root access

## How to use
Become sudo user
```
sudo su
```

Make sure wget is installed
```
sudo apt install wget -y
```

Get the install script
```
wget https://raw.githubusercontent.com/bit-berger/snowflake-installer/refs/heads/main/scripts/install_snowflake.sh
```

Execute the install script
```
bash install_snowflake.sh
```

Done! Check if it's working
```
sudo systemctl status snowflake.service
```

## Control the proxy
Temporarily start/stop the service
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
sudo bash /opt/update_snowflake.sh
```

## Links
- Snowflake: https://snowflake.torproject.org/
- TOR-Project: https://www.torproject.org/
- TOR-Project on Wikipedia: https://en.wikipedia.org/wiki/Tor_(network)
