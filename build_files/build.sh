#!/usr/bin/bash

set -ouex pipefail

/ctx/packages.sh

/ctx/build_files/gnome-extensions.sh

/ctx/build_files/docker.sh

/ctx/build_files/vscode.sh

/ctx/systemd.sh

/ctx/build_files/cleanup.sh