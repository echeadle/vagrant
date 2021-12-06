#!/bin/bash

# Update CentOS, except kernel, with any patches
yum install -y deltarpm
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
systemctl enable httpd
systemctl start httpd

systemctl stop httpd

rm -rf /var/www/html
ln -s /vagrant /var/www/html

systemctl start httpd

# PHP
yum install -y php-cli php-common php-devel php-mysql

# MySQL
yum install -y mysql mysql-devel mariadb-server
systemctl enable mariadb
systemctl start mariadb


mysql -u root -e "SHOW DATABASES";

# Download Starter content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/echeadle/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/echeadle/vagrant/master/files/info.php

systemctl restart httpd
