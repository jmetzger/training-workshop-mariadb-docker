# Upgrade MariaDB 10.4 -> 10.5 (Centos) 

```
# Step 0;
# Sicherung anlegen (mysqldump / mariabackup) 

# Step 1:
# Change version in 
# or where you have your repo definition
# Change 10.4 -> 10.5 
/etc/yum.repos./MariaDB.repo 

# Step 2:
systemctl stop mariadb 

# Step 3
sudo yum remove MariaDB-server

# Step 4
sudo yum install MariaDB-server 

# Step 5:
systemctl start mariadb 
mysql_upgrade 

```


# Reference 

  * https://mariadb.com/kb/en/upgrading-from-mariadb-104-to-mariadb-105/
