#!/usr/bin/env bash

set -e

REPO_URL="http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-11.noarch.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed."
  exit 0
fi

# Install puppet labs repo
echo "Configuring PuppetLabs repo..."
repo_path=$(mktemp)
wget --output-document=${repo_path} ${REPO_URL} 2>/dev/null
rpm -i ${repo_path} > /dev/null

# Install Puppet...
echo "Installing puppet..."
yum install -y puppet > /dev/null

# Show Puppet version
printf 'Installed puppet version ' ; puppet --version

# Installed required modules
for i in "$@"
do
  puppet module install $i --modulepath=/tmp/packer-puppet-masterless/manifests/modules >/dev/null 2>&1
done

printf 'Bootstrap modules installed in ' ; puppet module list --modulepath=/tmp/packer-puppet-masterless/manifests/modules
