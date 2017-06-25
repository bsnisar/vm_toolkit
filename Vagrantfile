# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|
    #   config.vm.box = "debian/jessie64"
		  config.vm.box = "centos/7"

	    # Disable the new default behavior introduced in Vagrant 1.7, to
	    # ensure that all Vagrant machines will use the same SSH key pair.
	    # See https://github.com/mitchellh/vagrant/issues/5005
	    config.ssh.insert_key = false

        # config.vm.provider :virtualbox do |vb|
        #    vb.gui = false
        #    vb.customize ["modifyvm", :id, "--cpus", 2]
        #    vb.customize ["modifyvm", :id, "--memory", 3072]
        #    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        # end

      config.vm.network :private_network, ip: '192.168.9.90'
	    config.vm.network "forwarded_port", guest: 80, host: 8085

        # need plugin!
        # vagrant plugin install vagrant-vbguest
        # config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
      config.vm.synced_folder ".", "/vagrant", disabled: true

		config.vm.provision "run_playbook", type: "ansible", run: "never" do |ansible|
        ansible.verbose = "v"
     		ansible.playbook = "provisioning/playbook.yml"
  	end
end
