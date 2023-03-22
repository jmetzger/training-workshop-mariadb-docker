# Calculate innodb-log-filze-size

```
pager grep sequence;
show engine innodb status; 
select sleep(60);
show engine innodb status;
```

```
mysql> select (3838334638 - 3836410803) / 1024 / 1024 as MB_per_min;
+------------+
| MB_per_min |
+------------+
| 1.83471203 | 
+------------+
```

  * https://www.percona.com/blog/how-to-calculate-a-good-innodb-log-file-size/
