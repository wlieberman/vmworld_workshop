# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.define "git" do |git|
    git.vm.box = "puppetlabs/centos-6.6-64-nocm"
    git.vm.hostname = "git"
    git.vm.provision :shell, path: "git/bootstrap.sh"
    git.vm.network :private_network, ip: "172.16.130.11"
  end
  config.vm.define "puppet-master" do |puppet|
    puppet.vm.box = "puppetlabs/centos-6.6-64-nocm"
    puppet.vm.hostname = "puppet-master"
    puppet.vm.provision :shell, path: "puppetmaster/bootstrap.sh"
    puppet.vm.network :private_network, ip: "172.16.130.10"
    puppet.vm.network :forwarded_port, host: 4567, guest: 443
    puppet.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "2"
    end
    puppet.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "4096"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
  config.vm.define "puppet-agent" do |puppetagent|
    puppetagent.vm.box = "puppetlabs/centos-6.6-64-nocm"
    puppetagent.vm.hostname = "puppet-agent.puppet.vm"
    puppetagent.vm.provision :shell, path: "puppetagent/bootstrap.sh"
    puppetagent.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"] = "1024"
      v.vmx["numvcpus"] = "1"
    end
    puppet.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
end
