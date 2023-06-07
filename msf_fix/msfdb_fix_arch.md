# MSFconsole Database fix for Arch Linux

## Step one: [Installing database package]
Install necessary package using pacman
<pre><code>sudo pacman -Sy postgresql</code></pre>

## Step two: [Reconissance & Testing]
Start metasploit using the command below
<pre><code>msfconsole</code></pre>

After starting msfconsole, check database status. If it woks great if not then proceed with the next steps.
<pre><code>db_status</code></pre>

## Step three: [Configuring and creating database, user with password]
After installing postgresql, you will have another user on the system with name postgres, su into that and do the following, you can check jounalctl for any errors.

<pre><code>su postgres</code></pre>

<pre><code>cd</code></pre>

<pre><code>psql -c "alter user postgres with password '<passwordhere>'</code></pre>

should see "ALTER ROLE" returned

<pre><code>psql</code></pre>

<pre><code>\l</code></pre> 
to list all databases.

<pre><code>CREATE DATABASE <databasename>;</code></pre>  

<pre><code>\l"</code></pre>
to make sure database was created.

<pre><code>CREATE USER <user> WITH ENCRYPTED PASSWORD '<password>';</code></pre>


<pre><code>GRANT ALL PRIVILEGES ON DATABASE <databasename> to <user>;</code></pre>

<pre><code>exit
su root
"cd ~"
"mkdir .ms4"
"cd .ms4"
"ls"
</code></pre>

Create config file for database
<pre><code>"vim .database.yml"</code></pre>

In .database.yml file, put the following:
<pre><code>	[
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
</code></pre>

## Step four: [Connecting to database in msf]
After starting msfconsole, you type <code>db_status</code>, still you will find no connection has been initated.
<pre><code>db_connect</code></pre> 
should be typed to start connection using the previously <strong>created database, user, and password</strong>.
<pre><code>db_connect <username@database></code></pre>
<pre><code>db_status</code></pre>
to check database connection.

