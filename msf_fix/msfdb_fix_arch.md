Step one: [Installing database package]
sudo pacman -Sy postgresql

Step two: [Reconissance & Testing]
test db connection after starting msf using "msfconsole" command.
msfconsole
use "db_status" command to check database connectivity.
db_status
	if works great done
	if not then proceed with the next steps.

Step three: [Configuring and creating database, user with password]
	after installing postgresql, you will have another user on the system with name postgres, su into that and do the following(make sure you check the journalctl for errors, this will help tremendously when troubleshooting errors that might occur.
	"cd ~"
	"psql -c "alter user postgres with password '<passwordhere>'"
	should see "ALTER ROLE" returned
	"psql"
	"\l" to list all databases.
	"CREATE DATABASE <databasename>;"  // comment: all in the small
	"\l" to make sure database was created.
	"CREATE USER <user> WITH ENCRYPTED PASSWORD '<password>';"
	"GRANT ALL PRIVILEGES ON DATABASE <databasename> to <user>;"
	"exit"
	"su root"
	"cd ~"
	"mkdir .ms4"
	"cd .ms4"
	"ls"
	"vim .database.yml"
	In .database.yml file:
	[
	production:
		adapter: postgresql
		database: <database>
		username: <username>
		password: <password>
		host: <currenthostname>
		port: default is 5432, can be changed
		pool: 5
		timeout: 5
	]

Step four: [Connecting to database in msf]
	After starting msfconsole, you type db_status, still you will find no connection has been initated.
	"db_connect" should be typed to start connection using the previously created database, user, and password.
	command: "db_connect <username@database>"
	"db_status" to check database connection.

