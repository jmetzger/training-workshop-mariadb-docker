# 1. Node started nicht nach Crash ? Was tun ? 

## Warum startet nicht ? 

```
# node ist in einem nicht-geordneten Zustand.
# und hat Angst ;o), dass die anderen Nodes u.U. weiter sind 
# Ziel sollte sein, die letzte Node als 1. zu starten mit -> galera_new_cluster 
```

## Wie beheben ? 

```
# Nach Informationen im Status gucken 
systemctl status mariadb 

# Nach Informationen in den Logs schauen 
journalctl -u mariadb 
# Speziell kann ich rausfiltern
journalctl -u mariadb | grep -i error

# In der Regel steht safe_to_bootstrap auf 0 
ä Fixend 
/var/lib/grastate.dat 
safe_to_bootstrap = 1 # setzen 

# Immer nur ausführen, wenn es nur eine Node 1 !! git 
galera-new-cluster

```
