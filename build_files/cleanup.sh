#!/usr/bin/bash

set -eoux pipefail

echo "::group:: ===$(basename "$0")==="

rm /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:phracek:PyCharm.repo
rm /etc/yum.repos.d/rpmfusion-nonfree-nvidia-driver.repo
rm /etc/yum.repos.d/rpmfusion-nonfree-steam.repo

# Add the Flathub flatpak remote and remove the Fedora flatpak remote
flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
systemctl disable flatpak-add-fedora-repos.service
systemctl mask flatpak-add-fedora-repos.service
rm -f /usr/lib/systemd/system/flatpak-add-fedora-repos.service

dnf clean all

rm -rf /.gitkeep
find /var/* -maxdepth 0 -type d \! -name cache -exec rm -fr {} \;
find /var/cache/* -maxdepth 0 -type d \! -name libdnf5 \! -name rpm-ostree -exec rm -fr {} \;
rm -rf /tmp && mkdir -p /tmp
rm -rf /boot && mkdir -p /boot

# Make sure /var/tmp is properly created
mkdir -p /var/tmp
chmod -R 1777 /var/tmp

echo "::endgroup::"
