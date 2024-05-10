# Profile for java motd
#

class profile::motd::java {

  file { '/etc/motd':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/motd/java',
  }

}
