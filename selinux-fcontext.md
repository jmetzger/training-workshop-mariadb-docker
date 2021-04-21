# Neues Datenverzeichnis selinux 

```
mkdir /data
chown mysql:mysql /data
semanage fcontext -a -t mysqld_db_t "/data(/.*)?"
restorecon -vr /data
# type _t should mysqld_db_t 
ls -laZ
```
