#!/bin/bash

# Uninstall Puppet and repo
yum remove -y puppet puppetlabs-release > /dev/null

# Remove Puppet-related files and directories
rm -rf /etc/puppet
rm -rf /var/cache/yum/puppetdeps
rm -rf /var/cache/yum/puppetlabs
rm -rf /var/lib/puppet
rm -rf /var/lib/hiera/common.yaml
