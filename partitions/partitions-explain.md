# Partitions - Explain 

## Walkthrough (Version 1) - RANGE 

```
-- EXPLAIN PARTITIONS

DROP TABLE IF EXISTS audit_log;
CREATE TABLE audit_log (
  yr    YEAR NOT NULL,
  msg   VARCHAR(100) NOT NULL)
ENGINE=InnoDB
PARTITION BY RANGE (yr) (
  PARTITION p0 VALUES LESS THAN (2010),
  PARTITION p1 VALUES LESS THAN (2011),
  PARTITION p2 VALUES LESS THAN (2012),
  PARTITION pmax VALUES LESS THAN MAXVALUE);
INSERT INTO audit_log(yr,msg) VALUES (2005,'2005'),(2006,'2006'),(2011,'2011'),(2020,'2020');
EXPLAIN PARTITIONS SELECT * from audit_log WHERE yr in (2011,2012)\G
```

## Walkthrough (Version 1) - RANGE - testing DATA DIR 

```
ALTER TABLE audit_log REORGANIZE PARTITION p0,p1,p2,p3 INTO (
PARTITION p0 VALUES LESS THAN (2010) DATA DIRECTORY = '/home/kurs/mysql/', 
PARTITION p1 VALUES LESS THAN (2011) DATA DIRECTORY = '/home/kurs/mysql/', 
PARTITION p2 VALUES LESS THAN (2012) DATA DIRECTORY = '/home/kurs/mysql/',
PARTITION p3 VALUES LESS THAN MAXVALUE DATA DIRECTORY = '/home/kurs/mysql/'

);

Query OK, 4 rows affected, 4 warnings (0,021 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [sakila]> show warnings;
+---------+------+------------------------------------------------------+
| Level   | Code | Message                                              |
+---------+------+------------------------------------------------------+
| Warning | 1982 | <DATA DIRECTORY> option ignored for InnoDB partition |
| Warning | 1982 | <DATA DIRECTORY> option ignored for InnoDB partition |
| Warning | 1982 | <DATA DIRECTORY> option ignored for InnoDB partition |
| Warning | 1982 | <DATA DIRECTORY> option ignored for InnoDB partition |
+---------+------+------------------------------------------------------+
4 rows in set (0,000 sec)

https://jira.mariadb.org/browse/MDEV-16594
https://github.com/MariaDB/server/commit/031c695b8c865e5eb6c4c09ced404ae08f98430f
```

## Adding new partition with other DATA DIRECTORY 

```
# Step 1: Create table with partitions 
DROP TABLE IF EXISTS audit_log;
CREATE TABLE audit_log (
  yr    YEAR NOT NULL,
  msg   VARCHAR(100) NOT NULL)
ENGINE=InnoDB
PARTITION BY RANGE (yr) (
  PARTITION p0 VALUES LESS THAN (2010),
  PARTITION p1 VALUES LESS THAN (2011),
  PARTITION p2 VALUES LESS THAN (2012),
  PARTITION pmax VALUES LESS THAN MAXVALUE);

# Step 2: Delete pmax, add new year, and add pmax again 
ALTER TABLE audit_log DROP PARTITION  pmax;
ALTER TABLE audit_log ADD PARTITION (PARTITION p2026 VALUES LESS than (2027) DATA DIRECTORY='/tmp');
ALTER TABLE audit_log ADD PARTITION (PARTITION pmax VALUES LESS than maxvalue DATA DIRECTORY='/tmp');

# In filesystem. these are symbolic links in datadir.
ls -la /var/lib/mysql/sakila/audit_log* 
# files with .isl suffix 

```

```
# Reorganize for new diretories does not work but you might want to 
change it with vi 

systemctl stop mariadb
cd /var/lib/mysql/sakila 
vi audit_log#P#pmax.isl
/tmp/foo/sakila/audit_log#P#pmax.ibd
systemctl start mariadb
```




## Partitions sliced by hash of field 

```
CREATE TABLE employees (
    id INT NOT NULL,
    fname VARCHAR(30),
    lname VARCHAR(30),
    hired DATE NOT NULL DEFAULT '1970-01-01',
    separated DATE NOT NULL DEFAULT '9999-12-31',
    job_code INT,
    store_id INT
)
PARTITION BY HASH(store_id)
PARTITIONS 4;
```

## Partitioning by datetime 

```
CREATE TABLE tbl (
        dt DATETIME NOT NULL,  -- or DATE
        ...
        PRIMARY KEY (..., dt),
        UNIQUE KEY (..., dt),
        ...
    )
    PARTITION BY RANGE (TO_DAYS(dt)) (
        PARTITION start        VALUES LESS THAN (0),
        PARTITION from20120315 VALUES LESS THAN (TO_DAYS('2012-03-16')),
        PARTITION from20120316 VALUES LESS THAN (TO_DAYS('2012-03-17')),
        ...
        PARTITION from20120414 VALUES LESS THAN (TO_DAYS('2012-04-15')),
        PARTITION from20120415 VALUES LESS THAN (TO_DAYS('2012-04-16')),
        PARTITION future       VALUES LESS THAN MAXVALUE
);

```
