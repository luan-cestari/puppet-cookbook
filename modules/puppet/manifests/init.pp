class puppet {
  file { '/usr/local/bin/papply':
    source => 'puppet:///modules/puppet/papply.sh',
    mode   => '0755',
  }
  file { '/usr/local/bin/pull-updates':
    source => 'puppet:///modules/puppet/pull-updates.sh',
    mode   => '0755',
  }
  file { '/home/deploy/.ssh/id_rsa.pub':
    source => 'puppet:///modules/puppet/deploy.pub',
    owner  => 'deploy',
    mode   => '0600',
  }
  cron { 'run-puppet':
    ensure  => 'present',
    user    => 'deploy',
    command => '/usr/local/bin/pull-updates',
    minute  => '*/10',
    hour    => '*',
  }
  package { 'vim-puppet':
    ensure => installed,
  }
}
