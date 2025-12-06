#!/usr/bin/bash

set -eoux pipefail

echo "::group:: ===$(basename "$0")==="

dnf clean all

rm -rf /.gitkeep
find /var/* -maxdepth 0 -type d \! -name cache -exec rm -fr {} \;
find /var/cache/* -maxdepth 0 -type d \! -name libdnf5 \! -name rpm-ostree -exec rm -fr {} \;

echo "::endgroup::"