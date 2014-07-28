Docker image to execute Tuleap REST tests
=========================================

How to use
==========

To execute all tests, just type:

    $> docker run --rm=true -v $PWD:/tuleap enalean/tuleap-test-rest


Continuous integration usage
----------------------------

For jenkins builds:

    $> docker run --rm=true -v $WORKSPACE/tuleap:/tuleap -v $WORKSPACE:/output enalean/tuleap-test-rest

