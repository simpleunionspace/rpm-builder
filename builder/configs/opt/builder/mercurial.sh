#!/bin/bash
set -euo pipefail

dos2unix /opt/builder/in/mercurial.sources

while read l; do
  cd ~/rpmbuild/BUILD
  hg clone $l
done < /opt/builder/in/mercurial.sources
