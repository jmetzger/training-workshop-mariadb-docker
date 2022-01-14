# Replication Centos old-style 

## Configure master 

```
# /etc/my.cnf.d/server.cnf 
# /etc/my.cnf.d/mariadb-server.cnf 
[mysqld]
log-bin=mariadb-bin 
server_id=1
log-basename=master1
binlog-format=row

systemctl restart mariadb

```

## Setup replication user on master 

```
CREATE USER 'replication_user'@'%' IDENTIFIED BY 'bigs3cret';
GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'%';

```

## Slave aufsetzen 

```
## Wichtig: möglichst gleiche Version 

# repo einrichten von mariadb 

# /etc/yum.repos.d/mariadb.repo 
# MariaDB 10.4 CentOS repository list - created 2022-01-14 08:34 UTC
# https://mariadb.org/download/
[mariadb]
name = MariaDB
baseurl = https://mirror.kumi.systems/mariadb/yum/10.4/centos8-amd64
module_hotfixes=1
gpgkey=https://mirror.kumi.systems/mariadb/yum/RPM-GPG-KEY-MariaDB
gpgcheck=1
# MariaDB 10.4 CentOS repository list - created 2022-01-14 08:34 UTC
# https://mariadb.org/download/
[mariadb]
name = MariaDB
baseurl = https://mirror.kumi.systems/mariadb/yum/10.4/centos8-amd64
module_hotfixes=1
gpgkey=https://mirror.kumi.systems/mariadb/yum/RPM-GPG-KEY-MariaDB
gpgcheck=1

# MariaDB - Server installieren 
dnf install -y MariaDB-server 



# server - config von master rüberspielen 

```

# server starten 

```


## Ref: 

  * https://mariadb.com/kb/en/setting-up-replication/
