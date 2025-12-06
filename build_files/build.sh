#!/usr/bin/bash

set -ouex pipefail

/ctx/packages.sh

/ctx/gnome-extensions.sh

/ctx/docker.sh

/ctx/vscode.sh

/ctx/systemd.sh

/ctx/cleanup.sh