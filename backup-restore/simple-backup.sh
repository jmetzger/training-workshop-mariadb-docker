# Simple Backup 

## Backup Script 

```
cat backup-test.sh
#!/bin/bash

DATABASES=$(echo "select schema_name from information_schema.schemata where schema_name != 'performance_schema' and schema_name != 'information_schema';" | mysql)
for i in $DATABASES
do
  mysqldump $i > /usr/src/dump_$i.sql
done
```
