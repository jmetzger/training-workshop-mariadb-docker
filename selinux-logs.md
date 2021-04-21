# SELinux Probleme erkennen und Debuggen

``` 
# Wenn mariadb nicht startet, dann zunächst Loganalyse
systemctl status mariadb 
# Gibt es ERROR - Einträge ? 
# Gibt es Permission / Access Denied - Einträge 
# Wenn ansonsten alle Rechte stimmen, weisst das Probleme mit SELinux 
journalctl -u mariadb | less 


# Logs von selinux laufen über den Audit-Daemon 
/var/log/audit/audit.log 
# Dies können mit sealert analysiert werden
# Wichtig: Geduld haben, die Analyse dauert einen Moment 
# auch nach 100% noch abwarten 
sealert -a /var/log/audit/audit.log 

# Allheilmittel ist meistens 
# Setzt den richtigen Context, den SELinux braucht, 
# damit mariadb starten kann 
restorecon -rv /var/lib/mysql 

```


