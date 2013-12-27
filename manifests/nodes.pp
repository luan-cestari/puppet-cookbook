node 'puppet-cookbook' {
  include puppet
  include memcached
  include apache
  include admin::ntp_de
  include user::virtual
  include user::sysadmins
  include user::developers
  apache::vhost { 'puppet-cookbook.local': }

  notify { "This is $::operatingsystem version $::operatingsystemrelease, on $::architecture architecture, kernel version $::kernelversion": }

  if tagged('admin::ntp') {
    notify { 'This node is running NTP': }
  }
  if tagged('admin') {
    notify { 'This node includes at least one class from the admin module': }
  }

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
