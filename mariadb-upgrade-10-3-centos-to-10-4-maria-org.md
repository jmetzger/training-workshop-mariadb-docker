# Upgrade 10.3 to 10.4 (Centos/Redhat/Rocky) 

## Prerequisites

```
Ubuntu 20.04 
MariaDB-Server from Distri

Install new 10.4 from Mariadb.org 

```
## Prepare 

  * Create backup of system (with mariabackup and/or mysqldump) 

## Steps 

```
# 1. systemctl stop mariadb 
# 2. dnf remove mariadb-* 
# 3. Doublecheck if components left: apt list --installed | grep mariadb
# 4. Setup repo for mariadb
# 5. dnf install MariaDB-server 

# 7. systemctl enable --now mariadb # enable for next reboot and start immediately 
# necessary for redhat 

# 8. Perform mysql_upgrade 
# On centos/redhat mysql_upgrade need to be done
mysql_upgrade 

# 9. Check if it was succesfull 
cat /var/lib/mysql_upgrade_info 

```

## Important - Check mysql - configuration structure

```
# Which directories are loaded in 
/etc/mysql/my.cnf 

# Eventually move files to the right directory
# As needed in migration from 10.3 (Distri) to 10.4 (mariadb.org) on Ubuntu 20.04

```

## Documentation 

  * https://mariadb.com/kb/en/upgrading-from-mariadb-103-to-mariadb-104/
  * https://mariadb.com/kb/en/mysql_upgrade/
