# Where does the Server Listen 

## How to check ? 

```
lsof -i | grep mariadb
# localhost means it does NOT listen to the outside now 
# mariadbd  5208           mysql   19u  IPv4  56942      0t0  TCP localhost:mysql (LISTEN)

netstat -tupel 
# or 
nestat -an 

```
