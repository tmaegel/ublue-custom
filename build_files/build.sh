#!/usr/bin/bash

set -ouex pipefail

/ctx/packages.sh

/ctx/tailscale.sh

/ctx/vscode.sh

/ctx/systemd.sh

/ctx/cleanup.sh
