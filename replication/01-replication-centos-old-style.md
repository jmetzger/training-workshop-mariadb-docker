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
# auf server 
cd /etc
tar cvfz my.cnf.d.tar.gz my.cnf.d 
scp my.cnf.d.tar.gz kurs@192.168.56.104:/tmp

# auf slave ausrollen 
cd /etc
mv my.cnf.d my.cnf.d.bkup
mv /tmp/my.cnf.d.tar.gz . 
tar cvfz my.cnf.d.tar.gz 

# config anpassen 
# /etc/my.cnf.d/server.cnf 
# pr: /etc/my.cnf.d/mariadb-server.cnf
[mysqld]


innodb-buffer-pool-size=3G
innodb-flush-method=O_DIRECT

# Enable slow-query-log
slow-query-log

server_id=2

# only necessary, if you want the slave to
# become master later on
log-bin=mariadb-bin
binlog-format=row
log-slave-updates=1
log-basename=slave1

```

# backup auf master ausspielen und auf slave kopieren

```
mysqldump --all-databases --single-transaction --events --routines --master-data=2 --flush-logs --delete-master-logs > /usr/src/master-dump.sql
```




# server starten 

```


## Ref: 

  * https://mariadb.com/kb/en/setting-up-replication/
