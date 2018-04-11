Docker image to execute Tuleap tests on PHP 7.0
===============================================

How to use
==========

This is meant to be used from Tuleap sources

    # Generate Junit XML in Jenkins job context
    $> make simpletest-70-ci

    # Run compatible tests with CLI reporter
    $> make simpletest-70

    # Update tests compatible with php 7.0
    $> make simpletest-70-update-compatibility-list
