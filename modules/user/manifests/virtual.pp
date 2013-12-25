class user::virtual {
  define ssh_user($key) {
    user { $name:
      ensure     => present,
      managehome => true,
    }

    file { "/home/${name}/.ssh":
      ensure => directory,
      mode   => '0700',
      owner  => $name,
    }

    ssh_authorized_key { "${name}_key":
      key     => $key,
      type    => 'ssh-rsa',
      user    => $name,
      require => File["/home/${name}/.ssh"],
    }
  }
  @user { 'admin': ensure => present }
  @user { 'deploy':
    ensure => present
  }
}
