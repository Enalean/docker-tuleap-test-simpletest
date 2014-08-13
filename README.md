Docker image to execute Tuleap PHP53+ tests
===========================================

How to use
==========

To execute all tests, just type:

    $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-ut-c6-php53

To execute only one file (actually you can pass any PhpUnit option):

    $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-ut-c6-php53 /tuleap/tests/rest/ProjectTest.php


Continuous integration usage
----------------------------

For jenkins builds:

    $> docker run --rm=true -v $WORKSPACE/tuleap:/tuleap -v $WORKSPACE:/output enalean/tuleap-test-ut-c6-php53
