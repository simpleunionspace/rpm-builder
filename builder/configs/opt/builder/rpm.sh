#!/bin/bash
set -euo pipefail

if [ -f /opt/builder/in/yum.sources ]; then
  dos2unix /opt/builder/in/yum.sources
  while read l; do
    rpm -i $l
  done < /opt/builder/in/rpm.sources
fi
if [ -d /opt/builder/in/yum.d.sources ]; then
  rpm -i /opt/builder/in/rpm.d.sources/*.rpm
fi
