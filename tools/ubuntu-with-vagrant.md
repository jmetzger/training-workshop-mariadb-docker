# Ubuntu with Vagrant 

## Walkthrough 

```
# Step 1: Download git for windows 
https://git-scm.com/downloads
# Step 2: Install Virtualbox 
https://download.virtualbox.org/virtualbox/6.1.18/VirtualBox-6.1.18-142142-Win.exe
# Step 3: Auf dem Desktop, rechte Maustaste -> git bash here 
# in the bash 
mkdir myvirtualmachine
vagrant init ubuntu/focal64 
vagrant up 
# and the you are in the machine (shell)
vagrant ssh 
# within machine switch from vagrant user to root without password  
sudo su -
# there you go - install whatever 
```

## Include provisioning in Vagrantfile 

```
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y mysql-server-5.7 wget
    cd /usr/src
    touch foo
    wget https://downloads.mysql.com/docs/sakila-db.tar.gz
    tar xzvf sakila-db.tar.gz
    cd sakila-db
    mysql < sakila-schema.sql
    mysql < sakila-data.sql
  SHELL
end
```

## Destroy machine 

```
vagrant destroy -f 
```
