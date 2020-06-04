#!/usr/bin/env bash

echo "Start provision"

# hide dpkg-preconfigure error output
sudo rm /etc/apt/apt.conf.d/70debconf > /dev/null 2>&1

echo "Running apt-get update"
sudo apt-get update > /dev/null

if [[ ! $(command -v apache2) ]]; then
    echo "Installing apache2"
    sudo apt-get install -y apache2 > /dev/null
else
    echo "apache2 already installed"
fi

if [[ ! $(command -v mysql) ]]; then
    echo "Installing mysql"
    sudo apt-get install -y mysql-server > /dev/null
else
    echo "mysql already installed"
fi

if [[ ! $(command -v php) ]]; then
    echo "Installing php"
    sudo add-apt-repository -y ppa:ondrej/php > /dev/null
    sudo apt-get update > /dev/null
    sudo apt-get install -y php7.4 > /dev/null
else
    echo "php already installed"
fi

echo "End provision"
