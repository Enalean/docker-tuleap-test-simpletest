Docker image to execute Tuleap tests on PHP 5.6
===============================================

How to use
==========

To execute all tests, just type:

    $> docker run --rm=true -v "$(pwd)":/tuleap:ro enalean/tuleap-simpletest:c6-php56 \
    /tuleap/tests/simpletest /tuleap/tests/integration /tuleap/plugins

To execute only one file:

    $> docker run --rm -v "$(pwd)":/tuleap:ro enalean/tuleap-simpletest:c6-php56 --nodb /tuleap/tests/simpletest/common/project/ProjectManagerTest.php

Please note the --nodb switch, it allows a faster start when there is no DB involved.
