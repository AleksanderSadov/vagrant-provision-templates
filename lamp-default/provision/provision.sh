#!/usr/bin/env bash

echo "start provision"

# hide dpkg-preconfigure error output
sudo rm /etc/apt/apt.conf.d/70debconf > /dev/null 2>&1

echo "running apt-get update"
sudo apt-get update > /dev/null

if [[ ! $(command -v apache2) ]]; then
    echo "installing apache2"
    sudo apt-get install -y apache2 > /dev/null
else
    echo "apache2 already installed"
fi

if [[ ! $(command -v mysql) ]]; then
    echo "installing mysql"
    sudo apt-get install -y mysql-server > /dev/null
else
    echo "mysql already installed"
fi

if [[ ! $(command -v php) ]]; then
    echo "installing php"
    sudo add-apt-repository -y ppa:ondrej/php > /dev/null
    sudo apt-get update > /dev/null
    sudo apt-get install -y php7.4 > /dev/null
else
    echo "php already installed"
fi

if [[ ! $(command -v composer) ]]; then
    echo "installing composer"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" > /dev/null
    php composer-setup.php > /dev/null
    sudo mv composer.phar /usr/local/bin/composer > /dev/null
    php -r "unlink('composer-setup.php');" > /dev/null
else
    echo "composer already installed"
fi

if [[ ! -d "/opt/phpmyadmin/" ]]; then
    echo "installing phpmyadmin"
    sudo apt-get install -y php7.4-mysql php7.4-xml php7.4-curl php7.4-zip php7.4-mbstring > /dev/null
    composer -q create-project phpmyadmin/phpmyadmin > /dev/null 2>&1
    sudo mv phpmyadmin /opt/phpmyadmin > /dev/null
    sudo mkdir /opt/phpmyadmin/tmp
    sudo chmod 777 /opt/phpmyadmin/tmp
    sudo cp /opt/phpmyadmin/config.sample.inc.php /opt/phpmyadmin/config.inc.php
    sudo sed -i -e "s|cfg\['blowfish_secret'\] = ''|cfg['blowfish_secret'] = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'|" /opt/phpmyadmin/config.inc.php
    sudo cp /vagrant/provision/apache/hosts/phpmyadmin.local.conf /etc/apache2/sites-available/ > /dev/null
    sudo a2ensite phpmyadmin.local.conf > /dev/null
    sudo systemctl reload apache2 > /dev/null
else
    echo "phpmyadmin already installed"
fi

if [[ ! -f "/etc/apache2/sites-available/example.local.conf" ]]; then
    echo "configuring virtual hosts"
    sudo cp /vagrant/provision/apache/hosts/example.local.conf /etc/apache2/sites-available > /dev/null
    sudo a2ensite example.local.conf > /dev/null
    sudo systemctl reload apache2 > /dev/null
else
    echo "virtual hosts already configured"
fi

if [[ ! -d "/var/lib/mysql/example" ]]; then
    echo "importing database"
    sudo mysql < /vagrant/provision/mysql/dumps/mysqlsampledatabase.sql
    sudo mysql < /vagrant/provision/mysql/setup/example-setup.sql
else
    echo "database already imported"
fi

echo "End provision"
