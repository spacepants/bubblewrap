# bubblewrap

[![wercker status](https://app.wercker.com/status/6ed6021e1ba79c205ed49621dcb0e3f1/s "wercker status")](https://app.wercker.com/project/bykey/6ed6021e1ba79c205ed49621dcb0e3f1)

### About

This repository contains the [Packer](http://packer.io) and [Puppet](http://puppetlabs.com) manifests used to pack and ship boxes to [Vagrant Cloud](http://vagrantcloud.com/spacepants).

## VM settings

* `root` password is set to `stedwards`
* `vagrant` account uses the [Vagrant project's insecure public key](https://github.com/mitchellh/vagrant/tree/master/keys)

## Under the hood
### Package versions
#### www
* **nginx** - latest available yum package from nginx.org *(currently 1.6)*
* **mariadb** - 10.0.x
* **php** - 5.6.x
  * opcache
  * APCu - *(via pecl)*
  * geoip - *(via pecl)*
  * redis - *(via pecl)*
* **redis** - 2.8.x

### Notes
#### PHP
* pear, composer, drush, and phpunit are already included.
* php-cli has a separate ini file from php-fpm
  * php-fpm uses `/etc/php.ini`
  * php-cli uses `/etc/php-cli.ini`

### Puppet data abstraction
We're using hiera for data abstraction, so changing versions or making other non-code CM changes are all done in [YAML](https://github.com/spacepants/bubblewrap/blob/master/hiera/common.yaml). Actual code or logic changes are done in the puppet modules or profiles.

## Issues
If you run into any problems or if we need to make any changes to the configs, feel free to [open an issue or pull request](https://github.com/spacepants/bubblewrap/issues).
