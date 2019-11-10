#!/bin/bash
set -euo pipefail

if [ -f /opt/builder/in/zip.sources ]; then
  dos2unix /opt/builder/in/zip.sources
  while read l; do
    wget -qO- $l | unzip -d ~/rpmbuild/BUILD/
  done < /opt/builder/in/zip.sources
fi
if [ -d /opt/builder/in/zip.d.sources ]; then
  for f in /opt/builder/in/zip.d.sources/*.zip; do
    unzip $f -d ~/rpmbuild/BUILD/
  done
fi
