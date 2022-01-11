# Start,stop and enabling of mariadb

## start/stop/status 

```
# als root - user 
systemctl status mariadb
systemctl stop mariadb 
systemctl start mariadb 

# 
systemctl restart mariadb
```

## enable 

```
# enable to be started after reboot 
systemctl enable mariadb 
```

## how is service configured / systemd-wise 

```
systemctl cat mariadb 

```
