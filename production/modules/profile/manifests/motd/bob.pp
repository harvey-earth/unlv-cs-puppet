# Profile for bob motd
#

class profile::motd::bob {

  file { '/etc/motd':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/motd/bob',
  }

}
