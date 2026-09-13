#!/bin/bash
# Deployment Task 3 - Pass Level
# Commands run on the EC2 instance to install LAMP and deploy WordPress

sudo apt update
sudo apt install -y apache2 mysql-server php php-mysql libapache2-mod-php

cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
sudo cp -r wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html
sudo rm /var/www/html/index.html

sudo mysql -e "CREATE DATABASE wordpress_db; CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'yourpassword'; GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wpuser'@'localhost'; FLUSH PRIVILEGES;"

sudo systemctl restart apache2
