# login
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include login
class login {

  if ($::osfamily == 'RedHat') {
    file { '/etc/dconf/profile/gdm':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/login/gdm',
    }->
    file { '/etc/dconf/db/gdm.d':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
    }->
    file { '/etc/dconf/db/local.d/00-background':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/login/00-background',
    }->
    file { '/usr/local/share/unlvb.jpg':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/login/unlvb.jpg',
    }->
    file { '/etc/dconf/db/gdm.d/00-login-screen':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/login/00-login-screen',
    }->
    file { '/usr/share/pixmaps/custom-greeter-logo.png':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/login/sblogo.png',
    }->
    file { '/etc/dconf/db/gdm.d/01-logo':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/login/01-logo',
    }->
    exec { '/usr/bin/dconf update': }

  }
}
