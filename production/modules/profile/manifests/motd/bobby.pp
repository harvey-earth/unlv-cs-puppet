# Profile for bobby motd
#

class profile::motd::bobby {

  file { '/etc/motd':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/motd/bobby',
  }

}
