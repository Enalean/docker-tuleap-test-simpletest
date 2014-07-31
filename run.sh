#!/bin/bash

service mysqld start

export TULEAP_LOCAL_INC=/tuleap/src/etc/local.inc.dist

mkdir -p /var/tmp/codendi_cache

cd /output
exec php -d include_path="/tuleap/src/www/include:/tuleap/src:/usr/share/pear:." /tuleap/tests/bin/simpletest $@
