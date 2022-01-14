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

## Setup replication user on mastr 

```
CREATE USER 'replication_user'@'%' IDENTIFIED BY 'bigs3cret';
GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'%';

```


## Ref: 

  * https://mariadb.com/kb/en/setting-up-replication/
