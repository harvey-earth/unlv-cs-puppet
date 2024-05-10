# Pulls sysctl.conf file and runs sysctl -p
#
class sysctl {

  file { '/etc/sysctl.d':
    ensure => directory,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { '/etc/sysctl.d/ddos.conf':
    ensure => file,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/sysctl/sysctl.conf',
  }

  exec { 'sysctl -p':
    user        => 'root',
    path        => '/usr/sbin',
    refreshonly => true,
    subscribe   => File['/etc/sysctl.d/ddos.conf'],
  }

}
