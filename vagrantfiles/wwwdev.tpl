# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "spacepants/test-box"
  config.vm.hostname = "www.stedwards.box"
  config.vm.network "forwarded_port", guest: 80, host: 8088
end
