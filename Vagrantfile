# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
BOX = "chef-VAGRANTSLASH-ubuntu-13.04"
RAM = "256"
vm_name = "fns_gov"

#Port Forwarding
  http_forward_port = 40080
  https_forward_port = 40443
  ssh_forward_port = 40022
  mysql_forward_port = 43306


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = BOX
  config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/vagrant"
  config.vm.host_name = "behat-demo"

  config.vm.network :forwarded_port, guest: 80, host: http_forward_port
  config.vm.network :forwarded_port, guest: 443, host: https_forward_port
  config.vm.network :forwarded_port, guest: 22, host: ssh_forward_port
  config.vm.network :forwarded_port, guest: 3306, host: mysql_forward_port
  
  config.vm.provider "virtualbox" do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024", "--name", vm_name]
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
	 # puppet.options="--verbose --debug"
   end
   

  


end
