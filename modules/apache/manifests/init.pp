# Manage Apache
class apache {
  package { 'apache2-mpm-prefork': ensure => installed }

  service { 'apache2':
    ensure  => stopped,
    enable  => true,
    require => Package['apache2-mpm-prefork'],
  }
}
apache::snippet { 'site-specific.conf': }
