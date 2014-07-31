#!/bin/bash

service mysqld start
#service httpd start

#make -C /tuleap TULEAP_LOCAL_INC=/etc/integration_tests.inc OUTPUT_DIR=/output BUILD_ENV=ci PHPUNIT_OPTIONS="$@" ci_simpletest

JOB_NAME=ut /tuleap/tools/continuous_integration/ci_build.sh --workspace=/ --srcdir=tuleap
