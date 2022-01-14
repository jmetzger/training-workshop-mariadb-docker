# Table Encryption 

## Walktrough 

```
mkdir -p /etc/mysql/encryption
echo "1;"$(openssl rand -hex 32) > /etc/mysql/encryption/keyfile

openssl rand -hex 128 > /etc/mysql/encryption/keyfile.key
openssl enc -aes-256-cbc -md sha1 -pass file:/etc/mysql/encryption/keyfile.key -in /etc/mysql/encryption/keyfile -out /etc/mysql/encryption/keyfile.enc

rm -f /etc/mysql/encryption/keyfile


```

## Ref:

  * https://mariadb.com/de/resources/blog/mariadb-encryption-tde-using-mariadbs-file-key-management-encryption-plugin/
