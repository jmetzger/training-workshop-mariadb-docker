# user variables 

```
# only valid within one session 
set @host='localhost';

# You can use it in select 
select @host; 

# You can use it in the where clause 
select mysql.user where host=@host; 

# not possible to use it within create user 
# DOES NOT WORK !
set @mypass='password';
create user someuser@somehost identified by @mypass; 
```
