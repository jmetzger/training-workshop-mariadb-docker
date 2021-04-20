# Show server/session status 

## Through mysql

```
# in mysql interface (client)
mysql
status;
```

## With mysqladmin 

```
mysqladmin status
# or if you want to know more 
mysqladmin extended status 
```

## with mysql -> show status 

```
mysql> show status;
mysql> show global status;
mysql> # setzt session status zurück 
mysql> flush status; 
mysql> show status;
```
