class {'r10k':
  sources     => {
    puppet    => {
      basedir => '/etc/puppetlabs/puppet/environments',
      remote  => 'git@git.puppet.vm:/home/git/control.git',
      prefix  => false,
    }
  },
  version => '2.0.2',
}
