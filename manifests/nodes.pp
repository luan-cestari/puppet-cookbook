node 'puppet-cookbook' {
  include puppet
  include memcached
  include admin::ntp_de
  include user::virtual
  include user::sysadmins
  include user::developers
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
}
