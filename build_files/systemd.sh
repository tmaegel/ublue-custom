#!/usr/bin/bash

set -ouex pipefail

echo "::group:: ===$(basename "$0")==="

systemctl enable podman.socket
systemctl --global enable podman-auto-update.timer
systemctl enable tailscaled.service

echo "::endgroup::"
