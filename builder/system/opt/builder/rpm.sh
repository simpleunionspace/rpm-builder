#!/bin/bash
set -euo pipefail

if [ -f /opt/builder/in/rpm.sources ]; then
  dos2unix /opt/builder/in/rpm.sources
  while read l; do
    sudo rpm -i $l
  done < /opt/builder/in/rpm.sources
fi
if [ -d /opt/builder/in/rpm.d.sources ]; then
  sudo rpm -i /opt/builder/in/rpm.d.sources/*.rpm
fi
