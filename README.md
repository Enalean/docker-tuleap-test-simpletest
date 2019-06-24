Docker image to execute Tuleap tests on PHP 7.4
===============================================

How to use
==========

This is meant to be used from Tuleap sources

    # Generate Junit XML in Jenkins job context
    $> make simpletest-74-ci

    # Run compatible tests with CLI reporter
    $> make simpletest-74

