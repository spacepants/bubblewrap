#!/usr/bin/env bash

echo "Bootstrapping versioned puppet modules..."
puppet module install --verbose kemra102-ius --version=1.0.0 --modulepath=/tmp/packer-puppet-masterless/manifests/modules >/dev/null 2>&1
puppet module install --verbose puppetlabs-mysql --version=3.2.0 --modulepath=/tmp/packer-puppet-masterless/manifests/modules >/dev/null 2>&1
puppet module install --verbose jfryman-nginx --version=0.2.2 --modulepath=/tmp/packer-puppet-masterless/manifests/modules >/dev/null 2>&1
puppet module install --verbose mayflower-php --version=3.0.1 --modulepath=/tmp/packer-puppet-masterless/manifests/modules >/dev/null 2>&1
puppet module install --verbose fsalum-redis --version=1.0.3 --modulepath=/tmp/packer-puppet-masterless/manifests/modules >/dev/null 2>&1

printf 'Modules installed in ' ; puppet module list --modulepath=/tmp/packer-puppet-masterless/manifests/modules
