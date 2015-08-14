#!/usr/bin/env bash

service iptables stop
cp /vagrant/hosts /etc/hosts
cp /vagrant/puppet-enterprise-3.8.2-el-6-x86_64.tar.gz /root
cd /root
tar zxf puppet-enterprise-3.8.2-el-6-x86_64.tar.gz
cd puppet-enterprise-3.8.2-el-6-x86_64
cp /vagrant/puppetmaster/my_answers .
./puppet-enterprise-installer -a my_answers
/usr/local/bin/puppet module install zack/r10k
/usr/local/bin/puppet apply /vagrant/puppet/r10k.pp
mkdir /root/.ssh
chmod 700 /root/.ssh
cp /vagrant/puppetmaster/id_rsa* /root/.ssh/
chmod 600 /root/.ssh/id_rsa
cp /vagrant/puppetmaster/ssh_config /root/.ssh/config
chown -R root:root /root/.ssh
cd /etc/puppetlabs/puppet/environments
rm -rf production/*
ln -s /opt/puppet/bin/puppet /usr/bin/puppet
/usr/local/bin/r10k deploy environment -p
cp -f /vagrant/puppetmaster/hiera.yaml /etc/puppetlabs/puppet/hiera.yaml
service pe-puppetserver restart
