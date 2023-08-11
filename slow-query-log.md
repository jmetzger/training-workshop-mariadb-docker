# Slow Query Log 

## Walkthrough (docker compose) 

```
# Copyright VMware, Inc.
# SPDX-License-Identifier: APACHE-2.0

version: '2.1'

services:
  mariadb:
    image: docker.io/bitnami/mariadb:10.6
    ports:
      - '3306:3306'
    volumes:
      - 'mariadb_data:/bitnami/mariadb'
    environment:
      # ALLOW_EMPTY_PASSWORD is recommended only for development.
      #- ALLOW_EMPTY_PASSWORD=yes
      - MARIADB_ROOT_PASSWORD=<my-pass>
      - MARIADB_EXTRA_FLAGS=--log-bin --innodb-buffer-pool-size=256M --slow-query-log --slow-query-log-file=slow.log
    healthcheck:
      test: ['CMD', '/opt/bitnami/scripts/mariadb/healthcheck.sh']
      interval: 15s
      timeout: 5s
      retries: 6

volumes:
  mariadb_data:
    driver: local

```

```
docker compose down
docker compose up -d 
```


## Walkthrough (Classic)

```
# Step 1
# /etc/my.cnf.d/mariadb-server.cnf 
# or: debian /etc/mysql/mariadb.conf.d/50-server.cnf 
[mysqld]
slow-query-log 

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

## Show queries that do not use indexes 

```
SET GLOBAL log_queries_not_using_indexes=ON;
```

## Geschwätzigkeit (Verbosity) erhöhen 

```
SET GLOBAL log_slow_verbosity='query_plan,explain'
```

## Queries die keine Indizes verwenden 

```
SET GLOBAL log_queries_not_using_indexes=ON;
```


## Reference 

  * https://mariadb.com/kb/en/slow-query-log-overview/

