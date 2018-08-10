Docker image to execute Tuleap tests on PHP 7.2
===============================================

How to use
==========

This is meant to be used from Tuleap sources

    # Generate Junit XML in Jenkins job context
    $> make simpletest-72-ci

    # Run compatible tests with CLI reporter
    $> make simpletest-72

    # Update tests compatible with php 7.2
    $> make simpletest-72-update-compatibility-list
