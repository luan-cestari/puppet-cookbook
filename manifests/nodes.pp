node 'puppet-cookbook' {
  include puppet
  include memcached
  include admin::ntp_de
  include user::virtual
  include user::sysadmins
  include user::developers
  class { 'nginx': }

  #notify { "This is $::operatingsystem version $::operatingsystemrelease, on $::architecture architecture, kernel version $::kernelversion": }

  append_if_no_such_line { '127.0.0.1 puppet-cookbook':
    file => '/etc/hosts',
    line => '127.0.0.1 puppet-cookbook',
  }

  append_if_no_such_line { '127.0.0.1 puppet-cookbook.local':
    file => '/etc/hosts',
    line => '127.0.0.1 puppet-cookbook.local',
  }

  cron { 'run-backup':
    ensure  => present,
    command => '/usr/local/bin/backup',
    hour    => inline_template('<%= @hostname.sum % 24 %>'),
    minute  => '00',
  }
}
