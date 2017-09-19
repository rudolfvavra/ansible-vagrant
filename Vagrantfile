# Defines our Vagrant environment
#
# -*- mode: ruby  -*-

Vagrant.configure("2") do |config|

  # create mgmt node
  # BOXES: https://app.vagrantup.com/boxes/search?provider=libvirt
  config.vm.define :mgmt do |mgmt_config|
    #mgmt_config.vm.box = "ubuntu/trusty64"
    mgmt_config.vm.box = "debian/jessie64"
    #mgmt_config.vm.box = "ceph/ubuntu-xenial"
    mgmt_config.vm.hostname = "mgmt"
    mgmt_config.vm.network :private_network, ip: "10.0.15.10"
    #mgmt_config.vm.provider "virtualbox" do |vb|
    mgmt_config.vm.provider "libvirt" do |vb|
      vb.memory = "256"
    end
    mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
  end

  # create load balancer
  config.vm.define :lb do |lb_config|
    lb_config.vm.box = "debian/jessie64"
    #lb_config.vm.box = "ceph/ubuntu-xenial"
    lb_config.vm.hostname = "lb"
    lb_config.vm.network :private_network, ip: "10.0.15.11"
    lb_config.vm.network "forwarded_port", guest: 80,host: 8080
    lb_config.vm.provider "libvirt" do |vb|
      vb.memory = "256"
    end
  end

  # create some web servers
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..3).each do |i|
    config.vm.define "web#{i}" do |node|
      node.vm.box = "debian/jessie64"
      #node.vm.box = "ceph/ubuntu-xenial"
      node.vm.hostname = "web#{i}"
      node.vm.network :private_network, ip: "10.0.15.2#{i}"
      node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
      node.vm.provider "libvirt" do |vb|
        vb.memory = "256"
      end
    end
  end

end
