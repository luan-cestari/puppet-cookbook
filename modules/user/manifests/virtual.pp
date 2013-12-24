class user::virtual {
  @user { 'admin': ensure => present }
  @user { 'deploy': ensure => present }
}
