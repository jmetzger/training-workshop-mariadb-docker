# Disable unix socket auth for user.

```
# before 
show grants for root@localhost;
GRANT ALL PRIVILEGES ON *.* TO `root`@`localhost` IDENTIFIED VIA mysql_native_password USING '*2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19' OR unix_socket
```

```
#after 
alter user root@localhost identified by 'meinpasswort';
```
