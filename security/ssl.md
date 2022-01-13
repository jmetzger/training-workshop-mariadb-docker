# ssl - mariadb (only server certificate) - Centos/Redhat/Rocky - Distribution Version

## Variant 1: Setup 1-way ssl encryption 

### Create CA and Server-Key 

```

# On Server - create ca and certificates 
sudo mkdir -p /etc/my.cnf.d/ssl
sudo cd /etc/my.cnf.d/ssl

# create ca.  
sudo openssl genrsa 4096 > ca-key.pem

# create ca-certificate 
# Common Name: MariaDB CA 
sudo openssl req -new -x509 -nodes -days 365000 -key ca-key.pem -out ca-cert.pem

# create server-cert 
# Common Name: server1.training.local 
# Password: --- leave empty ----
sudo openssl req -newkey rsa:2048 -days 365000 -nodes -keyout server-key.pem -out server-req.pem

# Next process the rsa - key 
sudo openssl rsa -in server-key.pem -out server-key.pem

# Now sign the key 
sudo openssl x509 -req -in server-req.pem -days 365000 -CA ca-cert.pem -CAkey ca-key.pem -set_serial 01 -out server-cert.pem

```

### Verify certificates 

```
openssl verify -CAfile ca-cert.pem server-cert.pem 


```

### Configure Server 
```
# create file 
# /etc/my.cnf.d/z_ssl.cnf 
[mysqld]
ssl-ca=/etc/my.cnf.d/ssl/ca-cert.pem
ssl-cert=/etc/my.cnf.d/ssl/server-cert.pem
ssl-key=/etc/my.cnf.d/ssl/server-key.pem
## Set up TLS version here. For example TLS version 1.2 and 1.3 ##
# Starts from mariadb 10.4.6 not possible before. !!!! 
tls_version = TLSv1.2,TLSv1.3

# Set ownership 
chown -vR mysql:mysql /etc/my.cnf.d/ssl/

```

### Restart and check for errors 
```
systemctl restart mariadb
journalctl -u mariadb 

```

### Test connection on client 

```
# only if we use option --ssl we will connect with ssl 
mysql --ssl -uxyz -p -h <ip-of-server>
mysql>status
SSL:                    Cipher in use is TLS_AES_256_GCM_SHA384

```

### Force to use ssl 


```
# on server 
# now client can only connect, when using ssl 
mysql> grant USAGE on *.* to remote@10.10.9.144 require ssl;
```





## Variant 2: 1-way ssl-encryption but checking server certificate 

### Prerequisites 

```
server1: 192.168.56.103 
client1: 192.168.56.104
```

### Copy ca-cert to client 

```
# on server1 
cd /etc/my.cnf.d/ssl
scp ca-cert.pem kurs@192.168.56.104:/tmp 

# on clien1 
cd /etc/my.cnf.d 
mkdir ssl 
cd ssl
mv /tmp/ca-cert.pem . 
```

### Configure client1 - client -config  

```
sudo vi /etc/my.cnf.d/mysql-clients.cnf

Append/edit in [mysql] section:

## MySQL Client Configuration ##
ssl-ca=/etc/my.cnf.d/ssl/ca-cert.pem

##  Force TLS version for client too
#tls_version = TLSv1.2,TLSv1.3
### This option is disabled by default ###
### ssl-verify-server-cert ###

# only works if you have no self-signed certificate
ssl-verify-server-cert
ssl

# domain-name in hosts setzen 
# because in dns
vi /etc/hosts 
192.168.56.103 server1.training.local 

# now you to connect with hostname
# otherwice no check against certificate can be done 
mysql -uext -p -h server1.training.local 

# if it does not work, you get 
ERROR 2026 (HY000): SSL connection error: Validation of SSL server certificate failed

```

## Ref 

  * https://www.cyberciti.biz/faq/how-to-setup-mariadb-ssl-and-secure-connections-from-clients/
  

