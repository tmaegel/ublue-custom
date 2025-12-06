#!/usr/bin/bash

set -ouex pipefail

echo "::group:: ===$(basename "$0")==="

systemctl enable docker.socket
systemctl enable podman.socket

echo "::endgroup::"