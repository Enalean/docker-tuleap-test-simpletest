#!/bin/bash

sudo -u mysql /usr/bin/scl enable rh-mysql57 -- /opt/rh/rh-mysql57/root/usr/libexec/mysql-prepare-db-dir mysql mysql
sudo -u mysql /opt/rh/rh-mysql57/root/usr/libexec/mysqld-scl-helper enable rh-mysql57 -- /opt/rh/rh-mysql57/root/usr/libexec/mysqld --daemonize --basedir=/opt/rh/rh-mysql57/root/usr --pid-file=/var/run/rh-mysql57-mysqld/mysqld.pid
