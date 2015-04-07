#!/bin/bash

# Uninstall Puppet repo
yum remove -y puppetlabs-release > /dev/null

# Remove Puppet-related files and directories
rm -rf /var/cache/yum/puppetdeps
rm -rf /var/cache/yum/puppetlabs
