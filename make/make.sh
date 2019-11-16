#!/bin/bash

BASEPATH=$(dirname "$0")

docker rmi -f $(docker images -q lifepainspace/rpm-builder)

docker build `
       --pull `
       --no-cache `
       --tag lifepainspace/rpm-builder:$(date +%Y%m%d.%H%M) `
       --tag lifepainspace/rpm-builder:latest `
       $BASEPATH/../src/
