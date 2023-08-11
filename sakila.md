# Installation of sakila-db 

```
cd /usr/src
wget https://downloads.mysql.com/docs/sakila-db.tar.gz
tar xzvf sakila-db.tar.gz

cd sakila-db 
# mysql < sakila-schema.sql 
# mysql < sakila-data.sql 

# Vebinden mit dem MySQL im Container
# Schritt 1: unsere IP herausfinden
docker inspect mariadb-mariadb-1

# mysql -uroot -p -h <ip-des-docker-containers < sakila-schema.sql
# mysql -uroot -p -h <ip-des-docker-containers < sakila-data.sql

mysql -uroot -p -h 172.21.0.2 < sakila-schema.sql
mysql -uroot -p -h 172.21.0.2 < sakila-data.sql



```
