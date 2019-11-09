#!/bin/bash
set -euo pipefail

dos2unix /opt/builder/in/yum.sources

while read l; do
  yum -y install $l
done < /opt/builder/in/yum.sources
