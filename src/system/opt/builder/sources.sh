#!/bin/bash
set -euo pipefail

if [ -f /opt/builder/in/yum.sources ]; then
    bash /opt/builder/yum.sh
fi
if [ -f /opt/builder/in/rpm.sources ] || [ -d /opt/builder/in/rpm.d.sources ]; then
    bash /opt/builder/rpm.sh
fi
if [ -f /opt/builder/in/tar.sources ] || [ -d /opt/builder/in/tar.d.sources ]; then
    bash /opt/builder/tar.sh
fi
if [ -f /opt/builder/in/zip.sources ] || [ -d /opt/builder/in/zip.d.sources ]; then
    bash /opt/builder/zip.sh
fi
if [ -f /opt/builder/in/git.sources ]; then
    bash /opt/builder/git.sh
fi
if [ -f /opt/builder/in/mercurial.sources ]; then
    bash /opt/builder/mercurial.sh
fi
if [ -f /opt/builder/in/subversion.sources ]; then
    bash /opt/builder/subversion.sh
fi
