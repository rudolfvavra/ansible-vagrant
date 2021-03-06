#!/usr/bin/env bash

## install ansible (http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-apt-ubuntu)
#sudo apt-get update
#sudo apt-get -y install software-properties-common
#sudo apt-add-repository -y ppa:ansible/ansible
#sudo apt-get update
#sudo apt-get -y install ansible

## Debian - install ansible (http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-apt-ubuntu)
deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt-get update
sudo apt-get -y install ansible

# copy examples into /home/vagrant  -- from inside the mgmt node
cp -a /vagrant/examples/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10 mgmt
10.0.15.11 lb
10.0.15.21 web1
10.0.15.22 web2
10.0.15.23 web3
EOL
