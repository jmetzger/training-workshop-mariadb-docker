# Installation mariadb mit docker-compose 

## Welche Version ? 

  * Immer die letzte Long Time Support - Version. (long term mariadb stable release)
  * Bitte hier nachschauen: 
    * https://mariadb.com/kb/en/mariadb-server-release-dates/

## Dazugehörige docker-compose.yaml - file finden 

  * Hier finden: 
  * https://github.com/bitnami/containers/tree/main/bitnami/mariadb
  * Für 10.6
  * https://github.com/bitnami/containers/blob/main/bitnami/mariadb/10.6/debian-11/docker-compose.yml

## Walkthrough 

```
sudo su -
mkdir mariadb
cd mariadb
vi docker-compose.yaml
```

```
# Copyright VMware, Inc.
# SPDX-License-Identifier: APACHE-2.0

version: '2.1'

services:
  mariadb:
    image: docker.io/bitnami/mariadb:10.6
    ports:
      - '3306:3306'
    volumes:
      - 'mariadb_data:/bitnami/mariadb'
    environment:
      # ALLOW_EMPTY_PASSWORD is recommended only for development.
      #- ALLOW_EMPTY_PASSWORD=yes
      - MARIADB_ROOT_PASSWORD=12ZaSpelle22
    healthcheck:
      test: ['CMD', '/opt/bitnami/scripts/mariadb/healthcheck.sh']
      interval: 15s
      timeout: 5s
      retries: 6

volumes:
  mariadb_data:
    driver: local
```

```
docker compose up -d
docker container ls 
```

## Ref:

  * docker/installation-mariadb-docker-compose.md
  
