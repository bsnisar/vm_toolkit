# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|
		  config.vm.box = "centos/7"

	    # Disable the new default behavior introduced in Vagrant 1.7, to
	    # ensure that all Vagrant machines will use the same SSH key pair.
	    # See https://github.com/mitchellh/vagrant/issues/5005
	    config.ssh.insert_key = false

      # For internt acces please create  virtual network switch
      #  Hyper-V Manager / Virtual Switch Manager / New virtual network switch
      # config.vm.provider "hyperv"

      # config.vm.network "public_network"
      config.vm.network :private_network, ip: '192.168.9.90'

      config.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.customize ["modifyvm", :id, "--cpus", 2]
        vb.customize ["modifyvm", :id, "--memory", 3072]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end

      config.vm.network "forwarded_port", guest: 8080, host: 9105
      config.vm.network "forwarded_port", host_ip: "127.0.0.1", guest: 80, host: 8091

      # Possible this task can failes.
			#
      # We need plugin to get sync folder on virtualbox
      # >> vagrant plugin install vagrant-vbguest
      # config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
      config.vm.synced_folder ".", "/vagrant", disabled: false


			# config.vm.provision "get-ansible-local",
			#   type: "shell",
			# 	privileged: true,
			# 	inline: "mkdir /vagrant && chown vagrant. /vagrant"

		  # config.vm.provision "copy-playbooks",
		  # type: "file",
		  # source: "provisioning",
			# destination: "/vagrant/provisioning"


			# Install java and nodejs
      config.vm.provision "dev", type: "ansible_local", run: "never" do |ansible|
        ansible.verbose = true
        ansible.playbook = "/vagrant/provisioning/dev-stack.yml"
      end

			## Install NGINX on VM
			config.vm.provision "web", type: "ansible", run: "never" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "provisioning/web-stack.yml"
      end

			# Install gerrit and docker on VM
			config.vm.provision "ops", type: "ansible_local", run: "never" do |ansible|
        ansible.verbose = true
        ansible.playbook = "provisioning/ops-stack.yml"
      end

     # config.vm.provision "compile_ffmpeg", type: "shell", run: "never" do |p|
     #    p.path = "compile_ffmpeg.sh"
     #	       p.privileged = true
     # end

			config.vm.provision "install_ffmpeg", type: "shell", run: "never" do |p|
         p.path = "install_ffmpeg.sh"
	       p.privileged = true
      end

end
