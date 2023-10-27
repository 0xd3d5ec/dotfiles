#!/bin/bash

#Please note that you need to replace placeholders like <passwordhere>, <databasename>, <user>, <password>, and <username> with your actual values. 
Also, make sure to execute this script with the appropriate permissions.

# Step one: Installing the database package
sudo pacman -Sy postgresql

# Step two: Reconnaissance & Testing
# Start metasploit
msfconsole

# Check database status
db_status

# Step three: Configuring and creating the database, user with a password
# Switch to the postgres user
su postgres

# Change to the home directory
cd

# Set a password for the postgres user (replace '<passwordhere>' with your desired password)
psql -c "alter user postgres with password '<passwordhere>'"

# Log in to the PostgreSQL prompt
psql

# List all databases
\l

# Create a database (replace '<databasename>' with your desired database name)
CREATE DATABASE <databasename>;

# List databases again to ensure it was created
\l

# Create a user and grant privileges (replace '<user>', '<password>', and '<databasename>' as needed)
CREATE USER <user> WITH ENCRYPTED PASSWORD '<password>';
GRANT ALL PRIVILEGES ON DATABASE <databasename> to <user>;

# Exit the PostgreSQL prompt
\q

# Exit the postgres user and return to root
exit
su root

# Navigate to the .ms4 directory
cd ~
mkdir .ms4
cd .ms4

# Create a config file for the database
vim .database.yml

# In .database.yml file, put the following:
cat <<EOL > .database.yml
[
  production:
    adapter: postgresql
    database: <databasename>
    username: <username>
    password: <password>
    host: <currenthostname>
    port: 5432
    pool: 5
    timeout: 5
]
EOL

# Step four: Connecting to the database in msf
# Start msfconsole again
msfconsole

# Connect to the database using the previously created database, user, and password
db_connect <username@database>

# Check the database connection
db_status






