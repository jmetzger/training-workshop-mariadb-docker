# Galera Installation and Configuration 

## Setting up 1st - node

```
# Schritt 1: Create config 

/etc/my.cnf.d/z_galera.cnf 
[mysqld]
binlog_format=ROW
default-storage-engine=innodb
innodb_autoinc_lock_mode=2
bind-address=0.0.0.0
# Set to 1 sec instead of per transaction
# for better performance // Attention: You might loose data on power
innodb_flush_log_at_trx_commit=0
# Galera Provider Configuration
wsrep_on=ON
# centos7 (x86_64)
wsrep_provider=/usr/lib64/galera-4/libgalera_smm.so
# Galera Cluster Configuration
wsrep_cluster_name="test_cluster"
wsrep_cluster_address="gcomm://192.168.56.103,192.168.56.104,192.168.56.105"
# Galera Synchronization Configuration
wsrep_sst_method=rsync
```
