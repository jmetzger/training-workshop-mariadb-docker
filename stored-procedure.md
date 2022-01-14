# Create a stored procedure 

## Example 

```
USE sakila;
DELIMITER //

CREATE PROCEDURE simpleproc (OUT param1 INT)
 BEGIN
  SELECT COUNT(*) INTO param1 FROM actor;
 END;
//

DELIMITER ;

CALL simpleproc(@a);

SELECT @a;
+------+
| @a   |
+------+
|    1 |
+------+


```

## Reference 

  * https://mariadb.com/kb/en/create-procedure/
