#!/bin/bash
set -euo pipefail

dos2unix /opt/builder/in/git.sources

while read l; do
  cd ~/rpmbuild/BUILD
  git clone --recurse-submodules $l
done < /opt/builder/in/git.sources
