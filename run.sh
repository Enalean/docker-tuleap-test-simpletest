#!/bin/bash

set -e

options=`getopt -o h,x -l nodb -- "$@"`
eval set -- "$options"

withdb=1
options=

while true
do
    case "$1" in
	--nodb)
	    withdb=
	    shift 1;;
	-x)
	    options=-x
	    shift 1;;
	--)
	    shift 1; break ;;
	*)
	    break ;;
    esac
done

if [ -n "$withdb" ]; then
    service mysqld start
fi

export TULEAP_LOCAL_INC=/tuleap/src/etc/local.inc.dist

mkdir -p /var/tmp/codendi_cache

mkdir -p /output
cd /output
exec php -d include_path="/tuleap/src/www/include:/tuleap/src:/usr/share/pear:." /tuleap/tests/bin/simpletest $options $@
