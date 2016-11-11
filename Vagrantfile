# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|
    config.vm.box = "debian/jessie64"
    config.ssh.insert_key = false

    config.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.customize ["modifyvm", :id, "--cpus", 2]
        vb.customize ["modifyvm", :id, "--memory", 3072]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    config.vm.network :private_network, ip: '192.168.62.117'

    # config.vm.synced_folder ".", "/vagrant", disabled: true

    # need plugin!
    # vagrant plugin install vagrant-vbguest
    config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

    config.vm.provision "install_common", type: "shell", privileged: true, inline: <<-SCRIPT
    sudo apt-get install -y git
    SCRIPT

    config.vm.provision "install_node", type: "shell", privileged: true, inline: <<-SCRIPT
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    sudo apt-get install -y nodejs
    SCRIPT

end
