#!/bin/bash

SPECNAME=$1

BASEPATH=$(dirname "$0")

if [ ! -d $BASEPATH/../src/$SPECNAME ]; then
    mkdir -p $BASEPATH/../src/$SPECNAME
fi

docker run `
       -it `
       -v $BASEPATH/../src/$SPECNAME:/opt/builder/in `
       -v $BASEPATH/../rpm/$SPECNAME:/opt/builder/out `
       lifepainspace/rpm-builder:latest
