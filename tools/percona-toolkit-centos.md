# Install percona - toolkit (Centos) 

## Walkthrough (Centos / Redhat) 

```
# Howto 
# https://www.percona.com/doc/percona-toolkit/LATEST/installation.html

# Step 1: repo installieren mit rpm -paket 
dnf install -y https://repo.percona.com/yum/percona-release-latest.noarch.rpm; dnf install -y percona-toolkit
```

## Debian / Ubuntu 

```
curl -O https://repo.percona.com/apt/percona-release_latest.generic_all.deb
sudo apt install gnupg2 lsb-release ./percona-release_latest.generic_all.deb
apt update
apt install percona-toolkit 


```
