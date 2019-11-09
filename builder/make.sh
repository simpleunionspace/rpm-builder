#!/bin/bash

docker build `
       --pull `
       --no-cache `
       --tag lifepainspace/rpm-builder:$(date +%Y%m%d.%H%M) `
       --tag lifepainspace/rpm-builder:latest `
       .
