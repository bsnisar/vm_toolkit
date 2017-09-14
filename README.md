# VM toolkit

### Vagrant script VM with useful tools
Vagrant (https://www.vagrantup.com/, version >=  1.8.0) with 'Debian x64' box. Include provision scripts for common tools [git] and nodejs >= 6.x.x.

### Sync folder
Sync folder must be configured via special plugin, that enables VM guest additions:
```
vagrant plugin install vagrant-vbguest
```

### Ansible
Setup Debian VM and use ansible for provisioning. Ansible playbock include several roles:
- lua script language
- java 8
- openresty
- docker

### KVM provider
vagrant plugin can be found here: https://github.com/vagrant-libvirt/vagrant-libvirt

### vim instalation
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp <rep>/.vimrc_example ~/.vimrc
