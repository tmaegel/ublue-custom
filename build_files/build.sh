#!/usr/bin/bash

set -ouex pipefail

/ctx/packages.sh

/ctx/vscode.sh

/ctx/tailscale.sh

/ctx/systemd.sh

/ctx/cleanup.sh
