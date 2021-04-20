# Installation Centos 

## Setup Repo 

```
Here is your custom MariaDB YUM repository entry for CentOS. Copy and paste it into a file under /etc/yum.repos.d/ (we suggest naming the file MariaDB.repo or something similar).

# MariaDB 10.4 CentOS repository list - created 2021-04-20 08:58 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.4/centos8-amd64
module_hotfixes=1
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1

The configuration item module_hotfixes=1 is a workaround for what we have been told is a dnf bug. See MDEV-20673 for more details.

After the file is in place, install and start MariaDB with:

sudo dnf install MariaDB-server
sudo systemctl start mariadb
```
