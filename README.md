Docker image to execute Tuleap on PHP54 tests
=============================================

** This branch is deprecated, please look at: https://github.com/Enalean/docker-tuleap-test-simpletest/tree/c6-php56 **

How to use
==========

To execute all tests, just type:

    $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-ut-c6-php54

To execute only one file (actually you can pass any PhpUnit option):

    $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-ut-c6-php54 /tuleap/tests/rest/ProjectTest.php

You can pass options to the execution, for instance when you don't test DB stuff
you can tell it so we don't start db:

    $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-ut-c6-php54 --nodb /tuleap/tests/rest/ProjectTest.php

Continuous integration usage
----------------------------

For jenkins builds:

    $> docker run --rm=true -v $WORKSPACE/tuleap:/tuleap -v $WORKSPACE:/output enalean/tuleap-test-ut-c6-php54
