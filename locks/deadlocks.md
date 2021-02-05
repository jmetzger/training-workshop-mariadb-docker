# Deadlocks 

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
