#!/bin/bash

service mysqld start

JOB_NAME=ut /tuleap/tools/continuous_integration/ci_build.sh --workspace=/ --srcdir=tuleap

echo "Completed"
