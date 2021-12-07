#!/bin/bash

# Apache
yum install -y httpd httpd-devel httpd-tools
systemctl start httpd
systemctl enable httpd

systemctl stop httpd

rm -rf /var/www/html
ln -s /vagrant /var/www/html

systemctl start httpd

# PHP
yum install -y php php-cli php-common php-devel php-mysql


# Download Starter content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/echeadle/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/echeadle/vagrant/master/files/info.php

systemctl restart httpd
