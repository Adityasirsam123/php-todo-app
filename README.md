# Todo-list-with-php
A simple todo list with bootstrap and raw php

# ✅ Todo-list-with-php

A simple todo list built using Bootstrap and raw PHP.

---

## 🚀 How to Run

1. Create a MySQL database and name it **`todo`**.
2. Import the `todo.sql` file into the `todo` database.
3. Open `index.php` in your browser.
4. Make sure your system is connected to the internet as this project uses **Bootstrap CDN** for styling. Without internet access, the design may not render properly.

---

## ✅ 1. Install Apache, MySQL, PHP

Use the following commands to install Apache, MySQL, PHP, and required modules:

```bash
sudo apt update
sudo apt install apache2 mysql-server php libapache2-mod-php php-mysql unzip -y

✅ 2. Setup MySQL DB on db-server
Step-by-step:
# Update and install MySQL
sudo apt update && sudo apt install mysql-server

# Secure the MySQL installation
sudo mysql_secure_installation

# Allow remote access by modifying the bind-address
sudo sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL to apply changes
sudo systemctl restart mysql

Check the Bind Address
Open the MySQL config file:
sudo nano /etc/mysql/my.cnf
Or (based on your system):
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

Change it to one of the following depending on your needs:

127.0.0.1 — only local connections allowed.

0.0.0.0 — allows connections from any IP address.

<specific IP> — allows connections only from that IP address.

✅ 3. Install Docker & Docker Compose
Install Docker and Docker Compose with the commands below:
# Install Docker
sudo apt-get install docker.io -y

# Add current user to Docker group
sudo usermod -aG docker ubuntu && newgrp docker

# Install Docker Compose
sudo apt-get install docker-compose -y


##some screenshoots
![](https://raw.githubusercontent.com/crrakib5/Todo-list-with-php/master/screenshoots/Screenshot%20(303).png)
![](https://raw.githubusercontent.com/crrakib5/Todo-list-with-php/master/screenshoots/Screenshot%20(304).png)
![](https://raw.githubusercontent.com/crrakib5/Todo-list-with-php/master/screenshoots/Screenshot%20(305).png)
![](https://raw.githubusercontent.com/crrakib5/Todo-list-with-php/master/screenshoots/Screenshot%20(306).png)
![](https://raw.githubusercontent.com/crrakib5/Todo-list-with-php/master/screenshoots/Screenshot%20(307).png)
