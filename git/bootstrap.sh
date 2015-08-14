#!/usr/bin/env bash

yum install -y git
useradd -m -k /vagrant/git/skel git
cd ~git
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
chown -R git:git .ssh
