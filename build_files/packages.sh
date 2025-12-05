#!/usr/bin/bash

set -ouex pipefail

# Validate packages.json before attempting to parse it
# This ensures builds fail fast if the JSON is malformed
if ! jq empty /ctx/packages.json 2>/dev/null; then
    echo "ERROR: packages.json contains syntax errors and cannot be parsed" >&2
    echo "Please fix the JSON syntax before building" >&2
    exit 1
fi

# build list of all packages requested for inclusion
INCLUDED_PACKAGES=($(jq -r ".include | sort | unique[]" /ctx/packages.json))

# build list of all packages requested for exclusion
EXCLUDED_PACKAGES=($(jq -r ".exclude | sort | unique[]" /ctx/packages.json))

if [[ "${#INCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    dnf5 install -y \
        ${INCLUDED_PACKAGES[@]}
else
    echo "No packages to install."
fi

if [[ "${#EXCLUDED_PACKAGES[@]}" -gt 0 ]]; then
    dnf5 remove -y \
        ${EXCLUDED_PACKAGES[@]}
else
    echo "No packages to remove."
fi