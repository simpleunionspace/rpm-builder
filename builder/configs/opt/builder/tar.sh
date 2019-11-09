#!/bin/bash
set -euo pipefail

if [ -f /opt/builder/in/tar.sources ]; then
  dos2unix /opt/builder/in/tar.sources
  while read l; do
    wget -qO- $l | tar xvz -C ~/rpmbuild/BUILD/
  done < /opt/builder/in/tar.sources
fi
if [ -d /opt/builder/in/tar.d.sources ]; then
  for f in /opt/builder/in/tar.d.sources/*.tar.gz; do
    tar -xzf $f -C ~/rpmbuild/BUILD/
  done
fi
