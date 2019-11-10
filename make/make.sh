#!/bin/bash

SPEC=$1

BASEPATH=$(dirname "$0")

docker run `
       -it `
       -v $BASEPATH/../src/$SPEC:/opt/builder/in `
       -v $BASEPATH/../rpm/$SPEC:/opt/builder/out `
       lifepainspace/rpm-builder:latest
