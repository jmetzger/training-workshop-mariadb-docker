# Config and Restart 

```
# change config in /etc/mysql/50-server.cnf 
# After that restart server - so that it takes your new config 
systemctl restart mariadb 
echo $? # Was call restart succesful -> 0 
```
