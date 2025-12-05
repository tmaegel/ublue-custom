#!/usr/bin/bash

set -ouex pipefail

systemctl enable podman.socket
systemctl enable flatpak-preinstall.service