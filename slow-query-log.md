# Slow Query Log 

```
# Step 1
/etc/my.cnf.d/server.cnf 
[mysqld]
slow_query_log 

# Step 2
mysql>SET GLOBAL slow_query_log = 1 
mysql>SET slow_query_log = 1 
mysql>SET GLOBAL long_query_time = 0.000001 
mysql>SET long_query_time = 0.000001

# Step 3
# run some time / data
# and look into your slow-query-log 
/var/lib/mysql/hostname-slow.log 

```

## Reference 

  * https://mariadb.com/kb/en/slow-query-log-overview/

