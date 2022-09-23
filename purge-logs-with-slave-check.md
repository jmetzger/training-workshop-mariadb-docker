# Purge Logs with Slave Check 

```
# Schritt 1: slave abfragen 
mysql -u ext -p -h 192.168.56.103 --pager="grep -E 'Master_Log_File:'" -e "show slave status \G" 
# Beispiel Ausgabe
mariadb-bin.000003

# Schritt 2: logs bis dahin löschen auf master
mysql -e "purge logs to 'mariadb-bin.000003'"
```
