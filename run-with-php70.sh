#!/bin/bash
set -e

params=${@} scl enable rh-php70 '/run.sh $params'
