# Upgrade MariaDB 10.4 -> 10.5 (Centos) 

```
# Step 0;
# Sicherung anlegen (mysqldump / mariabackup) 

# Step 1:
# Change version in 
# or where you have your repo definition
# Change 10.4 -> 10.5 
/etc/apt/sources.list
# Step 2:
systemctl stop mariadb 

# Step 3
sudo apt remove MariaDB-server

# Step 4
sudo apt install MariaDB-server 
apt list installed | grep MariaDB # sind alle Versionen gleich ! Wichtig ! 

# Step 4.5 
# Check if old config files were saved as .rpmsave after delete of package 10.4 
cd /etc/mysql/mariadb.conf.d/
ls -la 50-server.cnf*
# e.g. 


# Step 5:
systemctl start mariadb 
systemctl enable mariadb
mysql_upgrade # After that mysql_upgrade_info will be present in /var/lib/mysql with version-info 
```

# Reference 

  * https://mariadb.com/kb/en/upgrading-from-mariadb-10-6-to-mariadb-10-11/
