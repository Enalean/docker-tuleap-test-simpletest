#!/bin/bash

service mysqld start
service httpd start

make -C /tuleap TULEAP_LOCAL_INC=/etc/integration_tests.inc OUTPUT_DIR=/output BUILD_ENV=ci ci_api_test
