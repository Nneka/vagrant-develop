# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
BOX = "chef-VAGRANTSLASH-ubuntu-13.04"
RAM = "256"

#Port Forwarding
  http_forward_port = 20080
  https_forward_port = 20443
  ssh_forward_port = 20022
  mysql_forward_port = 23306


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = BOX
  config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/vagrant"
  config.vm.host_name = "development.recipebox.vm"
  config.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
   end
   
   #This installs puppet on the guest server.  
   #TODO: determine Linux flavor, and use correct bash script:  apt-get or yum 
   config.vm.provision "shell", :inline => <<-SHELL
     apt-get update
	 apt-get install -y puppet
   SHELL
   
   
   config.vm.provision "puppet" do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "site.pp"
	 puppet.module_path = "puppet/modules"
	 puppet.options="--verbose --debug"
   end
   

  


end
