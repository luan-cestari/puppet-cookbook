class admin::ntp_de inherits admin::ntp {
  File['/etc/ntpd.conf'] {
    source => 'puppet://modules/admin/ntp_de.conf',
  }
}
