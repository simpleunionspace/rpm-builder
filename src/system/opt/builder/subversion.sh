#!/bin/bash
set -euo pipefail

dos2unix /opt/builder/in/subversion.sources

while read l; do
  cd ~/rpmbuild/BUILD
  svn checkout $l
done < /opt/builder/in/subversion.sources
