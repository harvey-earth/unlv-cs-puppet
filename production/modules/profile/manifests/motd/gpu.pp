# Profile for gpu motd
#

class profile::motd::gpu {

  file { '/etc/update-motd.d/10-help-text':
    ensure => absent,
  }

  file { '/etc/default/motd-news':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/motd/motd-news',
  }

  file { '/etc/update-motd.d/80-esm':
    ensure => absent,
  }

  file { '/etc/update-motd.d/80-livepatch':
    ensure => absent,
  }

  file { '/etc/update-motd.d/91-release-upgrade':
    ensure => absent,
  }

  file { '/etc/motd':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/motd/gpu',
  }

}
