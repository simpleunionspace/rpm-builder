#!/bin/bash

SPECNAME=$1

BASEPATH=$(dirname "$0")

if [ ! -d $BASEPATH/../rpm/$SPECNAME ]; then
    mkdir -p $BASEPATH/../rpm/$SPECNAME
fi

docker run `
       -it `
       -v $BASEPATH/../src/$SPECNAME:/opt/builder/in `
       -v $BASEPATH/../rpm/$SPECNAME:/opt/builder/out `
       lifepainspace/rpm-builder:latest
