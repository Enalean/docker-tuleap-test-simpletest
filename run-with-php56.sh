#!/bin/bash
set -e

params=${@} scl enable rh-php56 '/run.sh $params'
