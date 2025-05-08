Vagrant.configure("2") do |config|
  config.vm.define "dhcp" do |dhcp|
    dhcp.vm.box = "ubuntu/focal64"
    dhcp.vm.hostname = "S-01-dhcp"

    dhcp.vm.network "private_network", 
      ip: "192.168.2.2", 
      virtualbox__hostonly: "vboxnet0",
      virtualbox__intnet: nil
    dhcp.vm.network "private_network", 
      ip: "192.168.1.1", 
      virtualbox__intnet: "internal",
      virtualbox__hostonly: false

    dhcp.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.name = "VM-S-01-dhcp"
      vb.memory = 1024
      vb.cpus = 1
      
    end

    dhcp.vm.synced_folder "./dhcp/configs", "/configs"

    dhcp.vm.provision "shell", path: "./dhcp/provision.sh"
  end

  config.vm.define "dockerhost" do |dockerhost|
    dockerhost.vm.box = "ubuntu/focal64"
    dockerhost.vm.hostname = "S-02-dockerhost"
    dockerhost.vm.network "private_network", 
      ip: "192.168.1.5",
      virtualbox__intnet: "internal",
      virtualbox__hostonly: false

    dockerhost.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.name = "VM-S-02-dockerhost"
      vb.memory = 2048
      vb.cpus = 2
    end
    dockerhost.vm.provision "shell", path: "./docker/provision.sh"
  end


end
