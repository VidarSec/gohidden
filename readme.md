# GoHidden
---

## Creating Database
---
Log into MySQL with the following command.
```
mysql
```

First, we'll create a new database.

```
MariaDB [(none)]> CREATE DATABASE mydatabase_db;
```

Next, create a new MySQL user account that we will use to operate on new database, with username "mydatabase_user".

```
MariaDB [(none)]> CREATE USER 'mydatabase_user'@'localhost' IDENTIFIED BY 'password';
```

Link the user and DB together by granting our user access to the database.

```
MariaDB [(none)]> GRANT ALL PRIVILEGES ON mydatabase_db.* to mydatabase_user@'localhost';
```

Flush the privileges so that MySQL knows about the user permissions we just added.

```
MariaDB [(none)]> FLUSH PRIVILEGES;
```

Exit out of the MySQL command prompt by typing.

```
MariaDB [(none)]> exit
```  


## After use with ./gohidden.sh
### nano /etc/nginx/nginx.conf
Remove hash(#) from the following lines:

```
#server_tokens off;
```
```
#server_name_in_redirect_off;
```

Change 
```
#server_names_hash_bucket_size to "128"
```

ctrl+x to save and exit

### nano /etc/nginx/sites-available/default
Change 
```
listen 80 default_server;``` to ```listen 80;
```

Change 
```
listen [::]:80 default_server;
``` 
to 
```
listen [::]:80;
```

Paste your .onion link in the following line:

```
server_name your.onion.link;
```

ctrl+x to save and exit

### cd /etc/nginx/sites-enabled
```
nginx -t
```

```
service nginx start
```

```
service nginx status
```
