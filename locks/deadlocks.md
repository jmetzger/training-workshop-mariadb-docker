# Debug Locks / Deadlocks 

## Prerequisite 

```
2 sessions (connected to same server):
Session 1
Session 2 

sakila database is installed 

```

## Session 1:

```
# Start transaction and lock row by updating it 
mysql>use sakila;
mysql>begin;
mysql>update actor set last_name='Johnsson' where actor_id = 200;

# Attention: not commit yet please, leave transaction open 

```

## Session 2:

```
# Start transactio and try to update same row 
mysql>use sakila;
mysql>begin;
mysql>update actor set last_name='John' where actor_id = 200;

# Now update cannot be done, because of lock from session one 

```

## Session 1: / or new Session 3 

```
# find out who blocks session 2 
mysql>use information_schema;
# find out trx_id of session 2 
mysql>select * from innodb_trx;
# assuming we have trx_id 1468; 
# now we find out what is blocking this transaction
mysql>select * from innodb_locks_wait; 
MariaDB [information_schema]> select * from innodb_lock_waits;
+-------------------+-------------------+-----------------+------------------+
| requesting_trx_id | requested_lock_id | blocking_trx_id | blocking_lock_id |
+-------------------+-------------------+-----------------+------------------+
| 1469              | 1469:66:3:201     | 1468            | 1468:66:3:201    |
+-------------------+-------------------+-----------------+------------------+
1 row in set (0.001 sec)

# either additional infos 
select + from innodb_trx where trx_id = 1468;

# or directly kill this transaction 
show processlist;
kill 1468;

```

## Refs ( 3 important tables )  

  * https://mariadb.com/kb/en/information-schema-innodb_lock_waits-table/ (most important one) 
  * https://mariadb.com/kb/en/information-schema-innodb_locks-table/
  * https://mariadb.com/kb/en/information-schema-innodb_trx-table/
