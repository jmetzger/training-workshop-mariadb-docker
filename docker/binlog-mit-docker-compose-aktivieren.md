# binlog mit docker-compose aktivieren 

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
      - ALLOW_EMPTY_PASSWORD=yes
      - MARIADB_EXTRA_FLAGS=--log-bin
    healthcheck:
      test: ['CMD', '/opt/bitnami/scripts/mariadb/healthcheck.sh']
      interval: 15s
      timeout: 5s
      retries: 6

volumes:
  mariadb_data:
    driver: local


```