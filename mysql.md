# mysql  

##  \G Spezialausgabe 

```
# Spalten werden als Zeilen angezeigt 
# nur im mysql-client 
mysql

mysql> show variables like 'bind%'  \G
```

## Pager 

```
# pager innerhalb von mysql verwenden 
mysql> pager less
mysql> -- Jetzt wird der Linux Pager less verwendet 
mysql> -- so schalte ich ihn wieder ab
mysql> pager
```
