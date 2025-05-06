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

  config.vm.define "client_1" do |client_1|
    client_1.vm.box = "ubuntu/focal64"
    client_1.vm.hostname = "C-01"
    client_1.vm.network "private_network", 
      type: "dhcp", 
      virtualbox__intnet: "internal",
      virtualbox__hostonly: false

    client_1.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.name = "VM-C-01"
      vb.memory = 1024
      vb.cpus = 1
    end
  end
end
