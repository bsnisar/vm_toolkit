# VM toolkit

### Main idea
Create toolkit for working with remote machines or dev environments


### Vagrant script VM with useful tools 
Vagrant (https://www.vagrantup.com/, version >=  1.8.0) with 'Debian x64' box. Include provision scripts for commont tools [git] and nodejs >= 6.x.x.

For apropare usage of the VM guest additions should be installed: `vagrant plugin install vagrant-vbguest`

### Ansible
Setup Debian VM and use ansible for provisioning. Ansible playbock include several roles:
- lua script language
- nginx 1.9 with additional modules
- java 8


### vim instalation
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp <rep>/.vimrc_example ~/.vimrc

