# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |conf|

  conf.vm.define "control-1", primary: true do |ctrl|
    ctrl.vm.hostname = "control-1"
    ctrl.vm.box = "ubuntu/focal64"
    ctrl.vm.box_version = "20240821.0.1"

    ctrl.vm.network "private_network", ip: "192.168.56.10"

    ctrl.vm.synced_folder "./shared-data", "/vagrant-data/all"
    ctrl.vm.synced_folder "./control", "/vagrant-data/control"
  
    ctrl.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = false

      # Customize the amount of memory on the VM:
      vb.memory = "2048"
      vb.cpus = "2"
    end

    ctrl.vm.provision "shell", inline: <<-SHELL
    /vagrant-data/all/1-setup.sh
    /vagrant-data/control/2-setup.sh
    SHELL
  end


  conf.vm.define "worker-1", primary: true do |ctrl|
    ctrl.vm.hostname = "worker-1"
    ctrl.vm.box = "ubuntu/focal64"
    ctrl.vm.box_version = "20240821.0.1"

    ctrl.vm.network "private_network", ip: "192.168.56.20"

    ctrl.vm.synced_folder "./shared-data", "/vagrant-data/all"
    ctrl.vm.synced_folder "./worker", "/vagrant-data/worker"

    ctrl.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = false

      # Customize the amount of memory on the VM:
      vb.memory = "1536"
      vb.cpus = "2"
    end

    ctrl.vm.provision "shell", inline: <<-SHELL
    sudo bash /vagrant-data/all/1-setup.sh
    sudo bash /vagrant-data/worker/3-setup.sh
    SHELL
  end

end