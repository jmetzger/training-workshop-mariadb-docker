# Dump one Database

## Dump one database only and restore 

```
mysqldump sakila > /usr/src/sakila.sql
echo "drop schema sakila" | mysql
echo "show databases" | mysql

# import to different db
echo "create schema sakila2" | mysql
mysql sakila2 < /usr/src/sakila.sql

# Import to same db
echo "create schema sakila" | mysql
mysql sakila < /usr/src/sakila.sql
```
