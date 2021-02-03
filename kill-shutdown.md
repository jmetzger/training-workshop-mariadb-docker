# kill user thread and shutdown 

```
MariaDB [mysql]> show processlist;
+----+----------+-----------+----------+---------+------+----------+------------------+----------+
| Id | User     | Host      | db       | Command | Time | State    | Info             | Progress |
+----+----------+-----------+----------+---------+------+----------+------------------+----------+
| 30 | root     | localhost | mysql    | Sleep   |   10 |          | NULL             |    0.000 |
| 34 | root     | localhost | mysql    | Query   |    0 | starting | show processlist |    0.000 |
| 43 | training | localhost | training | Sleep   |    5 |          | NULL             |    0.000 |
+----+----------+-----------+----------+---------+------+----------+------------------+----------+
3 rows in set (0.000 sec)

MariaDB [mysql]> quit
Bye
root@its-lu20s04:~# mysql -e 'kill 43' && systemctl stop mariadb
root@its-lu20s04:~#
```
