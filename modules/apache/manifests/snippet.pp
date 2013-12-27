# Deploy an Apache config snippet
define apache::snippet() {
  include apache

  file { "/etc/apache2/conf.d/${name}":
    source  => "puppet:///modules/apache/${name}",
    require => Package['apache2-mpm-prefork'],
    notify  => Service['apache2'],
  }
}
