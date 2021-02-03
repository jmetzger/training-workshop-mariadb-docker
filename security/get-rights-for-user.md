# Get rights for user 

## Root can show rights of a specific user 

```
# shows the right of the logged in user (you as a user)
show grants; 

# show grants for a specific user 
# no need for ' (quotes) if there are not special chars withing 
# e.g.
show grants for training@localhost; 
# if there are special chars, use quotes
show grants for 'mariadb.sys'@localhost;

# if you want to see rights of a user that has rights from everywhere
show grants for training@'%';
```

## If you cannot remember the exact user (user@host) look it up

```
# within mysql client 
use mysql 
select * from user \G 
```
