# Setting up new slave with master-slave replication 

## Step 0.5a: Installation on ubuntu/debian 

```
apt update
apt install mariadb-backup 
# check if available
mariabackup --version 

# prepare for mariabackup if you use it with root and with unix_socket 
/root/.my.cnf 
[mariabackup]
user=root
```

## Step 1: mariabackup on master 

```
mkdir /backups 
# target-dir needs to be empty or not present 
mariabackup --target-dir=/backups/2023032301 --backup 
# apply ib_logfile0 to tablespaces 
mariabackup --target-dir=/backups/2023032301 --prepare 
```

## Step 2: Transfer to new slave (from master) 

```
# root@master:
rsync -e ssh -avP /backups/2023032301 kurs@192.168.56.103:/home/kurs/
```

## Step 3: Setup replication user on master 

```
# as root@master 
#mysql>
CREATE USER repl@'192.168.56.%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.*  TO 'repl'@'192.168.56.%';
```

## Step 3a (Optional): Test repl user (connect) from slave 

```
# as root@slave 
# you be able to connect to 
mysql -urepl -p -h10.10.9.110
# test if grants are o.k. 
show grants 
```

## Step 4a: Set server-id on master -> 1 

```
[mysqld]
server-id=1
log-bin 
# just in case, falls master irgendwann mal slave werden soll
# unwahrscheinlich, aber dann ist das sauber 
log-slave-updates 
# mariadb empfiehlt auch mix als möglichkeit (default) 
log-format=ROW

systemctl restart mariadb 
## 
```

## Step 4b: Set server-id on slave -> 3 + same config as server 1 + log_slave_update

```
[mysqld]
server-id              = 3
# activate master bin log, if this slave might be a master later 
log_bin                = /var/log/mysql/mysql-bin.log
binlog_format = ROW
log_slave_update = 1 

systemctl restart mariadb 
## auf dem master config mit rsync rüberschrieben 
## root@master 
rsync -e ssh -avP /etc/mysql/mariadb.conf.d/z_uniruhr.cnf kurs@10.10.9.144:/home/kurs/
```

## Step 5: Restore Data on slave 

```
systemctl stop mariadb 
mv /var/lib/mysql /var/lib/mysql.bkup
mariabackup --target-dir=/home/student/20210121 --copy-back 
chown -R mysql:mysql /var/lib/mysql 
systemctl start mariadb
```

## Step 6: master.txt for change command 

```
# root@slave
$ cat xtrabackup_binlog_info
mariadb-bin.000096 568 0-1-2


# /root/master.txt 
# get information from master-databases.sql dump 
CHANGE MASTER TO 
   MASTER_HOST="10.10.9.110", 
   MASTER_PORT=3306, 
   MASTER_USER="repl",  
   MASTER_PASSWORD="password", 


mysql < master.txt 
# or: copy paste into mysql> 

# mysql>
start slave

# in mysql -> show slave status 
mysql>show slave status 
# Looking for
Slave_IO_Running: Yes
Slave_SQL_Running: Yes

```



## Walkthrough 

https://mariadb.com/kb/en/setting-up-a-replication-slave-with-mariabackup/
