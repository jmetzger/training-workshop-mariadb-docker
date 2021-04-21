# Create user who can authenticate through unix-socket (passwordless) (Centos)

```
mysql>create user training@localhost identified via unix_socket
useradd training
passwd training

# testing
su - training
# mysql 
# shouuld not work without password 
# Be sure, that use has access to socket 
cd /var/lib/mysql 
ls -la mysql.socket 
```
