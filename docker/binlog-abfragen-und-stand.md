# Arbeiten mit binlog 

## Binlog ausgeben (docker) 

```
# Innerhalb des containers
cd /bitnami/mariadb/data
# no-defaults is important because of "bug" in bitnami/mariadb config
# immer das letzte ist das aktuelle 
mysqlbinlog --no-defaults mysqld-bin.000002
```

## Wo wird als nächste hingeschrieben 

```
mysql -e "show master status;" -uroot -p<dein passwort>
```

