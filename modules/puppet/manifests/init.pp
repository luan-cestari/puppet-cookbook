class puppet {
  file { '/usr/local/bin/papply':
    source => 'puppet:///modules/puppet/papply.sh',
    mode   => '0755',
  }
  file { '/usr/local/bin/pull-updates':
    source => 'puppet:///modules/puppet/pull-updates.sh',
    mode   => '0755',
  }
  file { '/home/vagrant/.ssh/id_rsa':
    source => 'puppet:///modules/puppet/vagrantkey.priv',
    owner  => 'vagrant',
    mode   => '0600',
  }
  file { '/home/vagrant/.ssh/id_rsa.pub':
    source => 'puppet:///modules/puppet/vagrantkey.pub',
    owner  => 'vagrant',
    mode   => '0600',
  }
  cron { 'run-puppet':
    ensure  => 'present',
    user    => 'vagrant',
    command => '/usr/local/bin/pull-updates',
    minute  => '*/10',
    hour    => '*',
  }
}
