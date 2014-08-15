Docker image to execute Tuleap REST tests
=========================================

How to use
==========

To execute all tests, just type:

    $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-ut-c5-php51

To execute only one file/dir (for instance git plugin):

    $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-ut-c5-php51 /tuleap/plugins/git

You can pass options to the execution, for instance when you don't test DB stuff
you can tell it so we don't start db:

    $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-ut-c5-php51 --nodb /tuleap/tests/rest/ProjectTest.php


Continuous integration usage
----------------------------

For jenkins builds:

    $> docker run --rm=true -v $WORKSPACE/tuleap:/tuleap -v $WORKSPACE:/output enalean/tuleap-test-rest

