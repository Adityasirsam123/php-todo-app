🐬 MySQL Database Setup for todo_user
This guide walks you through the steps to:

Create a new MySQL database

Create a user and grant privileges

Connect to the database using the newly created user

🛠 Prerequisites
MySQL server installed and running

Root access to the MySQL server

Terminal or command-line access

⚙️ Step 1: Log in to MySQL as Root

mysql -u root -p
You will be prompted to enter the MySQL root password.

📂 Step 2: Create the Database todo

CREATE DATABASE todo;


👤 Step 3: Create a New User and Grant Privileges


CREATE USER 'todo_user'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON todo_user.* TO 'todo_user'@'%';
FLUSH PRIVILEGES;
Explanation:

'%' allows the user to connect from any host (can be restricted to specific IPs for better security).

'admin' is the password for the todo_user.

🚪 Step 4: Exit the MySQL Shell


EXIT;


🔗 Step 5: Connect to MySQL as todo_user
If the database is on the same machine:

mysql -u todo_user -p -h localhost todo_user
If the database is on a remote server:


mysql -u todo_user -p -h <DB_SERVER_IP> todo_user
Replace <DB_SERVER_IP> with your actual MySQL server’s IP address or hostname.

✅ Verification
After connecting, you can run:


SHOW TABLES;
This confirms you have access to the todo_user database.

🔐 Notes
Avoid using weak passwords like 'admin' in production.

Consider restricting the host value ('%') for better security.

Ensure port 3306 is open if you're connecting remotely and the server allows external MySQL access