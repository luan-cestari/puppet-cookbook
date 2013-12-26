class user::virtual {
  @user { 'admin': ensure => present }

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

  @ssh_user { 'deploy':
    key =>
'AAAAB3NzaC1yc2EAAAADAQABAAABAQDTfZSHghe3P9any4skWbWVcIes7kghQoR9qJcCvMS+4mKbLbt/Sul3I5ZpcrRn2ZRp4inY0SRlGCqdtJ5FBr6ksdP1WWFawFoZvvMeGA5Ct1KAEUPHKyVONu/vC4bNNmfinPfSc8LsggHUuOrK44uxClTDoQ93xhE5hfk8+WURWnkeEF0t8eyHLfEd395Vrzjsi34dIFagQLgB7foKUoL1oav1g6CykJZq+cgu2W/Cx5Bfz/PxH15joYeQ3b1vF3neQYqO5wq78f3LRP0/KIBcHTZWUxjoaFXkwqpS+JcJdZqfUjZILt3ZKoxj3YNJubNbvSZHqRtf6Hvc4wlw1sD5',
  }
}
