# Debug / Setup External Connection (Centos/Redhat/Rocky)

## Prerequisites 

```
client1: 192.168.56.104 
server1: 192.168.56.103
```

## Step 1: Be sure server is communicating to the outside

```
lsof -i 
# should be
*:mysql 
```

## Step 2: Test connection from client 

```
mysqladmin ping -h 192.168.56.103
# on succesful connection also without authentication
echo $?
0 # 0 was success also without proper authentication 

# Bad news, if 
echo $? 
1 
# Could not connect at all

```

## Step 2a: No connection possible  ? check Firewall .... 

```
# Server 1 
systemctl status firewalld 
firewall-cmd --state 
firewall-cmd --list-all # do we see mysql as a service

# no ? 
firewall-cmd --get-services 
firewall-cmd --add-service=mysql # only in runtime
firewall-cmd --runtime-to-permanent # config - works after reboot 

## Recheck with Step 2 

```

## Step 3: Setup user without grants - Server1

```
# Server 1 
mysql> create user ext@192.168.56.104 identified by 'topsecretpassword';
# Doing this twice triggers an weird error 

```

## Step 3a: test connection from client - Client 1

```
mysql -uext -p -h 192.168.56.103 
# on success 
mysql>show grants 
# should only be usage 
mysql>show schemas 

```

### Step 3b: Add priviliges (testing giving all) - Server1

```
# *.* = all databases and all tables 
mysql> GRANT ALL ON *.* TO ext@192.168.56.104
```

### Step 3c: See, if we have grants - Client 1

```
mysql>show grants 
# grants will be shown but do not work yet 
# we need to reconnect 
mysql>quit 
mysql -uext -p -h 192.168.56.103 
mysql> -- now it works 

```
