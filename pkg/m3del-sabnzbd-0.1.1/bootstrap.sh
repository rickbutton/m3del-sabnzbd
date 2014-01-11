#!/usr/bin/env bash

cd /tmp
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i puppetlabs-release-precise.deb
rm puppetlabs-release-precise.deb
apt-get update
apt-get -y install puppet
mv /etc/puppet/puppet.conf /etc/puppet/puppet.conf.example
mv /etc/default/puppet /etc/default/puppet.old
cp /vagrant/puppet.conf /etc/puppet/puppet.conf
cp /vagrant/puppet /etc/default/puppet
sudo puppet resource service puppet ensure=running enable=true