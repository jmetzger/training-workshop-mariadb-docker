# MariaDB Komplettkurs 

## Agenda 

  1. Installation
     * [Installation mit docker-compose](docker/installation-mariadb-docker-compose.md)
    
  1. Administration
     * [Zugriff auf container mit mariadb](docker/zugriff-auf-docker-mariadb-container.md)
     * [Manage global variables / server system variables](set-global-variable.md)
    
  1. Dokumentation
     * [Server System Variables](https://mariadb.com/kb/en/server-system-variables/#bind_address)


## Backlog

  1. Architektur MariaDB
     * [Architecture Server](/basics/mariadb-architecture.md)
     * [Architecture Server (Steps)](/performance/mysql-server-architecture.md)
     * [Storage Engines](/basics/storage-engines.md) 

  1. Installation 
     * [Installation Centos/RockyLinux](installation-centos.md) 
     * [Start/Status/Stop/Enable von MariaDB](start-status-stop.md)
     * [Does mariadb listen to the outside world](/installation/listening-where.md)

  1. Database Objects 
     * [Create Database](/basics/create-database.md)
     * [Show structure of table](show-create-table-describe.md)
     * [Show all tables within db](show-tables.md) 

  1. Security and User Rights 
     * [Disable unix_socket authentication for user](/security/no-unix-sock-auth.md)
     * [Debug and Setup External Connection](/security/debug-external-conn.md) 
     * [Get Rights of user](/security/get-rights-for-user.md)
     * [Secure with SSL server/client](/security/ssl.md)
     * [Auth with unix_socket](create-user-unix-socket.md)
     * [User- and Permission-concepts (best-practice)](/security/user-db-best-practice.md)
     * [Setup external access](external-access.md)
     * [Table encryption](table-encryption.md)

  1. InnoDB - Storage Engine 
     * [InnoDB - Storage Engine - Structure](/innodb/innodb-structure.md) 
     * [Important InnoDB - configuration - options to optimized performance](/innodb/innodb.md) 
     * [Calculate innodb logfile size](calculate-innodb-logfile-size.md)

  1. Training Data 
     * [Setup training data "contributions"](/indexes/setup-training-data-contributions.md)
     * [Setup sakila test db](sakila.md)

  1. Security and User Rights 
     * [Create User/Grant/Revoke - Management of users](grant-revoke.md)
     * [Change password of user](passwd-change-user.md)
     * [Automatisches Einloggen ohne Passwort](login-user-my-cnf.md)

  1. Binlog, Backup and Restore (Point-In-Time aka PIT) 
     * [binlog aktivieren und auslesen](binlog.md)
     * [Backup with mysqldump - best practices](backup-restore/mysqldump.md) 
     * [PIT - Point in time Recovery - Exercise](backup-restore/pit-exercise.md)
     * [Flashback](/backup-restore/flashback.md) 
     * [mariabackup](backup-restore/mariabackup.md) 
   
  1. Performance  
     * [Slow Query Log](slow-query-log.md)
     * [Percona-toolkit-Installation - Centos](/tools/percona-toolkit-centos.md)

  1. Monitoring 
     * [What to monitor?](/monitoring/monitoring.md) 
     * [Percona Management and Monitoring](/monitoring/pmm.md)

  1. Galera / MariaDB Cluster 
     * [Upgrade Minor/Major](/galera/upgrade.md) 
 
  1. Replication 
     * [Slave einrichten - gtid (mit mariabackup)](/replication/01-master-slave-gtid.md)
     * [Slave einrichten - old styke - masterpos](01-master-slave-masterpos.md)
     * [Binary Logs auf master bis slave-log-master-position ändern](purge-logs-with-slave-check.md)

  1. Tipps & Tricks 
     * [Set hostname on systemd-Systems](hostnamectl-set-hostname.md)
     * [Frisches Datenverzeichnis anlegen](create-fresh-datadir-centos.md)
     * [In den Root-Benutzer wechseln](sudo-root.md)
     * [Service Debuggen](debug-service.md)
     * [online schema change without blocking](pt-online-schema-change.md)
            
  1. Locking 
     * [Implicit Locks](locks/innodb-implicit-locks.md)
     * [Identify Deadlocks in innodb](locks/deadlocks.md)
     
  1. Optimal use of indexes 
     * [Index-Types](/indexes/type-of-indexes.md) 
     * [Describe and indexes](/indexes/describe-table.md)
     * [Find out indexes](indexes/findout-indexes.md) 
     * [Index and Functions](index-and-functions.md) 
     * [Index and Likes](/indexes/like-index-not-index.md)   
     * [profiling-get-time-for-execution-of.query](/indexes/profiling.md) 
     * [Find out cardinality without index](/indexes/cardinality.md)

  1. Dokumentation 
     * [MySQL - Performance - PDF](http://schulung.t3isp.de/documents/pdfs/mysql/mysql-performance.pdf)
     * [Server System Variables](https://mariadb.com/kb/en/server-system-variables/#bind_address)
     * [Killing connection](https://mariadb.com/kb/en/kill/)
     * [MariaDB - One Script Installation](https://mariadb.com/kb/en/mariadb-package-repository-setup-and-usage/)
     * [MariaDB - Information Schema Tables](https://mariadb.com/kb/en/information-schema-tables/)
     * [MariaDB - slow query log](https://mariadb.com/kb/en/slow-query-log-overview/)
     * [MariaDB - sys - vor 10.6](https://github.com/FromDual/mariadb-sys)
     * [mysql performance blog](https://www.percona.com/blog/innodb-performance-optimization-basics-updated/)
     * [Differences Community / Enterprise Version - nearly the same](https://fromdual.com/mariadb-enterprise-server-vs-mariadb-community-server)
     * [Hardware Optimization](https://mariadb.com/kb/en/hardware-optimization/)

## Backlog 

  1. Architecture of MariaDB
     * [Query Cache Usage and Performance](/performance/query-cache.md)
     * [Optimizer-Basics](optimizer-basics.md) 
 
  1. Installation 
     * [Installation SLES15](https://downloads.mariadb.org/mariadb/repositories/#distro=SLES&distro_release=sles15-amd64--sles15&mirror=timo&version=10.5) 
     * [Installation (Ubuntu)](installation-ubuntu.md)
     * [Does mariadb listen to the outside world](/installation/listening-where.md)
     
  1. Configuration
     * [Adjust configuration and restart](config-and-restart.md) 
     * [Set global server system variable](set-global-variable.md)

  1. Backup 
     * [Use xtrabackup for MariaDB 5.5](backup-restore/xtrabackup-for-mariadb-5-5.md)
     * [Ready-made-back-scripts](backup-restore/scripts.md) 
     * [Simple-Backup-Script](backup-restore/simple-backup.md)

  1. Administration / Troubleshooting
     * [Create fresh datadir (Centos/Redhat)](create-fresh-datadir-centos.md)
     * [Debug not starting service](troubleshooting/debug-service.md) 
   
  1. Galera 
     * [Installation and Configuration (Centos/Redhat 8)](setup-galera.md)
     * [1. Node started nicht nach Crash, z.B. Stromausfall](galera-recover-node1.md)  
   
  1. Information Schema / Status / Processes
     * [Show server/session status](show-server-status.md)
     * [Kill long running process](kill-process.md)
     * [Kill (kickout user) and stop server](kill-shutdown.md) 
 
  1. Security and User Rights 
     * [Debug and Setup External Connection](/security/debug-external-conn.md) 
     * [Get Rights of user](/security/get-rights-for-user.md)
     * [Secure with SSL server/client](/security/ssl.md) 
     * [Auth with unix_socket](create-user-unix-socket.md)
     * Authentification and Authorization
     * [User- and Permission-concepts (best-practice)](/security/user-db-best-practice.md)
     * [Setup external access](external-access.md)
     * [Table encryption](table-encryption.md)
 
  1. SELinux 
     * [Welche Ports sind freigegeben? (MariaDb startet damit)](selinux-ports.md)
     * [Neues Datenverzeichnis SELinux bekanntmachen - semanage fcontext](selinux-fcontext.md) 
     * [Probleme mit SELinux erkennen und debuggen](selinux-logs.md)
 
  1. Database - Objects  
   
     * [Triggers](triggers.md) 
     * [Functions](function.md)
     * [Stored Procedure](stored-procedure.md)
     * [Events](events.md)
     * [Data Types](https://mariadb.com/kb/en/data-types/)

  1. Upgrade 
     * [MariaDB Upgrade 10.3 (Centos) -> 10.4 (Mariadb.org)](mariadb-upgrade-10-3-centos-to-10-4-maria-org.md)
     * [MariaDB Upgrade 10.4 -> 10.5 (Centos)](mariadb-upgrade-10-04-10-05.md)
     * [MariaDB Upgrade 5.5 -> 10.5](https://mariadb.com/kb/en/upgrading-between-major-mariadb-versions/)

  1. Performance 
     * [io-Last/CPU-Last](performance/last.md) 
     * [Views and performance](/performance/views.md)  
     * [Partitions and Explain](partitions/partitions-explain.md) 
     * [3 Phases of DataSize](3-phases-of-data-size-and-performance-impact.md)
     * [Slow Query Log](slow-query-log.md)

  1. Optimal use of indexes
   
     * Index-Types 
     * [Describe and indexes](/indexes/describe-table.md)
     * [Find out indexes](indexes/findout-indexes.md) 
     * [Index and Functions](index-and-functions.md) 
     * [Index and Likes](/indexes/like-index-not-index.md)   
     * [profiling-get-time-for-execution-of.query](/indexes/profiling.md) 
     * [Find out cardinality without index](/indexes/cardinality.md)

  1. Replication 

     * [Slave einrichten - Centos - old style (master_pos)](/replication/01-replication-centos-old-style.md)
     * [MaxScale installieren](/replication/02.5-maxscale-installation.md)
     * [Reference: MaxScale-Proxy mit Monitoring](/replication/02-mariadbmon.md)
     * [Walkthrough:Automatic Failover Master Slave](/replication/03-automatic-failover-master-slave.md)

  1. Tools & Tricks
     * [Percona-toolkit-Installation - Ubuntu](/tools/percona-toolkit.md) 
     * [pt-query-digest under Windows](pt-query-digest-windows.md)
     * [pt-query-digest - analyze slow logs](/tools/pt-query-digest.md) 
     * [pt-online-schema-change howto](/tools/pt-online-schema-change.md)
     * [Ubuntu-with-Vagrant](/tools/ubuntu-with-vagrant.md)
     * [mysql-client](mysql.md)
     * [Schweizer Such-Taschenmesser grep -r](grep-r.md)
     * [Set timezone in Centos 7/8](set-timezone-centos.md) 
     * [Ist die Netzwerkkarte eingerichtet - nmtui](nmtui.md)
 
     * [User anlegen und passwort vergeben (Centos/Redhat)](useradd-passwd.md)
     * [Scripts for deploying galera-cluster to Ubuntu 20.04](https://github.com/jmetzger/ansible-galera-cluster-maxscale)
  
  1. Extras 
     * [User Variables](user-variables.md) 
     * [Installation sakila-db](sakila.md)
 
  1. Diagnosis and measurement of performance 
     * [Best practices to narrow down performance problems](performance/best-practice-analyze.md)
     
  1. Performance and optimization of SQL statements
     * [Do not use '*' whenever possible](/performance/select-no-star-please.md)
     * [Optimizer-hints (and why you should not use them)](performance/optimizer-hints.md)
     
  1. Replication 
     * [Replikation Read/Write](https://proxysql.com/blog/configure-read-write-split/)
     
  1. Performance 
     * [Best Practices](/performance/best-practices.md)
     * [Example sys-schema and Reference](/tools/sys.md)
     * [Change schema online (pt-online-schema-change)](https://www.percona.com/doc/percona-toolkit/3.0/pt-online-schema-change.html)
     * [Optimizer-Hints](performance/optimizer-hints.md) 
         
  1. Documentation / Literature 
   
     * [MySQL - Peformance Blog](https://www.percona.com/blog/)
     * [Source-Code MariaDB](https://github.com/MariaDB/server)
     * [Effective MySQL](https://www.amazon.com/Effective-MySQL-Optimizing-Statements-Oracle/dp/0071782796)
     * [Last Training](https://github.com/jmetzger/training-mysql-developers-basics)
     * [MariaDB Galera Cluster](http://schulung.t3isp.de/documents/pdfs/mariadb/mariadb-galera-cluster.pdf)
     * [MySQL Galera Cluster](https://galeracluster.com/downloads/)   
     * [Releases List - Long Time / Stable](https://mariadb.com/kb/en/mariadb-server-release-dates/)
   
  1. Questions and Answers 
     * [Questions and Answers](q-and-a.md)
     * [Best filesystem for MariaDB](https://mariadb.com/de/resources/blog/what-is-the-best-linux-filesystem-for-mariadb/)
    
  1. MySQL Do-Nots
     * [mysql-do-nots](/performance/mysql-do-nots.md)
