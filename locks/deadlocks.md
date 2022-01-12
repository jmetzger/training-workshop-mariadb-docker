# Debug Locks / Deadlocks 

## Create a locking 

```

-- session 1
START TRANSACTION;
UPDATE t SET id = 15 WHERE id = 10;

-- session 2
DELETE FROM t WHERE id = 10;
```


## Example 

```
#
SELECT l.*, t.*
    FROM information_schema.INNODB_LOCKS l
    JOIN information_schema.INNODB_TRX t
        ON l.lock_trx_id = t.trx_id
    WHERE trx_state = 'LOCK WAIT' \G

```

## Refs 

  * https://mariadb.com/kb/en/information-schema-innodb_locks-table/
