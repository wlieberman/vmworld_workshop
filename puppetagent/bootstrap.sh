#!/usr/bin/env bash

service iptables stop
cp /vagrant/puppetagent/hosts /etc/hosts
/usr/bin/curl -k https://puppet-master.puppet.vm:8140/packages/current/install.bash | bash
service pe-puppet stop
mkdir -p /etc/puppetlabs/facter/facts.d
# Copy a fact into place
