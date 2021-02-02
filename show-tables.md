# Show Tables 

## show all tables in database 

```
# connect with db training 
mysql training
mysql> show tables;
|training|
```

## describe 

MariaDB [training]> describe mitarbeiter;
+---------+---------------------+------+-----+---------+-------+
| Field   | Type                | Null | Key | Default | Extra |
+---------+---------------------+------+-----+---------+-------+
| id      | tinyint(3) unsigned | NO   | PRI | NULL    |       |
| name    | varchar(50)         | YES  |     | NULL    |       |
| vorname | varchar(30)         | YES  |     | NULL    |       |
+---------+---------------------+------+-----+---------+-------+
3 rows in set (0.001 sec)

## show create 

```
MariaDB [training]> show create table mitarbeiter;
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table       | Create Table                                                                                                                                                                                            |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| mitarbeiter | CREATE TABLE `mitarbeiter` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `vorname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.000 sec)

