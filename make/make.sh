#!/bin/bash

SPEC=$1

BASEPATH=$(dirname "$0")

docker run `
       -it `
       -v $BASEPATH/../src/$SPEC:/opt/builder/in `
       -v $BASEPATH/../rpm/$SPEC:/opt/builder/out `
       -v $BASEPATH/../tmp/$SPEC:/root/rpmbuild `
       lifepainspace/rpm-builder:latest
