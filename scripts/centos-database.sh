#!/bin/bash

# MySQL
yum install -y mysql mysql-devel mariadb-server
systemctl enable mariadb
systemctl start mariadb


mysql -u root -e "SHOW DATABASES";

