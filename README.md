Docker image to execute Tuleap REST tests
=========================================

How to use
==========

To execute all tests, just type:

    $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-ut-c5-php51

To execute only one file/dir (for instance git plugin):

    $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-ut-c5-php51 /tuleap/plugins/git

Continuous integration usage
----------------------------

For jenkins builds:

    $> docker run --rm=true -v $WORKSPACE/tuleap:/tuleap -v $WORKSPACE:/output enalean/tuleap-test-rest

