#!/bin/sh

# Store build time
date > /etc/vagrant_box_build_time

# Set up sudo
echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant

# Install vagrant key
mkdir -pm 700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# NFS used for file syncing
apt-get --yes install nfs-common
