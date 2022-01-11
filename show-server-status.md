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
# Status within session (status - counters)
mysql> show status;
# Status global (since last reboot/start of mariadb server) 
mysql> show global status;
mysql> -- reset session status 
mysql> flush status; 
# Show session status 
mysql> show session status;
```
