#!/usr/bin/bash

set -ouex pipefail

echo "::group:: ===$(basename "$0")==="

dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf -y install tailscale

systemctl enable tailscaled

echo "::endgroup::"
