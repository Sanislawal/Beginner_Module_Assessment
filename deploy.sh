#!/bin/bash

# Update package repositories
sudo apt update

# Install Apache web server
sudo apt install -y apache2

# Install MySQL server and set root password
sudo apt install -y mysql-server
# Secure MySQL installation
sudo mysql_secure_installation

# Install PHP and required modules
sudo apt install -y php libapache2-mod-php php-mysql

# Enable Apache modules
sudo a2enmod rewrite
sudo systemctl restart apache2

# Clone Laravel project from GitHub
sudo apt install -y git
sudo git clone https://github.com/laravel/laravel.git /var/www/html/laravel

# Adjust permissions
sudo chown -R www-data:www-data /var/www/html/laravel
sudo chmod -R 755 /var/www/html/laravel

# Restart Apache for changes to take effect
sudo systemctl restart apache2
