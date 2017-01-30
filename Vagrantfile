# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "bento/centos-7.3"

  config.ssh.insert_key = false

  config.vm.network "private_network", ip: "192.168.77.10"

  config.vm.provision "shell", :path => "./provision/provision.sh"

  config.vm.provision "shell", run: "always", :path => "./provision/always.sh"

end
