#!/usr/bin/env bash

echo "Installing versioned puppet modules..."
puppet module install --verbose kemra102-ius --version=1.0.0 >/dev/null 2>&1
puppet module install --verbose puppetlabs-mysql --version=3.2.0 >/dev/null 2>&1
puppet module install --verbose jfryman-nginx --version=0.2.2 >/dev/null 2>&1
puppet module install --verbose mayflower-php --version=3.0.1 >/dev/null 2>&1
puppet module install --verbose fsalum-redis --version=1.0.3 >/dev/null 2>&1

printf 'Modules installed in ' ; puppet module list --modulepath=/etc/puppet/modules
